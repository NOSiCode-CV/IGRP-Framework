package nosi.core.webapp.security;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * xml.xsl.transform.js posts to the plain route r=igrp/Generator/transform (Chrome 158+ has no XSLTProcessor).
 * SecurtyCallPage.resolvePage decrypts every route that is neither public nor in PAGES_SCAPE_ENCRYPT, so a plain
 * route missing from that list is decrypted into garbage and the framework answers with the Home page. The Studio
 * then inserts that page into the Design view, and its scripts reload jQuery (jQuery UI "sortable" disappears).
 */
class GeneratorTransformRouteTest {

    private static final String ROUTE = "igrp/generator/transform";

    @Test
    void plainTransformRouteIsNotDecrypted() {
        assertTrue(PagesScapePermission.PAGES_SCAPE_ENCRYPT.contains(ROUTE));
    }

    @Test
    void transformStillRequiresAnAuthenticatedUser() {
        assertFalse(PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains(ROUTE));
    }
}
