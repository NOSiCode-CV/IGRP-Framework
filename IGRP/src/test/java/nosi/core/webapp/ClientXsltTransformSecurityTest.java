package nosi.core.webapp;

import javax.servlet.ServletContext;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Request-supplied XML/XSL sent to igrp/Generator/transform must not be able to call Java,
 * read files/URLs (document(), xsl:include, external entities) or reach IGRP routes.
 */
class ClientXsltTransformSecurityTest {

    private static final String SECRET = "TOP-SECRET-" + System.nanoTime();
    private static final String XSL_NS = "xmlns:xsl='http://www.w3.org/1999/XSL/Transform'";
    private static final Map<String, String> NO_PARAMS = Collections.emptyMap();

    private Path secretFile;
    private final Map<String, String> webapp = new HashMap<>();

    @BeforeEach
    void setUp() throws Exception {
        Controller.invalidateXslCache();
        secretFile = Files.createTempFile("igrp-xslt-secret", ".xml");
        Files.write(secretFile, ("<s>" + SECRET + "</s>").getBytes(StandardCharsets.UTF_8));
    }

    @AfterEach
    void tearDown() throws Exception {
        Files.deleteIfExists(secretFile);
    }

    private ServletContext context() {
        return (ServletContext) Proxy.newProxyInstance(getClass().getClassLoader(),
                new Class<?>[]{ServletContext.class}, (proxy, method, args) -> {
                    if ("getContextPath".equals(method.getName())) {
                        return "/IGRP";
                    }
                    if ("getResourceAsStream".equals(method.getName())) {
                        String content = webapp.get((String) args[0]);
                        return content != null ? new ByteArrayInputStream(content.getBytes(StandardCharsets.UTF_8)) : null;
                    }
                    return null;
                });
    }

    private static String transformOrMessage(ThrowingSupplier call) {
        try {
            return call.get();
        } catch (Exception e) {
            return "ERROR: " + e;
        }
    }

    private interface ThrowingSupplier {
        String get() throws Exception;
    }

    // ── stylesheet sent by the client ───────────────────────────────────────

    @Test
    void inlineStylesheetCannotCallJava() {
        String xsl = "<xsl:stylesheet version='1.0' " + XSL_NS
                + " xmlns:sys='http://xml.apache.org/xalan/java/java.lang.System'>"
                + "<xsl:template match='/'>v=<xsl:value-of select=\"sys:getProperty('java.version')\"/></xsl:template>"
                + "</xsl:stylesheet>";

        String out = transformOrMessage(() -> Controller.performClientXsltTransform("<r/>", xsl, NO_PARAMS));

        assertFalse(out.contains(System.getProperty("java.version")), out);
    }

    @Test
    void inlineStylesheetCannotReadFilesWithDocument() {
        String xsl = "<xsl:stylesheet version='1.0' " + XSL_NS + ">"
                + "<xsl:template match='/'>doc=<xsl:value-of select='document(/r/@f)'/></xsl:template>"
                + "</xsl:stylesheet>";

        String out = transformOrMessage(() -> Controller.performClientXsltTransform(
                "<r f='" + secretFile.toUri() + "'/>", xsl, NO_PARAMS));

        assertFalse(out.contains(SECRET), out);
    }

    @Test
    void inlineStylesheetCannotIncludeFiles() {
        String xsl = "<xsl:stylesheet version='1.0' " + XSL_NS + ">"
                + "<xsl:include href='" + secretFile.toUri() + "'/>"
                + "<xsl:template match='/'>ok</xsl:template></xsl:stylesheet>";

        assertThrows(Exception.class, () -> Controller.performClientXsltTransform("<r/>", xsl, NO_PARAMS));
    }

    @Test
    void externalEntitiesAreNotLoadedInXmlOrStylesheet() {
        String echo = "<xsl:stylesheet version='1.0' " + XSL_NS + ">"
                + "<xsl:template match='/'>xml=<xsl:value-of select='.'/></xsl:template></xsl:stylesheet>";
        String xxeXml = "<!DOCTYPE r [<!ENTITY x SYSTEM '" + secretFile.toUri() + "'>]><r>&x;</r>";
        String xxeXsl = "<!DOCTYPE xsl:stylesheet [<!ENTITY x SYSTEM '" + secretFile.toUri() + "'>]>"
                + "<xsl:stylesheet version='1.0' " + XSL_NS + "><xsl:template match='/'>&x;</xsl:template>"
                + "</xsl:stylesheet>";

        String viaXml = transformOrMessage(() -> Controller.performClientXsltTransform(xxeXml, echo, NO_PARAMS));
        String viaXsl = transformOrMessage(() -> Controller.performClientXsltTransform("<r/>", xxeXsl, NO_PARAMS));

        assertFalse(viaXml.contains(SECRET), viaXml);
        assertFalse(viaXsl.contains(SECRET), viaXsl);
    }

    @Test
    void inlineStylesheetStillTransformsNormally() throws Exception {
        String xsl = "<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp '&#160;'>]>"
                + "<xsl:stylesheet version='1.0' " + XSL_NS + "><xsl:param name='p'/>"
                + "<xsl:template match='/'><div class='x'><xsl:value-of select='r/t'/>&nbsp;<xsl:value-of select='$p'/>"
                + "</div></xsl:template></xsl:stylesheet>";

        String out = Controller.performClientXsltTransform("<r><t>Olá</t></r>", xsl,
                Collections.singletonMap("p", "param"));

        assertTrue(out.contains("<div class=\"x\">"), out);
        assertTrue(out.contains("Olá") || out.contains("Ol&aacute;"), out);
        assertTrue(out.contains("param"), out);
    }

    // Studio (IGRP2.4) design views send an inline stylesheet that reads its locale file with document().
    private static String documentStylesheet() {
        return "<xsl:stylesheet version='1.0' " + XSL_NS + ">"
                + "<xsl:template match='/'>[<xsl:value-of select='document(/r/f)'/>]</xsl:template></xsl:stylesheet>";
    }

    @Test
    void inlineStylesheetCanReadStaticImagesFilesWithDocument() throws Exception {
        webapp.put("/images/IGRP/IGRP2.4/xml/locale/pt.xml", "<l><t>locale-ok</t></l>");

        for (String href : new String[]{"/IGRP/images/IGRP/IGRP2.4/xml/locale/pt.xml",
                "/images/IGRP/IGRP2.4/xml/locale/pt.xml?v=1"}) {
            String out = Controller.performClientXsltTransform("<r><f>" + href + "</f></r>",
                    documentStylesheet(), NO_PARAMS, context());
            assertTrue(out.contains("locale-ok"), href + " -> " + out);
        }
    }

    @Test
    void inlineStylesheetDocumentStillBlocksEverythingOutsideStaticImages() {
        webapp.put("/WEB-INF/web.xml", "<web-app>" + SECRET + "</web-app>");
        webapp.put("/images/IGRP/IGRP2.4/xml/locale/pt.xml", "<l>" + SECRET + "</l>");

        for (final String href : new String[]{secretFile.toUri().toString(), "/IGRP/WEB-INF/web.xml",
                "/images/../WEB-INF/web.xml", "http://127.0.0.1:1/x.xml", "webapps?r=igrp/login/logout",
                "/IGRP/images/IGRP/IGRP2.4/xml/locale/pt.xml/../../../../../../WEB-INF/web.xml"}) {
            String out = transformOrMessage(() -> Controller.performClientXsltTransform(
                    "<r><f>" + href + "</f></r>", documentStylesheet(), NO_PARAMS, context()));
            assertFalse(out.contains(SECRET), href + " -> " + out);
        }
    }

    // ── stylesheet stored in the webapp, XML sent by the client ─────────────

    @Test
    void storedStylesheetDocumentReadsOnlyStaticImagesFiles() throws Exception {
        webapp.put("/images/test/doc.xsl", "<xsl:stylesheet version='1.0' " + XSL_NS + ">"
                + "<xsl:template match='/'>[<xsl:for-each select='r/f'><xsl:value-of select='document(.)'/>|</xsl:for-each>]"
                + "</xsl:template></xsl:stylesheet>");
        webapp.put("/images/test/data.xml", "<d>static-ok</d>");
        webapp.put("/WEB-INF/web.xml", "<web-app>" + SECRET + "</web-app>");

        String xml = "<r><f>data.xml</f><f>" + secretFile.toUri() + "</f><f>/IGRP/WEB-INF/web.xml</f>"
                + "<f>../../WEB-INF/web.xml</f><f>webapps?r=igrp/login/logout</f></r>";

        String out = Controller.performClientXsltTransformFromPath(xml, "/images/test/doc.xsl", null, context(), NO_PARAMS);

        assertTrue(out.contains("static-ok"), out);
        assertFalse(out.contains(SECRET), out);
    }

    @Test
    void storedStylesheetInputXmlIsXxeSafe() {
        webapp.put("/images/test/echo.xsl", "<xsl:stylesheet version='1.0' " + XSL_NS + ">"
                + "<xsl:template match='/'>xml=<xsl:value-of select='.'/></xsl:template></xsl:stylesheet>");
        String xxeXml = "<!DOCTYPE r [<!ENTITY x SYSTEM '" + secretFile.toUri() + "'>]><r>&x;</r>";

        String out = transformOrMessage(() -> Controller.performClientXsltTransformFromPath(
                xxeXml, "/images/test/echo.xsl", null, context(), NO_PARAMS));

        assertFalse(out.contains(SECRET), out);
    }
}
