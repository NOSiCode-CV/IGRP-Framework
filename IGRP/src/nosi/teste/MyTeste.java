package nosi.teste;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import nosi.webapps.igrp.pages.login.Login;

public class MyTeste {

	public static void main(String []args) throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(dateFormat1.format(dateFormat.parse("08-06-2017")));
	}
	
}