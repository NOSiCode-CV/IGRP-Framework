package nosi.teste;

import java.lang.annotation.Annotation;
import java.lang.reflect.*;

import java.io.*;

import nosi.core.webapp.RParam;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class MyTeste {
	
	private float []array;
	private MyTeste teste;
	private boolean []xpto;
	/*
	public void func(@RParam(rParamName = "param1") String name, DefaultpaginaModel model){
		System.out.println(name);
	}
	*/
	public void  func2(int x){
		System.out.println("Ok");
	}

	public static void main(String []args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException{
	
		// ([a-zA-Z]+[0-9]*(_{1}|-{1})?([a-zA-Z]+|[0-9]+|_))+
		String str = "dhgfhjejrhdgf_121221-/default/index";
		String pattern = "([a-zA-Z]+([0-9]*(_{1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+/[a-zA-Z]{2,255}/[a-zA-Z]{2,255}";
		
		System.out.println(str.matches(pattern));
		
		System.exit(1);
		
		MyTeste obj =  new MyTeste();
		Class c = obj.getClass();
		for(Method method : c.getDeclaredMethods()){
			if(method.getName().equals("func")){
				for(Parameter parameter : method.getParameters()){
					System.out.println(parameter.getType().getName());// teste if the parameter is primitive
					if(parameter.getAnnotation(RParam.class) != null)
						System.out.println(parameter.getAnnotation(RParam.class).rParamName());
				}
					
			}
			/*for(Parameter parameter :method.getParameters()){
				QSParam a = parameter.getAnnotation(QSParam.class);
				System.out.println(a.qsParamName());
			}*/
		}
	}
	
}