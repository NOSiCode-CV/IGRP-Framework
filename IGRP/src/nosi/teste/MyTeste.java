package nosi.teste;

import java.lang.annotation.Annotation;
import java.lang.reflect.*;
import nosi.core.webapp.QSParam;;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class MyTeste {
	
	private float []array;
	private MyTeste teste;
	private boolean []xpto;
	
	public void func(@QSParam(qsParamName = "param1") String name){
		System.out.println(name);
	}

	public static void main(String []args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException{
		MyTeste obj =  new MyTeste();
		Class c = obj.getClass();
		for(Method method : c.getDeclaredMethods()){
			
			/*for(Parameter parameter :method.getParameters()){
				QSParam a = parameter.getAnnotation(QSParam.class);
				System.out.println(a.qsParamName());
			}*/
		}
	}
	
}