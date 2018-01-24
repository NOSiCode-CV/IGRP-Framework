package nosi.core.webapp.webservices.helpers;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;
import nosi.core.webapp.helpers.UrlHelper;

/**
 * * @author: Emanuel Pereira
 * 22 Jan 2018
 */
public class ConfigurationRequest {

	private RestRequest request;
	
	public ConfigurationRequest(RestRequest request) {
		this.request = request;
	}
	public Client bluidClient() {
		return  ClientBuilder.newBuilder()
				.sslContext(this.createSslContext())
				.hostnameVerifier(this.getHostNameVerifier())
				.register(this.getHttpAuthenticationFeature())
				.build();
	}

	public String getUrl() {
		return UrlHelper.urlEncoding(this.request.getBase_url());
	}

	public HttpAuthenticationFeature getHttpAuthenticationFeature() {
		return HttpAuthenticationFeature.basic(this.request.getUsername(),this.request.getPassword());
	}
	
	public HostnameVerifier getHostNameVerifier() {
		return new HostnameVerifier() {
			@Override
			public boolean verify(String s, SSLSession sslSession) {
				return true;
			}
		};
	}
	
	public SSLContext createSslContext() {
		SSLContext sslContext = null;
		try {
			sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, this.createTrustManager(), new java.security.SecureRandom());// new java.security.SecureRandom()
		} catch (NoSuchAlgorithmException | KeyManagementException e) {
		}
		return sslContext;
	}
	
	public TrustManager[] createTrustManager() {
		return new TrustManager[ ] {
			    new X509TrustManager() {			    	
			        @Override
			        public X509Certificate[] getAcceptedIssuers() {
			            return null;
			        }
			        @Override
			        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
			        }
			        @Override
			        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
			        }
			    }
        };
	}
	public Client bluidClientMultiPart() {
		return  ClientBuilder.newBuilder()
				.sslContext(this.createSslContext())
				.hostnameVerifier(this.getHostNameVerifier())
				.register(this.getHttpAuthenticationFeature())
				.build();
	}
}
