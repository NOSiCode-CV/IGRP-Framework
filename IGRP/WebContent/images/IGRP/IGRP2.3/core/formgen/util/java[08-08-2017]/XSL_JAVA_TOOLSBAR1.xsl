<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>	
	
	<xsl:template match="rows/content/*[@type = 'toolsbar']">
    	<!--ToolBar-->
		<xsl:value-of select="$tab" />
		<xsl:text>private void</xsl:text>
			<xsl:value-of select="$space" />
			<xsl:value-of select="name()" /> () {
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:for-each select="/item">
		<xsl:text>page.addItem("</xsl:text>
			<xsl:value-of select="title" />
			<xsl:text>",</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="app" />
			<xsl:text>",</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="page" />
			<xsl:text>",</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="link" />
			<xsl:text>",</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="target" />
			<xsl:text>",</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="image" />
			<xsl:text>");</xsl:text>
			<xsl:value-of select="$enter" />			
		</xsl:for-each>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$enter" />
    </xsl:template>
</xsl:stylesheet>