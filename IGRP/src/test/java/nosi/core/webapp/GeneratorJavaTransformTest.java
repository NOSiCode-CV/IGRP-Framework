package nosi.core.webapp;

import jakarta.servlet.ServletContext;
import nosi.webapps.igrp.pages.generator.GeneratorController;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.FileInputStream;
import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Studio generator "Java" tab without browser XSLT (Chrome 158+): the formgen mvc stylesheets
 * are compiled on the server and their bare-name includes must come from xslBasePath (util/java).
 */
class GeneratorJavaTransformTest {

    private static final Path WEBAPP = Path.of("src", "main", "webapp");
    private static final String JAVA_BASE = "/images/IGRP/IGRP2.4/core/formgen/util/java";
    private static final String XML = "<rows><plsql><package_db>teste</package_db><package_copy_db/>"
            + "<package_html>minha_pagina</package_html><package_copy_html/><action>index</action>"
            + "<table_name/></plsql><content/></rows>";

    private static ServletContext webappContext() {
        return (ServletContext) Proxy.newProxyInstance(GeneratorJavaTransformTest.class.getClassLoader(),
                new Class<?>[]{ServletContext.class}, (proxy, method, args) -> switch (method.getName()) {
                    case "getContextPath" -> "/IGRP";
                    case "getResourceAsStream" -> {
                        Path file = WEBAPP.resolve(((String) args[0]).substring(1));
                        yield Files.isRegularFile(file) ? new FileInputStream(file.toFile()) : null;
                    }
                    default -> null;
                });
    }

    @BeforeEach
    void clearCache() {
        Controller.invalidateXslCache();
    }

    @Test
    void generatesEveryJavaTabPartUsingXslBasePath() throws Exception {
        Map<String, String> parts = Map.of(
                "XSL_CONTROLLER.xsl", "Controller extends Controller",
                "XSL_MODEL.xsl", "extends Model",
                "XSL_VIEW.xsl", "extends View",
                "XSL_INTERFACE.xsl", "interface",
                "XSL_INTERFACE_IMPL.xsl", "implements");
        assertGenerates(JAVA_BASE, parts);

        // IGRP2.3 generator only has controller/model/view
        String base23 = JAVA_BASE.replace("IGRP2.4", "IGRP2.3");
        assertGenerates(base23, Map.of(
                "XSL_CONTROLLER.xsl", "Controller extends Controller",
                "XSL_MODEL.xsl", "extends Model",
                "XSL_VIEW.xsl", "extends View"));
    }

    private static void assertGenerates(String base, Map<String, String> expectedByXsl) throws Exception {
        for (Map.Entry<String, String> e : expectedByXsl.entrySet()) {
            String out = Controller.performClientXsltTransformFromPath(XML, base + "/mvc/" + e.getKey(),
                    base, webappContext(), Map.of());

            assertTrue(out.contains(e.getValue()), base + "/mvc/" + e.getKey() + " ->\n" + out);
        }
    }

    @Test
    void reportsStylesheetCompileErrorInsteadOfHalfBuiltTemplates() {
        // Without xslBasePath, mvc/XSL_CONTROLLER.xsl includes itself.
        Exception ex = assertThrows(Exception.class, () -> Controller.performXsltTransformFromPath(XML,
                JAVA_BASE + "/mvc/XSL_CONTROLLER.xsl", webappContext(), Map.of()));

        assertFalse(ex instanceof NullPointerException, String.valueOf(ex));
        assertTrue(ex.getMessage().contains("Failed to compile XSL template"), ex.getMessage());

        // The log line is the root cause only: one line, no Xalan/Xerces nesting.
        String summary = Controller.rootCauseSummary(ex);
        assertTrue(summary.contains("including itself"), summary);
        assertFalse(summary.contains("\n") || summary.contains("\r"), summary);
        assertTrue(summary.length() <= 503, summary);
    }

    @Test
    void rootCauseSummaryIsBoundedAndSafeForOddExceptions() {
        assertEquals("IllegalStateException", Controller.rootCauseSummary(new IllegalStateException()));
        assertEquals("IllegalStateException: a b",
                Controller.rootCauseSummary(new RuntimeException("outer", new IllegalStateException("a\r\nb"))));

        StringBuilder huge = new StringBuilder();
        for (int i = 0; i < 2000; i++) huge.append('x');
        String capped = Controller.rootCauseSummary(new RuntimeException(huge.toString()));
        assertEquals(503, capped.length());
        assertTrue(capped.endsWith("..."), capped);
    }

    @Test
    void acceptsOnlyXslFilesUnderImages() {
        String controller = JAVA_BASE + "/mvc/XSL_CONTROLLER.xsl";
        assertEquals(controller, GeneratorController.imagesXslPath("https://host/IGRP" + controller + "?v=3"));
        assertEquals(controller, GeneratorController.imagesXslPath(".." + controller));
        assertEquals(controller, GeneratorController.imagesXslPath(JAVA_BASE + "/./mvc//XSL_CONTROLLER.xsl"));

        assertNull(GeneratorController.imagesXslPath("/images/../WEB-INF/web.xml"));
        assertNull(GeneratorController.imagesXslPath("/images/../WEB-INF/evil.xsl"));
        assertNull(GeneratorController.imagesXslPath("/WEB-INF/classes/x.xsl"));
        assertNull(GeneratorController.imagesXslPath("/images/IGRP/x.xml"));
        assertNull(GeneratorController.imagesXslPath("/images/IGRP\\..\\..\\WEB-INF\\x.xsl"));
        assertNull(GeneratorController.imagesXslPath(null));
    }

    @Test
    void acceptsXslBasePathOnlyWhenItIsAParentOfTheStylesheetFolder() {
        String controller = JAVA_BASE + "/mvc/XSL_CONTROLLER.xsl";
        assertEquals(JAVA_BASE, GeneratorController.includeBaseFor("https://host/IGRP" + JAVA_BASE + "/?v=3", controller));
        assertEquals(JAVA_BASE, GeneratorController.includeBaseFor(".." + JAVA_BASE, controller));

        assertNull(GeneratorController.includeBaseFor(JAVA_BASE + "/mvc", controller), "own folder: no-op");
        assertNull(GeneratorController.includeBaseFor("/images/IGRP/IGRP2.4/xsl", controller), "unrelated folder");
        assertNull(GeneratorController.includeBaseFor(JAVA_BASE + "/mvc/sub", controller), "child folder");
        assertNull(GeneratorController.includeBaseFor("/WEB-INF", controller));
        assertNull(GeneratorController.includeBaseFor(null, controller));
    }
}
