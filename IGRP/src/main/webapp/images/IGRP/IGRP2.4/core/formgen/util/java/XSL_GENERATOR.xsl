<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>

    <xsl:include href="XSL_CONSTANTS.xsl" />
    <xsl:include href="XSL_FIELDS.xsl" />
    <xsl:include href="XSL_BUTTON.xsl"/>
    <xsl:include href="XSL_MODEL.xsl" />
    <xsl:include href="XSL_VIEW.xsl" />
    <xsl:include href="XSL_CONTROLLER.xsl" />

    <xsl:template match="/">
    	<xsl:text>/*---------------------- Create Model ----------------------*/</xsl:text>
   		<xsl:value-of select="$newline"></xsl:value-of>
    		<xsl:call-template name="create-model"></xsl:call-template>
   		<xsl:value-of select="$newline"></xsl:value-of>
    	<xsl:text>/*------------------------- END -------------------------*/</xsl:text>
   		<xsl:value-of select="$newline"></xsl:value-of>
   		<xsl:value-of select="$newline"></xsl:value-of>
    	<xsl:text>/*Create View*/</xsl:text>
   		<xsl:value-of select="$newline"></xsl:value-of>
        	<xsl:call-template name="create-view"></xsl:call-template>
   		<xsl:value-of select="$newline"></xsl:value-of>
    	<xsl:text>/*------------------------- END -------------------------*/</xsl:text>
   		<xsl:value-of select="$newline"></xsl:value-of>
   		<xsl:value-of select="$newline"></xsl:value-of>
    	<xsl:text>/*Create Controller*/</xsl:text>
   		<xsl:value-of select="$newline"></xsl:value-of>
    		<xsl:call-template name="create-controller"></xsl:call-template>
   		<xsl:value-of select="$newline"></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>