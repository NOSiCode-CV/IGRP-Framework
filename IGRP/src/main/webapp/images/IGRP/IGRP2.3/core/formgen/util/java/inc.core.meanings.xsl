<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="utils.core.meaning" >		
		<xsl:param name="key"/>		
		<xsl:choose>		
		    <xsl:when test="$key = 'LocalDate::data_atual'">				
				<xsl:text>LocalDate.now()</xsl:text>					
			</xsl:when>	
			 <xsl:when test="$key = 'messageSucess'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.setMessageSuccess(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>);</xsl:text>					
			</xsl:when>
			 <xsl:when test="$key = 'messageError'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.setMessageError(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>);</xsl:text>					
			</xsl:when>	
			 <xsl:when test="$key = 'messageWarning'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.setMessageWarning(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>);</xsl:text>					
			</xsl:when>		
			 <xsl:when test="$key = 'messageInfo'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.setMessageInfo(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>);</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'messageInfoLink'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>	
				<xsl:variable name="valor2">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value1']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.setMessageInfoLink(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>, </xsl:text><xsl:value-of select="$valor2"/><xsl:text>);</xsl:text>					
			</xsl:when>	
			 <xsl:when test="$key = 'Integer::apanhar_parametro_inteiro'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.getParamInt(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>	
			 <xsl:when test="$key = 'String::apanhar_parametro_texto'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.getParam(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'String::apanhar_parametro_report'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.getReportParam(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>												
			<xsl:when test="$key = 'String::nome_utilizador_atual'">				
				<xsl:text>Core.getCurrentUser().getName()</xsl:text>					
			</xsl:when>					
			<xsl:when test="$key = 'String::email_utilizador_atual'">				
				<xsl:text>Core.getCurrentUser().getEmail()</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'Integer::id_utilizador_atual'">				
				<xsl:text>Core.getCurrentUser().getId()</xsl:text>					
			</xsl:when>				
			<xsl:when test="$key = 'Integer::toInt'">
				<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:text>Core.toInt(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'double::toDouble'">
				<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:text>Core.toDouble(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'Long::toLong'">
				<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:text>Core.toLong(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>				
			<xsl:when test="$key = 'String::toString'">	
				<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:value-of select="$valor1"></xsl:value-of><xsl:text>.toString()</xsl:text>					
			</xsl:when>						
			<xsl:when test="$key = 'verificar se está nulo'">				
				<xsl:text>Core.isNull()</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'verificar se não está nulo'">				
				<xsl:text>Core.isNotNull()</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'enviar_email'">			
				<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:variable name="valor2">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value1']"/>						
					</xsl:call-template>					
				</xsl:variable>			
				<xsl:variable name="valor3">	
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value2']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:variable name="valor4">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value3']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:variable name="valor5">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value4']"/>						
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:text>boolean email= Core.mail(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>, </xsl:text><xsl:value-of select="$valor2"/><xsl:text>, </xsl:text><xsl:value-of select="$valor3"/><xsl:text>, </xsl:text><xsl:value-of select="$valor4"/><xsl:text>, </xsl:text><xsl:value-of select="$valor5"/><xsl:text>); </xsl:text>				
				<xsl:value-of select="$newlineTab3"/>				
				<xsl:text>if(email == true)</xsl:text>				
				<xsl:value-of select="$newlineTab4"/>			
				<xsl:text>Core.setMessageSuccess("Email enviado com sucesso!");</xsl:text>					
			</xsl:when>				
			<xsl:when test="$key = 'String::get_domain'">			
				<xsl:variable name="valor1" select="field[@name='domaindrop']"/>									
				<xsl:variable name="valor2">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>			
				<xsl:text>Core.findDomainDescByKey("</xsl:text><xsl:value-of select="$valor1"/><xsl:text>", </xsl:text><xsl:value-of select="$valor2"/><xsl:text>)</xsl:text>					
			</xsl:when>		
		</xsl:choose>		
	</xsl:template>	
</xsl:stylesheet>