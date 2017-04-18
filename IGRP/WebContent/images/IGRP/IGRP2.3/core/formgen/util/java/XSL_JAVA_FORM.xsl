<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="text" encoding="UTF-8" indent="no" />

    <!-- =========================Template Generate Form ===========================-->
	     <xsl:template match="rows/content/*[@type='form']">
        	<!--Form-->        
			<xsl:value-of select="$tab" />
    		<xsl:text>private void</xsl:text>
			<xsl:value-of select="$space" />
			<xsl:value-of select="name()" /> () {
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />	
			<xsl:value-of select="$tab" />
			
			<xsl:for-each select="fields">
				<xsl:if test="*"> 
					<xsl:text>page.</xsl:text>
					<xsl:for-each select="*">
					<xsl:text>addField(this.</xsl:text>
					<xsl:value-of select="name()" />
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(../..),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(../..),2)" />
					<xsl:text>)</xsl:text>
					<xsl:if test="position() != last()">
						<xsl:text>.</xsl:text>
					</xsl:if>
					</xsl:for-each>
					<xsl:text>;</xsl:text>
				</xsl:if>
			</xsl:for-each>
			
    		<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>page.addFieldsToForm("</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text>");</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:for-each select="tools-bar/item">
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<!-- <xsl:for-each select="item"> -->
					<xsl:variable name="i" select="position()" />
					<xsl:text>page.addItem(this.formToolbar</xsl:text>
					<xsl:value-of select="$i" />
					<xsl:text>);</xsl:text>
					<xsl:value-of select="$enter" />
				<!-- </xsl:for-each> -->
			 	<!-- <xsl:apply-templates mode="button" select="tools-bar"/> -->
			</xsl:for-each>
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:if test="tools-bar">
				<xsl:text>page.addItensToToolbar("</xsl:text>
				<xsl:value-of select="name(tools-bar)" />
				<xsl:text>");</xsl:text>
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$enter" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>page.addToolbarToForm("</xsl:text>
				<xsl:value-of select="name()" />
				<xsl:text>");</xsl:text>
			</xsl:if>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$enter" />
    </xsl:template>
</xsl:stylesheet>