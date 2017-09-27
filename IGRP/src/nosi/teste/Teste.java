package nosi.teste;

import org.apache.commons.lang.RandomStringUtils;

/**
 * Isaias.Nunes
 * Sep 27, 2017
 */

public class Teste {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String teste = java.util.UUID.randomUUID().toString().replaceAll("-", "");
		System.out.println(teste);
		System.out.println(RandomStringUtils.randomAlphabetic(40));
	}

}
