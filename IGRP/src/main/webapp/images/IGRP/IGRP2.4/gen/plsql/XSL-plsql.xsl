<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    
    <xsl:include href="XSL-plsql.constants.xsl"/>
   
    <xsl:template match="/">
        <xsl:call-template name="generateHTMLBody">
            <xsl:with-param name="packageName" select="$packageHtmlName"/>
        </xsl:call-template>
 
    </xsl:template>

   

    <!-- Generate a package BODY -->
    <xsl:template name="generateHTMLBody">
        <xsl:param name="packageName"/>
        <xsl:call-template name="genPackageCab">
            <xsl:with-param name="packageName" select="$packageName"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$entertab"/>
        <xsl:text>--CÓDIGO PÁGINA: </xsl:text><xsl:value-of select="rows/page"/>
        <xsl:value-of select="$enter"/><xsl:value-of select="$entertab"/>L_APP<xsl:value-of
            select="$space"/>VARCHAR2(150):=<xsl:value-of select="$space"/>
        <xsl:value-of select="$quotes"/><xsl:value-of select="rows/app"/><xsl:value-of
            select="$quotes"/>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/><xsl:value-of select="$entertab"/>L_PAGE<xsl:value-of
            select="$space"/>VARCHAR2(150):=<xsl:value-of select="$space"/>
        <xsl:value-of select="$quotes"/><xsl:value-of select="rows/page"/><xsl:value-of
            select="$quotes"/>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/><xsl:value-of select="$entertab"/>V_APP<xsl:value-of
            select="$space"/>VARCHAR2(150)<xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/><xsl:value-of select="$entertab"/>V_PAGE<xsl:value-of
            select="$space"/>VARCHAR2(150)<xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/><xsl:value-of select="$entertab"/>V_ACTION<xsl:value-of
            select="$space"/>VARCHAR2(150)<xsl:value-of select="$endline"/>
        
        <xsl:call-template name="generateToolbar"/>
        
        <xsl:call-template name="generateField"/>
        
        <xsl:call-template name="generateChart"/>
        
        <xsl:call-template name="genPackageEndCab"/>
    </xsl:template>


    <!-- Generate FIELD -->
    <xsl:template name="generateField">
        
        <xsl:if test="rows/content/view">
            <xsl:call-template name="genFieldGroup">
                <xsl:with-param name="fields" select="rows/content/view/label/*"/>
                <xsl:with-param name="type" select="'view'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/filter">
            <xsl:call-template name="genFieldGroup">
                <xsl:with-param name="fields" select="rows/content/filter/label/*"/>
                <xsl:with-param name="type" select="'filter'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/form">
            <xsl:call-template name="genFieldGroup">
                <xsl:with-param name="fields" select="rows/content/form/label/*"/>
                <xsl:with-param name="type" select="'form'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/table">
            <xsl:call-template name="genFieldGroup">
                <xsl:with-param name="fields" select="rows/content/table/label/*"/>
                <xsl:with-param name="type" select="'list'" />
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template>


    <!-- Generate TOOLBAR -->
    <xsl:template name="generateToolbar">
        
        <xsl:if test="rows/content/filter/tools-bar">
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="rows/content/filter/tools-bar/*"/>
                <xsl:with-param name="type" select="'filter'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/form/tools-bar">
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="rows/content/form/tools-bar/*"/>
                <xsl:with-param name="type" select="'form'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/table/tools-bar">
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="rows/content/table/tools-bar/*"/>
                <xsl:with-param name="type" select="'list'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/table/context-menu">
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="rows/content/table/context-menu/*"/>
                <xsl:with-param name="type" select="'context'" />
            </xsl:call-template>
        </xsl:if>
        
        <xsl:if test="rows/content/menu">
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="rows/content/menu/*"/>
                <xsl:with-param name="type" select="'menu'" />
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template>
    
    <!-- Generate CHART -->
    <xsl:template name="generateChart">
        
        <xsl:if test="rows/content/*[@type = 'chart']">
            <xsl:call-template name="genChartGroup">
                <xsl:with-param name="charts" select="rows/content/*[@type = 'chart']"/>
                <xsl:with-param name="type" select="'chart'" />
            </xsl:call-template>
        </xsl:if>
        
        
    </xsl:template>

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
    
    
    <xsl:include href="XSL-plsql.utils.xsl"/>
    <xsl:include href="XSL-plsql.field.html.xsl"/>
    <xsl:include href="XSL-plsql.toolbar.html.xsl"/>
    <xsl:include href="XSL-plsql.chart.html.xsl"/>
    
</xsl:stylesheet>
