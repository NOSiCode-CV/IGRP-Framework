package tests;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.List;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.client.urlconnection.HTTPSProperties;

import nosi.webapps.agenda.helper.RestRequestHelper;

import org.json.*;
/**
 * @author Marcel Iekiny
 * Aug 3, 2017
 */
public final class App {
	
	private static final String url = "http://imf:8280/services/MyFirstDS/user_/2";
	
	private App() {}
	
	public static void main(String []args) throws NoSuchAlgorithmException, KeyManagementException, ClassNotFoundException {
		/*List<User> obj = null;
		Gson gson = new Gson();
		String aux = "[{\"updated_at\":1458171615,\"password_hash\":\"$2y$13$85kYuq/UcbvsodmjgORQx.8UUYe9rzozZsEmD7EdbHljHlAAI2zu2\",\"created_at\":1458171615,\"password_reset_token\":null,\"id\":2,\"auth_key\":\"8XC3IWv8gusgmsE6Ec4_ut-MR359NbMJ\",\"funcionario\":null,\"email\":\"iekinyfernandes@gmail.com\",\"username\":\"demo\",\"status\":1}]";
		 obj = gson.fromJson(aux,  new TypeToken<List<User>>(){}.getType());
		System.out.println(obj.get(0).getUsername());
		
		System.exit(1);
		*/
		ClientConfig config = new DefaultClientConfig();
		 
         Client client = Client.create(RestRequestHelper.applySslSecurity(config));
         
         WebResource resource = client.resource(url);
        
         ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

    	 String jsonResult = response.getEntity(String.class);
    	 
         if(response.getStatus() == 200) {
        	// User user = RestRequestHelper.convertJsonToDao(jsonResult, "tbl_userCollection", "tbl_user", User.class);
        	 System.out.println("Ok");
         }
         else {
        	 System.out.println("Error");
        	 System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
         }
         
        client.destroy();
		
		System.out.println();
	}
}
