<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:variable name="enter">
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
    </xsl:variable>
    <xsl:variable name="start">
        <xsl:text xml:space="preserve"> </xsl:text>
    </xsl:variable>
    <xsl:variable name="quotes">
        <xsl:text>'</xsl:text>
    </xsl:variable>
    <xsl:variable name="endline">
        <xsl:text>;</xsl:text>
    </xsl:variable>
    <xsl:variable name="comma">
        <xsl:text>,</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="packageDBName" select="'C_CIDADAO_LAB_PLSQL2_DB'" />    
    <xsl:variable name="pkg_core" select="'REDGLOBAL.GLB_CORE'" />    
    <xsl:variable name="pkg_type" select="'REDGLOBAL.GLB_TYPE'" />
    <xsl:variable name="date_format" select="'DD-MM-YYYY'" />
    

    <xsl:template match="/">
        <xsl:variable name="type" select="rows/app"/>
        <xsl:variable name="code" select="rows/page"/>
        <xsl:variable name="title" select="rows/content/title"/>
        <!--<xsl:variable name="packageName" select="concat(concat($type,$code),'_',$title,'_HTML')"/>-->
        <xsl:variable name="packageName" select="'C_CIDADAO_LAB_PLSQL2_HTML'" />
        
        <xsl:call-template name="generateHTMLBody">
            <xsl:with-param name="packageName" select="$packageName"/>
        </xsl:call-template>
 
        
    </xsl:template>

    <!-- PLSQL Type -->
    <xsl:template name="plsql_type">
        <xsl:param name="type" select="'text'"/>
        <xsl:param name="tag"/>
        <xsl:choose>
            <xsl:when test="($type='number' or $type='vkb_num' or $type='filter_num')">
                <xsl:text>number</xsl:text>
            </xsl:when>
            <xsl:otherwise>VARCHAR2</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- LowerCase -->
    <xsl:template name="LowerCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>    
    </xsl:template>
    
    <!-- UpperCase -->
    <xsl:template name="UpperCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>    
    </xsl:template>
    
    <!-- InitCap -->
    <xsl:template name="InitCap">
        <xsl:param name="text"/>
        <xsl:value-of
            select="concat(translate(substring(text, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(text, 2))"
        />
    </xsl:template>
    
    <!-- SanitizeTag -->
    <xsl:template name="sanitizeTag">
        <xsl:param name="tag"/>
        <xsl:call-template name="LowerCase">
            <xsl:with-param name="text" select="translate(translate($tag,' .-','__'),'-\/','')" />
        </xsl:call-template>
    </xsl:template>
    
    <!-- SanitizeToolbar -->
    <xsl:template name="sanitizeToolbar">
        <xsl:param name="title"/>
        <xsl:param name="selfaction"/>
        <xsl:param name="page"/>
        <xsl:param name="action"/>
        
        <xsl:variable name="v">
            <xsl:choose>
             <xsl:when test="string-length($selfaction) &lt;= 6">
                 <xsl:call-template name="sanitizeTag">
                     <xsl:with-param name="tag" select="$selfaction" /> 
                 </xsl:call-template>
             </xsl:when>
              <xsl:otherwise>
                  <xsl:variable name="v1">
                      <xsl:call-template name="sanitizeTag">
                          <xsl:with-param name="tag" select="$selfaction" /> 
                      </xsl:call-template>
                  </xsl:variable>
                  <xsl:value-of select="concat(substring(translate($v1,'_',''),1,3),substring(translate($v1,'_',''),-3))"/>                  
              </xsl:otherwise>  
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="v_action">
            <xsl:variable name="v_action_1">
                <xsl:choose>
                    <xsl:when test="substring-before($title, ' ')!=''">
                        <xsl:value-of select="substring-before($title, ' ')" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$title" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <xsl:call-template name="sanitizeTag">
                <xsl:with-param name="tag" select="$v_action_1" /> 
            </xsl:call-template>
        </xsl:variable> 
        
        <xsl:variable name="v_action1" select="substring($v_action,1,9)" />           
                 
        <xsl:variable name="v_action2">
            <xsl:variable name="v_action2_1">
                <xsl:call-template name="sanitizeTag">
                    <xsl:with-param name="tag" select="substring(translate($page,'_T_',''),1,6)" /> 
                </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="translate(concat(substring(translate($action,'_',''),1,4),'_',substring($v_action2_1,1,20)),'_','')" />
        </xsl:variable> 
        
        <xsl:call-template name="LowerCase">
            <xsl:with-param name="text" select="concat($v_action1,'_',$v,$v_action2)" />
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
    
    <!-- Gen Type of fields -->
    <xsl:template name="genWhatType">
        <xsl:param name="type"/>        
        <xsl:choose>
            <xsl:when test="$type='select' or $type='selectchange' or $type='selectlist' or $type='radiolist' or $type='checkboxlist'">options</xsl:when>
            <xsl:when test="$type='separatorlist' or $type='separatordialog' or $type='list' or $type='formlist'">list</xsl:when>
            <xsl:when test="contains($type,'LOOKUP')">lookup</xsl:when>
            <xsl:otherwise><xsl:value-of select="$type"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Gen Type of button -->
    <xsl:template name="genWhatButton">
        <xsl:param name="type"/>        
        <xsl:choose>
            <xsl:when test="$type='form'">FRM</xsl:when>
            <xsl:when test="$type='list' or $type='filter'">LST</xsl:when>
            <xsl:when test="$type='context'">CTX</xsl:when>
            <xsl:otherwise><xsl:value-of select="$type"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Generate FIELD GROUP-->
    <xsl:template name="genFieldGroup">
        <xsl:param name="fields" />
        <xsl:param name="type" /> 
        
        <xsl:variable name="procName" select="concat('FIELD_',$type)" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/><xsl:text>-----</xsl:text><xsl:value-of
            select="$procName"/>: group of fields for <xsl:value-of select="$type"/>     
        
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="params" select="concat('p',$tab,'OUT',$space, $pkg_type,'.t_form')"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:text>t</xsl:text>
        <xsl:value-of select="$tab"/><xsl:value-of select="$pkg_type"/>
        <xsl:text>.t_form</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        
        <xsl:for-each select="$fields">
            <xsl:call-template name="genField">
                <xsl:with-param name="field" select="."/>
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </xsl:for-each>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>p:=t</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        
    </xsl:template>
    

    <!-- Generate FIELD Attribute -->
    <xsl:template name="genFieldAttribute">
        <xsl:param name="name"/>
        <xsl:param name="type" select="''"/>
        <xsl:param name="value"/>
        <xsl:param name="with_quotes" select="'true'"/>
        <xsl:param name="with_comma" select="'true'"/>
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$name" />=><xsl:if test="$with_quotes='true'"><xsl:value-of select="$quotes"/></xsl:if><xsl:value-of
            select="$value"/><xsl:if test="$with_quotes='true'"><xsl:value-of select="$quotes"/></xsl:if><xsl:if test="$with_comma='true'"><xsl:value-of select="$comma"/></xsl:if>
            
     </xsl:template>
    
   
        <!-- Generate FIELD -->
    <xsl:template name="genField">
        <xsl:param name="field"/>
        <xsl:param name="type" />         
        <xsl:param name="with_label" select="'true'"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----Column:</xsl:text><xsl:value-of
            select="name()"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>t(t.count+1):=</xsl:text>
        <xsl:value-of select="$pkg_type"/><xsl:text>.add_form(</xsl:text>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_tag'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="name()"/>
        </xsl:call-template> 
        
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="name()"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text>
            <xsl:if test="$with_label='true'">
                <xsl:text>NVL(</xsl:text>
                <xsl:value-of select="$packageDBName"/>
                <xsl:text>.tp_label.</xsl:text>
                <xsl:value-of select="name()"/>
                <xsl:value-of select="$comma" />
            </xsl:if>
            
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="text()" />
            <xsl:value-of select="$quotes" />
            
            <xsl:if test="$with_label='true'">
                <xsl:text>)</xsl:text>
            </xsl:if>
            
            <xsl:text>)</xsl:text>
        </xsl:variable>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_label'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="$label"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
          </xsl:call-template>   
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_name'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="@name"/>
        </xsl:call-template> 
                
        <xsl:variable name="value">
            <xsl:text>NVL(</xsl:text>
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get(</xsl:text>
            <xsl:value-of select="$quotes"/>
            <xsl:value-of select="@name"/>
            <xsl:value-of select="$quotes"/><xsl:text>)</xsl:text>
            <xsl:value-of select="$comma"/>
            
            <xsl:if test="@type='date'">
                <xsl:text>TO_CHAR(</xsl:text>
            </xsl:if>
            
            <xsl:value-of select="$packageDBName"/>
            <xsl:text>.tp_record.</xsl:text>
            <xsl:value-of select="name()"/>
            
            <xsl:if test="@type='date'">
                <xsl:value-of select="$comma"/>
                <xsl:value-of select="$quotes"/>
                <xsl:value-of select="$date_format"/>                
                <xsl:value-of select="$quotes"/>
                <xsl:text>)</xsl:text>
            </xsl:if>
            
            <xsl:text>)</xsl:text>
        </xsl:variable>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_value'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="$value"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_permission'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="concat($packageDBName,'.tp_permission.',name())"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:if test="$type!='list' and $type!='view'">
         <xsl:call-template name="genFieldAttribute">
             <xsl:with-param name="name" select="'p_maxlength'"/>
             <xsl:with-param name="type" select="@type"/>
             <xsl:with-param name="value" select="@maxlength"/>
         </xsl:call-template>  
         
         
         <xsl:call-template name="genFieldAttribute">
             <xsl:with-param name="name" select="'p_attributes'"/>
             <xsl:with-param name="type" select="@type"/>
             <xsl:with-param name="value" select="@attributes"/>
         </xsl:call-template> 
         
         <xsl:variable name="what_type">
             <xsl:call-template name="genWhatType">
                 <xsl:with-param name="type" select="@type"/>
             </xsl:call-template> 
         </xsl:variable>
          
         <xsl:if test="$what_type='options'">
             <xsl:call-template name="genFieldAttribute">
                 <xsl:with-param name="name" select="'p_data'"/>
                 <xsl:with-param name="type" select="@type"/>
                 <xsl:with-param name="value" select="concat($pkg_type,'.add_select(',$packageDBName,'.SQL_',name(),')')"/>
                 <xsl:with-param name="with_quotes" select="'false'"/>
             </xsl:call-template> 
         </xsl:if>
         
         <xsl:if test="$what_type='lookup'">
             <xsl:call-template name="genFieldAttribute">
                 <xsl:with-param name="name" select="'p_js_lookup'"/>
                 <xsl:with-param name="type" select="@type"/>
                 <xsl:with-param name="value" select="concat($packageDBName,'.JS_',name())"/>
                 <xsl:with-param name="with_quotes" select="'false'"/>
             </xsl:call-template> 
         </xsl:if>
         
         <xsl:if test="$what_type='list'">
             <xsl:call-template name="genFieldAttribute">
                 <xsl:with-param name="name" select="'p_value_list'"/>
                 <xsl:with-param name="type" select="@type"/>
                 <xsl:with-param name="value" select="concat($packageDBName,'.VALUE_',name())"/>
                 <xsl:with-param name="with_quotes" select="'false'"/>
             </xsl:call-template> 
         </xsl:if>
         
         <xsl:if test="@rel">
             <xsl:call-template name="genFieldAttribute">
                 <xsl:with-param name="name" select="'p_tag_group'"/>
                 <xsl:with-param name="type" select="@type"/>
                 <xsl:with-param name="value" select="@rel"/>
             </xsl:call-template> 
         </xsl:if>
        
        </xsl:if>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_type'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="@type"/>
            <xsl:with-param name="with_comma" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/>)<xsl:value-of select="$endline"/>
        
    </xsl:template>
    
    
    <!-- Generate TOOLBAR GROUP-->
    <xsl:template name="genToolbarGroup">
        <xsl:param name="toolbars" />
        <xsl:param name="type" /> 
        
        <xsl:variable name="procName" select="concat('TOOLBAR_',$type)" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/><xsl:text>-----</xsl:text><xsl:value-of
            select="$procName"/>: group of button for <xsl:value-of select="$type"/>     
        
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="params" select="concat('p',$tab,'OUT',$space, $pkg_type,'.t_toolbar')"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:text>t</xsl:text>
        <xsl:value-of select="$tab"/><xsl:value-of select="$pkg_type"/>
        <xsl:text>.t_toolbar</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        
        <xsl:for-each select="$toolbars">
            <xsl:call-template name="genToolbar">
                <xsl:with-param name="field" select="."/>
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </xsl:for-each>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>p:=t</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        
    </xsl:template>
    
    
    <!-- Generate TOOLBAR -->
    <xsl:template name="genToolbar">
        <xsl:param name="toolbar"/>
        <xsl:param name="type" />         
        <xsl:param name="with_label" select="'true'"/>
        <xsl:param name="selfaction" select="''"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----TOOLBAR:</xsl:text><xsl:value-of
            select="title"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>t(t.count+1):=</xsl:text>
        <xsl:value-of select="$pkg_type"/><xsl:text>.add_toolbar(</xsl:text>
        
        <!--<xsl:variable name="code">
            <xsl:call-template name="sanitizeToolbar">
                <xsl:with-param name="title" select="title"/>
                <xsl:with-param name="selfaction" select="$selfaction"/>
                <xsl:with-param name="page" select="page"/>
                <xsl:with-param name="action" select="link"/>
            </xsl:call-template>
        </xsl:variable>
        -->
        
        <xsl:variable name="what_button">
            <xsl:call-template name="genWhatButton">
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="code">
            <xsl:call-template name="sanitizeTag">
                <xsl:with-param name="tag" select="title"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="name" select="concat($what_button,'_',$code)" />
        
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="concat($type,'_',$code)"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text>
            <xsl:if test="$with_label='true'">
                <xsl:text>NVL(</xsl:text>
                <xsl:value-of select="$packageDBName"/>
                <xsl:text>.tp_label.</xsl:text>
                <xsl:value-of select="$name"/>
                <xsl:value-of select="$comma" />
            </xsl:if>
            
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="title" />
            <xsl:value-of select="$quotes" />
            
            <xsl:if test="$with_label='true'">
                <xsl:text>)</xsl:text>
            </xsl:if>
            
            <xsl:text>)</xsl:text>
        </xsl:variable>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_title'"/>            
            <xsl:with-param name="value" select="$label"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template>   
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_app'"/>            
            <xsl:with-param name="value" select="'L_APP'"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_page'"/>           
            <xsl:with-param name="value" select="page"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_action'"/>           
            <xsl:with-param name="value" select="link"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_type'"/>           
            <xsl:with-param name="value" select="@type"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_target'"/>           
            <xsl:with-param name="value" select="target"/>
        </xsl:call-template>         
      
        <xsl:if test="$type!='filter'">
            <xsl:call-template name="genFieldAttribute">
                <xsl:with-param name="name" select="'p_permission'"/>
                <xsl:with-param name="value" select="concat($packageDBName,'.tp_permission.',$name)"/>
                <xsl:with-param name="with_quotes" select="'false'"/>
            </xsl:call-template> 
            
            <xsl:call-template name="genFieldAttribute">
                <xsl:with-param name="name" select="'p_parameter'"/>
                <xsl:with-param name="type" select="@type"/>
                <xsl:with-param name="value" select="concat($packageDBName,'.tp_parameter.',$name)"/>
                <xsl:with-param name="with_quotes" select="'false'"/>
            </xsl:call-template> 
        </xsl:if>     
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_img'"/>
            <xsl:with-param name="value" select="img"/>
            <xsl:with-param name="with_comma" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/>)<xsl:value-of select="$endline"/>
        
    </xsl:template>
    
   
</xsl:stylesheet>
