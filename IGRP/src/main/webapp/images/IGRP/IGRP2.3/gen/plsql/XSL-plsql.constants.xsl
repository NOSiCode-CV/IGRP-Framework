<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
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
    
    <xsl:variable name="pkg_core" select="'REDGLOBAL.GLB_CORE'" />    
    <xsl:variable name="pkg_type" select="'REDGLOBAL.GLB_TYPE'" />
    <xsl:variable name="date_format" select="'DD-MM-YYYY'" /> 
    
    <xsl:variable name="packageDBName" select="rows/plsql/package_db"/>
    <xsl:variable name="packageHtmlName" select="rows/plsql/package_html"/>
    
    <xsl:variable name="with_label" select="rows/plsql/with_label"/>
    <xsl:variable name="with_biztalk" select="rows/plsql/with_biztalk"/>
    <xsl:variable name="with_replace" select="rows/plsql/with_replace"/>
    <xsl:variable name="with_dynamic" select="rows/plsql/dynamic_menu"/>
    
    <xsl:variable name="selfapp" select="rows/app"/>
    <xsl:variable name="selfpage" select="rows/page"/>
    <xsl:variable name="selfaction" select="rows/plsql/action"/>       
    <xsl:variable name="selftitle" select="rows/content/title"/>
    
    
</xsl:stylesheet>