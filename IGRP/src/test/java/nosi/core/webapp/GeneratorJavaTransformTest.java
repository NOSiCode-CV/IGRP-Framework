package nosi.core.webapp;

import javax.servlet.ServletContext;

import nosi.webapps.igrp.pages.generator.GeneratorController;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Studio generator "Java" tab without browser XSLT (Chrome 158+): the formgen mvc stylesheets
 * are compiled on the server and their bare-name includes must come from xslBasePath (util/java).
 */
class GeneratorJavaTransformTest {

    private static final File WEBAPP = new File("src/main/webapp");
    private static final String JAVA_BASE = "/images/IGRP/IGRP2.3/core/formgen/util/java";
    private static final String XML = "<rows><plsql><package_db>teste</package_db><package_copy_db/>"
            + "<package_html>minha_pagina</package_html><package_copy_html/><action>index</action>"
            + "<table_name/></plsql><content/></rows>";

    private static ServletContext webappContext() {
        return (ServletContext) Proxy.newProxyInstance(GeneratorJavaTransformTest.class.getClassLoader(),
                new Class<?>[]{ServletContext.class}, (proxy, method, args) -> {
                    if ("getContextPath".equals(method.getName())) {
                        return "/IGRP";
                    }
                    if ("getResourceAsStream".equals(method.getName())) {
                        File file = new File(WEBAPP, ((String) args[0]).substring(1));
                        return file.isFile() ? new FileInputStream(file) : null;
                    }
                    return null;
                });
    }

    @BeforeEach
    void clearCache() {
        Controller.invalidateXslCache();
    }

    @Test
    void generatesEveryJavaTabPartUsingXslBasePath() throws Exception {
        Map<String, String> parts = new LinkedHashMap<>();
        parts.put("XSL_CONTROLLER.xsl", "Controller extends Controller");
        parts.put("XSL_MODEL.xsl", "extends Model");
        parts.put("XSL_VIEW.xsl", "extends View");

        for (Map.Entry<String, String> e : parts.entrySet()) {
            String out = Controller.performClientXsltTransformFromPath(XML, JAVA_BASE + "/mvc/" + e.getKey(),
                    JAVA_BASE, webappContext(), Collections.<String, String>emptyMap());

            assertTrue(out.contains(e.getValue()), e.getKey() + " ->\n" + out);
        }
    }

    @Test
    void reportsStylesheetCompileErrorInsteadOfHalfBuiltTemplates() {
        // Without xslBasePath, mvc/XSL_CONTROLLER.xsl includes itself.
        Exception ex = assertThrows(Exception.class, () -> Controller.performXsltTransformFromPath(XML,
                JAVA_BASE + "/mvc/XSL_CONTROLLER.xsl", webappContext(), Collections.<String, String>emptyMap()));

        assertFalse(ex instanceof NullPointerException, String.valueOf(ex));
        assertTrue(ex.getMessage().contains("Failed to compile XSL template"), ex.getMessage());
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
        assertNull(GeneratorController.includeBaseFor("/images/IGRP/IGRP2.3/xsl", controller), "unrelated folder");
        assertNull(GeneratorController.includeBaseFor(JAVA_BASE + "/mvc/sub", controller), "child folder");
        assertNull(GeneratorController.includeBaseFor("/WEB-INF", controller));
        assertNull(GeneratorController.includeBaseFor(null, controller));
    }
}
