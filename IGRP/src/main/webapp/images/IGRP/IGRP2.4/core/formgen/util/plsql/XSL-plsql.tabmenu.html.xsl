<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!-- Generate TABMENU GROUP-->
    <xsl:template name="genTabMenuGroup">
        <xsl:param name="groups" />
        <xsl:param name="type" />
        <xsl:param name="type_pkg" select="'html'"/>
        
        <xsl:variable name="procName" select="concat('TABMENU_',$type)" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="concat($entertab,'-----',$procName,': Tab Menu')"/>        
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$entertab"/>
        
        <xsl:text>BEGIN</xsl:text>
                
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$pkg_type"/>
        <xsl:text>.tbl_tabmenu.delete</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:choose>
            
            <xsl:when test="$with_menucopy='true' and $type_pkg='html'">
                
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$packageCopyDBName"/>
                <xsl:text>.</xsl:text><xsl:value-of select="'DML_MENU'"/>
                <xsl:value-of select="$endline"/>
                
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$packageCopyHtmlName"/>
                <xsl:text>.</xsl:text><xsl:value-of select="$procName"/>
                <xsl:value-of select="$endline"/>
                
            </xsl:when>
       
            <xsl:when test="$with_dynamic='true' and $type_pkg='html'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$packageDBName"/>
                <xsl:text>.</xsl:text><xsl:value-of select="$procName"/>
                <xsl:value-of select="$endline"/>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:for-each select="$groups">
                    <xsl:call-template name="genMenuGroup">
                        <xsl:with-param name="group" select="."/>
                        <xsl:with-param name="type" select="$type"/>
                        <xsl:with-param name="position" select="position()"/>
                    </xsl:call-template>
                </xsl:for-each> 
            </xsl:otherwise>
        </xsl:choose>   
     
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        
    </xsl:template>
    
    
    <!-- Generate Menu Item -->
    <xsl:template name="genMenuGroup">
        <xsl:param name="group"/>
        <xsl:param name="type" />
        <xsl:param name="position" />  
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----GROUP:</xsl:text><xsl:value-of
            select="@title"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_type"/><xsl:text>.add_menu_group(</xsl:text>
        
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="@code"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text>
           
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="@title" />
            <xsl:value-of select="$quotes" />          
            
            <xsl:text>)</xsl:text>
        </xsl:variable>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_title'"/>            
            <xsl:with-param name="value" select="$label"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
            <xsl:with-param name="with_comma" select="'false'"/>
        </xsl:call-template>  
      
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/>)<xsl:value-of select="$endline"/>
        
        <xsl:for-each select="$group/*">
            <xsl:call-template name="genMenuItem">
                <xsl:with-param name="toolbar" select="."/>
                <xsl:with-param name="type" select="'menu'" />
                <xsl:with-param name="position" select="$position" />
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>
    
    
    <!-- Generate Menu Item -->
    <xsl:template name="genMenuItem">
        <xsl:param name="toolbar"/>
        <xsl:param name="type" /> 
        <xsl:param name="position" />  
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----MENU:</xsl:text><xsl:value-of
            select="title"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$pkg_type"/><xsl:text>.add_menu_item(</xsl:text>
        
             
        <xsl:variable name="what_button">
            <xsl:call-template name="genWhatButton">
                <xsl:with-param name="type" select="local-name(../..)"/>
            </xsl:call-template>
        </xsl:variable>                       
        
        
        <xsl:variable name="code">
            <xsl:call-template name="sanitizeTag">
                <xsl:with-param name="tag" select="title"/>
            </xsl:call-template>
        </xsl:variable>
        
        <!--<xsl:variable name="name" select="concat('TAB',$position,'_',$code)" />-->
        
        <xsl:variable name="name" select="concat($what_button,'_',$code)" />
                 
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="@code"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text>
          
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="title" />
            <xsl:value-of select="$quotes" />
         
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
        
        <xsl:if test="@transaction='true'">
            <xsl:call-template name="genFieldAttribute">
                <xsl:with-param name="name" select="'p_flg_transaction'"/>
                <xsl:with-param name="value" select="'TRUE'"/>
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