<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
    <xsl:preserve-space elements="*"/>

    <!-- Join all templates to create controller -->
    <xsl:template name="create-controller">
    	<xsl:value-of select="$newline"/>
     	<xsl:call-template name="import-packages-controller"></xsl:call-template>
     	<xsl:value-of select="$newline"/>
 		<xsl:value-of select="concat('public class ',$class_name,'Controller extends Controller {')"/>
	 		<xsl:value-of select="$tab2"/>
	     	<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="actionIndex"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="'}'"/>
    </xsl:template>


     <!-- import all class to using in controller -->
 	<xsl:template name="import-packages-controller">
 		<xsl:value-of select="$import_controller"/>
		<xsl:value-of select="$newline"/>
 	</xsl:template>

 	<!-- add actionIndex() - it is default method in any controller -->
	<xsl:template name="actionIndex">
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>public void actionIndex() throws IOException{</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="concat($class_name,'Model',' model = ',$class_name,'Model();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="concat($class_name,'View',' view = ',$class_name,'View();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="concat('view.addModel(',$double_quotes,'model',$double_quotes,',','model);')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="'this.renderView(view,true);'"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>}</xsl:text>
 	</xsl:template>

</xsl:stylesheet>