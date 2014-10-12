package kr.ac.apart.processing;

import org.springframework.stereotype.Service;
import processing.core.PApplet;
import processing.serial.*;

@Service("processing")
public class ArduinoProcessing extends PApplet{
	private static final long serialVersionUID = 1L;
	private Serial myPort;
	public static String isfull1=null;
	public static String isfull2=null;
	static{
		System.load("D:\\LSG\\jSSC-2.8.dll");
	}
	public void setup()
	{
	  System.out.println("setup start!");
	  String portName=Serial.list()[0];
	  myPort = new Serial(this, portName, 8088);
	}
	
	public void draw()  
	{
	  if(myPort.available() > 0)
	  {
	    String value = myPort.readString();
	    System.out.println(value);
	    char is1='N';
	    char is2='N';
	    try{
	    is1=value.split("1")[1].charAt(0);
	    is2=value.split("2")[1].charAt(0);
	    }catch(ArrayIndexOutOfBoundsException e){
	    	isfull1="ERROR";
	    	isfull2="ERROR";
	    	return;
	    }
	    if(is1=='E')
	    	isfull1="EMPTY";
	    else if(is1=='F')
	    	isfull1="FULL";
	    else
	    	isfull1="ERROR";

	    if(is2=='E')
	    	isfull2="EMPTY";
	    else if(is2=='F')
	    	isfull2="FULL";
	    else
	    	isfull2="ERROR";
	    myPort.stop();
	  }
	}
}