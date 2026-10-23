package nosi.core.webapp.activit.rest.business;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.LongSupplier;

/** Small, bounded probe for UI visibility; never loads the complete process list. */
final class ActivitiProcessAvailability {
    private static final Logger LOG = LoggerFactory.getLogger(ActivitiProcessAvailability.class);
    private static final long POSITIVE_CACHE_NANOS = Duration.ofMinutes(30).toNanos();
    private static final long NEGATIVE_CACHE_NANOS = Duration.ofSeconds(30).toNanos();
    private final ConcurrentHashMap<String, Result> results = new ConcurrentHashMap<>();
    private final String baseUrl;
    private final boolean configured;
    private final HttpClient client;
    private final LongSupplier clock;
    private final Duration requestTimeout;

    ActivitiProcessAvailability(String baseUrl, String username, String password) {
        this(baseUrl, username, password, System::nanoTime, Duration.ofSeconds(3));
    }

    ActivitiProcessAvailability(String baseUrl, String username, String password,
                               LongSupplier clock, Duration requestTimeout) {
        this.baseUrl = baseUrl;
        this.clock = clock;
        this.requestTimeout = requestTimeout;
        this.configured = baseUrl != null && !baseUrl.isBlank()
                && username != null && !username.isBlank() && password != null && !password.isEmpty();
        this.client = HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(2))
                .authenticator(new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password.toCharArray());
                    }
                }).build();
    }

    boolean hasProcesses(String dad) {
        if (!configured || dad == null || dad.isBlank() || Thread.currentThread().isInterrupted()) {
            return false;
        }
        long now = clock.getAsLong();
        results.entrySet().removeIf(entry -> entry.getValue().expired(now));
        return results.compute(dad, (key, previous) -> {
            if (previous != null && !previous.expired(clock.getAsLong())) {
                return previous;
            }
            boolean available = probe(key);
            return new Result(available, clock.getAsLong());
        }).available();
    }

    private boolean probe(String dad) {
        try {
            String endpoint = baseUrl.endsWith("/") ? baseUrl : baseUrl + "/";
            URI uri = URI.create(endpoint + "repository/process-definitions?size=1&suspended=false&latest=true&tenantId="
                    + URLEncoder.encode(dad, StandardCharsets.UTF_8));
            HttpRequest request = HttpRequest.newBuilder(uri).timeout(requestTimeout)
                    .header("Accept", "application/json").GET().build();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() != 200) {
                LOG.debug("Activiti process availability check returned HTTP {}", response.statusCode());
                return false;
            }
            return !new JSONObject(response.body()).getJSONArray("data").isEmpty();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        } catch (IOException | RuntimeException e) {
            LOG.debug("Activiti process availability check failed", e);
            return false;
        }
    }

    private record Result(boolean available, long checkedAt) {
        boolean expired(long now) {
            return now - checkedAt >= (available ? POSITIVE_CACHE_NANOS : NEGATIVE_CACHE_NANOS);
        }
    }
}
