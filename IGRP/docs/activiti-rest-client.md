# Activiti REST client and downloads

The Java 8 REST helper reuses an application-scoped Jersey client. Basic credentials,
Accept headers and read timeouts belong to individual requests. The servlet listener
closes the client on shutdown. Request objects are mutable and must not be shared
between threads; the transport can be shared.

Every returned JAX-RS Response belongs to the caller. Use try-with-resources,
including when parsing JSON throws. Responses are streamed without bufferEntity().
HTTP error statuses remain available for ResponseError parsing. Transport failures
now propagate as ProcessingException instead of returning null.

## Large or slow downloads

TaskServiceRest.getFile transfers its response to FileRest. The framework controller
streams the file in 64 KiB blocks and closes FileRest even if the browser disconnects.
Content-Length is a long; an unknown length is omitted from the servlet response.
Code consuming FileRest directly must close either the file or its content stream.

For saving directly to a file or another output stream:

```java
RestRequest request = new RestRequest(); // Activiti rest.request.RestRequest
request.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
request.setReadTimeoutMillis(600000);
try (OutputStream output = Files.newOutputStream(destination)) {
    long bytes = request.download("repository/deployments/123/resourcedata/model.bpmn", output);
}
```

download closes its HTTP response but leaves the supplied output open. It uses a
fixed-size buffer and a long byte counter. A failed copy may leave partial output;
callers should write to a temporary destination and publish it only after success.
No automatic retry is performed by the download helper.

Default timeouts are 30 seconds to connect and 5 minutes of read inactivity.
Configure JVM properties igrp.rest.connectTimeoutMillis and igrp.rest.readTimeoutMillis,
or setReadTimeoutMillis on an individual request (0 means no read timeout).
The read timeout does not limit the total duration of an actively streaming download.
Proxy and servlet-container timeouts remain separate deployment settings.

Methods returning Base64 strings or JSON strings still materialize their result;
use FileRest or download for large binary files.

## TLS, redirects and uploads

TLS uses the JVM trust store and hostname verification. Install a private CA into
the configured trust store when necessary; accepting all certificates was removed.
Automatic redirects are disabled so authenticated requests cannot silently follow
another destination. Callers that follow redirects must validate the destination.

Multipart uploads use Jersey's multipart provider. Part streams opened by the
helper are closed after upload. An InputStream supplied by the caller remains
caller-owned. Existing public request method signatures are preserved.

ConfigurationRequest.bluidClient remains a legacy independent-client factory;
its caller must close that client. The REST helper uses getSharedClient instead.
Custom ConfigurationRequest subclasses that formerly overrode only bluidClient
must adapt to this transport ownership contract.
