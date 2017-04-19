<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

     <xsl:variable name="tab">
        <xsl:text>&#x9;</xsl:text>
    </xsl:variable>    
    <xsl:variable name="tab2">
        <xsl:text>&#x9;&#x9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab3">
        <xsl:text>&#x9;&#x9;&#x9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab4">
        <xsl:text>&#x9;&#x9;&#x9;&#x9;</xsl:text>
    </xsl:variable>    
    <xsl:variable name="newline">
        <xsl:text>&#x0A;</xsl:text>
    </xsl:variable>
    <xsl:variable name="double_quotes">"</xsl:variable>
    <xsl:variable name="import_components">import nosi.core.gui.components.*;</xsl:variable>
    <xsl:variable name="import_view">import nosi.core.webapp.View;</xsl:variable>
    <xsl:variable name="import_model">import nosi.core.webapp.Model;</xsl:variable>
    <xsl:variable name="class_name">Teste</xsl:variable>
</xsl:stylesheet>