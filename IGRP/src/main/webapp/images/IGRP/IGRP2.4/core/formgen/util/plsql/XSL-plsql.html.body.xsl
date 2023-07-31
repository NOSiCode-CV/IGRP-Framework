<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
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
        
        <xsl:value-of select="$enter"/>
        <xsl:text>/*</xsl:text>
        
        <xsl:call-template name="genRecordType" />
        
        <xsl:value-of select="$enter"/>
        <xsl:text>*/</xsl:text>
        <xsl:value-of select="$enter"/>
        
        <xsl:call-template name="genBodyLoad" /> 
        
        <xsl:call-template name="generateToolbar"/>
        
        <xsl:call-template name="generateTabMenu"/>
        
        <xsl:call-template name="generateField"/>
        
        <xsl:call-template name="generateChart"/>
        
        <xsl:call-template name="generateTable"/>
        
        <xsl:call-template name="generateBodyList">
            <xsl:with-param name="title" select="rows/content/title"/>
        </xsl:call-template>
        
        <xsl:call-template name="generateBodyToolsbar" />

        <xsl:call-template name="genPackageEndCab"/>
    </xsl:template>


    <!-- Generate FIELD -->
    <xsl:template name="generateField">
        <xsl:for-each select="$all_fields_plsql">
            <xsl:call-template name="genFieldGroup">
                <xsl:with-param name="fields" select="fields/*"/>
                <xsl:with-param name="type" select="name()" />
                <xsl:with-param name="genGroup" select="@gen-group" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>


    <!-- Generate TOOLBAR -->
    <xsl:template name="generateToolbar">
        <xsl:for-each select="$all_toolsbars_html">
            <xsl:variable name="name">
                <xsl:choose>
                    <xsl:when test="name()='tools-bar'">
                        <xsl:value-of select="local-name(..)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="name()"/>
                    </xsl:otherwise>
                 </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="*"/>                
                <xsl:with-param name="type" select="$name" />
            </xsl:call-template>
        </xsl:for-each>
        
        <xsl:for-each select="$all_fields_list">
            <xsl:call-template name="genToolbarGroup">
                <xsl:with-param name="toolbars" select="table/context-menu/*"/>
                <xsl:with-param name="type" select="name()" />
            </xsl:call-template>
        </xsl:for-each>
        
        
        
    </xsl:template>
    
    <!-- Generate CHART -->
    <xsl:template name="generateChart">
        
        <xsl:if test="rows/content/*[@type = 'chart']">
            <xsl:call-template name="genChartGroup">
                <xsl:with-param name="charts" select="$all_fields_chart"/>
                <xsl:with-param name="type" select="'chart'" />
            </xsl:call-template>
        </xsl:if>       
        
    </xsl:template>
    
    
    <!-- Generate TABMENU -->
    <xsl:template name="generateTabMenu">
        
        <xsl:for-each select="$all_tabmenu">
            <xsl:call-template name="genTabMenuGroup">
                <xsl:with-param name="groups" select="*"/>
                <xsl:with-param name="type" select="name()" />
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>
    
    <!-- Generate TABLE -->
    <xsl:template name="generateTable">
        
        <xsl:for-each select="$all_fields_list">
            <xsl:call-template name="genTableGroup">
                <xsl:with-param name="title" select="@title"/>
                <xsl:with-param name="type" select="@type" />
                <xsl:with-param name="tag" select="name()" />
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>
    
    
    <!-- Generate TABLE -->
    <xsl:template name="generateBodyToolsbar">
        <xsl:for-each select="$all_toolsbars_plsql">
            <xsl:call-template name="genBodyToolsbar">
                <xsl:with-param name="title" select="title"/>
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="action" select="link" />
            </xsl:call-template>
        </xsl:for-each>
        <!-- GEN FORM LINK SUBMIT PROC -->
        <xsl:for-each select="$all_form_submit_links">
            <xsl:call-template name="genBodyToolsbar">
                <xsl:with-param name="title" select="label"/>
                <xsl:with-param name="page" select="@page" />
                <xsl:with-param name="action" select="@action" />
                <xsl:with-param name="tag" select="name()" />
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>
    
    <xsl:include href="XSL-plsql.field.html.xsl"/>
    <xsl:include href="XSL-plsql.chart.html.xsl"/>
    <xsl:include href="XSL-plsql.tabmenu.html.xsl"/>
    <xsl:include href="XSL-plsql.toolbar.html.xsl"/>
    <xsl:include href="XSL-plsql.body.table.html.xsl"/>
    <xsl:include href="XSL-plsql.body.list.html.xsl"/>
    <xsl:include href="XSL-plsql.body.toolsbar.html.xsl"/>
    <xsl:include href="XSL-plsql.body.load.html.xsl"/>
    
    
</xsl:stylesheet>
