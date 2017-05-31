package nosi.teste;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import nosi.webapps.igrp.pages.login.Login;

public class MyTeste {
	
	public static void main(String []args){
		Login model = new Login();
		model.setUser("Iekiny Marcel Mendes Fernandes");
		model.validate();
		Map<String, ArrayList<String>> map = model.getErrors();
		for(Map.Entry<String, ArrayList<String>> obj : map.entrySet()){
			System.out.println(obj.getKey() + " - " + obj.getValue().size());
		}
	}
	
}
