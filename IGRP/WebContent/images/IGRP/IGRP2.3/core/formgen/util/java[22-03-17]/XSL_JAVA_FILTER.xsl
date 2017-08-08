<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

    <xsl:include href="XSL_PHP_FIELD.xsl" />

    <!--=================Template Generate Filter===============================-->
	<xsl:template name="filters">
		<xsl:text>$filter = \backend\igrp\grid\IGRPFilter::begin(</xsl:text>
		<xsl:value-of select="$quotes" />
		<xsl:value-of select="$quotes" />
		<xsl:value-of select="$comma" />
		<xsl:value-of select="$space" />
		<xsl:text>null</xsl:text>
		<xsl:text>);</xsl:text>
        <xsl:call-template  name="field">					
			<xsl:with-param name="value" select="rows/content/filter/label" />
			<xsl:with-param name="type" select="'filter'" />
		</xsl:call-template>
        <xsl:value-of select="$enter" />
		<xsl:text>IGRPFilter::end();</xsl:text>
	</xsl:template>

</xsl:stylesheet>