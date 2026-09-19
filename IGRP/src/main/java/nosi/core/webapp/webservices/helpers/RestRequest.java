package nosi.core.webapp.webservices.helpers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Objects;
import javax.servlet.http.Part;
import javax.ws.rs.ProcessingException;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.glassfish.jersey.client.ClientProperties;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.file.StreamDataBodyPart;
import com.google.gson.annotations.Expose;

/**
 * Mutable, per-operation request settings. The transport is application scoped.
 * Callers own every returned Response and must close it, preferably with
 * try-with-resources. Entities are streamed, never buffered by this helper.
 */
public class RestRequest {
    @Expose(serialize=false,deserialize=false)
    private String base_url;
    @Expose(serialize=false,deserialize=false)
    private String final_url;
    @Expose(serialize=false,deserialize=false)
    private Boolean useBaseUrl = true;
    @Expose(serialize=false,deserialize=false)
    private String username;
    @Expose(serialize=false,deserialize=false)
    private String password;
    @Expose(serialize=false,deserialize=false)
    private String accept_format = MediaType.APPLICATION_JSON;
    @Expose(serialize=false,deserialize=false)
    private static final String content_type = MediaType.APPLICATION_JSON;
    @Expose(serialize=false,deserialize=false)
    private ConfigurationRequest config;
    @Expose(serialize=false,deserialize=false)
    private int readTimeoutMillis = Integer.getInteger("igrp.rest.readTimeoutMillis", 300000);

    public RestRequest() {
        config = new ConfigurationRequest(this);
    }

    /** Read inactivity timeout, not a limit on total download duration; zero disables it. */
    public void setReadTimeoutMillis(int timeoutMillis) {
        if (timeoutMillis < 0)
            throw new IllegalArgumentException("Read timeout must not be negative");
        readTimeoutMillis = timeoutMillis;
    }

    private Invocation.Builder prepare(String url, Object id) {
        addUrl(Objects.requireNonNull(url, "url"));
        WebTarget target = getConfig().getSharedClient().target(getConfig().getUrl());
        if (id != null)
            target = target.path(String.valueOf(id));
        Invocation.Builder builder = target.request(getAccept_format())
                .property(ClientProperties.READ_TIMEOUT, readTimeoutMillis);
        if (getUsername() != null && getPassword() != null) {
            builder.property(HttpAuthenticationFeature.HTTP_AUTHENTICATION_BASIC_USERNAME, getUsername())
                    .property(HttpAuthenticationFeature.HTTP_AUTHENTICATION_BASIC_PASSWORD, getPassword());
        }
        return builder;
    }

    private Response execute(String method, String url, Object id, Entity<?> entity) {
        Invocation.Builder builder = prepare(url, id);
        // Preserve HTTP error responses for Activiti's ResponseError parsing.
        // Transport failures propagate as ProcessingException; never silently return null.
        return entity == null ? builder.method(method) : builder.method(method, entity);
    }

    public Response get(String url) {
        return execute("GET", url, null, null);
    }

    public Response get(String url, Object id) {
        return execute("GET", url, id, null);
    }

    public Response post(String url, String content) {
        return execute("POST", url, null, Entity.json(content));
    }

    public Response post(String url, String content, Object id) {
        return execute("POST", url, id, Entity.json(content));
    }

    public Response put(String url, String content) {
        return execute("PUT", url, null, Entity.json(content));
    }

    public Response put(String url, String content, Object id) {
        return execute("PUT", url, id, Entity.json(content));
    }

    public Response delete(String url, Object id) {
        return execute("DELETE", url, id, null);
    }

    public Response post(String url, Part file, String fileExtension) throws IOException {
        try (InputStream input = file.getInputStream()) {
            return post(url, input, file.getName() + fileExtension, file.getContentType());
        }
    }

    public Response post(String url, Part file) throws IOException {
        try (InputStream input = file.getInputStream()) {
            return post(url, input, file.getSubmittedFileName(), file.getContentType());
        }
    }

    /** The supplied input stream remains owned by the caller. */
    public Response post(String url, InputStream file, String fileName, String contentType) throws IOException {
        Objects.requireNonNull(file, "file");
        // Multipart cleanup must not close a caller-owned stream.
        InputStream borrowed = new java.io.FilterInputStream(file) {
            @Override public void close() { }
        };
        Response response = null;
        try (FormDataMultiPart body = new FormDataMultiPart()) {
            body.bodyPart(new StreamDataBodyPart("file", borrowed, fileName,
                    contentType == null ? MediaType.APPLICATION_OCTET_STREAM_TYPE : MediaType.valueOf(contentType)));
            response = execute("POST", url, null, Entity.entity(body, body.getMediaType()));
        } catch (IOException | RuntimeException e) {
            if (response != null)
                response.close();
            throw e;
        }
        return response;
    }

    /**
     * Copies a successful response using a fixed 64 KiB buffer. Closes the HTTP
     * response on success or failure, but leaves the caller's output open.
     * On failure the output may contain a partial download; no retry is attempted.
     */
    public long download(String url, OutputStream output) throws IOException {
        Objects.requireNonNull(output, "output");
        try (Response response = get(url)) {
            if (response.getStatusInfo().getFamily() != Response.Status.Family.SUCCESSFUL)
                throw new IOException("Download failed with HTTP status " + response.getStatus());
            if (!response.hasEntity())
                return 0;
            try (InputStream input = response.readEntity(InputStream.class)) {
                byte[] buffer = new byte[64 * 1024];
                long total = 0;
                int count;
                while ((count = input.read(buffer)) != -1) {
                    output.write(buffer, 0, count);
                    total += count;
                }
                return total;
            }
        } catch (ProcessingException e) {
            throw new IOException("Download transport failed", e);
        }
    }

	public void addUrl(String url){
		final_url=(Boolean.TRUE.equals(useBaseUrl) && base_url != null ? base_url : "") + url;
	}
	public String getBase_url() {
		return base_url;
	}

	public void userBaseUrl(Boolean use_base_url) {
		useBaseUrl=use_base_url;
	}

	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}
	
	public String getAccept_format() {
		return accept_format;
	}

	public void setAccept_format(String accept_format) {
		this.accept_format = Objects.requireNonNull(accept_format, "accept_format");
	}

	public String getContent_type() {
		return content_type;
	}


	public ConfigurationRequest getConfig() {
		return config;
	}

	public void setConfig(ConfigurationRequest config) {
		this.config = config;
	}

    public String getFinal_url() {
        return final_url;
    }
	public void setBase_url(String url) {
		base_url=url;
	}

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
