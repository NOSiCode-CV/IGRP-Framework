package nosi.core.filter;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nosi.core.config.Config;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.lang.reflect.Proxy;
import java.util.LinkedHashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class StaticResourceCacheFilterTest {
    private static final String BASE = "/images/IGRP/IGRP2.3/";

    @Test
    void cachesVersionedVendorAssetsIncludingConditionalResponses() throws Exception {
        for (String path : new String[]{"core/jquery/3.7.1/jquery.min.js",
                "core/bootstrap/3.4.1/fonts/glyphicons-halflings-regular.woff2",
                "core/fontawesome/4.7/css/font-awesome.min.css"}) {
            Fixture fixture = new Fixture();
            fixture.run(BASE + path, "GET", null, (req, res) -> {
                assertEquals("public, max-age=2592000", ((HttpServletResponse) res).getHeader("Cache-Control"));
                ((HttpServletResponse) res).setHeader("ETag", "fixture-etag");
                ((HttpServletResponse) res).setStatus(304);
            });
            assertEquals("public, max-age=2592000", fixture.headers.get("Cache-Control"));
            assertEquals("fixture-etag", fixture.headers.get("ETag"));
        }
    }

    @Test
    void cachesReleaseVersionedFrameworkAssetsForGetAndHead() throws Exception {
        for (String method : new String[]{"GET", "HEAD"}) {
            Fixture fixture = new Fixture();
            fixture.run(BASE + "core/igrp/IGRP.core.js", method, Config.VERSION, (req, res) -> {});
            assertEquals("public, max-age=2592000", fixture.headers.get("Cache-Control"));
        }
        Fixture horizon = new Fixture();
        horizon.run("/images/IGRP/IGRP2.4/themes/default/app.css", "GET", Config.VERSION, (req, res) -> {});
        assertEquals("public, max-age=2592000", horizon.headers.get("Cache-Control"));
    }

    @Test
    void revalidatesMutableUrlsAndUnrecognizedVersionTokens() throws Exception {
        for (String version : new String[]{null, "", "2", "outdated-release"}) {
            Fixture fixture = new Fixture();
            fixture.run(BASE + "themes/style.css", "GET", version, (req, res) -> {});
            assertEquals("no-cache", fixture.headers.get("Cache-Control"));
        }
    }

    @Test
    void excludesPagesAppDataTemplatesUploadsAndAmbiguousPaths() throws Exception {
        for (String path : new String[]{"/app/webapps", "/index.jsp", "/uploads/photo.png",
                BASE + "app/sis/page/data.json", BASE + "app/sis/page/page.js",
                BASE + "xsl/tmpl/IGRP-home-include.tmpl.xsl", BASE + "themes/config.xml",
                BASE + "themes/theme.css/../private.css", BASE + "themes/%2e%2e/private.css",
                BASE + "themes/style.css;extra", BASE + "themes/style.css/extra"}) {
            Fixture fixture = new Fixture();
            fixture.run(path, "GET", Config.VERSION, (req, res) -> {});
            assertFalse(fixture.headers.containsKey("Cache-Control"), path);
        }
        Fixture post = new Fixture();
        post.run(BASE + "themes/style.css", "POST", Config.VERSION, (req, res) -> {});
        assertFalse(post.headers.containsKey("Cache-Control"));
    }

    @Test
    void preservesExplicitUpstreamAndDownstreamPolicies() throws Exception {
        Fixture upstream = new Fixture();
        upstream.headers.put("Cache-Control", "private, no-store");
        upstream.run(BASE + "themes/style.css", "GET", Config.VERSION, (req, res) -> {});
        assertEquals("private, no-store", upstream.headers.get("Cache-Control"));
        Fixture downstream = new Fixture();
        downstream.run(BASE + "themes/style.css", "GET", Config.VERSION,
                (req, res) -> ((HttpServletResponse) res).setHeader("Cache-Control", "no-store"));
        assertEquals("no-store", downstream.headers.get("Cache-Control"));
    }

    @Test
    void doesNotCacheMissingResourcesErrorsRedirectsOrExceptions() throws Exception {
        for (int status : new int[]{302, 403, 404, 500}) {
            Fixture fixture = new Fixture();
            fixture.run(BASE + "themes/missing.css", "GET", Config.VERSION,
                    (req, res) -> ((HttpServletResponse) res).setStatus(status));
            assertEquals("no-store", fixture.headers.get("Cache-Control"));
        }
        for (int operation = 0; operation < 3; operation++) {
            int current = operation;
            Fixture fixture = new Fixture();
            fixture.run(BASE + "themes/style.css", "GET", Config.VERSION, (req, res) -> {
                HttpServletResponse response = (HttpServletResponse) res;
                if (current == 0) response.sendError(404);
                else if (current == 1) response.sendError(500, "fixture");
                else response.sendRedirect("/login");
            });
            assertEquals("no-store", fixture.headers.get("Cache-Control"));
        }
        Fixture exception = new Fixture();
        assertThrows(IOException.class, () -> exception.run(BASE + "themes/style.css", "GET", Config.VERSION,
                (req, res) -> { throw new IOException("fixture"); }));
        assertEquals("no-store", exception.headers.get("Cache-Control"));
    }

    private static final class Fixture {
        final Map<String, String> headers = new LinkedHashMap<>();

        void run(String path, String method, String version, FilterChain chain) throws Exception {
            HttpServletRequest request = (HttpServletRequest) Proxy.newProxyInstance(getClass().getClassLoader(),
                    new Class[]{HttpServletRequest.class}, (proxy, called, args) -> {
                        switch (called.getName()) {
                            case "getServletPath": return path;
                            case "getMethod": return method;
                            case "getParameter": return "v".equals(args[0]) ? version : null;
                            default: return null;
                        }
                    });
            HttpServletResponse response = (HttpServletResponse) Proxy.newProxyInstance(getClass().getClassLoader(),
                    new Class[]{HttpServletResponse.class}, (proxy, called, args) -> {
                        switch (called.getName()) {
                            case "containsHeader": return headers.containsKey(args[0]);
                            case "getHeader": return headers.get(args[0]);
                            case "setHeader": headers.put((String) args[0], (String) args[1]); return null;
                            case "isCommitted": return false;
                            default: return null;
                        }
                    });
            new StaticResourceCacheFilter().doFilter(request, response, chain);
        }
    }
}
