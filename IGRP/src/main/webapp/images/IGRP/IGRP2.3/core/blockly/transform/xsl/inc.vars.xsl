<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    
    <xsl:param name="jsEnter">
        <xsl:text>&#10;</xsl:text>
    </xsl:param>
    
    <xsl:variable name="all-blocks" select="//*/block"></xsl:variable>
    
    <xsl:variable name="app-title" select="main/config/app/title"></xsl:variable>
    
    <xsl:variable name="page-title" select="main/config/page/title"></xsl:variable>

    <xsl:variable name="tab">
        <xsl:text>&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab2">
        <xsl:text>&#9;&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab3">
        <xsl:text>&#9;&#9;&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab4">
        <xsl:text>&#9;&#9;&#9;&#9;</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="gt">
        <xsl:text>&gt;</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="lt">
        <xsl:text>&lt;</xsl:text>
    </xsl:variable>

    <xsl:variable name="newline">
        <xsl:value-of select="$jsEnter"/>
    </xsl:variable>
    
    <xsl:variable name="newlineTab1">
        <xsl:value-of select="concat($newline,$tab)"/>
    </xsl:variable>
    
    <xsl:variable name="newlineTab2">
        <xsl:value-of select="concat($newline,$tab2)"/>
    </xsl:variable>
    
     <xsl:variable name="newlineTab3">
        <xsl:value-of select="concat($newline,$tab2,$tab)"/>
    </xsl:variable>

    <xsl:variable name="double_quotes">"</xsl:variable>

    <xsl:variable name="simple_quotes">'</xsl:variable>
    
    <!--LowerCase-->
    <xsl:template name="LowerCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
    </xsl:template>
    <!--UpperCase-->
    <xsl:template name="UpperCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
    </xsl:template>
    <!--InitCap-->
    <xsl:template name="InitCap">
        <xsl:param name="text"/>
        <xsl:value-of
            select="concat(translate(substring($text, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring($text, 2))"/>
    </xsl:template>
   
</xsl:stylesheet>