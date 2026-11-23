package nosi.core.webapp;

import jakarta.servlet.ServletContext;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/**
 * IGRP-process-utils calls lookup-tool, which is defined in IGRP-form-utils. Xalan resolves every
 * xsl:call-template at compile time, so a process page that the Application Builder generates without a
 * form container (hence without form-utils) failed to compile on the server. process-utils now imports
 * form-utils; pages that also include form-utils must still compile (no duplicate named templates).
 */
class ProcessUtilsXslCompileTest {

    private static final Path WEBAPP = Path.of("src", "main", "webapp");
    private static final String XML = "<rows/>";

    /** Includes the Application Builder emits for a process page with only a table container. */
    private static final Map<String, List<String>> PROCESS_PAGE_INCLUDES = Map.of(
            "IGRP2.3", List.of("IGRP-functions.tmpl", "IGRP-variables.tmpl", "IGRP-home-include.tmpl",
                    "IGRP-utils.tmpl", "IGRP-table-utils.tmpl", "IGRP-process-utils.tmpl"),
            "IGRP2.4", List.of("IGRP-functions.tmpl", "IGRP-variables.tmpl", "IGRP-home-include.tmpl",
                    "IGRP-utils.tmpl", "parts.common", "parts.head", "parts.header", "parts.scripts",
                    "parts.footer", "parts.sidebar", "IGRP-table-utils.tmpl", "IGRP-process-utils.tmpl"));

    private final Map<String, String> pages = new HashMap<>();

    private ServletContext webappContext() {
        return (ServletContext) Proxy.newProxyInstance(getClass().getClassLoader(),
                new Class<?>[]{ServletContext.class}, (proxy, method, args) -> switch (method.getName()) {
                    case "getContextPath" -> "/IGRP";
                    case "getResourceAsStream" -> {
                        String webPath = (String) args[0];
                        String page = pages.get(webPath);
                        if (page != null) yield new ByteArrayInputStream(page.getBytes(StandardCharsets.UTF_8));
                        Path file = WEBAPP.resolve(webPath.substring(1));
                        yield Files.isRegularFile(file) ? new FileInputStream(file.toFile()) : null;
                    }
                    default -> null;
                });
    }

    /** Generated page under app/demo/<name>/ that includes the given templates and renders a lookup button. */
    private String page(String version, String name, List<String> includes) {
        StringBuilder xsl = new StringBuilder()
                .append("<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">")
                .append("<xsl:output method=\"html\" omit-xml-declaration=\"yes\" encoding=\"utf-8\" indent=\"no\"/>")
                .append("<xsl:template match=\"/\"><div id=\"probe\"><xsl:call-template name=\"lookup-tool\">")
                .append("<xsl:with-param name=\"name\" select=\"'p_probe'\"/></xsl:call-template></div></xsl:template>");
        for (String include : includes) {
            xsl.append("<xsl:include href=\"../../../xsl/tmpl/").append(include).append(".xsl?v=23\"/>");
        }
        xsl.append("</xsl:stylesheet>");

        String path = "/images/IGRP/" + version + "/app/demo/" + name + "/Page.xsl";
        pages.put(path, xsl.toString());
        return path;
    }

    @BeforeEach
    void clearCache() {
        Controller.invalidateXslCache();
    }

    @Test
    void processPageWithoutFormUtilsCompilesAndRendersLookup() throws Exception {
        for (Map.Entry<String, List<String>> e : PROCESS_PAGE_INCLUDES.entrySet()) {
            String path = page(e.getKey(), "process_no_form", e.getValue());

            String out = Controller.performXsltTransformFromPath(XML, path, webappContext(), Map.of());

            assertTrue(out.contains("IGRP_lookupPopup") && out.contains("p_probe"), path + " ->\n" + out);
        }
    }

    @Test
    void processPageThatAlsoIncludesFormUtilsHasNoDuplicateTemplates() throws Exception {
        for (Map.Entry<String, List<String>> e : PROCESS_PAGE_INCLUDES.entrySet()) {
            // Form containers add form-utils before process-utils.
            List<String> includes = new ArrayList<>(e.getValue());
            includes.add(includes.size() - 2, "IGRP-form-utils.tmpl");
            String path = page(e.getKey(), "process_with_form", includes);

            String out = Controller.performXsltTransformFromPath(XML, path, webappContext(), Map.of());

            assertTrue(out.contains("IGRP_lookupPopup"), path + " ->\n" + out);
        }
    }
}
