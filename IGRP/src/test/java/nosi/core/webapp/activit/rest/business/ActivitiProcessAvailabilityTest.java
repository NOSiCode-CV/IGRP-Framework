package nosi.core.webapp.activit.rest.business;

import com.sun.net.httpserver.HttpServer;
import org.junit.jupiter.api.Test;

import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

import static org.junit.jupiter.api.Assertions.*;

class ActivitiProcessAvailabilityTest {
    @Test
    void boundsQueryAndCachesPositiveResultsLongerThanNegativeResultsPerApplication() throws Exception {
        AtomicInteger calls = new AtomicInteger();
        AtomicLong clock = new AtomicLong();
        AtomicReference<String> body = new AtomicReference<>("{\"data\":[{\"id\":\"1\"}]}");
        AtomicReference<String> query = new AtomicReference<>();
        HttpServer server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/service/repository/process-definitions", exchange -> {
            calls.incrementAndGet();
            query.set(exchange.getRequestURI().getRawQuery());
            byte[] bytes = body.get().getBytes(StandardCharsets.UTF_8);
            exchange.sendResponseHeaders(200, bytes.length);
            exchange.getResponseBody().write(bytes);
            exchange.close();
        });
        server.start();
        try {
            var check = new ActivitiProcessAvailability(url(server), "user", "password", clock::get, Duration.ofSeconds(3));
            assertTrue(check.hasProcesses("app & one"));
            assertEquals("size=1&suspended=false&latest=true&tenantId=app+%26+one", query.get());
            body.set("{\"data\":[]}");
            clock.set(Duration.ofSeconds(29).toNanos());
            assertTrue(check.hasProcesses("app & one"));
            assertEquals(1, calls.get());
            assertFalse(check.hasProcesses("another"));
            clock.set(Duration.ofSeconds(30).toNanos());
            assertTrue(check.hasProcesses("app & one"));
            assertEquals(2, calls.get());
            clock.set(Duration.ofSeconds(299).toNanos());
            assertTrue(check.hasProcesses("app & one"));
            assertEquals(2, calls.get());
            clock.set(Duration.ofMinutes(5).toNanos());
            assertFalse(check.hasProcesses("app & one"));
            assertEquals(3, calls.get());
            body.set("{\"data\":[{}]}");
            assertFalse(check.hasProcesses("app & one"));
            clock.set(Duration.ofSeconds(329).toNanos());
            assertFalse(check.hasProcesses("app & one"));
            assertEquals(3, calls.get());
            clock.set(Duration.ofSeconds(330).toNanos());
            assertTrue(check.hasProcesses("app & one"));
            assertEquals(4, calls.get());
        } finally {
            server.stop(0);
        }
    }

    @Test
    void hidesForHttpErrorsMalformedResponsesAndUnavailableService() throws Exception {
        AtomicInteger status = new AtomicInteger(401);
        HttpServer server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/service/repository/process-definitions", exchange -> {
            byte[] body = "invalid JSON".getBytes(StandardCharsets.UTF_8);
            exchange.sendResponseHeaders(status.get(), body.length);
            exchange.getResponseBody().write(body);
            exchange.close();
        });
        server.start();
        var check = new ActivitiProcessAvailability(url(server), "user", "password");
        try {
            assertFalse(check.hasProcesses("unauthorized"));
            status.set(200);
            assertFalse(check.hasProcesses("malformed"));
        } finally {
            server.stop(0);
        }
        assertFalse(check.hasProcesses("offline"));
        assertFalse(new ActivitiProcessAvailability("", "", "").hasProcesses("app"));
    }

    @Test
    void boundsSlowRequestsAndPreservesInterruption() throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/service/repository/process-definitions", exchange -> {
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } finally {
                exchange.close();
            }
        });
        server.start();
        try {
            var check = new ActivitiProcessAvailability(url(server), "user", "password",
                    System::nanoTime, Duration.ofMillis(100));
            assertTimeout(Duration.ofSeconds(2), () -> assertFalse(check.hasProcesses("slow")));
            Thread.currentThread().interrupt();
            assertFalse(check.hasProcesses("interrupted"));
            assertTrue(Thread.currentThread().isInterrupted());
        } finally {
            Thread.interrupted();
            server.stop(0);
        }
    }

    private String url(HttpServer server) {
        return "http://127.0.0.1:" + server.getAddress().getPort() + "/service/";
    }
}
