package nosi.core.webapp.webservices.helpers;

import java.security.NoSuchAlgorithmException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.ws.rs.client.Client;
import org.glassfish.jersey.client.ClientProperties;
import org.glassfish.jersey.client.JerseyClientBuilder;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import nosi.core.webapp.helpers.UrlHelper;

public class ConfigurationRequest {
    private final RestRequest request;
    private static Client sharedClient;

    public ConfigurationRequest(RestRequest request) {
        this.request = request;
    }

    /** Application-owned transport. Callers close responses, never this client. */
    public Client getSharedClient() {
        synchronized (ConfigurationRequest.class) {
            if (sharedClient == null) {
                sharedClient = new JerseyClientBuilder()
                        .register(HttpAuthenticationFeature.basicBuilder().build())
                        .register(MultiPartFeature.class)
                        .property(ClientProperties.CONNECT_TIMEOUT,
                                Integer.getInteger("igrp.rest.connectTimeoutMillis", 30000))
                        .property(ClientProperties.FOLLOW_REDIRECTS, false)
                        .build();
            }
            return sharedClient;
        }
    }

    /** Called when the web application is stopped or redeployed. */
    public static synchronized void closeSharedClient() {
        if (sharedClient != null) {
            sharedClient.close();
            sharedClient = null;
        }
    }

    /** Legacy factory: creates a separate client which the caller must close. */
    public Client bluidClient() {
        return new JerseyClientBuilder()
                .sslContext(createSslContext())
                .hostnameVerifier(getHostNameVerifier())
                .register(getHttpAuthenticationFeature())
                .register(MultiPartFeature.class)
                .property(ClientProperties.CONNECT_TIMEOUT,
                        Integer.getInteger("igrp.rest.connectTimeoutMillis", 30000))
                .property(ClientProperties.READ_TIMEOUT,
                        Integer.getInteger("igrp.rest.readTimeoutMillis", 300000))
                .property(ClientProperties.FOLLOW_REDIRECTS, false)
                .build();
    }

    public String getUrl() {
        return UrlHelper.urlEncoding(request.getFinal_url());
    }

    public HttpAuthenticationFeature getHttpAuthenticationFeature() {
        return HttpAuthenticationFeature.basic(request.getUsername(), request.getPassword());
    }

    public HostnameVerifier getHostNameVerifier() {
        return HttpsURLConnection.getDefaultHostnameVerifier();
    }

    public SSLContext createSslContext() {
        try {
            return SSLContext.getDefault();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("Default TLS context is unavailable", e);
        }
    }

    /** Null selects the JVM's configured trust managers, including its trust store. */
    public TrustManager[] createTrustManager() {
        return null;
    }
}
