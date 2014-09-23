import java.io.PrintWriter;

import processing.core.PApplet;
import processing.serial.*;

public class parkingTest extends PApplet {
    Serial myPort;
    PrintWriter output;
    String result = "";
    public void setup() {
        String portName = Serial.list()[1];
        myPort = new Serial(this,portName,9600);
        output = createWriter("C:\\SK\\workspace\\Apart\\WebContent\\parking_info\\data.txt");
    }
    public void draw() {
        if(myPort.available() > 0) {
            String value = myPort.readString();
            if(value.equals("E")) {
                result = "EMPTY";
            }
            if(value.equals("F")) {
                result = "FULL";
            }
        }

    }
    public void keyPressed() {
        output.println(result);
        output.flush();
        output.close();
        exit();
    }
}