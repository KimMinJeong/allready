package kr.ac.apart.processing;

import java.io.PrintWriter;

import org.springframework.stereotype.Service;

import processing.core.PApplet;
import processing.serial.Serial;

@Service("processing")
public class ArduinoProcessing extends PApplet{
	private static final long serialVersionUID = 1L;
	private Serial myPort;
	private PrintWriter output;
	public void setup()
	{
	  System.out.println("setup start!");
	  String portName = Serial.list()[0];
	  myPort = new Serial(this, portName, 8088);
	  output = createWriter("D:\\LSG\\workspace\\Apart\\WebContent\\parking_info\\data.txt");
	}
	public void draw()  
	{
	  if(myPort.available() > 0)
	  {
	    String value = myPort.readString();
	    if(value.equals("E"))
	    	value="EMPTY";
	    else if(value.equals("F"))
	    	value="FULL";
	    else{
	    	output.println("ERROR");
			output.flush();
			output.close();
	    }
	  	  output.println(value);
		  output.flush();
		  output.close();
		  myPort.stop();
	  }
	}
}
