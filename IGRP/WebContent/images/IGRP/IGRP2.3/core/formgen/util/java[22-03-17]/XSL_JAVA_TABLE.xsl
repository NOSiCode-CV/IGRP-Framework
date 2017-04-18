<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="text" encoding="UTF-8" indent="no" />

    <!-- =========================Template Generate Table ===========================-->
	     <xsl:template match="rows/content/*[@type='table']">
        	<!--Form-->        
			<xsl:value-of select="$tab" />
    		<xsl:text>private void</xsl:text>
			<xsl:value-of select="$space" />
			<xsl:value-of select="name()" /> () {
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:if test="//fields"> 	
			<xsl:value-of select="$tab" />
				<xsl:text>page.</xsl:text>
    			<xsl:for-each select="fields/*">
					<xsl:text>addField(this.</xsl:text>
					<xsl:value-of select="name()" />
					<xsl:text>)</xsl:text>
					<xsl:if test="position() != last()">
						<xsl:text>.</xsl:text>
					</xsl:if>
			 	</xsl:for-each>
				<xsl:text>;</xsl:text>
			</xsl:if>
    		<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>page.addFieldToTable("</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text>");</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:for-each select="table">
				<xsl:if test="tools-bar">
					<xsl:value-of select="$tab" />
					<xsl:apply-templates mode="button" select="tools-bar"/>
				 </xsl:if>
				<!-- <xsl:value-of select="$tab" /> -->
				<xsl:if test="context-menu">
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:apply-templates mode="contextMenuTable" select="context-menu"/>
				 </xsl:if>
			 </xsl:for-each>
			 <xsl:for-each select="table/value/row/context-menu/*">
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>page.addParam("</xsl:text>
				<xsl:value-of select="." />
				<xsl:text>").toContextMenuIn("</xsl:text>
				<xsl:value-of select="name(../../../../..)" />
				<xsl:text>");</xsl:text>
				<xsl:value-of select="$enter" />
			 </xsl:for-each>
			 <xsl:value-of select="$tab" />
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$enter" />
    </xsl:template>
</xsl:stylesheet>