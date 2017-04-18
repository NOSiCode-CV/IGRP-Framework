<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="text" encoding="UTF-8" indent="no" />

    <!-- =========================Template Generate Table ===========================-->
	     <xsl:template match="rows/content/*[@type='chart']">
        	<!--Form-->
			<xsl:value-of select="$tab" />
			<xsl:text>private void</xsl:text>
			<xsl:value-of select="$space" />
			<xsl:value-of select="name()" /> () {
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />	
			<xsl:value-of select="$tab" />
			<xsl:text>page.</xsl:text>
			<xsl:for-each select="label/*">
				<xsl:text>addField(this.</xsl:text>
				<xsl:value-of select="." />
				<xsl:text>)</xsl:text>
				<xsl:if test="position() != last()">
					<xsl:text>.</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>;</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>page.addFieldToChart("</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text>"</xsl:text>
			<xsl:text>,</xsl:text>
			<xsl:text> this.</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text>List</xsl:text>
			<xsl:text>);</xsl:text>
			<xsl:value-of select="$enter" />
			 <xsl:value-of select="$tab" />
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$enter" />
    </xsl:template>
</xsl:stylesheet>