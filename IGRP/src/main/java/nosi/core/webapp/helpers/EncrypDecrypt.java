package nosi.core.webapp.helpers;
/**
 * @author: Emanuel Pereira
 * 17 Nov 2017
 */

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import nosi.core.webapp.Igrp;

public class EncrypDecrypt {

	private final String ALGO = "AES/ECB/PKCS5Padding";// "AES/ECB/PKCS5PADDING"
	private final String CHARTSET = "UTF-8";
	private final String SECRET_KEY_SPEC = "AES";
	private final String SECRET_KEY_ALGO = "SHA-1";
	public String SECRET_KEY = "igrp.encrypt";
	public final String SECRET_KEY_ENCRYPT_DB = "igrp.conf.db";
	
	public String encrypt(String content) {
		if (getWakandaList(content)) {
			content = encrypt(content, getSecretKey()).replace(" ", "+");
		}
		return content;
	}

	public boolean getWakandaList(String content) {
		return 
				!content.equals("igrp/login/login")	&& 
				!content.equals("igrp/ErrorPage/exception") && 
				!content.equals("igrp/error-page/exception") && 
				!content.equals("igrp/login/logout") && 
				!content.contains("igrp/page") && 	
				!content.contains("changeStatus");
	}
	
	public String decrypt(String content) {
		String customHeader = Igrp.getInstance().getRequest().getHeader("X-IGRP-REMOTE");
		if(customHeader != null && customHeader.equals("1")) return content;
		
		if (getWakandaList(content) ) {
			content = decrypt(content.replace(" ", "+"), getSecretKey()); 
		}
		return content;
	}

	private String getSecretKey() {
		if(this.SECRET_KEY==null)
			this.SECRET_KEY = (Igrp.getInstance().getRequest() != null) ? Igrp.getInstance().getRequest().getSession().getId() : null;
		return this.SECRET_KEY;
	}

	public SecretKeySpec generateSecretKey(String key) {
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

	public String encrypt(String content, String secretKey) {
		try {
			Cipher cipher = Cipher.getInstance(ALGO);
			cipher.init(Cipher.ENCRYPT_MODE, generateSecretKey(secretKey));
			return Base64.getEncoder().encodeToString(cipher.doFinal(content.getBytes(CHARTSET)));
		} catch (Exception e) {

		}
		return null; 
	}

	public String decrypt(String content, String secretKey) {
		try {
			Cipher cipher = Cipher.getInstance(ALGO);
			cipher.init(Cipher.DECRYPT_MODE, generateSecretKey(secretKey));
			return new String(cipher.doFinal(Base64.getDecoder().decode(content)));
		} catch (Exception e) {

		}
		return null;
	}

}
