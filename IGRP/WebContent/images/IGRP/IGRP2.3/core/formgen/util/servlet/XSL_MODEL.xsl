<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

   
	<!-- get class name instance -->
	<xsl:template name="typeClass">
    	<xsl:param name="type"/>    	
    	<xsl:choose>
    		<xsl:when test="$type='form'">
    			<xsl:value-of select="'IGRPForm'" />
    		</xsl:when>
    		<xsl:when test="$type='table'">
    			<xsl:value-of select="'IGRPTable'" />
    		</xsl:when>
    		<xsl:otherwise />   
    	</xsl:choose>
    </xsl:template>

   
    <!-- declare variables in the class model -->
 	<xsl:template name="declare-variables-model">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$newline"/>
 		<xsl:call-template name="gen-field">
			<xsl:with-param name="type_content">
				<xsl:value-of select="'form'" />
			</xsl:with-param>
			<xsl:with-param name="type">
				<xsl:value-of select="'declare'" />
			</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="gen-field">
			<xsl:with-param name="type_content">
				<xsl:value-of select="'table'" />
			</xsl:with-param>
			<xsl:with-param name="type">
				<xsl:value-of select="'declare'" />
			</xsl:with-param>
		</xsl:call-template>
 	</xsl:template>

 	<!-- import all class to using in model -->
 	<xsl:template name="import-packages-model">
 		<xsl:value-of select="$import_model"/>
		<xsl:value-of select="$newline"/>
 	</xsl:template>

 	<!-- Join all template to create a class model -->
 	<xsl:template name="create-model">
 		<xsl:call-template name="import-packages-model"></xsl:call-template>
 		<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="concat('public class ',$class_name,'Model extends Model{')"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="declare-variables-model"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="'}'"/>
 	</xsl:template>
</xsl:stylesheet>