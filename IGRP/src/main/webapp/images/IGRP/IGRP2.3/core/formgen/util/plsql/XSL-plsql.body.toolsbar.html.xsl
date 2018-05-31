<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate TOOLBAR GROUP-->
    <xsl:template name="genBodyToolsbar">
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
        <xsl:variable name="procDbName" select="concat('dml_',$code_action)" />

        <xsl:variable name="procDbName2">
            <xsl:call-template name="getProcName">
                <xsl:with-param name="procedureName" select="$procDbName"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/>
        <xsl:value-of  select="concat('-----',$procName,':',$title,'(',$page,' - ',$action,')')"/>
                
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>            
        </xsl:call-template> 
               
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'load parameters into record'"/>
        </xsl:call-template>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>LOAD</xsl:text>
        <xsl:value-of select="$endline"/>
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="concat('invoke db ',$procDbName2)"/>
        </xsl:call-template>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_core_debug"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:text>ACTION DB:</xsl:text>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="$procDbName2"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="$procDbName2"/>
        <xsl:text>(</xsl:text>
        <xsl:text>p_page=>V_PAGE</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:text>p_action=>V_ACTION</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:text>p_app=>V_APP</xsl:text>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'invoke xml engine for igrp2.2'"/>
        </xsl:call-template>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.GO_TO_PAGE(</xsl:text>
        <xsl:text>p_page=>NVL(V_PAGE,L_PAGE)</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:text>p_action=>NVL(V_ACTION,</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$selfaction"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:text>p_app=>NVL(V_APP,L_APP)</xsl:text>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'catch error exception'"/>
        </xsl:call-template>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>        
        <xsl:text>EXCEPTION</xsl:text>
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'catch user validation error'"/>
        </xsl:call-template>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>        
        <xsl:text>WHEN</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.</xsl:text>
        <xsl:value-of select="$error_validation"/>
        <xsl:value-of select="$space"/>
        <xsl:text>THEN</xsl:text>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/> 
        <xsl:text>ROLLBACK</xsl:text>
        <xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_core_debug"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$error_validation"/>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$concat"/>
        <xsl:value-of select="$error_sqlerrm"/>
        <xsl:value-of select="$concat"/>
        <xsl:value-of select="$error_backtrace"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.load_message</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.GO_TO_PAGE(</xsl:text>
        <xsl:text>p_page=>L_PAGE</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:text>p_action=></xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$selfaction"/>
        <xsl:value-of select="$quotes"/>        
        <xsl:value-of select="$comma"/>
        <xsl:text>p_app=>L_APP</xsl:text>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'catch others error'"/>
        </xsl:call-template>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>        
        <xsl:text>WHEN</xsl:text>
        <xsl:value-of select="$space"/>        
        <xsl:value-of select="$error_others"/>
        <xsl:value-of select="$space"/>
        <xsl:text>THEN</xsl:text>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/> 
        <xsl:text>ROLLBACK</xsl:text>
        <xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_core_debug"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:text>SEVERE: </xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$concat"/>
        <xsl:value-of select="$error_sqlerrm"/>
        <xsl:value-of select="$concat"/>
        <xsl:value-of select="$error_backtrace"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.messagedmlerror</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.GO_TO_PAGE(</xsl:text>
        <xsl:text>p_page=>L_PAGE</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:text>p_action=></xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$selfaction"/>
        <xsl:value-of select="$quotes"/>        
        <xsl:value-of select="$comma"/>
        <xsl:text>p_app=>L_APP</xsl:text>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
                               
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        
    </xsl:template>
    
    
   
</xsl:stylesheet>