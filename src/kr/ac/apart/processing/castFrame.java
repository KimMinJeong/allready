package kr.ac.apart.processing;

import kr.ac.apart.processing.ArduinoProcessing;

import java.awt.BorderLayout;
import java.awt.Frame;

import org.springframework.stereotype.Service;

import processing.core.PApplet;

@Service("frame")
public class castFrame extends Frame {
	     public castFrame() {
	         super("Embedded PApplet");

	         setLayout(new BorderLayout());
	         PApplet embed = new ArduinoProcessing();
	         add(embed, BorderLayout.CENTER);
	         embed.init();
	     }
	     public void castConfirm(){
	    	 System.out.println("OK");
	     }
}
