<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

    <!-- Join all templates to create view -->
    <xsl:template name="create-view">
		<xsl:value-of select="$newline"/>
     	<xsl:call-template name="import-packages-view"></xsl:call-template>
     	<xsl:value-of select="$newline"/>
 		<xsl:value-of select="concat('public class ',$class_name,'View extends View {')"/>
	 		<xsl:value-of select="$tab2"/>
	     	<xsl:value-of select="$newline"/>
	     	<xsl:call-template name="declare-variables-view"></xsl:call-template>
	     	<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="create-construct"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:call-template name="render"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="'}'"/>
    </xsl:template>

     <!-- import all class to using in view -->
 	<xsl:template name="import-packages-view">
 		<xsl:value-of select="concat('package ',$package_name)"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_view"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_components"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_fields"/>
		<xsl:value-of select="$newline"/>
 	</xsl:template>
 	
	<!--  create construct view class -->
	<xsl:template name="create-construct">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="concat('public ', $class_name,'View','(',$class_name,' model){')"></xsl:value-of>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="instance-components-view"></xsl:call-template>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$tab"></xsl:value-of>
		<xsl:value-of select="'}'"></xsl:value-of>
	</xsl:template>
	
 	<!-- create render method 
	@Override
	public void render(){
		TesteModel model = new TesteModel();
	}
 	-->
 	<xsl:template name="render">
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>@Override</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>public void render(){</xsl:text>
		<xsl:value-of select="$newline"/>
			<xsl:call-template name="add-fields"></xsl:call-template>
			<xsl:call-template name="add-to-page"></xsl:call-template>
		<xsl:value-of select="$tab"/>
 		<xsl:text>}</xsl:text>
 	</xsl:template>

 	<!-- add fields in construct class -->
 	<xsl:template name="add-fields">
 		<xsl:for-each select="//content/*">
 			<xsl:call-template name="add-field">
	 			<xsl:with-param name="type"><xsl:value-of select="@type"/></xsl:with-param>
	 		</xsl:call-template>
 		</xsl:for-each>
 	</xsl:template>

 	<!-- 
 		Add containers to page
		this.addToPage(form_1);
		this.addToPage(form_2);
		this.addToPage(table_1);
		...
	-->
 	<xsl:template name="add-to-page">
 		<xsl:call-template name="add-button-to-container"></xsl:call-template>
 		<xsl:for-each select="//content/*">
 			<xsl:call-template name="gen-instance-components">
				<xsl:with-param name="type_content">
					<xsl:value-of select="@type" />
				</xsl:with-param>
				<xsl:with-param name="type">
					<xsl:value-of select="'add-to-page'" />
				</xsl:with-param>
			</xsl:call-template>
 		</xsl:for-each>
 	</xsl:template>

 	  <!--
		Declare and create instances components, for example:
	 	public IGRPForm form_1;
	 	public IGRPTables form_1;
	 	....
	-->
	<xsl:template name="gen-instance-components">
		<xsl:param name="type_content" /> 
		<xsl:param name="type" /> 
		<xsl:for-each select="/rows/content/*[@type=$type_content]/*">
		 	<xsl:variable name="instance_name">
		 		<xsl:value-of select="local-name(parent::*)"/>
		 	</xsl:variable>
			<xsl:choose>
				<xsl:when test="local-name() = 'fields'">
					<xsl:value-of select="$tab"/>
				 	<xsl:variable name="className">
				 		<xsl:call-template name="typeClass">
				 			<xsl:with-param name="type">                
				 				<xsl:value-of select="$type_content"/>
				 			</xsl:with-param>
				 		</xsl:call-template>
				 	</xsl:variable>
				 	<xsl:choose>
				 		<xsl:when test="$type='instance'">
							<xsl:value-of select="$tab"/>
				 			<xsl:value-of select="concat($instance_name,' = new ',$className,'(',$double_quotes,$instance_name,$double_quotes,');')"/>
				 		</xsl:when>
				 		<xsl:when test="$type='declare'">
				 			<xsl:value-of select="concat('public ',$className,' ',$instance_name,';')"/>
				 		</xsl:when>
				 		<xsl:when test="$type='add-to-page'">
				 			<xsl:value-of select="$tab"/>
				 			<xsl:value-of select="concat('this.addToPage(',$instance_name,');')"/>
				 		</xsl:when>
				 	</xsl:choose>
				 	<xsl:value-of select="$newline"/>
				</xsl:when>
				<xsl:when test="local-name()='item'">
					<xsl:if test="$type='add-to-page'">
			 			<xsl:value-of select="$tab2"/>
			 			<xsl:value-of select="concat('this.addToPage(',$instance_name,');')"/>
				 		<xsl:value-of select="$newline"/>
			 		</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<!-- declare variables in the class view -->
 	<xsl:template name="declare-variables-view">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$newline"/>
 		<xsl:call-template name="gen-field-view">
			<xsl:with-param name="type">
				<xsl:value-of select="'declare'" />
			</xsl:with-param>
		</xsl:call-template>
		<xsl:for-each select="//content/*">
 			<xsl:call-template name="gen-instance-components">
				<xsl:with-param name="type_content">
					<xsl:value-of select="@type" />
				</xsl:with-param>
				<xsl:with-param name="type">
					<xsl:value-of select="'declare'" />
				</xsl:with-param>
			</xsl:call-template>
 		</xsl:for-each>
 		<xsl:call-template name="gen-toolsbar">
			<xsl:with-param name="type_"><xsl:value-of select="'declare'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
 		<xsl:call-template name="gen-button">
			<xsl:with-param name="type_"><xsl:value-of select="'declare'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
 	</xsl:template>

 	<!-- instances components in the class view -->
 	<!-- declare variables in the class view -->
 	<xsl:template name="instance-components-view">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$newline"/>
		<xsl:for-each select="//content/*">
 			<xsl:call-template name="gen-instance-components">
				<xsl:with-param name="type_content">
					<xsl:value-of select="@type" />
				</xsl:with-param>
				<xsl:with-param name="type">
					<xsl:value-of select="'instance'" />
				</xsl:with-param>
			</xsl:call-template>
 		</xsl:for-each>

		<xsl:call-template name="gen-field-view">
			<xsl:with-param name="type">
				<xsl:value-of select="'instance'" />
			</xsl:with-param>
		</xsl:call-template>
		
 		<xsl:call-template name="gen-toolsbar">
			<xsl:with-param name="type_"><xsl:value-of select="'instance'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
 		<xsl:call-template name="gen-button">
			<xsl:with-param name="type_"><xsl:value-of select="'instance'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>