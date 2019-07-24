<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:key name="index1" match="block" use="@type" />
	
	
	<xsl:template name="blockly.imports">
		
		<xsl:variable name="dao-imports" select="$all-blocks[contains(@type,'et-dao-')]"></xsl:variable>
		
		<xsl:text>/* Start-Code-Block (import) */</xsl:text>
		
		<xsl:value-of select="$newline"></xsl:value-of>
		
		<xsl:for-each select="$all-blocks[generate-id() = generate-id( key('index1', @type )[1] )]">
			
			<xsl:choose>
			
				<xsl:when test="contains(@type,'et-dao-')">
					
					<xsl:variable name="className" select="substring-after(@type, 'et-dao-')"></xsl:variable>
					
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"></xsl:value-of>
					<xsl:text>.</xsl:text><xsl:value-of select="$className"></xsl:value-of>
					<xsl:text>;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
				</xsl:when>

			</xsl:choose>
			
		</xsl:for-each> 
		
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>/* End-Code-Block */</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>
		
	</xsl:template>

</xsl:stylesheet>