package nosi.core.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import nosi.core.config.Config;

import java.io.IOException;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

/** Browser caching for bundled framework assets, never application responses. */
public class StaticResourceCacheFilter implements Filter {

    private static final String LONG_CACHE = "public, max-age=2592000";
    private static final Set<String> EXTENSIONS = Set.of(
            "css", "js", "png", "jpg", "jpeg", "gif", "svg", "webp", "avif", "ico",
            "woff", "woff2", "ttf", "otf", "eot");
    private static final Pattern ASSET_PATH = Pattern.compile(
            "^/images/IGRP/IGRP2\\.[34]/(?:core|plugins|themes|assets)/.+$");
    private static final Pattern VERSIONED_LIBRARY = Pattern.compile(
            "^/images/IGRP/IGRP2\\.[34]/core/(?:jquery|bootstrap|fontawesome)/\\d+(?:\\.\\d+){1,3}/.+$");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (!(request instanceof HttpServletRequest req)
                || !(response instanceof HttpServletResponse resp)
                || !("GET".equals(req.getMethod()) || "HEAD".equals(req.getMethod()))
                || !isAsset(req.getServletPath()) || resp.containsHeader("Cache-Control")) {
            chain.doFilter(request, response);
            return;
        }

        boolean versioned = VERSIONED_LIBRARY.matcher(req.getServletPath()).matches()
                || Config.VERSION.equals(req.getParameter("v"));
        // Stable URLs must revalidate so edited themes and images do not stay stale.
        resp.setHeader("Cache-Control", versioned ? LONG_CACHE : "no-cache");
        HttpServletResponseWrapper guarded = new HttpServletResponseWrapper(resp) {
            @Override
            public void setStatus(int status) {
                if (status != 200 && status != 203 && status != 206 && status != 304)
                    setHeader("Cache-Control", "no-store");
                super.setStatus(status);
            }

            @Override
            public void sendError(int status) throws IOException {
                setHeader("Cache-Control", "no-store");
                super.sendError(status);
            }

            @Override
            public void sendError(int status, String message) throws IOException {
                setHeader("Cache-Control", "no-store");
                super.sendError(status, message);
            }

            @Override
            public void sendRedirect(String location) throws IOException {
                setHeader("Cache-Control", "no-store");
                super.sendRedirect(location);
            }
        };
        try {
            chain.doFilter(request, guarded);
        } catch (IOException | ServletException | RuntimeException ex) {
            if (!resp.isCommitted())
                resp.setHeader("Cache-Control", "no-store");
            throw ex;
        }
    }

    private static boolean isAsset(String path) {
        if (path == null || path.contains("..") || path.indexOf('%') >= 0
                || path.indexOf(';') >= 0 || path.indexOf('\\') >= 0 || !ASSET_PATH.matcher(path).matches())
            return false;
        int dot = path.lastIndexOf('.');
        return dot > path.lastIndexOf('/') && EXTENSIONS.contains(path.substring(dot + 1).toLowerCase(Locale.ROOT));
    }
}
