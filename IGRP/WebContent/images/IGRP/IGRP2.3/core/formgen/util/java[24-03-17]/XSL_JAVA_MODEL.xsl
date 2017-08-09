<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="text" encoding="UTF-8" indent="no" />
	
	<xsl:include href="XSL_JAVA_CONSTANT.xsl" />

    <!-- =========================Template Generate Form ===========================-->
	    <xsl:template name="model" mode="model" match="rows/content">
        <xsl:text>package xpto;</xsl:text>
    	<xsl:value-of select="$enter" />
		<xsl:text>import java.util.ArrayList;
	import java.util.HashMap;
	import nosi.igrp.helper.Field;</xsl:text>
		<xsl:value-of select="$enter" />   
		<xsl:value-of select="$initClass" />
    	<xsl:value-of select="$endClass" />
    </xsl:template>
</xsl:stylesheet>