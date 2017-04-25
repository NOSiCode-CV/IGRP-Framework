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
    <xsl:variable name="import_fields">import nosi.core.gui.fields.*;</xsl:variable>
    <xsl:variable name="import_view">import nosi.core.webapp.View;</xsl:variable>
    <xsl:variable name="import_model">import nosi.core.webapp.Model;</xsl:variable>
    <xsl:variable name="import_controller">import nosi.core.webapp.Controller;</xsl:variable>
    <xsl:variable name="import_exception">import java.io.IOException;</xsl:variable>
    <xsl:variable name="import_annotations">import nosi.core.webapp.RParam;</xsl:variable>
    <xsl:variable name="class_name">
    	<xsl:call-template name="CamelCaseWord">
    		<xsl:with-param name="text">
    			<xsl:value-of select="rows/plsql/package_html"></xsl:value-of>
    		</xsl:with-param>
    	</xsl:call-template>
    </xsl:variable>
    <xsl:variable name="page">
    	<xsl:call-template name="lowerCase">
    		<xsl:with-param name="text">
    			<xsl:value-of select="rows/plsql/package_html"></xsl:value-of>
    		</xsl:with-param>
    	</xsl:call-template>
    </xsl:variable>
    <xsl:variable name="package_name">
		<xsl:value-of select="concat(rows/plsql/package_db,'.',$page,';')"></xsl:value-of>
    </xsl:variable>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" /> 
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" /> 
   
    <xsl:template name="CamelCaseWord">
      <xsl:param name="text"/>
      <xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      <xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
    </xsl:template>
    <xsl:template name="upperCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $smallcase, $uppercase)"/>
    </xsl:template>
    
    <xsl:template name="lowerCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $uppercase, $smallcase)"/>
    </xsl:template>  
</xsl:stylesheet>