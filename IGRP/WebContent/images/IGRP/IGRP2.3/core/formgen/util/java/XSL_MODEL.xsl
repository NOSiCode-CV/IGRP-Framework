<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

   	<!--
		Declare get and set mehtods in class model
    	public String getText(){
    		return this.text;
    	}
    	...
	-->
    <xsl:template name="gen-get-set-model">
        <xsl:for-each select="//fields/*">
            <xsl:if test="not(@name=preceding::node()/@name)">	
				<xsl:value-of select="$tab"/>
				<xsl:call-template name="getSetField">
		    		<xsl:with-param name="type" select="@type" />
		    		<xsl:with-param name="name" select="name()" />
		    	</xsl:call-template>
				<xsl:value-of select="$newline"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<!--
		Declare fields in class model
    	private String text;
    	private int id;
    	...
	-->
    <xsl:template name="declare-variables-model">
        <xsl:for-each select="//fields/*">
            <xsl:if test="not(@name=preceding::node()/@name)">		
				<xsl:value-of select="$tab"/>
				<xsl:variable name="type_field">
					<xsl:call-template name="typeField">
			    		<xsl:with-param name="type" select="@type" />
			    	</xsl:call-template>
				</xsl:variable>
				<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes,'p_',name(),$double_quotes,')')"/>			
				<xsl:value-of select="$newline"/>			
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="concat('private ',$type_field,' ',name(),';')"/>				
				<xsl:value-of select="$newline"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

 	<!-- import all class to using in model -->
 	<xsl:template name="import-packages-model">
 		<xsl:value-of select="concat('package ',$package_name)"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_model"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_annotations"/>
		<xsl:value-of select="$newline"/>
 	</xsl:template>

 	<!-- Join all template to create a class model -->
 	<xsl:template name="create-model">
 		<xsl:call-template name="import-packages-model"></xsl:call-template>
 		<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="concat('public class ',$class_name,' extends Model{')"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="declare-variables-model"></xsl:call-template>
	 		<xsl:call-template name="gen-get-set-model"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="'}'"/>
 	</xsl:template>
</xsl:stylesheet>