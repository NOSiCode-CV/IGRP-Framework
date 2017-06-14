<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        UTILS
    -->
    <!-- Gen cabecalho Package -->
    <xsl:template name="genPackageCab">
        <xsl:param name="packageName"/>
        <xsl:param name="body" select="'true'"/>
        <xsl:text>CREATE</xsl:text><xsl:value-of select="$space"/>OR<xsl:value-of select="$space"
        />REPLACE<xsl:value-of select="$enter"/>PACKAGE<xsl:value-of select="$space"/><xsl:if
            test="$body='true'">BODY<xsl:value-of select="$space"/></xsl:if><xsl:value-of
                select="$packageName"/>
        <xsl:value-of select="$enter"/>IS<xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/>--------------- RED <xsl:value-of select="$enter"
        />--------------- IGRP FrameWork <xsl:value-of select="$enter"/>--------------- Data:
        <xsl:value-of select="$enter"/>--------------- User: <xsl:value-of select="$enter"
        />--------------- XSL-Generator </xsl:template>
    
    <!-- Gen fim cabecalho Package -->
    <xsl:template name="genPackageEndCab">
        <xsl:param name="packageName" select="''"/>
        <xsl:value-of select="$enter"/>END<xsl:value-of select="$endline"/><xsl:value-of select="$enter"/>
    </xsl:template>
    
    
    <!-- Gen cabecalho Procedure -->
    <xsl:template name="genProcedureCab">
        <xsl:param name="procedureName"/>
        <xsl:param name="params" select="''"/>
        <xsl:param name="body" select="'true'"/>
        <xsl:value-of select="$entertab"/>PROCEDURE<xsl:value-of select="$space"/><xsl:value-of
            select="$procedureName"/><xsl:if test="$params != ''">(<xsl:value-of select="$params"
            />)</xsl:if>
        <xsl:value-of select="$entertab"/>IS<xsl:value-of select="$enter"/>
    </xsl:template>
    
    <!-- Gen fim cabecalho Package -->
    <xsl:template name="genProcedureEndCab">
        <xsl:param name="procedureName"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$entertab"/>END<xsl:value-of select="$space"/>
        <xsl:value-of select="$procedureName"/>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
    </xsl:template>
       
</xsl:stylesheet>