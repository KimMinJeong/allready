import java.awt.Container;
import java.awt.Graphics;

import javax.swing.JApplet;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

public class appletExam extends JApplet{
	public void init() {
		Container contentPane = getContentPane();
		contentPane.add(new JLabel("Hello, Java", SwingConstants.CENTER));
		}
	 public void paint(Graphics g) 
     {  
      g.drawString("Hey hey hey",20,20); 
      g.drawString("Hellooow World",20,40);

     }
}
 