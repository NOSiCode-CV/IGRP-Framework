<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

    <xsl:variable name="all_fields_chart" select="rows/content/*[@type = 'chart' and not(local-name(.)=local-name(preceding::*))]"/> 
   
   	<xsl:template name="generateChart">    
    	<xsl:if test="rows/content/*[@type = 'chart']">
    		<xsl:call-template name="genChartGroup">
                <xsl:with-param name="charts" select="$all_fields_chart"/>
                <xsl:with-param name="type" select="'chart'" />
            </xsl:call-template>
    	</xsl:if> 
	</xsl:template>	

	<xsl:template name="genChartGroup">
        <xsl:param name="charts" />
        <xsl:param name="type" />    

        <xsl:for-each select="$charts">
            <xsl:call-template name="genChart">
                <xsl:with-param name="charts" select="."/>
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="genChart">
        <xsl:param name="chart"/>
        <xsl:param name="type" /> 
       
        <xsl:variable name="caption">
        	<xsl:value-of select="$quotes" /><xsl:text>caption</xsl:text><xsl:value-of select="$quotes" />
			<xsl:text>=&gt;</xsl:text>
			<xsl:value-of select="$quotes" /><xsl:value-of select="caption" /><xsl:value-of select="$quotes" />
			<xsl:value-of select="$comma" />
			<xsl:value-of select="$enter" />
	        <xsl:value-of select="$tab" />
        </xsl:variable>

        <xsl:variable name="chart_type">
        	<xsl:value-of select="$quotes" /><xsl:text>chart_type</xsl:text><xsl:value-of select="$quotes" />
			<xsl:text>=&gt;</xsl:text>
			<xsl:value-of select="$quotes" /><xsl:value-of select="chart_type" /><xsl:value-of select="$quotes" />
			<xsl:value-of select="$comma" />
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
        </xsl:variable>

        <xsl:variable name="width">
        	<xsl:value-of select="$quotes" /><xsl:text>width</xsl:text><xsl:value-of select="$quotes" />
			<xsl:text>=&gt;</xsl:text>
			<xsl:value-of select="$quotes" />
			<xsl:if test="not(width)">
				<xsl:value-of select="'200'" />
		    </xsl:if>
		    <xsl:value-of select="width" />
			<xsl:value-of select="$quotes" />
			<xsl:value-of select="$comma" />
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
        </xsl:variable>

        <xsl:variable name="height">
        	<xsl:value-of select="$quotes" /><xsl:text>height</xsl:text><xsl:value-of select="$quotes" />
			<xsl:text>=&gt;</xsl:text>
			<xsl:value-of select="$quotes" />
			<xsl:if test="not(height)">
				<xsl:value-of select="'150'" />
		    </xsl:if>
			<xsl:value-of select="height" />
			<xsl:value-of select="$quotes" />
			<xsl:value-of select="$comma" />
			<xsl:value-of select="$enter" />
        </xsl:variable>	
        
      	<xsl:text>\backend\igrp\widgets\IGRPChart::begin(</xsl:text><xsl:value-of select="$quotes" />
        <xsl:value-of select="name()"/><xsl:value-of select="$quotes" /><xsl:value-of select="$comma" />
        <xsl:value-of select="$quotes" /><xsl:value-of select="$null"/><xsl:value-of select="$quotes" />    
        <xsl:value-of select="$rigth_p" /><xsl:value-of select="$enter"/><xsl:value-of select="$pointer"/>
        <xsl:text>paint</xsl:text><xsl:value-of select="$left_p" /><xsl:value-of select="$quotes" />
		<xsl:value-of select="name()"/><xsl:value-of select="$quotes" /><xsl:value-of select="$comma" />
		<xsl:text>[</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		
		<xsl:value-of select="$caption" />
		<xsl:value-of select="$chart_type" />
		<xsl:value-of select="$width" />
		<xsl:value-of select="$height" />

		<xsl:value-of select="$tab" />
		<xsl:text>'dataProvider' =&gt; $dataProvider</xsl:text>
		<xsl:value-of select="$comma" />
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$quotes" />
		<xsl:text>columns</xsl:text>
		<xsl:value-of select="$quotes" />
		<xsl:text> =&gt; [</xsl:text>
		<xsl:for-each select="label/*">
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab3" />
			<xsl:value-of select="$quotes" />
			<xsl:value-of select="." />
			<xsl:value-of select="$quotes" />
			<xsl:value-of select="$comma" />			
		</xsl:for-each>

        <xsl:value-of select="$enter" /><xsl:text>]</xsl:text><xsl:value-of select="$comma" />

        <xsl:text>]</xsl:text><xsl:value-of select="$rigth_p" /><xsl:value-of select="$endline" />
    </xsl:template>
    
</xsl:stylesheet>