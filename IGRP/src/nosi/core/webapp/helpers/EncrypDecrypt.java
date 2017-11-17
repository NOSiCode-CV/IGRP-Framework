package nosi.core.webapp.helpers;
/**
 * @author: Emanuel Pereira
 * 17 Nov 2017
 */
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class EncrypDecrypt {

	private static final String ALGO = "AES/ECB/PKCS5Padding";//"AES/ECB/PKCS5PADDING"
	private static final String CHARTSET = "UTF-8";
    private static final String SECRET_KEY_SPEC = "AES";
    private static final String SECRET_KEY_ALGO = "SHA-1";
    
    public static void main(String args[]){
    	System.out.println(encrypt("Yma"));
    	System.out.println(encrypt("Yma"));
    	System.out.println(decrypt(encrypt("Yma")));
    }
    
	public static String encrypt(String content){
		return encrypt(content, "igrp.encrypt.test");
	}
	
	public static String decrypt(String content){
		return decrypt(content, "igrp.encrypt.test");
	}
	
	public static SecretKeySpec generateSecretKey(String key){
        MessageDigest sha = null;
        try {
        	 byte[] byteKey = key.getBytes(CHARTSET);
            sha = MessageDigest.getInstance(SECRET_KEY_ALGO);
            byteKey = sha.digest(byteKey);
            byteKey = Arrays.copyOf(byteKey, 16);
            return new SecretKeySpec(byteKey, SECRET_KEY_SPEC);
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
	
	public static String encrypt(String content, String secretKey){
        try
        {
           Cipher cipher = Cipher.getInstance(ALGO);
            cipher.init(Cipher.ENCRYPT_MODE, generateSecretKey(secretKey));
            return Base64.getEncoder().encodeToString(cipher.doFinal(content.getBytes(CHARTSET)));
        }
        catch (Exception e)
        {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }
	 
    public static String decrypt(String content, String secretKey){
        try
        {
            Cipher cipher = Cipher.getInstance(ALGO);
            cipher.init(Cipher.DECRYPT_MODE, generateSecretKey(secretKey));
            return new String(cipher.doFinal(Base64.getDecoder().decode(content)));
        }
        catch (Exception e)
        {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
}
