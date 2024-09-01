package nosi.core.webapp.webservices.helpers;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Base64;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.ClientRequestContext;
import jakarta.ws.rs.client.ClientRequestFilter;
import jakarta.ws.rs.core.HttpHeaders;


import nosi.core.webapp.helpers.UrlHelper;

/**
 * * @author: Emanuel Pereira
 * 22 Jan 2018
 */
public class ConfigurationRequest {

	private final RestRequest request;
	
	public ConfigurationRequest(RestRequest request) {
		this.request = request;
	}
	public Client bluidClient() {
		 ClientBuilder clientBuild = ClientBuilder.newBuilder()
			.register(new Authenticator(this.request.getUsername(), this.request.getPassword()));
		if(request.getBase_url().startsWith("https://"))
			clientBuild.sslContext(this.createSslContext()).hostnameVerifier(this.getHostNameVerifier());
		
		return clientBuild.build();
	}
	public String getUrl() {
		return UrlHelper.urlEncoding(this.request.getBase_url());
	}

   private record Authenticator(String user, String password) implements ClientRequestFilter {

      @Override
      public void filter(ClientRequestContext requestContext) {
         var authString = user + ":" + password;
         var encodedAuthString = Base64.getEncoder().encodeToString(authString.getBytes());
         requestContext.getHeaders().add(HttpHeaders.AUTHORIZATION, "Basic " + encodedAuthString);
      }
   }
	public HostnameVerifier getHostNameVerifier() {
	    return (String s, SSLSession sslSession) -> s.equalsIgnoreCase(sslSession.getPeerHost());
	}
	public SSLContext createSslContext() {
		SSLContext sslContext = null;
		try {
			sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, this.createTrustManager(), new java.security.SecureRandom());// new java.security.SecureRandom()
		} catch (NoSuchAlgorithmException | KeyManagementException ignored) {
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
}
