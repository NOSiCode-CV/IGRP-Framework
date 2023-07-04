<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate FIELD GROUP-->
    <xsl:template name="genFieldGroup">
        <xsl:param name="fields" />
        <xsl:param name="type" /> 
        <xsl:param name="genGroup" /> 

        <xsl:variable name="procName" select="concat('FIELD_',$type)" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/>
        <xsl:value-of select="concat('-----',$procName,': group of fields for ',$type)"/>     
       
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
    

    <!-- Generate FIELD -->
    <xsl:template name="genField">
        <xsl:param name="field"/>
        <xsl:param name="type" />  

        <xsl:variable name="fTag">
            <xsl:choose>
                <xsl:when test="@type='hidden'">
                    <xsl:value-of select="@tag"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="name()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>         
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----Column:</xsl:text><xsl:value-of
            select="$fTag"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>t(t.count+1):=</xsl:text>
        <xsl:value-of select="$pkg_type"/><xsl:text>.add_form(</xsl:text>

        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_tag'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="$fTag"/>
        </xsl:call-template> 
        
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="@code"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text>
            <xsl:if test="$with_label='true'">
                <xsl:text>NVL(</xsl:text>
                <xsl:value-of select="$packageDBName"/>
                <xsl:text>.tp_label.</xsl:text>
                <xsl:value-of select="$fTag"/>
                <xsl:value-of select="$comma" />
            </xsl:if>
            
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="label/text()" />
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
            <xsl:value-of select="$fTag"/>
            
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
            <xsl:with-param name="value" select="concat($packageDBName,'.tp_permission.',$fTag)"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template> 
        
        <!--<xsl:if test="$type!='list' and $type!='view'">-->
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
                    <xsl:with-param name="value" select="concat($pkg_type,'.add_select(',$packageDBName,'.SQL_',$fTag,')')"/>
                    <xsl:with-param name="with_quotes" select="'false'"/>
                </xsl:call-template> 
            </xsl:if>
            
            <xsl:if test="$what_type='lookup'">
                <xsl:call-template name="genFieldAttribute">
                    <xsl:with-param name="name" select="'p_js_lookup'"/>
                    <xsl:with-param name="type" select="@type"/>
                    <xsl:with-param name="value" select="concat($packageDBName,'.JS_',$fTag)"/>
                    <xsl:with-param name="with_quotes" select="'false'"/>
                </xsl:call-template> 
            </xsl:if>
            
            <!--<xsl:if test="$what_type='list'">
                <xsl:call-template name="genFieldAttribute">
                    <xsl:with-param name="name" select="'p_value_list'"/>
                    <xsl:with-param name="type" select="@type"/>
                    <xsl:with-param name="value" select="concat($packageDBName,'.VALUE_',$fTag)"/>
                    <xsl:with-param name="with_quotes" select="'false'"/>
                </xsl:call-template> 
            </xsl:if>-->
            
            <xsl:if test="@rel">
                <xsl:call-template name="genFieldAttribute">
                    <xsl:with-param name="name" select="'p_tag_group'"/>
                    <xsl:with-param name="type" select="@type"/>
                    <xsl:with-param name="value" select="@rel"/>
                </xsl:call-template> 
            </xsl:if>
            
        <!--</xsl:if>-->

        <xsl:variable name="ttype">
            <xsl:choose>
                <xsl:when test="@lookup_parser='true'">js_passa_valor</xsl:when>
                <xsl:when test="$what_type='lookup'"><xsl:value-of select="@lookup_type"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
            </xsl:choose>

        </xsl:variable>

        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_type'"/>
            <xsl:with-param name="type" select="$ttype"/>
            <xsl:with-param name="value" select="$ttype"/>
            <xsl:with-param name="with_comma" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/>)<xsl:value-of select="$endline"/>
        
    </xsl:template>
    
</xsl:stylesheet>