<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="utils.core.meaning" >
		
		<xsl:param name="key"/>
		
		<xsl:choose>
			
			<xsl:when test="$key = 'mensagem sucesso'">
				
				<xsl:text>Core.setMessageSuccess</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'mensagem erro'">
				
				<xsl:text>Core.setMessageError</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'converter para inteiro'">
				
				<xsl:text>Core.toInt</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'converter para texto'">
				
				<xsl:text>""+</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'converter texto para Data'">
				
				<xsl:text>Core.toDate</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'verificar se está nulo'">
				
				<xsl:text>Core.isNull</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'verificar se não está nulo'">
				
				<xsl:text>Core.isNotNull</xsl:text>
					
			</xsl:when>
		
		</xsl:choose>
		
	</xsl:template>
	
</xsl:stylesheet>