
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import javax.imageio.ImageIO;
/**
*
* @author mohamed khalaf
*/import javax.media.*;
import javax.swing.*;

import java.awt.*;
import java.net.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;

import javax.media.control.FrameGrabbingControl;
import javax.media.format.VideoFormat;
import javax.media.util.BufferToImage;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import com.github.nkzawa.emitter.Emitter;
// socket.io for java by kjs
import com.github.nkzawa.socketio.client.IO;
import com.github.nkzawa.socketio.client.Socket;

public class JMFtest extends JFrame {
	boolean saved=false;
	File file=null;
	public Container c=getContentPane();
	public Player _player=null;
	public Image img=null;
	public Buffer buffer=null;
	public BufferToImage btoi=null;
	public ImagePanel imagepanel=null;
	
	
	//properties하나 만들기.. 바뀌는 부분
	public String socketIoUrl = "http://localhost";
	public Integer socketIoPort = 8000;
	
	Socket socketIO = null;
	
	class ImagePanel extends JFrame{
		public Image myimg;
		public ImagePanel() {
		
		setLayout(new FlowLayout());
		setSize(50,50);
		setVisible(true);
		}
		public void setmage(Image img){
			this.myimg=img;
			repaint();	
		}
		public void paint(Graphics g){
			if(myimg!=null){
				g.drawImage(myimg,0,0, this);
			}
		}
	}
		
	JMFtest() {
		addWindowListener( new WindowAdapter() {
			public void windowClosing( WindowEvent e ) {
				_player.stop();
				_player.deallocate();
				_player.close();	
				System.exit( 0 );
			}
	});
	
	JPanel panel = (JPanel)getContentPane();
	panel.setLayout( new FlowLayout() );
	
	JButton startBtn=new JButton("Start");
	startBtn.setMnemonic('S');
	startBtn.setCursor(new Cursor(Cursor.HAND_CURSOR));
	panel.add(startBtn);
	
	JButton stopBtn=new JButton("Stop");
	stopBtn.setMnemonic('S');
	stopBtn.setCursor(new Cursor(Cursor.WAIT_CURSOR));
	panel.add(stopBtn);
	
	JButton phothoBtn=new JButton("Take photo");
	phothoBtn.setMnemonic('T');
	phothoBtn.setCursor(new Cursor(Cursor.HAND_CURSOR));
	panel.add(phothoBtn);
	
	startBtn.addActionListener(new ActionListener() {
	
		public void actionPerformed(ActionEvent e) {
			_player.start();	
	}
	});
	stopBtn.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
			_player.stop();
		}
	});
	
	phothoBtn.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
			// socket.io binding
			socketIOBinding();
			FrameGrabbingControl fgc = (FrameGrabbingControl)_player.getControl("javax.media.control.FrameGrabbingControl");
			while(true)
			{	
				buffer=fgc.grabFrame();  //이미지를 순간적으로 캡쳐
				btoi = new BufferToImage((VideoFormat)buffer.getFormat()); //버퍼형식을 이미지로 전환
				Image img = btoi.createImage(buffer);
				// socket_test.js 모듈에 img라는 이벤트를convertImageToBase64(img) 스트링으로 전달하는
				socketIO.emit("img", convertImageToBase64(img));
			}	
		}
		public byte[] ImageToByteArray(Image img)   //이미지를 바이트 형태로 변환
		{
			BufferedImage bimage = new BufferedImage(img.getWidth(null), img.getHeight(null), BufferedImage.TYPE_3BYTE_BGR);
			//해상도 낮춤
		    Graphics2D bGr = bimage.createGraphics();
		    bGr.drawImage(img, 0, 0, null);
		    bGr.dispose();
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			try {
				ImageIO.write(bimage, "gif", baos);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return baos.toByteArray();
		}

		public void socketIOBinding() {
			// socket.io connect
			// 처음에 연결
			try {
				socketIO = IO.socket(socketIoUrl + ":" + socketIoPort.toString());
			} catch (URISyntaxException e2) {
				e2.printStackTrace();
			}
			// 연결됐을 때..
			socketIO.on(Socket.EVENT_CONNECT, new Emitter.Listener() {
				@Override
				public void call(Object... args) {
					
				}
			}).on("event", new Emitter.Listener() { // socket.io(in node)에서 event 받을 때..
				
				@Override
				public void call(Object... args) {
					
				}
			});
			// 여기다가 계속 on..붙이시면 노드랑 통신 가능
			// 예를 들면 stop버튼 눌렀을 때 서버에 전달해준다던가...
			
			// 연결하기
			socketIO.connect();
		}
		public String convertImageToBase64(Image img) {
			String ret = Base64.encode(ImageToByteArray(img));
			return ret;
		}
	});
	String mediaFile = "vfw://0";
	try {
			MediaLocator mlr = new MediaLocator( mediaFile );
			_player = Manager.createRealizedPlayer(mlr);
	
		if (_player.getVisualComponent() != null){
			setSize(100,100);
			panel.add("South", _player.getVisualComponent());
		}
	}
	catch (Exception e) {
		System.err.println( "Got exception " + e );
	}	
}
	
	public static void main(String[] args) {
		JMFtest jmfTest = new JMFtest();
		jmfTest.setSize(800,800);
		jmfTest.show();
	}
}