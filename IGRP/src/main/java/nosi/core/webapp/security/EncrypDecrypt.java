package nosi.core.webapp.security;
/**
 * @author: Emanuel Pereira
 * 17 Nov 2017
 */

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;

public class EncrypDecrypt {

	private static final String ALGO = "AES/ECB/PKCS5Padding";// "AES/ECB/PKCS5PADDING"
	private static final String CHARTSET = "UTF-8";
	private static final String SECRET_KEY_SPEC = "AES";
	private static final String SECRET_KEY_ALGO = "SHA-1";
	private static final String SECRET_KEY = "igrp.encrypt";
	public static final String SECRET_KEY_ENCRYPT_DB = "igrp.conf.db";
	
	public static String encrypt(String content) {
		return encrypt(content, getSecretKey()).replace(" ", "+");
	}

	public static String encrypt(String content, String secretKey) {
		try {
			Cipher cipher = Cipher.getInstance(ALGO);
			cipher.init(Cipher.ENCRYPT_MODE, generateSecretKey(secretKey));
			return Base64.getEncoder().encodeToString(cipher.doFinal(content.getBytes(CHARTSET)))+"=";
		} catch (Exception e) {

		}
		return content;
	}
	
	public static String decrypt(String content) {
		String customHeader = Igrp.getInstance() != null ? Igrp.getInstance().getRequest().getHeader("X-IGRP-REMOTE")
				: null;
		if (customHeader != null && customHeader.equals("1") && content.split("/").length==3 && !content.endsWith("="))
			return content;
		
		
		final String replace = content.replace(" ", "+");
		content = decrypt(replace.endsWith("=")?replace.substring(0, replace.length()-1):replace, getSecretKey());
		return content;
	}
	
//	private static Boolean isNotEncrypt(String[] content) {
//		(content.split("/"
//		if(content.length==3) {			
//			return content[2].endsWith("=");
//		
//		}
//		return false;
//		
//	}

	public static String decrypt(String content, String secretKey) {
		try {
			Cipher cipher = Cipher.getInstance(ALGO);
			cipher.init(Cipher.DECRYPT_MODE, generateSecretKey(secretKey));
			return new String(cipher.doFinal(Base64.getDecoder().decode(content)));
		} catch (Exception e) {

		}
		return null;
	}
	
	private static String getSecretKey() {
		return Igrp.getInstance().getRequest().getSession().getId();
	}

	public static SecretKeySpec generateSecretKey(String key) {
		try {
			byte[] byteKey = key.getBytes(CHARTSET);
			MessageDigest sha = MessageDigest.getInstance(SECRET_KEY_ALGO);
			byteKey = sha.digest(byteKey);
			byteKey = Arrays.copyOf(byteKey, 16);
			return new SecretKeySpec(byteKey, SECRET_KEY_SPEC);
		} catch (Exception e) {

		}
		return null;
	}

}
