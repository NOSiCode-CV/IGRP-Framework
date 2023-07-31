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
        
        <xsl:for-each select="$all_toolsbars_plsql">
            <xsl:call-template name="genSpecToolsbar">
                <xsl:with-param name="title" select="title"/>
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="action" select="link" />
            </xsl:call-template>
        </xsl:for-each>
        <!-- form link submit proc -->
        <xsl:for-each select="$all_form_submit_links">
            <xsl:call-template name="genSpecToolsbar">
                <xsl:with-param name="title" select="label"/>
                <xsl:with-param name="page" select="@page" />
                <xsl:with-param name="action" select="@action" />
                <xsl:with-param name="tag" select="name()" />
            </xsl:call-template>
        </xsl:for-each>

        <xsl:for-each select="$all_toolsbars_html[@dynamic-menu = 'true' or @copy = 'true']">
            <xsl:call-template name="genProcedureCab">
                <xsl:with-param name="procedureName" select="concat('TOOLBAR_',name())"/>
                <xsl:with-param name="params" select="concat('p',$tab,'OUT',$space, $pkg_type,'.t_toolbar')"/>
                <xsl:with-param name="body" select="'false'"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="genSpecToolsbar">
        <xsl:param name="title" />        
        <xsl:param name="page" />
        <xsl:param name="action" /> 
        <xsl:param name="tag" select="@rel"/>

        <xsl:variable name="code_action">
            <xsl:call-template name="sanitizeToolbar">
                <xsl:with-param name="title" select="$tag"/>
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
