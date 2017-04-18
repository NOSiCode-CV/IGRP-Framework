<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:variable name="initClass">public class {</xsl:variable>
    <xsl:variable name="endClass">}</xsl:variable>  
    <xsl:variable name="quotes">'</xsl:variable>
    <xsl:variable name="double_quotes">"</xsl:variable>
    <xsl:variable name="comma">,</xsl:variable>
    <xsl:variable name="model">$model</xsl:variable>
    <xsl:variable name="null" select="'null'" />
    <xsl:variable name="pointer">
    	<xsl:text>-&gt;</xsl:text>
    </xsl:variable>
    <xsl:variable name="typeNumber">
    	<xsl:text>['type' =&gt; 'number']</xsl:text>
    </xsl:variable>
    <xsl:variable name="endline">;</xsl:variable>
    <!--Tabulacao-->    
    <xsl:variable name="tab">
        <xsl:text>&#x9;</xsl:text>
    </xsl:variable>    
    <xsl:variable name="tab2">
        <xsl:text>&#x9;&#x9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab3">
        <xsl:text>&#x9;&#x9;&#x9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab4">
        <xsl:text>&#x9;&#x9;&#x9;&#x9;</xsl:text>
    </xsl:variable>
	<xsl:variable name="row_name" select="rows/content/*[@type='table']/table/value/row/*[local-name()]"/>
	<xsl:variable name="row" select="rows/content/*[@type='table']/table/value/row"/>
    <!--Parentesis Esquerdo-->
    <xsl:variable name="left_p">(</xsl:variable>
    <!--Parentesis Direito-->
    <xsl:variable name="rigth_p">)</xsl:variable>
    <!--Espacamento-->
    <xsl:variable name="space">
        <xsl:text xml:space="preserve"> </xsl:text>
    </xsl:variable>
    <!--Enter-->
    <xsl:variable name="enter">
        <xsl:text xml:space="preserve">
            <![CDATA[]]>
        </xsl:text>
    </xsl:variable>
    <!--kebra de linha-->
    <xsl:variable name="broke">
        <xsl:text xml:space="preserve">
        </xsl:text>
    </xsl:variable>
    <!-- XPath-->
     <xsl:variable name="content" select="rows/content/@type"/>
     <xsl:variable name="typeField1" select="'@type'"/>
    <!--============================Upper and Lower Case=================================-->
    <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <xsl:variable name="small" select="'abcdefghijklmnopqrstuvwxyz'" />  

    <xsl:template name="uppercase">    	     
        <xsl:param name="value"/>       
        <xsl:value-of select="translate($value, $small, $upper)"/>
    </xsl:template>

    <xsl:template name="smallcase">    	
        <xsl:param name="value"/>        
        <xsl:value-of select="translate($value, $upper, $small)"/>
    </xsl:template>

     <xsl:template name="space2underscore">    	
        <xsl:param name="value"/>        
        <xsl:value-of select="translate($value, ' ', '_')"/>
    </xsl:template>
	
	<xsl:template name="endOf">    	
        <xsl:param name="value"/>
		<xsl:text>===================================END OF</xsl:text>
        <xsl:value-of select="$value"/>
		<xsl:text>===================================</xsl:text>
    </xsl:template>
	
	<xsl:template name="startOf">    	
        <xsl:param name="value"/>
		<xsl:text>===================================BEGINNING OF</xsl:text>
        <xsl:value-of select="$value"/>
		<xsl:text>===================================</xsl:text>
    </xsl:template>
	
	<xsl:template name="getMethod">
		<xsl:param name="linkName"/>
	  <xsl:choose>
		<xsl:when test="contains($linkName, '.')">
			<xsl:call-template name="getMethod">
			  <xsl:with-param name="linkName" select="substring-after($linkName, '.')"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="$linkName"/>
		</xsl:otherwise>
	  </xsl:choose>
	</xsl:template>

</xsl:stylesheet>