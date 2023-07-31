<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- <xsl:output method="text" encoding="UTF-8" indent="no"/>
	
	<xsl:template match="/">
	
		<xsl:call-template name="blockly.imports"/>
	
		<xsl:call-template name="blockly.elements">
			<xsl:with-param name="elements" select="main/xml/block"/>
		</xsl:call-template> 
		 
	</xsl:template>
	
	 -->
	 
	
	<xsl:include href="inc.vars.xsl"/>
	
	<xsl:include href="inc.values.xsl"/>
	
	<xsl:include href="inc.utils.xsl"/>
	
    <xsl:include href="inc.elements.xsl"/>
    
    <xsl:include href="inc.imports.xsl"/>
	
</xsl:stylesheet>