<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="convert_blocks">
		
		<xsl:param name="value"/>
		
		<xsl:param name="from"/>
		
		<xsl:param name="to" />
		
		<xsl:param name="neto" />
		
		<xsl:param name="valuechild" />
		
		<xsl:variable name="upvaluechild">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$valuechild"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="result">
		
			<xsl:choose>
		
				<xsl:when test="$from = 'String' and $to = 'Integer'">	
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				
				<xsl:when test="$from = 'Integer' and $to = 'String'">	
					<xsl:text>""+</xsl:text><xsl:value-of select="$value"></xsl:value-of>
				</xsl:when>
		
				<xsl:when test="$from = 'String' and $to = 'Link'">	
					<xsl:text>Core.getLinkFileByUuid(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				
				<xsl:when test="$neto != '' ">
					<xsl:text>obj.get</xsl:text><xsl:value-of select="$upvaluechild"></xsl:value-of>
					<xsl:text>()!=null?</xsl:text><xsl:value-of select="$value"></xsl:value-of>
					<xsl:text>:null</xsl:text>
				</xsl:when>
				
				<xsl:when test="$from = 'Integer' and $to = 'hidden'">
					<xsl:text>""+</xsl:text><xsl:value-of select="$value"></xsl:value-of>
				</xsl:when>
				
				<xsl:when test="$from = 'hidden' and $to = 'Integer'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				
				<xsl:when test="$from = 'double' and $to = 'String'">
					<xsl:text>""+</xsl:text><xsl:value-of select="$value"></xsl:value-of>
				</xsl:when>
				
				<xsl:when test="$from = 'String' and $to = 'double'">
					<xsl:text>Core.toDouble(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				
				<xsl:when test="$from = 'Date' and $to = 'Integer'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				
				<xsl:when test=" $from = 'Integer' and $to = 'Date' ">
					<xsl:text>Core.formatDate(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, "dd-mm-yyyy", "yyyy-mm-dd")</xsl:text>
				</xsl:when> 
				
				<xsl:when test=" $from =   'Date' and $to = 'hidden' ">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>!=null?</xsl:text>
					<xsl:text>Core.dateToString(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>,"dd-MM-yyyy"):null</xsl:text>
				</xsl:when> 
				
				<xsl:when test=" $from = 'hidden' and $to = 'Date' ">
					<xsl:text>Core.formatDate(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, "dd-mm-yyyy", "yyyy-mm-dd")</xsl:text>
				</xsl:when> 
					
				<xsl:when test=" $from = 'Date' and $to = 'String' ">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>!=null?</xsl:text>
					<xsl:text>Core.dateToString(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>,"dd-MM-yyyy"):null</xsl:text>
				</xsl:when>
				
				<xsl:when test=" $from = 'String' and $to = 'Date' ">
					<xsl:text>Core.formatDate(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, "dd-mm-yyyy", "yyyy-mm-dd")</xsl:text>
				</xsl:when>  
				
				<xsl:when test=" $from = 'File' and $to = 'String' ">
					<xsl:text>Core.saveFileNGetUuid(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when> 
				
				<xsl:when test=" $from = 'File' and $to = 'Integer' ">
					<xsl:text>"The type in the DAO Class to save File must be a String"</xsl:text>
				</xsl:when> 
				
				<xsl:when test=" $from = 'File' and $to = 'Date' ">
					<xsl:text>"The type in the DAO Class to save File must be a String"</xsl:text>
				</xsl:when> 
				
				<xsl:when test="contains( $to ,'SelectDom*') ">
				
				<xsl:choose>
				
					<xsl:when test="contains( $to ,' « ') ">
						<xsl:variable name="domainvalue" select="substring-before(substring-after($to,'SelectDom*'),' « ') "/>
						<xsl:text>Core.findDomainDescByKey("</xsl:text><xsl:value-of select="$domainvalue"></xsl:value-of><xsl:text>",</xsl:text>
						<xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
					</xsl:when>

					<xsl:otherwise>
						<xsl:variable name="domainvalue2" select="substring-after($to,'SelectDom*') "/>
						<xsl:text>Core.findDomainDescByKey("</xsl:text><xsl:value-of select="$domainvalue2"></xsl:value-of><xsl:text>",</xsl:text>
						<xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
					</xsl:otherwise>
				
				</xsl:choose> 
				
				</xsl:when> 
				
				<xsl:otherwise>
					<xsl:value-of select="$value"></xsl:value-of>
				</xsl:otherwise>
			
			</xsl:choose>
			
		</xsl:variable>
		
		<xsl:value-of select="$result"></xsl:value-of>
	
	</xsl:template>
	
</xsl:stylesheet>