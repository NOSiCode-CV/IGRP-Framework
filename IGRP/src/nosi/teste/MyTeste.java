package nosi.teste;

import java.lang.annotation.Annotation;

import nosi.core.webapp.RParam;

public class MyTeste {
	
	@RParam(rParamName = "")
	private int cod;
	
	private String name;

	public static void main(String []args) throws NoSuchFieldException, SecurityException{
		MyTeste myTeste = new MyTeste();
		Class c = myTeste.getClass();
		Annotation []annotation = c.getDeclaredField("cod").getAnnotations();
		for(Annotation a : annotation){
			System.out.println(a.annotationType().getSimpleName());
		}
	}
	
}
