<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!--<xsl:variable name="enter">
        <xsl:text xml:space="preserve"><![CDATA[      
 ]]></xsl:text>
    </xsl:variable>     
    <xsl:variable name="entertab">
        <xsl:text xml:space="preserve"><![CDATA[      
      ]]></xsl:text>
    </xsl:variable>
    <xsl:variable name="enter2tab">
        <xsl:text xml:space="preserve"><![CDATA[      
              ]]></xsl:text>
    </xsl:variable>
    <xsl:variable name="tab">
        <xsl:text xml:space="preserve">      </xsl:text>
    </xsl:variable>
    <xsl:variable name="space">
        <xsl:text xml:space="preserve">  </xsl:text>
    </xsl:variable>-->


    <xsl:variable name="start">
        <xsl:text xml:space="preserve"> </xsl:text>
    </xsl:variable>
    
    <!-- <xsl:variable name="enter"><xsl:text>&#10;</xsl:text></xsl:variable>
    <xsl:variable name="entertab"><xsl:text>&#10;&#9;</xsl:text></xsl:variable> 
    <xsl:variable name="enter2tab"><xsl:text>&#10;&#9;&#9;</xsl:text></xsl:variable>
    -->
    <xsl:variable name="enter" select="$jsEnter"/>
    <xsl:variable name="entertab" select="concat($jsEnter,'&#9;')"></xsl:variable>
    <xsl:variable name="enter2tab" select="concat($jsEnter,'&#9;&#9;')"></xsl:variable>
    <xsl:variable name="tab"><xsl:text>&#9;</xsl:text></xsl:variable>
    <xsl:variable name="space"><xsl:text>&#32;&#32;</xsl:text></xsl:variable>
    
    <xsl:variable name="quotes">
        <xsl:text>'</xsl:text>
    </xsl:variable>
    <xsl:variable name="endline">
        <xsl:text>;</xsl:text>
    </xsl:variable>
    <xsl:variable name="comma">
        <xsl:text>,</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="sql_options"><xsl:text>'SELECT ''Opcao 1'' nome, ''1'' id from dual union all SELECT ''Opcao 2'' nome, ''2'' id from dual union all SELECT ''Opcao 3'' nome, ''3'' id from dual'</xsl:text></xsl:variable>
    
    <xsl:variable name="sql_chart"><xsl:text>'SELECT ''Eixo de Y'' EixoY,''Eixo de X'' EixoX, 1000 Valor From dual'</xsl:text></xsl:variable>
    
    <xsl:variable name="js_lookup"><xsl:text>'&amp;'||REDGLOBAL.GLB_CONFIG.L_PRM_TARGET||'=_blank&amp;p_fwl_db=</xsl:text></xsl:variable>

    <xsl:variable name="concat" select="'||'" />
    <xsl:variable name="end" select="'/'" />
    <xsl:variable name="error_validation" select="'L_EX_VALIDATION'" />
    <xsl:variable name="error_others" select="'OTHERS'" />
    <xsl:variable name="error_sqlerrm" select="'SQLERRM'" /> 
    <xsl:variable name="error_backtrace" select="'DBMS_UTILITY.FORMAT_ERROR_BACKTRACE'" />
    
    <xsl:variable name="pkg_core" select="'REDGLOBAL.GLB_CORE'" />    
    <xsl:variable name="pkg_type" select="'REDGLOBAL.GLB_TYPE'" />
    <xsl:variable name="date_format" select="'DD-MM-YYYY'" />
    <xsl:variable name="pkg_core_debug" select="'REDGLOBAL.GLB_CORE.LOG_DEBUG'" />
    <xsl:variable name="pkg_type_toolsbar" select="'REDGLOBAL.GLB_TYPE.TP_PAGE.TBL_TOOLBAR'" />
    <xsl:variable name="pkg_type_tabmenu" select="'REDGLOBAL.GLB_TYPE.TP_PAGE.TBL_TABMENU'" />
    <xsl:variable name="pkg_type_form" select="'REDGLOBAL.GLB_TYPE.TP_PAGE.TBL_FORM'" />
    <xsl:variable name="pkg_type_table" select="'REDGLOBAL.GLB_TYPE.TP_PAGE.TBL_TABLE'" />
    <xsl:variable name="pkg_type_chart" select="'REDGLOBAL.GLB_TYPE.TP_PAGE.TBL_CHART'" />
    <xsl:variable name="pkg_sep_hide_field" select="'FIELD_SEPARATOR_HIDE'"/>
    <xsl:variable name="serv_convert" select="'DBMS_XMLGEN.CONVERT'" />
    <xsl:variable name="serv_decode" select="'DBMS_XMLGEN.entity_decode'" />
    <xsl:variable name="xml_api" select="'RED.NOSI_XML_API'" />
    
    <xsl:variable name="packageDBName" select="rows/plsql/package_db"/>
    <xsl:variable name="packageHtmlName" select="rows/plsql/package_html"/>
    <xsl:variable name="packageCopyDBName" select="rows/plsql/package_copy_db"/>
    <xsl:variable name="packageCopyHtmlName" select="rows/plsql/package_copy_html"/>
    <xsl:variable name="table_name" select="rows/plsql/table_name"/>
    <xsl:variable name="packageInstance" select="rows/plsql/package_instance"/>
    <xsl:variable name="preserve_url" select="rows/plsql/preserve_url"/>
    
    
    <xsl:variable name="with_label" select="rows/plsql/with_label"/>
    <xsl:variable name="with_biztalk" select="rows/plsql/with_biztalk"/>
    <xsl:variable name="with_replace" select="rows/plsql/with_replace"/>
    <xsl:variable name="with_dynamic" select="rows/plsql/dynamic_menu"/>
    <xsl:variable name="with_menucopy" select="rows/plsql/copy_menu"/>
    
    <xsl:variable name="selfapp" select="rows/app"/>
    <xsl:variable name="selfpage" select="rows/page"/>
    <xsl:variable name="selfaction" select="rows/plsql/action"/>       
    <xsl:variable name="selftitle" select="rows/content/title"/>
    <xsl:variable name="owner">
            <xsl:choose>
                <xsl:when test="substring-before($table_name,'.')!=''">
                    <xsl:value-of select="substring-before($table_name,'.')" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$selfapp" />
                </xsl:otherwise>
             </xsl:choose>
     </xsl:variable>

    <xsl:variable name="all_containers" select="rows/content/*[@gen-type='container']"/>

    <xsl:variable name="all_callListForm" select="rows/content/*[@type = 'form']|rows/content/*[@xml-type = 'form']|rows/content/*[@type = 'view']|rows/content/*[@xml-type = 'fingerprint']|rows/content/*[@xml-type = 'iframe']"/>

    <xsl:variable name="all_menu_items" select="rows/content/*[@gen-type='menu']"/>

    <xsl:variable name="all_fields" select="$all_containers/fields/*[not(local-name(.)=local-name(preceding::*))]"/>
    
    <xsl:variable name="all_fields_sql" select="$all_containers/fields/*[not(local-name(.)=local-name(preceding::*)) and (@type='select' or @type='selectchange' or @type='selectlist' or @type='radiolist' or @type='checkboxlist')]"/>

    <xsl:variable name="all_fields_with_procs" select="$all_fields[rules/rule]"/>
    
    <xsl:variable name="all_fields_chart" select="rows/content/*[@type = 'chart' and not(local-name(.)=local-name(preceding::*))]"/>
    
    <xsl:variable name="all_fields_lookup" select="$all_containers/fields/*[not(local-name(.)=local-name(preceding::*)) and (contains(@type,'LOOKUP') or contains(@type,'lookup'))]"/>
    
    <xsl:variable name="all_fields_group" select="rows/content/*[ (@gen-group='true') and not(local-name(.)=local-name(preceding::*))]" />
    
    <xsl:variable name="all_fields_array" select="rows/content/*[@gen-group='true']/fields/*[not(local-name(.)=local-name(preceding::*))]" />

    <xsl:variable name="all_fields_table" select="rows/content/*[(@type = 'table' or @xml-type = 'table') and not(local-name(.)=local-name(preceding::*))]" />

    <xsl:variable name="all_toolsbars" select="$all_menu_items/*|rows/content/*[@type = 'form']/tools-bar/*|rows/content/*[@type = 'table']/table/context-menu/*|rows/content/*[@type = 'tabmenu']/group/*"/>

    <xsl:variable name="all_form_submit_links" select="rows/content/*[@type = 'form']/fields/*[contains(@target,'submit')]"/>
    
    <xsl:variable name="all_toolsbars_plsql" select="rows/content/*[@gen-group='true']/table/context-menu/*|$all_menu_items/*|rows/content/*[@type = 'form']/tools-bar/*" />
    
    <xsl:variable name="all_fields_list" select="rows/content/*[@gen-group='true']" />

    <xsl:variable name="all_fields_plsql" select="$all_containers"/>
    
    <xsl:variable name="all_tabmenu" select="rows/content/*[@type = 'tabmenu']"/>
    
    <xsl:variable name="all_toolsbars_html" select="rows/content/*[@gen-type = 'menu']|rows/content/*[@type = 'form']/tools-bar" />
    
    <xsl:variable name="toolsbars_dynamic" select="$all_toolsbars_html[@dynamic-menu = 'true']" />
    <xsl:variable name="toolsbars_copy" select="$all_toolsbars_html[@copy = 'true']" />

    <xsl:variable name="all_values_persist" select="rows/content/*/fields/*[@persist='true']"/>

    <xsl:variable name="remote_procedure" select="rows/content/*[@gen-remote='true']"/>

    <xsl:variable name="all_separatorlist" select="rows/content/*[@type='separatorlist']"/>
   

    <!-- <xsl:variable name="all_fields" select="rows/content/*[@type = 'view' or @type = 'form' or @type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']/fields/*[not(local-name(.)=local-name(preceding::*))]"/>
    
    <xsl:variable name="all_fields_sql" select="rows/content/*[@type = 'form' or @type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']/fields/*[not(local-name(.)=local-name(preceding::*)) and (@type='select' or @type='selectchange' or @type='selectlist' or @type='radiolist' or @type='checkboxlist')]"/>
    
    <xsl:variable name="all_fields_chart" select="rows/content/*[@type = 'chart' and not(local-name(.)=local-name(preceding::*))]"/>
    
    <xsl:variable name="all_fields_lookup" select="rows/content/*[@type = 'form' or @type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']/fields/*[not(local-name(.)=local-name(preceding::*)) and (contains(@type,'LOOKUP') or contains(@type,'lookup'))]"/>
    
    <xsl:variable name="all_fields_group" select="rows/content/*[(@type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist') and not(local-name(.)=local-name(preceding::*))]" />
    
    <xsl:variable name="all_fields_array" select="rows/content/*[@type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']/fields/*[not(local-name(.)=local-name(preceding::*))]" />

    <xsl:variable name="all_fields_table" select="rows/content/*[(@type = 'table') and not(local-name(.)=local-name(preceding::*))]" />

    <xsl:variable name="all_toolsbars" select="rows/content/*[@type = 'toolsbar']/*|rows/content/*[@type = 'form']/tools-bar/*|rows/content/*[@type = 'table']/table/context-menu/*|rows/content/*[@type = 'tabmenu']/group/*"/>
    
    <xsl:variable name="all_toolsbars_plsql" select="rows/content/*[@type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']/table/context-menu/*|rows/content/*[@type = 'toolsbar']/*|rows/content/*[@type = 'form']/tools-bar/*" />
    
    <xsl:variable name="all_fields_list" select="rows/content/*[@type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']" />

    <xsl:variable name="all_fields_plsql" select="rows/content/*[@type = 'view' or @type = 'form' or @type = 'table' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'list' or @type = 'formlist']"/>
    
    <xsl:variable name="all_tabmenu" select="rows/content/*[@type = 'tabmenu']"/>
    
    <xsl:variable name="all_toolsbars_html" select="rows/content/*[@type = 'toolsbar']|rows/content/*[@type = 'form']/tools-bar" /> -->
        
</xsl:stylesheet>