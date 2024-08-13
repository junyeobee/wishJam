package com.wishJam.detail;

import java.text.*;

public class ColorDAO {
	 
	public String colortoHex(int r, int g, int b) {
		String r_s = Integer.toHexString(r);
		String g_s = Integer.toHexString(g);
		String b_s = Integer.toHexString(b);

		String hexR ="";
		String hexG ="";
		String hexB ="";
		
		if(r_s.length()==1) {
			hexR = "0"+r_s;
		} else {
			hexR = r_s;
		}
		
		if(g_s.length()==1) {
			hexG = "0"+g_s;
		} else {
			hexG = g_s;
		}
		
		if(b_s.length()==1) {
			hexB = "0"+b_s;
		} else {
			hexB = b_s;
		}
		
		String hexcode = "#"+hexR+hexG+hexB;
		
		return hexcode;
	}
}
