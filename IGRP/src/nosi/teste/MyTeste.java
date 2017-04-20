package nosi.teste;

import java.lang.reflect.*;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class MyTeste {
	
	private float []array;
	private MyTeste teste;
	private boolean []xpto;
	
	public void func(String name, String surname, int age){
		System.out.println(name + " - " + surname + " - " + age);
	}

	public static void main(String []args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException{
		
		MyTeste obj = new MyTeste();

		for(Field f : obj.getClass().getDeclaredFields()){
			f.setAccessible(true);
			System.out.println(f.getType().getName());
		}
		
		/*	Class c = Class.forName("nosi.teste.MyTeste");
		MyTeste myTeste = (MyTeste) c.newInstance();
		
		Method m = null;
		
		for(Method aux : c.getMethods())
			if("func".equals(aux.getName()))
				m = aux;
		
		Class []paramTypes = m.getParameterTypes();
		int count = m.getParameterCount();
		Object []param = new Object[]{"Iekiny", "Marcel", 23};
		
		m.invoke(myTeste, param);*/
	}
	
}
