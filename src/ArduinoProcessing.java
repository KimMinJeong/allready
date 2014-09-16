
import java.io.PrintWriter;

import processing.core.PApplet;
import processing.serial.Serial;
public class ArduinoProcessing extends PApplet{
	private static final long serialVersionUID = 1L;
	private Serial myPort;
	private PrintWriter output;
	public void setup()
	{
	  String portName = Serial.list()[0];
	  myPort = new Serial(this, portName, 9600);
	  output = createWriter("D:\\LSG\\workspace\\Apart\\WebContent\\parking_info\\data.txt");
	}
	public void draw()  
	{
	  if(myPort.available() > 0)
	  {
	    String value = myPort.readString();
//	    System.out.println("value="+value);
	    if(value.equals("E"))
	    	value="EMPTY";
	    else if(value.equals("F"))
	    	value="FULL";
	    else{
	    	output.println("ERROR");
			output.flush();
			output.close();
	    	exit();
	    }
	  	  output.println(value);
		  output.flush();
		  output.close();
		  exit();
	  }
	}
}
