package nosi.core.webapp.digicert;

//To modify this template, edit file JavaS.txt in TEMPLATE
//directory of SQL Navigator
//
//Purpose: Briefly explain the functionality of the procedure
//
//MODIFICATION HISTORY
//Person      Date    Comments
//---------   ------  -------------------------------------------
//
import java.lang.*;
import java.io.ByteArrayInputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

import org.apache.cxf.common.util.Base64Exception;
import org.apache.cxf.common.util.Base64Utility;


public class Validation {

	public static byte[] Base64ToByte(String value) throws Base64Exception {
		return Base64Utility.decode(value);
	}

	public static String verifySignature(String data, String signature, String cert) {
		boolean isValid = false;
		String subject = "";

		/*
		 * try { Provider p[] = Security.getProviders(); for (int i = 0; i < p.length;
		 * i++) { System.out.println(p[i]); for (Enumeration e = p[i].keys();
		 * e.hasMoreElements();) System.out.println("\t" + e.nextElement()); } } catch
		 * (Exception e) { System.out.println(e); }
		 */

		try {

			byte[] authCertBA = Base64ToByte(cert);
			byte[] b_signature = Base64ToByte(signature);

			System.out.println("--------------------------------------------------------------------------------");

			System.out.println("DATA:: " + data);
			System.out.println("SIGNATURE: " + signature);
			System.out.println("CERTIFICATE: " + cert);

			System.out.println("--------------------------------------------------------------------------------");

			CertificateFactory certFactory = CertificateFactory.getInstance("X509");
			X509Certificate authCert = (X509Certificate) certFactory
					.generateCertificate(new ByteArrayInputStream(authCertBA));

			System.out.println("SUBJECT DN: " + authCert.getSubjectX500Principal().getName());
			System.out.println("PUBLIC KEY: " + authCert.getPublicKey());
			System.out.println("Algorithm: " + authCert.getPublicKey().getAlgorithm());
			System.out.println("Signature Algorithm: " + authCert.getSigAlgName());

			// Signature signatureEngine = Signature.getInstance("SHA256withRSA");
			Signature signatureEngine = Signature.getInstance(authCert.getSigAlgName());

			// initialize for verification with our verification key that we got
			// from
			// the certificate
			signatureEngine.initVerify(authCert.getPublicKey());

			// put the original data that claims to be signed
			signatureEngine.update(data.getBytes());

			isValid = signatureEngine.verify(b_signature);

			if (isValid)
				subject = authCert.getSubjectX500Principal().toString();

		} catch (CertificateException e) {
			throw new RuntimeException("CertificateException::" + e.getMessage());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new RuntimeException("NoSuchAlgorithmException::" + e.getMessage());
		} catch (InvalidKeyException e) {
			throw new RuntimeException("InvalidKeyException::" + e.getMessage());
		} catch (SignatureException e) {
			throw new RuntimeException("SignatureException::" + e.getMessage());
			
		} catch ( Base64Exception e) {
			throw new RuntimeException("Base64Exception::" + e.getMessage());
		}

		return subject;
	}
}