<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--Generate a package DB SPEC-->
    <xsl:template name="generateDBBody">
        <xsl:param name="packageName"/>

        
        <xsl:call-template name="genPackageCab">
            <xsl:with-param name="packageName" select="$packageName"/>
            <xsl:with-param name="body" select="'true'"/>
            <xsl:with-param name="replace" select="$with_replace"/>
        </xsl:call-template>

        <xsl:value-of select="$enter"/>
        
        <xsl:call-template name="genPreserveYourCode">
            <xsl:with-param name="procName" select="'BIZTALK'" />
        </xsl:call-template>

        <!-- STAR SERVICE PAGE-->
        <xsl:for-each select="rows">
            <xsl:call-template name="genDbService" />
        </xsl:for-each>
       
        <xsl:call-template name="generateDbBodySelectAll">
            <xsl:with-param name="procName" select="'dml_select'" />
        </xsl:call-template>


        <xsl:call-template name="generateDbBodySelectAll"/>

        <xsl:call-template name="generateDbBodySelectAll">
            <xsl:with-param name="procName" select="'dml_insert'" />
        </xsl:call-template>

        <xsl:call-template name="generateDbBodySelectAll">
            <xsl:with-param name="procName" select="'dml_update'" />
        </xsl:call-template>

        <xsl:call-template name="generateDbBodySelectAll">
            <xsl:with-param name="procName" select="'dml_delete'" />
        </xsl:call-template>

        <xsl:call-template name="generateDbBodyTable" />
        
        <xsl:call-template name="generateDbBodyToolsbar" />

        <xsl:call-template name="generateDbBodyRemoteProcedure" />

        <xsl:call-template name="generateDbBodyFieldsProcs"/>

        <xsl:call-template name="genPackageEndCab"/>

    </xsl:template>
    <!--Generate Spec Toolbars-->
    <xsl:template name="generateDbBodySelectAll">
        <xsl:param name="procName" select="'dml_select_all'" />
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="$procName"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>NULL</xsl:text>
        <xsl:value-of select="$endline"/>
        
        <xsl:if test="$procName = 'dml_select_all'">
            <xsl:value-of select="$enter"/>
            <xsl:for-each select="$all_separatorlist/fields/*[@visible='false']">
                <xsl:value-of select="concat($enter2tab,$pkg_core,'.',$pkg_sep_hide_field,'(',$quotes,name(),$quotes,')',$endline,$enter)"/>
            </xsl:for-each>
        </xsl:if>

        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="preserve" select="'true'"/>
        </xsl:call-template>

    </xsl:template>

    <xsl:template name="generateDbBodyToolsbar">
        <xsl:if test="$all_toolsbars_plsql">
            <xsl:call-template name="generateDbBodySelectAll">
                <xsl:with-param name="procName" select="'dml_menu'" />
            </xsl:call-template>
        </xsl:if>
        <xsl:for-each select="$all_toolsbars_plsql">
            <!-- STAR SERVICE-->
            <xsl:call-template name="genDbService" />

            <xsl:call-template name="genDbBodyToolsbar">
                <xsl:with-param name="title" select="title"/>
                <xsl:with-param name="app" select="app" />
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="action" select="link" />
            </xsl:call-template>

        </xsl:for-each>
       
        <!-- form link submit proc -->
        <xsl:for-each select="$all_form_submit_links">
            <xsl:call-template name="genDbBodyToolsbar">
                <xsl:with-param name="title" select="label"/>
                <xsl:with-param name="app" select="@app" />
                <xsl:with-param name="page" select="@page" />
                <xsl:with-param name="action" select="@action" />
                <xsl:with-param name="tag" select="name()" />
            </xsl:call-template>
        </xsl:for-each>
        

        <xsl:if test="$toolsbars_dynamic">
            <xsl:for-each select="$toolsbars_dynamic">
                <xsl:call-template name="genToolbarGroup">
                    <xsl:with-param name="toolbars" select="*"/>                
                    <xsl:with-param name="type" select="name()" />
                    <xsl:with-param name="gen-dynamic-menu" select="'true'" />
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>

    </xsl:template>
    
    <xsl:template name="generateDbBodyTable">
        <xsl:for-each select="$all_fields_list">

            <xsl:if test="@gen-clean='true'">
                <xsl:call-template name="genDbCleanList" />
            </xsl:if>

            <xsl:call-template name="genDbTableGroup">
                <xsl:with-param name="title" select="@title"/>
                <xsl:with-param name="type" select="@type" />
                <xsl:with-param name="tag" select="name()" />
                <xsl:with-param name="fields" select="fields/*" />
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="generateDbBodyRemoteProcedure">
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
            </xsl:call-template>

            <xsl:value-of select="concat($entertab,'BEGIN',$space,'NULL',$endline)"/>
            <xsl:call-template name="genPreserveYourCode">
                <xsl:with-param name="procName" select="$procName" />
            </xsl:call-template>

            <xsl:choose>
                <xsl:when test="@type='treemenu'">
                    <xsl:value-of select="concat($enter2tab,'---',$pkg_core,'.remote_treemenu(CLABEL=&gt;',$quotes,'----',$quotes,$comma,'CTAG =&gt;',$quotes,$vname,$quotes,$comma,'CVALUE =&gt;',$quotes,$quotes,$comma,'CSQL =&gt;',$quotes,'select',$quotes,$quotes,'remote',$quotes,$quotes,'||rownum name, rownum id from dual connect by rownum&lt;=3',$quotes,')',$endline)"/>
                </xsl:when>
                <xsl:when test="@type='calendar'">
                    <xsl:value-of select="concat($enter2tab,'/*',$enter2tab,$tab,'Ex. output em JSON',$enter2tab,$tab)"/>
                    <xsl:text>htp.p('{"type":"error/info/success/warning","message":"Gravado com Success"}');</xsl:text>
                    <xsl:value-of select="concat($enter2tab,$tab,'Ex. output em XML',$enter2tab,$tab)"/>htp.p('<xsl:value-of select="concat('&lt;?xml version=',$quotes,$quotes,'1.0',$quotes,$quotes,' encoding=',$quotes,$quotes,'ISO-8859-1',$quotes,$quotes,'?&gt;')"/><xsl:value-of select="'&lt;messages&gt;'"/><xsl:value-of select="concat('&lt;message type=',$quotes,$quotes,'success',$quotes,$quotes,'&gt;')"/>Gravado com Success<xsl:value-of select="concat('&lt;/message&gt;','&lt;/messages&gt;')"/>');<xsl:value-of select="concat($enter2tab,'*/')"/>
                </xsl:when>
            </xsl:choose>

            <xsl:value-of select="concat($entertab,$entertab,'END',$space,$procName,$endline)"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="generateDbBodyFieldsProcs">

        <xsl:for-each select="$all_fields_with_procs">

            <xsl:variable name="fname" select="name()"/>

            <xsl:for-each select="rules/rule">
     
                <xsl:variable name="procName" select="proc" />

                <xsl:variable name="reqParams" select="requestFields"/>
                
                <xsl:call-template name="genProcedureCab">
                    <xsl:with-param name="procedureName" select="$procName"/>
                    <xsl:with-param name="params" select="$reqParams"/>
                </xsl:call-template>

                <xsl:value-of select="$entertab"/>
                
                <xsl:text>BEGIN</xsl:text>
                
                <xsl:call-template name="genPreserveYourCode">
                    <xsl:with-param name="procName" select="$procName" />
                </xsl:call-template>

                <xsl:value-of select="$enter2tab"/>
                <xsl:choose>
                   
                    <xsl:when test="@type = 'remote_combobox'">
                        
                        REDGLOBAL.GLB_CORE.remote_combo(
                            CLABEL=&gt;'----',
                            CTAG =&gt; '<xsl:value-of select="$fname"/>', 
                            CVALUE =&gt;'',
                            CSQL =&gt; 'select ''Remote ''||rownum name, rownum id from dual connect by rownum&lt;=3' 
                        );

                    </xsl:when>

                </xsl:choose>

                
                



                <xsl:call-template name="genProcedureEndCab">
                    <xsl:with-param name="procedureName" select="$procName"/>
                </xsl:call-template>

            </xsl:for-each>

        </xsl:for-each>

    </xsl:template>

    <xsl:include href="XSL-plsql.body.toolsbar.db.xsl"/>
    <xsl:include href="XSL-plsql.body.service.db.xsl"/>
    <xsl:include href="XSL-plsql.body.table.db.xsl"/>
</xsl:stylesheet>
