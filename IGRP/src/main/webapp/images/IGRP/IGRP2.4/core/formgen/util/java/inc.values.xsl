<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.getValue">
	
		<xsl:param name="value"/>
		
		<xsl:param name="parent"/>
		
		<xsl:param name="startEndCode" select="false()"/>
		
		<xsl:variable name="valueElements" select="$value/block|$value/shadow"/>
			
		<xsl:choose>
		
			<xsl:when test="$valueElements">
				
				<xsl:call-template name="blockly.elements">
				
					<xsl:with-param name="elements" select="$valueElements"></xsl:with-param>
					
					<xsl:with-param name="startEndCode" select="$startEndCode"></xsl:with-param>
					
					<xsl:with-param name="parent" select="$parent"/>
					
				</xsl:call-template>
				
			</xsl:when>
			
			<xsl:otherwise>
			
				<xsl:value-of select="$value"/>
				
			</xsl:otherwise>
			
		</xsl:choose>

	</xsl:template>
	
</xsl:stylesheet>