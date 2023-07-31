<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate a package DB SPEC -->
    <xsl:template name="generateDBSpec">
        <xsl:param name="packageName"/>
        
        <xsl:call-template name="genPackageCab">
            <xsl:with-param name="packageName" select="$packageName"/>
            <xsl:with-param name="body" select="'false'"/>
            <xsl:with-param name="replace" select="$with_replace"/>
        </xsl:call-template>

        <xsl:value-of select="$enter"/> 

        <xsl:call-template name="genRecordType" />
        
        <xsl:call-template name="genPreserveYourCode">
            <xsl:with-param name="procName" select="'DB_TYPES'" />
        </xsl:call-template>
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="'dml_select'"/>
        </xsl:call-template>
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="'dml_select_all'"/>
        </xsl:call-template>
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="'dml_insert'"/>
        </xsl:call-template>
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="'dml_update'"/>
        </xsl:call-template>
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="'dml_delete'"/>
        </xsl:call-template>
        
        <xsl:call-template name="generateDbSpecTable" />
        
        <xsl:call-template name="generateDbSpecToolsbar" />

        <xsl:call-template name="generateDbSpecRemoteProcedure" />

        <xsl:call-template name="generateDbSpecFieldsProcs" />
        
        <xsl:call-template name="genPreserveYourCode">
            <xsl:with-param name="procName" select="'DB_SPEC'" />
        </xsl:call-template>
                        
        <xsl:call-template name="genPackageEndCab"/>
    </xsl:template>

   
    
    <!-- Generate Spec Toolbars -->
    <xsl:template name="generateDbSpecToolsbar">
        <xsl:if test="$all_toolsbars_plsql">
            <xsl:call-template name="genProcedureSpec">
                <xsl:with-param name="procedureName" select="'dml_menu'"/>
            </xsl:call-template>
        </xsl:if>

        <xsl:for-each select="$all_toolsbars_plsql">
           <xsl:call-template name="genDbSpecToolsbar">
                <xsl:with-param name="title" select="@rel"/>
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="action" select="link" />
            </xsl:call-template>
        </xsl:for-each>

        <xsl:for-each select="$all_form_submit_links">
            <xsl:call-template name="genDbSpecToolsbar">
                <xsl:with-param name="title" select="name()"/>
                <xsl:with-param name="page" select="@page" />
                <xsl:with-param name="action" select="@action" />
            </xsl:call-template>
        </xsl:for-each>
        
        <!-- dynamic-menu -->
        <xsl:for-each select="$all_toolsbars_html[@dynamic-menu = 'true']">
            <xsl:call-template name="genProcedureCab">
                <xsl:with-param name="procedureName" select="concat('TOOLBAR_',name())"/>
                <xsl:with-param name="params" select="concat('p',$tab,'OUT',$space, $pkg_type,'.t_toolbar')"/>
                <xsl:with-param name="body" select="'false'"/>
            </xsl:call-template>
        </xsl:for-each>

        <xsl:if test="$all_toolsbars_plsql/service or rows/service">
            <xsl:value-of select="concat($entertab,'K_LOCAL_USERDATA  varchar2(255)',$endline)"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="genDbSpecToolsbar">
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
        
        <xsl:variable name="procName" select="concat('dml_',$code_action)" />
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="params" select="concat(concat(concat('p_page',$space,'OUT',$space,'VARCHAR2,',$space),concat('p_action',$space,'OUT',$space,'VARCHAR2,',$space)),concat('p_app',$space,'OUT',$space,'VARCHAR2'))"/>
        </xsl:call-template>

    </xsl:template>
    
    <xsl:template name="genDbSpecTableGroup">
        <xsl:param name="title" />
        <xsl:param name="type" />
        <xsl:param name="tag" />
        <xsl:param name="type_pkg" select="'html'"/>

        <xsl:if test="@gen-clean = 'true'">
            <xsl:variable  name="cleanProcName" select="concat('CLEAN_',$tag)"/>
            <xsl:call-template name="genProcedureSpec">
                <xsl:with-param name="procedureName" select="$cleanProcName"/>
                <xsl:with-param name="params" select="concat('p_clean_memory',$space,'BOOLEAN:=FALSE')"/>
            </xsl:call-template>
        </xsl:if>
        
        <xsl:variable name="procName" select="concat('VALUE_',$tag)" />
        
        <xsl:call-template name="genProcedureSpec">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="params" select="concat(concat('p',$space,'OUT',$space,$pkg_type,'.T_FIELD,',$space),concat('params',$space,'OUT',$space,$pkg_type,'.T_PARAM'))"/>
        </xsl:call-template>

    </xsl:template>
    
    <xsl:template name="generateDbSpecTable">
    
        <xsl:for-each select="$all_fields_list">

            <xsl:call-template name="genDbSpecTableGroup">
                <xsl:with-param name="title" select="@title"/>
                <xsl:with-param name="type" select="@type" />
                <xsl:with-param name="tag" select="name()" />
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>    

    <xsl:template name="generateDbSpecRemoteProcedure">
        <xsl:for-each select="$remote_procedure">

            <xsl:variable name="vname" select="name(.)"/>
            <xsl:variable name="name">
                <xsl:call-template name="UpperCase">
                    <xsl:with-param name="text" select="$vname"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="params">
                <xsl:choose>
                    <xsl:when test="@type='calendar'">
                        <xsl:value-of select="concat('p_event_id',$space,'VARCHAR2',$comma,$space,'p_start',$space,'VARCHAR2',$comma,$space,'p_end',$space,'VARCHAR2',$space,'DEFAULT NULL')"/>
                    </xsl:when>
                    <xsl:when test="@type='treemenu'">
                        <xsl:value-of select="concat('p_id',$space,'VARCHAR2',$space,'DEFAULT NULL',$comma,$space,'p_active',$space,'VARCHAR2',$space,'DEFAULT NULL')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('p_id',$space,'VARCHAR2')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="procName">
                <xsl:choose>
                    <xsl:when test="@type='calendar'">
                        <xsl:value-of select="concat('EDITEVENTS_',$name)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('REMOTE_',$name)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:call-template name="genProcedureCab">
                <xsl:with-param name="procedureName" select="$procName"/>
                <xsl:with-param name="params" select="$params"/>
                <xsl:with-param name="body" select="'false'"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="generateDbSpecFieldsProcs">
        
        <xsl:for-each select="$all_fields_with_procs">

            <xsl:variable name="fname" select="name()"/>

            <xsl:for-each select="rules/rule">

                <xsl:variable name="reqParams" select="requestFields"/>
                
                <xsl:call-template name="genProcedureSpec">

                    <xsl:with-param name="procedureName" select="proc"/>

                    <xsl:with-param name="params" select="$reqParams"/>

                    <!-- <xsl:with-param name="params" select="concat('p_',$fname,' VARCHAR2')"/> -->

                </xsl:call-template>

            </xsl:for-each>


        </xsl:for-each>

    </xsl:template>


    
</xsl:stylesheet>
