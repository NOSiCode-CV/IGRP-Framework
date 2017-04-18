<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate a package SPEC -->
    <xsl:template name="generateHTMLSpec">
        <xsl:param name="packageName"/>
        <xsl:call-template name="genPackageCab">
            <xsl:with-param name="packageName" select="$packageName"/>
            <xsl:with-param name="body" select="'false'"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/> 
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="'list'"/>
        </xsl:call-template>
        
        <xsl:call-template name="generateSpecToolsbar" />
                        
        <xsl:call-template name="genPackageEndCab"/>
    </xsl:template>

   
    
    <!-- Generate Spec Toolbars -->
    <xsl:template name="generateSpecToolsbar">
        
        <xsl:for-each select="rows/content/*[@type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']/table/context-menu/*|rows/content/*[@type = 'toolsbar']/*">
            <xsl:call-template name="genSpecToolsbar">
                <xsl:with-param name="title" select="title"/>
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="action" select="link" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="genSpecToolsbar">
        <xsl:param name="title" />        
        <xsl:param name="page" />
        <xsl:param name="action" /> 
        
        <xsl:variable name="code_action">
            <xsl:call-template name="sanitizeToolbar">
                <xsl:with-param name="title" select="$title"/>
                <xsl:with-param name="selfaction" select="$selfaction"/>
                <xsl:with-param name="page" select="$page"/>
                <xsl:with-param name="action" select="$action"/>
            </xsl:call-template>
        </xsl:variable>        
        
        <xsl:variable name="procName" select="concat('form_',$code_action)" />
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
