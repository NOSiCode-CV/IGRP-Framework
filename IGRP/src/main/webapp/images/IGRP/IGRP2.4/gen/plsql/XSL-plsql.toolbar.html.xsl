<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
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
            
            <xsl:if test="@transaction='true'">
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