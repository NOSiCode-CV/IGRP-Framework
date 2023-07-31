<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" indent="no"/>


	<xsl:template name="create-interface">
		<xsl:call-template name="import-packages-interface"></xsl:call-template>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat('public interface I',$class_name,'Delegate {')"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<xsl:value-of select="$tab"/>
		<xsl:value-of select="concat('default void index(',$class_name,' model, ',$class_name,'View view) {}')"/>

		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		
		<xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or  (count(/rows/content//tools-bar) &gt; 0) or (count(/rows/content//context-menu/item) &gt; 0)">
            <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type='verticalmenu']/item">   <!-- Button in tools-bar -->
            	<xsl:if test="not(@rel=preceding::node()/@rel)">
		          	<xsl:call-template name="actions-interface">
						<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
						<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
						<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
						<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
						<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
						<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
		            </xsl:call-template>
		        </xsl:if>
           </xsl:for-each>
           <xsl:for-each select="//tools-bar/item">   <!-- Button in form -->
           	<xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="actions-interface">
					<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
	            </xsl:call-template>
	        </xsl:if>
           </xsl:for-each>           
           <xsl:for-each select="//context-menu/item">   <!-- Button in table -->
            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="actions-interface">
					<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
	            </xsl:call-template>
            </xsl:if>
           </xsl:for-each>
        </xsl:if>
		

		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="'}'"></xsl:value-of>

	</xsl:template>

	<xsl:template name="import-packages-interface">
		<xsl:value-of select="concat('package ',rows/plsql/package_db,'.pagedelegate',';')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$import_exception"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$import_response"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($package_import_name,'.pages.', $page ,'.', $class_name,';')"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($package_import_name,'.pages.', $page ,'.', $class_name,'View;')"></xsl:value-of>
	</xsl:template>


</xsl:stylesheet>
