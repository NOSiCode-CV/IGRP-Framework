<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:preserve-space elements="*"/>
    <!-- Generate TOOLBAR GROUP-->
    <xsl:template name="genTableGroup">
        <xsl:param name="title" />
        <xsl:param name="type" />
        <xsl:param name="tag" />
        <xsl:param name="type_pkg" select="'html'"/>
        
        <xsl:variable name="procName" select="concat('LIST_',$tag)" />
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/> 
        <xsl:value-of select="$entertab"/>
        <xsl:value-of select="concat('-----',$procName,': list for ',$tag)"/>     
        
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>            
        </xsl:call-template> 
               
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        
        <xsl:variable name="label">
            <xsl:value-of select="$pkg_core"/>
            <xsl:text>.get_lang_label(p_code=></xsl:text><xsl:value-of select="$quotes" />
            <xsl:value-of select="@code"/><xsl:value-of select="$quotes" />
            <xsl:value-of select="$comma" /><xsl:text>p_text=></xsl:text>
            <xsl:if test="$with_label='true'">
                <xsl:text>NVL(</xsl:text>
                <xsl:value-of select="$packageDBName"/>
                <xsl:text>.tp_label.</xsl:text>
                <xsl:value-of select="$tag"/>
                <xsl:value-of select="$comma" />
            </xsl:if>
            
            <xsl:value-of select="$quotes" />
            <xsl:value-of select="$title" />
            <xsl:value-of select="$quotes" />
            
            <xsl:if test="$with_label='true'">
                <xsl:text>)</xsl:text>
            </xsl:if>
            
            <xsl:text>)</xsl:text>
        </xsl:variable>        
        
        
                
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).title:=</xsl:text>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$label"/>        
        <xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).permission:=</xsl:text>
        <xsl:value-of select="concat($packageDBName,'.tp_permission.',$tag)"/>        
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).legend:=</xsl:text>
        <xsl:value-of select="concat($pkg_type,'.add_select(',$packageDBName,'.LEG_',$tag,')')"/>        
        <xsl:value-of select="$endline"/>
        
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).type:=</xsl:text>        
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$type"/> 
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>FIELD_</xsl:text>
        <xsl:value-of select="$tag"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).header)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>TOOLBAR_</xsl:text>
        <xsl:value-of select="$tag"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).context)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.VALUE_</xsl:text>
        <xsl:value-of select="$tag"/>
        <xsl:text>(p=></xsl:text>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).data</xsl:text>
        <xsl:value-of select="$comma"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:text>params=></xsl:text>
        <xsl:value-of select="$pkg_type_table"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="$tag"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>).params</xsl:text>        
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        
        
        
        
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        
    </xsl:template>
    
   
</xsl:stylesheet>