<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
   
    <xsl:variable name="all-blocks" select="//*/block"></xsl:variable>
    
    <xsl:variable name="app-title" select="rows/app"></xsl:variable>
    
    <xsl:variable name="page-title" select="rows/page"></xsl:variable>
    
    <xsl:variable name="service-package" select="rows/classNameService"></xsl:variable>

    <xsl:variable name="newlineTab1">
    
        <xsl:value-of select="concat($newline,$tab)"/>
        
    </xsl:variable>
    
    <xsl:variable name="newlineTab2">
    
        <xsl:value-of select="concat($newline,$tab2)"/>
        
    </xsl:variable>
    
    
     <xsl:variable name="newlineTab3">
     
        <xsl:value-of select="concat($newline,$tab2,$tab)"/>
        
    </xsl:variable>
    
     <xsl:variable name="newlineTab4">
     
        <xsl:value-of select="concat($newline,$tab2,$tab2)"/>
        
    </xsl:variable>
    
    <xsl:variable name="newlineTab5">
        <xsl:value-of select="concat($newline,$tab,$tab2,$tab2)"/>
    </xsl:variable>
    
    <xsl:variable name="newlineTab6">
    
        <xsl:value-of select="concat($newline,$tab2,$tab2,$tab2)"/>
        
    </xsl:variable>
    
    <!--InitCap-->
    
    <xsl:template name="InitCap">
    
        <xsl:param name="text"/>
        
        <xsl:value-of select="concat(translate(substring($text, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring($text, 2))"/>
    
    </xsl:template>
    
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
   
</xsl:stylesheet>