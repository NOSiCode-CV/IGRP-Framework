package nosi.teste;

import nosi.webapps.igrp.pages.login.Login;

public class MyTeste {

	public static void main(String []args){
		Login model = new Login();
		model.setUser("iekjd2323ini.fernandes@nosi.cv.pt");
		model.validate();
		System.out.println(model.hasErrors("user"));
	}
	
}
