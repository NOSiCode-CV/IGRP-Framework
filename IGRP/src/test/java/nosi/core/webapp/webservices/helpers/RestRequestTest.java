package nosi.core.webapp.webservices.helpers;

import com.sun.net.httpserver.HttpServer;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import javax.ws.rs.ProcessingException;
import javax.ws.rs.core.Response;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class RestRequestTest {
    private HttpServer server;
    private ExecutorService executor;
    private String base;

    @BeforeEach
    void start() throws IOException {
        server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        executor = Executors.newCachedThreadPool();
        server.setExecutor(executor);
        base = "http://127.0.0.1:" + server.getAddress().getPort() + "/";
        server.createContext("/echo", exchange -> {
            ByteArrayOutputStream data = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int count;
            while ((count = exchange.getRequestBody().read(buffer)) != -1)
                data.write(buffer, 0, count);
            String result = exchange.getRequestMethod() + "|" + exchange.getRequestURI()
                    + "|" + exchange.getRequestHeaders().getFirst("Accept")
                    + "|" + exchange.getRequestHeaders().getFirst("Authorization")
                    + "|" + new String(data.toByteArray(), StandardCharsets.UTF_8);
            byte[] bytes = result.getBytes(StandardCharsets.UTF_8);
            exchange.sendResponseHeaders(200, bytes.length);
            try (OutputStream output = exchange.getResponseBody()) {
                output.write(bytes);
            }
        });
        server.createContext("/large", exchange -> {
            exchange.sendResponseHeaders(200, 0); // chunked, unknown content length
            try (OutputStream output = exchange.getResponseBody()) {
                byte[] chunk = new byte[8192];
                for (int i = 0; i < 2048; i++)
                    output.write(chunk);
            }
        });
        server.createContext("/error", exchange -> {
            exchange.sendResponseHeaders(404, -1);
            exchange.close();
        });
        server.createContext("/slow", exchange -> {
            try {
                Thread.sleep(500);
                exchange.sendResponseHeaders(200, -1);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } finally {
                exchange.close();
            }
        });
        server.start();
    }

    @AfterEach
    void stop() {
        server.stop(0);
        executor.shutdownNow();
        ConfigurationRequest.closeSharedClient();
    }

    private RestRequest request() {
        RestRequest request = new RestRequest();
        request.setBase_url(base);
        return request;
    }

    @Test
    void verbsReturnReadableStreamsAndPreserveHttpErrors() {
        RestRequest request = request();
        try (Response response = request.get("echo", "123")) {
            assertTrue(response.readEntity(String.class).startsWith("GET|/echo/123|"));
        }
        try (Response response = request.post("echo", "{\"a\":1}")) {
            assertTrue(response.readEntity(String.class).endsWith("|{\"a\":1}"));
        }
        try (Response response = request.put("echo", "body", "123")) {
            assertTrue(response.readEntity(String.class).startsWith("PUT|/echo/123|"));
        }
        try (Response response = request.delete("echo", "123")) {
            assertTrue(response.readEntity(String.class).startsWith("DELETE|/echo/123|"));
        }
        try (Response response = request.get("error")) {
            assertEquals(404, response.getStatus());
        }
    }

    @Test
    void sharedTransportKeepsConcurrentCredentialsAndAcceptSeparate() throws Exception {
        RestRequest first = request();
        first.setUsername("alice");
        first.setPassword("one");
        first.setAccept_format("application/xml");
        RestRequest second = request();
        second.setUsername("bob");
        second.setPassword("two");
        assertSame(first.getConfig().getSharedClient(), second.getConfig().getSharedClient());
        Future<String> a = executor.submit(() -> {
            try (Response response = first.get("echo")) { return response.readEntity(String.class); }
        });
        Future<String> b = executor.submit(() -> {
            try (Response response = second.get("echo")) { return response.readEntity(String.class); }
        });
        assertTrue(a.get().contains("|application/xml|Basic YWxpY2U6b25l|"));
        assertTrue(b.get().contains("|application/json|Basic Ym9iOnR3bw==|"));
    }

    @Test
    void largeDownloadUsesBoundedWritesAndLeavesDestinationOpen() throws IOException {
        final long[] count = {0};
        OutputStream sink = new OutputStream() {
            @Override public void write(int value) { fail("Expected block writes"); }
            @Override public void write(byte[] bytes, int offset, int length) {
                assertTrue(length <= 64 * 1024);
                count[0] += length;
            }
            @Override public void close() { fail("Caller owns destination"); }
        };
        assertEquals(16L * 1024 * 1024, request().download("large", sink));
        assertEquals(16L * 1024 * 1024, count[0]);
        assertThrows(IOException.class, () -> request().download("error", sink));
    }

    @Test
    void failedDestinationPropagatesAndSubsequentRequestsWork() {
        OutputStream broken = new OutputStream() {
            @Override public void write(int value) throws IOException { throw new IOException("Disk full"); }
        };
        assertThrows(IOException.class, () -> request().download("large", broken));
        try (Response response = request().get("echo")) {
            assertEquals(200, response.getStatus());
        }
    }

    @Test
    void timeoutIsConfigurableAndTransportErrorsAreNotNull() {
        RestRequest request = request();
        request.setReadTimeoutMillis(50);
        assertThrows(ProcessingException.class, () -> request.get("slow"));
        assertThrows(IllegalArgumentException.class, () -> request.setReadTimeoutMillis(-1));
    }

    @Test
    void multipartPreservesPayloadAndCallerStreamOwnership() throws IOException {
        ByteArrayInputStream input = new ByteArrayInputStream("upload-content".getBytes(StandardCharsets.UTF_8)) {
            @Override public void close() { fail("Caller owns upload stream"); }
        };
        try (Response response = request().post("echo", input, "example.txt", "text/plain")) {
            String body = response.readEntity(String.class);
            assertTrue(body.contains("filename=\"example.txt\""));
            assertTrue(body.contains("Content-Type: text/plain"));
            assertTrue(body.contains("upload-content"));
        }
    }

    @Test
    void fileOwnsResponseUntilStreamIsClosed() throws IOException {
        Response response = request().get("echo");
        try (FileRest file = new FileRest()) {
            file.setResponse(response);
            assertTrue(file.getContent().read() >= 0);
        }
        assertThrows(IllegalStateException.class, () -> response.readEntity(String.class));
    }
}
