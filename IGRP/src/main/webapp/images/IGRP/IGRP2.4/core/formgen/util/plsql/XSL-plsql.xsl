<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    <xsl:param name="jsEnter">
        <xsl:text>&#10;</xsl:text>
    </xsl:param>
    <xsl:preserve-space elements="*"/>
    <xsl:include href="XSL-plsql.constants.xsl"/>
    
    <xsl:template match="/">
        <xsl:text>-- SET DEFINE OFF;</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:text>-- /</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/>
        <xsl:call-template name="generateDBSpec">
            <xsl:with-param name="packageName" select="$packageDBName"/>
        </xsl:call-template> 
         <xsl:call-template name="generateDBBody">
            <xsl:with-param name="packageName" select="$packageDBName"/>
        </xsl:call-template>
        <xsl:call-template name="generateHTMLSpec">
            <xsl:with-param name="packageName" select="$packageHtmlName"/>
        </xsl:call-template>
       <xsl:call-template name="generateHTMLBody">
            <xsl:with-param name="packageName" select="$packageHtmlName"/>
        </xsl:call-template> 

    </xsl:template>
    
    <xsl:include href="XSL-plsql.utils.xsl"/>
    <xsl:include href="XSL-plsql.global.xsl"/>
    <xsl:include href="XSL-plsql.record.type.xsl"/>
    <xsl:include href="XSL-plsql.html.body.xsl"/>
    <xsl:include href="XSL-plsql.html.spec.xsl"/>
    <xsl:include href="XSL-plsql.db.spec.xsl"/>
    <xsl:include href="XSL-plsql.db.body.xsl"/>
</xsl:stylesheet>
