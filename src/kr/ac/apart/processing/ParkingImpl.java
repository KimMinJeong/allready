package kr.ac.apart.processing;

import kr.ac.apart.processing.ArduinoProcessing;

import java.awt.BorderLayout;
import java.awt.Frame;

import org.springframework.stereotype.Service;

import processing.core.PApplet;

@SuppressWarnings("serial")
@Service("frame")
public class ParkingImpl extends Frame implements Parking{
	     public void check(){
	         setLayout(new BorderLayout());
	         PApplet embed = new ArduinoProcessing();
	         add(embed, BorderLayout.CENTER);
	         embed.init();
	     }
}
