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
 		<xsl:value-of select="concat('package ',$package_name)"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_controller"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_exception"/>
		<xsl:value-of select="$newline"/>
 	</xsl:template>
	
	<!-- create actions based in button -->
	<xsl:template name="createActions">
		 <xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content//tools-bar) &gt; 0)">
            
        </xsl:if>
	</xsl:template>
	
	<xsl:template name="actions">
		<xsl:param name="class_name"/>
		<xsl:param name="action_name"/>
		<xsl:param name="target"/>
		
		<xsl:choose>
			<xsl:when test="$target='submit'">
			</xsl:when>
			<xsl:when test="$target='_self'">
			</xsl:when>
		</xsl:choose>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
	</xsl:template>
	
 	<!-- add actionIndex() - it is default method in any controller -->
	<xsl:template name="actionIndex">
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>public void actionIndex() throws IOException{</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="concat($class_name,' model = new ',$class_name,'();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="concat($class_name,'View',' view = new ',$class_name,'View(model);')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="'this.renderView(view);'"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>}</xsl:text>
 	</xsl:template>

</xsl:stylesheet>