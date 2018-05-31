<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate TOOLBAR GROUP-->
    <xsl:template name="genToolbarGroup">
        <xsl:param name="toolbars" />
        <xsl:param name="type" />
        <xsl:param name="type_pkg" select="'html'"/>
        <xsl:param name="gen-dynamic-menu" select="'false'"/>
        
        <xsl:variable name="procName" select="concat('TOOLBAR_',$type)" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/><xsl:value-of
            select="concat('-----',$procName,': group of button for ')"/><xsl:value-of select="$type"/><xsl:if test="$with_dynamic='true' or @dynamic-menu='true'"> (Dynamic Menu)</xsl:if>     
        

        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="params" select="concat('p',$tab,'OUT',$space, $pkg_type,'.t_toolbar')"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:text>t</xsl:text>
        <xsl:value-of select="$tab"/><xsl:value-of select="$pkg_type"/>
        <xsl:text>.t_toolbar</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        <xsl:if test="$gen-dynamic-menu = 'true'">
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$entertab"/>
            /*
            <xsl:value-of select="$enter"/>
        </xsl:if>
        <xsl:choose>
            
            <xsl:when test="@copy='true' and $type_pkg='html' and ($type='menu' or @gen-type='menu')">
                
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$selfapp"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="@copy-package-db"/>
                <xsl:text>.</xsl:text><xsl:value-of select="'DML_MENU'"/>
                <xsl:value-of select="$endline"/>
                
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$selfapp"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="@copy-package-html"/>
                <xsl:text>.</xsl:text>
                <xsl:value-of select="'TOOLBAR_'"/>
                <xsl:value-of select="@copy-tag"/>
                <xsl:value-of select="concat('(p','=>','t)')"/>
                <xsl:value-of select="$endline"/>
                
            </xsl:when>
            
            <xsl:when test="@dynamic-menu='true' and $type_pkg='html' and ($type='menu' or @gen-type='menu') and $gen-dynamic-menu = 'false'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$packageDBName"/>
                <xsl:text>.</xsl:text><xsl:value-of select="$procName"/>
                <xsl:value-of select="concat('(p','=>','t)')"/>
                <xsl:value-of select="$endline"/>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:for-each select="$toolbars">
                    <xsl:call-template name="genToolbar">
                        <xsl:with-param name="field" select="."/>
                        <xsl:with-param name="type" select="$type"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose> 
        <xsl:if test="$gen-dynamic-menu = 'true'">
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$entertab"/> 
            */
            <xsl:value-of select="$enter"/>
            --- #START-MENU#
            --- #END-MENU#
        </xsl:if>
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
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----TOOLBAR:</xsl:text><xsl:value-of
            select="@rel"/>

        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>t(t.count+1):=</xsl:text>
        <xsl:value-of select="$pkg_type"/><xsl:text>.add_toolbar(</xsl:text>
        
        <xsl:variable name="code_action">
            <xsl:call-template name="sanitizeToolbar">
                <xsl:with-param name="title" select="@rel"/>
                <xsl:with-param name="selfaction" select="$selfaction"/>
                <xsl:with-param name="page" select="page"/>
                <xsl:with-param name="action" select="link"/>
            </xsl:call-template>
        </xsl:variable>
      
        <xsl:variable name="code_action2">
            <xsl:call-template name="getProcName">
                <xsl:with-param name="procedureName" select="concat('form_',$code_action)"/>
            </xsl:call-template>
        </xsl:variable>
        
        
        <xsl:variable name="button_type">
            <xsl:choose>
                <xsl:when test="local-name(..)='context-menu'">
                    <xsl:value-of select="'context'"/>
                </xsl:when>
                <xsl:when test="local-name(..)='tools-bar'">
                    <xsl:value-of select="'form'"/>
                </xsl:when>
                <xsl:when test="../@type='tabcontent'">
                    <xsl:value-of select="'tab'"/>
                </xsl:when>
                <xsl:when test="../@type='toolsbar'">
                    <xsl:value-of select="'tbar'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'btn'"/>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:variable>
        
        <xsl:variable name="what_button">
            <xsl:call-template name="genWhatButton">
                <xsl:with-param name="type" select="$button_type"/>
            </xsl:call-template>
        </xsl:variable>                       
        
        
        <xsl:variable name="code">
            <xsl:call-template name="sanitizeTag">
                <xsl:with-param name="tag" select="@rel"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="name" select="concat($what_button,'_',$code)" />

        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="@code"/><xsl:value-of select="$quotes" />
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
            <!--<xsl:with-param name="value" select="$code_action"/>-->
            <xsl:with-param name="value" select="concat('$',$owner,'.',$packageHtmlName,'.',$code_action2,'$')"/>
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
            
            <xsl:if test="@flg_transaction='true'">
                <xsl:call-template name="genFieldAttribute">
                    <xsl:with-param name="name" select="'p_flg_transaction'"/>
                    <xsl:with-param name="value" select="'TRUE'"/>
                    <xsl:with-param name="with_quotes" select="'false'"/>
                </xsl:call-template> 
            </xsl:if> 
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