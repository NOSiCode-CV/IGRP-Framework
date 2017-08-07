package nosi.webapps.agenda.helper;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.List;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.client.urlconnection.HTTPSProperties;
import java.lang.reflect.Type;
import nosi.webapps.agenda.dao.Fault;
/**
 * Marcel Iekiny
 * Aug 4, 2017
 */
public final class RestRequestHelper{
	
	public static final String baseUrl = "https://localhost:9092/services/DSN_Agenda";
	
	private RestRequestHelper() {}
	
	// Convert the JSON result to a list of DAO objects
	public static List convertJsonToDaoColl(String jsonResult, String groupName, String resourceName, Type type){
		List list = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			if(jsonObject.has(groupName)) {
				JSONObject aux = jsonObject.getJSONObject(groupName);
				if(aux.has(resourceName)) {
					String result = aux.getJSONArray(resourceName).toString();
					Gson gson = new Gson();
					list = gson.fromJson(result, type);//new TypeToken<List>(){}.getType()
				}
			}
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Object convertJsonToDao(String jsonResult, String groupName, String resourceName, Type type) {
		List list = RestRequestHelper.convertJsonToDaoColl(jsonResult, groupName, resourceName, type);
		return list != null ? list.get(0) : list; // :-)
	}
	
	// Convert the JSON result to a list of DAO objects
	//public static <T> List<T> convertJsonToDaoColl(String jsonResult, String groupName, String resourceName, Type daoClass /*param. not used*/){
		/*List<T> list = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			JSONArray jsonArray = jsonObject.getJSONObject(groupName).getJSONArray(resourceName);
			String result = jsonArray.toString();
			Gson gson = new Gson();
			Type type = new TypeToken<List<T>>(){}.getType();
			list = (List<T> ) gson.fromJson(result, new TypeToken<List<T>>(){}.getType());
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return list;
	}
	*/
	
	// Convert the json result to Fault object
	public static Fault convertToDefaultFault(String jsonResult) {
		Fault fault = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			String result = jsonObject.getJSONObject("Fault").toString();
			Gson gson = new Gson();
			fault = gson.fromJson(result, Fault.class);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return fault;
	}
	
	public static ClientConfig applySslSecurity(ClientConfig clientConfig) {
		SSLContext sslContext = RestRequestHelper.createSslContext();
		if(sslContext != null) {
			clientConfig.getProperties()
	        .put(HTTPSProperties.PROPERTY_HTTPS_PROPERTIES,
	                new HTTPSProperties(
	                        new HostnameVerifier() {
								public boolean verify(String hostname, SSLSession session) {
									return false;
								}
							},
	                        sslContext));
			}
		return clientConfig;
	}
	
	private static SSLContext createSslContext() {
		SSLContext sslContext = null;
		try {
			sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, RestRequestHelper.createTrustManager(), new java.security.SecureRandom());// new java.security.SecureRandom()
		} catch (NoSuchAlgorithmException | KeyManagementException e) {
			e.printStackTrace();
		}
		return sslContext;
	}
	
	private static TrustManager[] createTrustManager() {
		return new TrustManager[]{
                new X509TrustManager() {
                    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }
                    public void checkClientTrusted(
                            final java.security.cert.X509Certificate[] arg0, final String arg1)
                            throws CertificateException {
                        // do nothing and blindly accept the certificate
                    }
                    public void checkServerTrusted(
                            final java.security.cert.X509Certificate[] arg0, final String arg1)
                            throws CertificateException {
                        // do nothing and blindly accept the server
                    }

                }
        };
	}
}