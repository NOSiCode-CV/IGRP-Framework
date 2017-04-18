<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="yes" />
    <!--Variable Declaration-->
    <xsl:include href="XSL_PHP_CONSTANT.xsl" />
   
   
    <!-- ============================Main Generate View===================================-->
    <xsl:template match="/">
    	<!--Main of genarator (Rows element)-->
    	 
    	<xsl:value-of select="$space" />
    	<xsl:value-of select="$enter" />  
		<xsl:call-template name="form" />
    </xsl:template>

   
	
      <!-- =========================Template Generate Form ===========================-->
     <xsl:template name="form">
        	<!--Form--> 
        	<xsl:text>package nosi.igrp.dao;</xsl:text>
			<xsl:text>import java.sql.Connection;</xsl:text>
			
        	
    		<xsl:text> public class Rui{</xsl:text>
			
			<xsl:text> }</xsl:text>
    		<!--<xsl:value-of select="$quotes" />
    		<xsl:value-of select="rows/content/title" />
    		<xsl:value-of select="$quotes" />
			<xsl:value-of select="$comma" />
			<xsl:value-of select="$space" />
			<xsl:text>null</xsl:text>
			<xsl:text>);</xsl:text>
			Call template form
			<xsl:call-template  name="field">					
				<xsl:with-param name="value" select="rows/content/form/label" />
				<xsl:with-param name="type" select="'form'" />
				<xsl:with-param name="formName" select="$formName" />
		    </xsl:call-template>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
					
			<xsl:for-each select="rows/content/form/tools-bar/*">
				<xsl:call-template  name="toolBar" />
			</xsl:for-each>
			<xsl:value-of select="$enter" />			
			<xsl:text>\backend\igrp\widgets\IGRPForm::end();</xsl:text>  -->  	
    </xsl:template>

	
    
</xsl:stylesheet>