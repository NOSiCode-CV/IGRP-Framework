<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate CHART GROUP-->
    <xsl:template name="genChartGroup">
        <xsl:param name="charts" />
        <xsl:param name="type" /> 
        
        <xsl:variable name="procName" select="'FIELD_chart'" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/>
        <xsl:value-of select="concat('-----',$procName,': group of fields for ')"/><xsl:value-of select="$type"/>     
        
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$pkg_type"/>
        <xsl:text>.TBL_CHART.DELETE</xsl:text><xsl:value-of select="$endline"/>
        
        <xsl:for-each select="$charts">
            <xsl:call-template name="genChart">
                <xsl:with-param name="charts" select="."/>
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </xsl:for-each>
        
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        
    </xsl:template>
    
    
    
    <!-- Generate FIELD -->
    <xsl:template name="genChart">
        <xsl:param name="chart"/>
        <xsl:param name="type" />   
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----------------------------------------------------------------------</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:text>-----CHART:</xsl:text><xsl:value-of
            select="name()"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
        <xsl:value-of select="$pkg_type"/><xsl:text>.add_chart(</xsl:text>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_tag'"/>           
            <xsl:with-param name="value" select="name()"/>
        </xsl:call-template> 
        
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
        
        <xsl:variable name="label_x">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="concat(@code,'_x')"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text> 
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="xaxys" />
            <xsl:value-of select="$quotes" />   
            <xsl:text>)</xsl:text>
        </xsl:variable>
        
        <xsl:variable name="label_y">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="concat(@code,'_y')"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text> 
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="yaxys" />
            <xsl:value-of select="$quotes" />   
            <xsl:text>)</xsl:text>
        </xsl:variable>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_title'"/>          
            <xsl:with-param name="value" select="$label"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_x_axys'"/>         
            <xsl:with-param name="value" select="$label_x"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template>   
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_y_axys'"/>           
            <xsl:with-param name="value" select="$label_y"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template>  
        
             
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_sql'"/>         
            <xsl:with-param name="value" select="concat($packageDBName,'.CHART_',name())"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template>
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_permission'"/>
            <xsl:with-param name="type" select="@type"/>
            <xsl:with-param name="value" select="concat($packageDBName,'.tp_permission.CHART_',name())"/>
            <xsl:with-param name="with_quotes" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:call-template name="genFieldAttribute">
            <xsl:with-param name="name" select="'p_chart_type'"/>         
            <xsl:with-param name="value" select="chart_type"/>
            <xsl:with-param name="with_comma" select="'false'"/>
        </xsl:call-template> 
        
        <xsl:value-of select="$enter2tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"
        /><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>)<xsl:value-of select="$endline"/>
        
    </xsl:template>
    
</xsl:stylesheet>