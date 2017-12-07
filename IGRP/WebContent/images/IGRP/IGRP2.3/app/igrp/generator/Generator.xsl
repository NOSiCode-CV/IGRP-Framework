<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8"/>
   
    <xsl:template match="/">
        <xsl:call-template name="formgen-html"/>
    </xsl:template> 

    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484827360488"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484827360488"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484827360488"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484827360488"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1484827360488"/>

    <xsl:include href="../../../core/formgen/xsl/formgen.xsl"/>

</xsl:stylesheet>
