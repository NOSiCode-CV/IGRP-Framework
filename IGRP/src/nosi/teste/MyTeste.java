package nosi.teste;

import java.util.*;

import nosi.webapps.igrp.pages.login.Login;

public class MyTeste {

	public static void main(String []args){
		Login model = new Login();
		model.setUser("0.1");
		model.validate();
		System.out.println(model.hasErrors("user"));
	}
	
}