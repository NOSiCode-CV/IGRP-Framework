package nosi.teste;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MyTeste {

	public static void main(String []args) throws NoSuchFieldException, SecurityException{
		
		try {
			byte[] teste = "demo".getBytes();
			MessageDigest m = MessageDigest.getInstance("MD5");
			byte[] thedigest = m.digest(teste);
			BigInteger bi = new BigInteger(1, thedigest); 
			
			System.out.println(bi.toString(16));
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}
		
		
	}
	
}
