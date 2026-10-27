package nosi.core.webapp;

import jakarta.servlet.ServletContext;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class ReportPreviewTransformTest {
    @Test
    void rendersReportDataAsHtmlWithoutBrowserStylesheetInstruction() throws Exception {
        String xml = "<?xml version=\"1.0\"?>"
                + "<?xml-stylesheet type=\"text/xsl\" href=\"webapps?r=report/get-xsl&amp;p_id=42\"?>"
                + "<rows><title>Relatório São Vicente</title></rows>";
        String xsl = "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">"
                + "<xsl:param name=\"label\"/><xsl:template match=\"/\"><html><body>"
                + "<h1><xsl:value-of select=\"rows/title\"/></h1>"
                + "<p><xsl:value-of select=\"$label\"/></p>"
                + "</body></html></xsl:template></xsl:stylesheet>";

        String html = Controller.performXsltTransform(xml, xsl, Map.of("label", "Preview"));

        assertTrue(org.jsoup.Jsoup.parse(html).text().contains("Relatório São Vicente"));
        assertTrue(html.contains("Preview"));
        assertTrue(html.contains("<html>"));
        assertFalse(html.contains("xml-stylesheet"));
    }

    @Test
    void resolvesStoredReportIncludesInsideDeploymentContext() throws Exception {
        String includedXsl = "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">"
                + "<xsl:template name=\"report-body\"><h1><xsl:value-of select=\"rows/title\"/></h1>"
                + "</xsl:template></xsl:stylesheet>";
        ServletContext ctx = (ServletContext) Proxy.newProxyInstance(getClass().getClassLoader(),
                new Class<?>[]{ServletContext.class}, (proxy, method, args) -> switch (method.getName()) {
                    case "getContextPath" -> "/IGRP";
                    case "getResourceAsStream" -> "/images/report-body.xsl".equals(args[0])
                            ? new ByteArrayInputStream(includedXsl.getBytes(StandardCharsets.UTF_8)) : null;
                    default -> null;
                });
        String xsl = "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">"
                + "<xsl:include href=\"/IGRP/images/report-body.xsl?v=1\"/>"
                + "<xsl:template match=\"/\"><html><body><xsl:call-template name=\"report-body\"/>"
                + "</body></html></xsl:template></xsl:stylesheet>";

        String html = Controller.performXsltTransform("<rows><title>Included report</title></rows>",
                xsl, null, ctx);

        assertTrue(html.contains("<h1>Included report</h1>"));
    }
}
