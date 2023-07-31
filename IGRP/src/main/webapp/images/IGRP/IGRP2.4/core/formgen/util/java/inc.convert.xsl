<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="convert_blocks">
		<xsl:param name="daolow"/>
		<xsl:param name="value"/>
		<xsl:param name="valueblock"/>
		<xsl:param name="from"/>		
		<xsl:param name="to" />				
		<xsl:param name="block_namechild" />		
		<xsl:param name="block_name" />				
		<xsl:variable name="result">
			<xsl:choose>
				<xsl:when test="$from = 'String' and $to = 'LocalTime'">
					<xsl:text>Core.convertStringToLocalTime(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'LocalTime' and $to = 'String'">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'LocalDate'">
					<xsl:text>Core.convertStringToLocalDate(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, Core.DD_MM_YYYY)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'LocalDate' and $to = 'String'">
					<xsl:text>Core.convertLocalDateToString(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, Core.DD_MM_YYYY)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'LocalDateTime'">
					<xsl:text>Core.convertStringToLocalDateTime(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, Core.DD_MM_YYYY)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'LocalDateTime' and $to = 'String'">
					<xsl:text>Core.convertLocalDateTimeToString(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>, "dd-MM-yyyy - HH:mm")</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'int'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'int'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'Integer'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'Integer_PK#'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'BigInteger'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'String[]'">	
					<xsl:text></xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>.split(";")</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String[]' and $to = 'String'">	
					<xsl:text>String.join(";",</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'Integer' and $to = 'String[]'">	
					<xsl:text>This field in DAO must be a String field!!</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String[]' and $to = 'Integer'">	
					<xsl:text>This field in DAO must be a String field!!</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'checkboxlist'">	
					<xsl:text></xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>.split(";")</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'double'">
					<xsl:text>Core.toDouble(</xsl:text><xsl:value-of select="$value"/><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'double' and $to = 'String'">		
					<xsl:text>String.valueOf(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test=" $from = 'String' and $to = 'Date' ">
					<xsl:text>Core.formatDate(</xsl:text><xsl:value-of select="$value"/><xsl:text>, Core.DD_MM_YYYY, Core.YYYY_MM_DD)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'Link'">	
					<xsl:text>Core.getLinkFileByUuid(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'Image'">	
					<xsl:text>Core.getLinkFileByUuid(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'String' and $to = 'Image_View'">	
					<xsl:text>Core.getLinkFileByUuid(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test=" $from = 'String' and $to = 'File' ">
					<xsl:text>"Can not fill the upload field form!"</xsl:text>
				</xsl:when>  
				<xsl:when test="$from = 'Integer' and $to = 'hidden'">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'Integer' and $to = 'String'">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'Integer_PK#' and $to = 'hidden'">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'Integer_PK#' and $to = 'String'">
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>
				<xsl:when test=" $from = 'Integer' and $to = 'Date' ">
					<xsl:text>Core.formatDate(</xsl:text><xsl:value-of select="$value"/><xsl:text>, Core.DD_MM_YYYY, Core.YYYY_MM_DD)</xsl:text>
				</xsl:when> 
				<xsl:when test="$from = 'Date' and $to = 'Integer'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>				
				</xsl:when>
				<xsl:when test=" $from = 'Date' and $to = 'hidden' ">			
					<xsl:text>Core.dateToString(</xsl:text><xsl:value-of select="$value"/><xsl:text>,Core.DD_MM_YYYY)</xsl:text>			
				</xsl:when>				
				<xsl:when test=" $from = 'Date' and $to = 'String' ">				
					<xsl:text>Core.dateToString(</xsl:text><xsl:value-of select="$value"/><xsl:text>,Core.DD_MM_YYYY)</xsl:text>			
				</xsl:when>   		
				<xsl:when test="$from = 'hidden' and $to = 'Integer'">		
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>	
				</xsl:when>
				<xsl:when test="$from = 'hidden' and $to = 'Integer_PK#'">		
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>	
				</xsl:when>
				<xsl:when test="$from = 'hidden' and $to = 'BigInteger'">
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>	
				</xsl:when>
				<xsl:when test=" $from = 'hidden' and $to = 'Date' ">
					<xsl:text>Core.formatDate(</xsl:text><xsl:value-of select="$value"/><xsl:text>, Core.DD_MM_YYYY, Core.YYYY_MM_DD)</xsl:text>
				</xsl:when>
				<xsl:when test=" $from = 'File' and $to = 'String' ">
					<xsl:variable name="upvalueblock">		
						<xsl:call-template name="InitCap">					
							<xsl:with-param name="text" select="$valueblock"/>						
						</xsl:call-template>					
					</xsl:variable>
					<xsl:value-of select="$value"/><xsl:text>!= null &amp;&amp; </xsl:text><xsl:value-of select="$value"/><xsl:text>.isUploaded() ? </xsl:text>					
					<xsl:value-of select="$daolow"/><xsl:text>.get</xsl:text><xsl:value-of select="$upvalueblock"/><xsl:text>() == null ? </xsl:text>					
					<xsl:text>Core.saveFileNGetUuid(</xsl:text><xsl:value-of select="$value"/><xsl:text>) : </xsl:text>					
					<xsl:text>Core.updateFile(</xsl:text><xsl:value-of select="$value"/><xsl:text>,</xsl:text><xsl:value-of select="$daolow"/><xsl:text>.get</xsl:text><xsl:value-of select="$upvalueblock"/>				
					<xsl:text>()) ? </xsl:text><xsl:value-of select="$daolow"/><xsl:text>.get</xsl:text><xsl:value-of select="$upvalueblock"/><xsl:text>() : </xsl:text><xsl:value-of select="$daolow"/><xsl:text>.get</xsl:text><xsl:value-of select="$upvalueblock"/><xsl:text>() : null</xsl:text>									
				</xsl:when>  			
				<xsl:when test=" $from = 'File' and $to = 'Integer' ">	
					<xsl:text>"The type in the DAO Class to save File must be a String"</xsl:text>					
				</xsl:when> 			
				<xsl:when test=" $from = 'File' and $to = 'Date' ">				
					<xsl:text>"The type in the DAO Class to save File must be a String"</xsl:text>					
				</xsl:when>				
				<xsl:when test="$from = 'BigInteger' and $to = 'String'">				
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>				
				<xsl:when test="$from = 'BigInteger' and $to = 'hidden'">					
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>						
				<xsl:when test="$from = 'int' and $to = 'String'">		
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>				
				<xsl:when test=" $from = 'Image' and $to = 'String' ">				
					<xsl:variable name="valuuid">			
						<xsl:call-template name="replace-all">						
							<xsl:with-param name="text" select="$value"/>						
							<xsl:with-param name="replace" select="'()'"/>							
							<xsl:with-param name="by" select="'_uuid()'"/>						
						</xsl:call-template>						
					</xsl:variable>					
					<xsl:value-of select="$valuuid"/>
				</xsl:when>  			
				<xsl:when test="$from = 'checkboxlist' and $to = 'String'">					
					<xsl:text>String.join(";",</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>				
				</xsl:when>																						
				<xsl:when test="contains( $to ,'SelectDomSep*') ">				
					<xsl:choose>					
						<xsl:when test="contains( $to ,' « ') ">						
							<xsl:variable name="domainvalue" select="substring-before(substring-after($to,'SelectDomSep*'),' « ') "/>							
							<xsl:text>Core.findDomainDescByKey("</xsl:text><xsl:value-of select="$domainvalue"/><xsl:text>",</xsl:text><xsl:value-of select="$value"/><xsl:text>)</xsl:text>						
						</xsl:when>	
						<xsl:otherwise>						
							<xsl:variable name="domainvalue2" select="substring-after($to,'SelectDomSep*') "/>							
							<xsl:text>Core.findDomainDescByKey("</xsl:text><xsl:value-of select="$domainvalue2"/><xsl:text>",</xsl:text><xsl:value-of select="$value"/><xsl:text>)</xsl:text>					
						</xsl:otherwise>					
					</xsl:choose> 		
				</xsl:when> 				
				<xsl:when test="$from = 'Integer' and $to = 'Integer' and contains($block_name,'sep_row')">					
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>	
				<xsl:when test="$from = 'Integer_PK#' and $to = 'Integer' and contains($block_name,'sep_row')">					
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>	
				<xsl:when test="$from = 'String' and $to = 'Long'">
					<xsl:text>Core.toLong(</xsl:text><xsl:value-of select="$value"/><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'Long' and $to = 'String'">		
					<xsl:text>String.valueOf(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>		
				<xsl:when test="$from = 'Integer' and $to = 'Integer' and contains($block_name,'sep_form')">				
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>
				<xsl:when test="$from = 'Integer_PK#' and $to = 'Integer' and contains($block_name,'sep_form')">				
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>		
				<xsl:when test="$from = 'String' and contains($to,'_FK#')">					
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>				
				</xsl:when>				
				<xsl:when test="$to = 'String' and contains($from,'_FK#')">					
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>				
				<xsl:when test="$from = 'Integer' and $to = 'Integer' and contains($block_namechild,'get_row_sep')">					
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>				
				</xsl:when>			
				<xsl:when test="$from = 'Integer' and $to = 'Integer' and contains($block_namechild,'get_row_form')">					
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>					
				</xsl:when>	
				<xsl:when test="$from = 'Integer_PK#' and $to = 'Integer' and contains($block_namechild,'get_row_sep')">					
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>				
				</xsl:when>			
				<xsl:when test="$from = 'Integer_PK#' and $to = 'Integer' and contains($block_namechild,'get_row_form')">					
					<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$value"></xsl:value-of><xsl:text>)</xsl:text>					
				</xsl:when>			
				<xsl:when test="$to = 'String' and $block_namechild = 'core_get_param'">			
					<xsl:value-of select="$value"></xsl:value-of><xsl:text>.toString()</xsl:text>
				</xsl:when>				
				<xsl:otherwise>		
					<xsl:value-of select="$value"></xsl:value-of>		
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>
		<xsl:value-of select="$result"></xsl:value-of>
	</xsl:template>
</xsl:stylesheet>