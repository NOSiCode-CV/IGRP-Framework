<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="blockly.element.set_visible">		
		<xsl:variable name="field" select="field[@name='set_visible']"/>		
		<xsl:variable name="value"  select="field[@name='tru_fal']"/>			
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.setVisible(</xsl:text><xsl:value-of select="$value"/><xsl:text>);</xsl:text>				
	</xsl:template>	
	<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 	
	<xsl:template name="blockly.element.set_visible_row">		
		<xsl:variable name="field" select="field[@name='set_visible_row']"/>					
		<xsl:text>row.hiddenButton(view.</xsl:text><xsl:value-of select="$field"/><xsl:text>);</xsl:text>				
	</xsl:template>
	<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="blockly.element.set_readonly">		
		<xsl:variable name="field" select="field[@name='set_readonly']"/>		
		<xsl:variable name="value"  select="field[@name='tru_fal']"/>			
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.propertie().add("readonly", "</xsl:text><xsl:value-of select="$value"/><xsl:text>");</xsl:text>				
	</xsl:template>	
	<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 	
	<xsl:template name="blockly.element.set_disabled">		
		<xsl:variable name="field" select="field[@name='set_disabled']"/>
		<xsl:variable name="value"  select="field[@name='tru_fal']"/>					
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.propertie().add("disabled", "</xsl:text><xsl:value-of select="$value"/><xsl:text>");</xsl:text>								
	</xsl:template> 	
</xsl:stylesheet>
		