package nosi.core.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.security.cert.CertificateException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import nosi.core.config.Config;
import nosi.core.webapp.User;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;
/**
 * Marcel Iekiny
 * Nov 02, 2017
 */
@WebServlet(name = "igrpoauth2sso", urlPatterns = "/igrpoauth2sso") 
public class IgrpOAuth2SSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public IgrpOAuth2SSO() { 
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("SSO entrado ... "); 
		
		String app = request.getParameter("app"); 
		String _url = request.getParameter("_url"); 
		
		Properties settings = this.load("common", "main.xml"); 
		
		String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri"); 
		String client_id = settings.getProperty("ids.wso2.oauth2.client_id"); 
		String authorizeUrl = settings.getProperty("ids.wso2.oauth2.endpoint.authorize"); 
		
		if(client_id == null || client_id.isEmpty() || redirect_uri == null || redirect_uri.isEmpty() || authorizeUrl == null || authorizeUrl.isEmpty()) {
			response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
		}else {
			
			String sessionValue = (String) request.getSession().getAttribute("_identity-igrp");
			if(sessionValue != null && !sessionValue.isEmpty()) {
				String auxUrl = "app/webapps?r=igrp/home/index";
				if(app != null && !app.isEmpty()) auxUrl += "&dad=" + app; 
				if(_url != null && !_url.isEmpty()) auxUrl += "&_url=" + _url; 
				
				response.sendRedirect(auxUrl); 
				return;
			} 
			
			if(app != null && !app.isEmpty()) 
				request.getSession().setAttribute("_appHomeUrl", app); 
			
			if(_url != null && !_url.isEmpty()) 
				request.getSession().setAttribute("_url", _url); 
			
			String warName = new File(this.getServletContext().getRealPath("/")).getName(); 
			redirect_uri = redirect_uri.replace("IGRP", warName);
			
			authorizeUrl += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=CoeDjo10&redirect_uri=" + redirect_uri;
			
			response.sendRedirect(authorizeUrl); 
			
		}
		
	} 
	
	private Properties load(String filePath, String fileName) {
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath());
		
		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream(file)) {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
	
}
