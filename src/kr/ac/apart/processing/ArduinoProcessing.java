package kr.ac.apart.processing;

import org.springframework.stereotype.Service;
import processing.core.PApplet;
import processing.serial.Serial;

@Service("processing")
public class ArduinoProcessing extends PApplet{
	private static final long serialVersionUID = 1L;
	private Serial myPort;
	public static String isfull=null;
	
	public void setup()
	{
	  System.out.println("setup start!");
	  
	  String portName = Serial.list()[0];
	  
	  myPort = new Serial(this, portName, 8088);
	}
	
	public void draw()  
	{
	  if(myPort.available() > 0)
	  {
	    String value = myPort.readString();
	    if(value.equals("E"))
	    	isfull="EMPTY";
	    else if(value.equals("F"))
	    	isfull="FULL";
	    else
	    	isfull="ERROR";
		  myPort.stop();
	  }
	}
}