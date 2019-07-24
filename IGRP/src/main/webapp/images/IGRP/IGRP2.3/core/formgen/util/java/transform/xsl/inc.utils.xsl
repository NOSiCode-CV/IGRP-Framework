<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:include href="inc.meanings.xsl"/>
	
	<xsl:include href="inc.core.meanings.xsl"/>

	<xsl:template name="utils.try">
		
		<xsl:param name="code"/>
		<xsl:param name="exceptionCode"/>
		
		<xsl:text>try{</xsl:text>
		
		<xsl:value-of select="$newlineTab1"/>
		
		<xsl:if test="$code">
			
			<xsl:call-template name="utils.try.catch">
				<xsl:with-param name="code" select="$code"/>
			</xsl:call-template>
			
			<xsl:call-template name="utils.try.end">
				<xsl:with-param name="exceptionCode" select="$exceptionCode"/>
			</xsl:call-template>
			
		</xsl:if>
	
	</xsl:template>
	
	<xsl:template name="utils.try.catch">
		
		<xsl:param name="code"/>
		
		<xsl:value-of select="$code"/>
		
		<xsl:value-of select="$newline"></xsl:value-of>
		
		<xsl:text>}catch(Exception e){</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="utils.try.end">
	
		<xsl:param name="exceptionCode"/>
		
		<xsl:if test="$exceptionCode">
			
			<xsl:value-of select="$newlineTab1"/>
			
			<xsl:value-of select="$exceptionCode"/>
			
			<xsl:value-of select="$newline"/>
			
		</xsl:if>
	
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
	</xsl:template>
	
	<xsl:template name="utils.arguments">
	
		<xsl:param name="args"/>
		
		<xsl:text>(</xsl:text>
		<xsl:value-of select="$args"/>
		<xsl:text>)</xsl:text>
	
	</xsl:template>

</xsl:stylesheet>