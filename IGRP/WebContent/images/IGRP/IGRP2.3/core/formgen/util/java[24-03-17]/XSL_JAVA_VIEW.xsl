<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
     <xsl:preserve-space elements="*"/>

    <!--=================Template Generate View===============================-->

    <xsl:template name="view">
    	<xsl:param name="version"/>
    	<xsl:param name="view_name"/>
    	<xsl:value-of select="$enter" />
		<xsl:text>$view = \backend\igrp\grid\IGRPDetailView::begin(</xsl:text>
		<xsl:value-of select="$quotes" />
		<xsl:value-of select="$quotes" />
		<xsl:value-of select="$comma" />
		<xsl:value-of select="$space" />
		<xsl:choose>
			<xsl:when test="$version = ''">				
				<xsl:text>null</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>[],</xsl:text>
				<xsl:value-of select="$space" />
				<xsl:value-of select="$quotes" />
				<xsl:value-of select="$view_name" />
				<xsl:value-of select="$quotes" />
			</xsl:otherwise>
		</xsl:choose>		
		<xsl:text>);</xsl:text>		
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>$view</xsl:text>
		<xsl:text> =&gt; view</xsl:text>
		<xsl:text>([</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab2" />
		<xsl:text>'model' => $model</xsl:text>
		<xsl:value-of select="$comma" />
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab2" />
		<xsl:value-of select="$quotes" />
		<xsl:text>columns</xsl:text>
		<xsl:value-of select="$quotes" />
		<xsl:text> =&gt; [</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab3" />
		<!--Call template table-->
		<xsl:choose>
			<xsl:when test="$version = ''">				
				<xsl:call-template  name="element-field">					
					<xsl:with-param name="value" select="rows/content/filter" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template  name="element-field">					
					<xsl:with-param name="value" select="." />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>]</xsl:text>
		<xsl:text>]);</xsl:text>        
        <xsl:value-of select="$enter" />
		<xsl:text>\backend\igrp\grid\IGRPDetailView::end();</xsl:text>
	</xsl:template>

</xsl:stylesheet>