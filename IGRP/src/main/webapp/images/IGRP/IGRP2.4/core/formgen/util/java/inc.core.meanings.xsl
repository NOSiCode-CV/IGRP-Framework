<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="utils.core.meaning" >		
		<xsl:param name="key"/>		
		<xsl:choose>		
		    <xsl:when test="$key = 'LocalDate::data_atual'">				
				<xsl:text>LocalDate.now()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'LocalDateTime::data_atual_hora'">				
				<xsl:text>LocalDateTime.now()</xsl:text>					
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
			<xsl:when test="$key = 'String::get_username_by_id'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>
				<xsl:variable name="valortype">		
					<xsl:choose>
						<xsl:when test="value/block/value/block/value/block/value/block/field != ''">				
							<xsl:value-of select="substring-before(value/block/value/value/block/block/value/block/field,'::')"/>				
						</xsl:when>	
						<xsl:when test="value/block/value/block/value/block/field != ''">				
							<xsl:value-of select="substring-before(value/block/value/block/value/block/field,'::')"/>				
						</xsl:when>				
						<xsl:when test="value/block/value/block/field != ''">				
							<xsl:value-of select="substring-before(value/block/value/block/field,'::')"/>				
						</xsl:when>					
						<xsl:otherwise>				
							<xsl:value-of select="substring-before(value/block/field,'::')"/>				
						</xsl:otherwise>				
					</xsl:choose>		
				</xsl:variable>	
				<xsl:variable name="valor_convert">		
					<xsl:call-template name="convert_blocks">									
						<xsl:with-param name="value" select="$valor1"></xsl:with-param>						
						<xsl:with-param name="from" select="$valortype"></xsl:with-param>				
						<xsl:with-param name="to" select="'Integer'"></xsl:with-param>															
					</xsl:call-template>					
				</xsl:variable>				
				<xsl:text>Core.getUsernameById(</xsl:text><xsl:value-of select="$valor_convert"/><xsl:text>)</xsl:text>					
			</xsl:when>			
			 <xsl:when test="$key = 'verify_is_null'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.isNull(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>	
			 <xsl:when test="$key = 'verify_is_null_or_zero'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.isNullOrZero(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>
			 <xsl:when test="$key = 'verify_is_not_null'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.isNotNull(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>
			 <xsl:when test="$key = 'verify_is_not_null_or_zero'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
			</xsl:when>
			 <xsl:when test="$key = 'messageInfo'">	
			 	<xsl:variable name="valor1">		
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='value_default']"/>						
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.setMessageInfo(</xsl:text><xsl:value-of select="$valor1"/><xsl:text>)</xsl:text>					
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
			 	<xsl:variable name="valor" select="field[@name='value1']"/>					
				<xsl:text>Core.getParamInt("</xsl:text><xsl:value-of select="$valor"/><xsl:text>")</xsl:text>					
			</xsl:when>	
			 <xsl:when test="$key = 'String::apanhar_parametro_texto'">	
			 	<xsl:variable name="valor" select="field[@name='value1']"/>	
				<xsl:text>Core.getParam("</xsl:text><xsl:value-of select="$valor"/><xsl:text>")</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'String::apanhar_parametro_report'">	
			 	<xsl:variable name="valor" select="field[@name='value1']"/>
				<xsl:text>Core.getReportParam("</xsl:text><xsl:value-of select="$valor"/><xsl:text>")</xsl:text>					
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
			<xsl:when test="$key = 'Integer::id_perfil_atual'">				
				<xsl:text>Core.getCurrentProfile()</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'String::code_perfil_atual'">				
				<xsl:text>Core.getCurrentProfileCode()</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'Integer::id_organi_atual'">				
				<xsl:text>Core.getCurrentOrganization()</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'String::code_organi_atual'">				
				<xsl:text>Core.getCurrentOrganizationCode()</xsl:text>					
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
				<xsl:variable name="valortype">		
					<xsl:choose>
						<xsl:when test="value/block/value/block/value/block/value/block/field != ''">				
							<xsl:value-of select="substring-before(value/block/value/block/value/block/value/block/field,'::')"/>				
						</xsl:when>		
						<xsl:when test="value/block/value/block/value/block/field != ''">				
							<xsl:value-of select="substring-before(value/block/value/block/value/block/field,'::')"/>				
						</xsl:when>				
						<xsl:when test="value/block/value/block/field != ''">				
							<xsl:value-of select="substring-before(value/block/value/block/field,'::')"/>				
						</xsl:when>					
						<xsl:otherwise>				
							<xsl:value-of select="substring-before(value/block/field,'::')"/>				
						</xsl:otherwise>				
					</xsl:choose>		
				</xsl:variable>	
				<xsl:variable name="valor_convert">		
					<xsl:call-template name="convert_blocks">									
						<xsl:with-param name="value" select="$valor2"></xsl:with-param>						
						<xsl:with-param name="from" select="$valortype"></xsl:with-param>				
						<xsl:with-param name="to" select="'String'"></xsl:with-param>															
					</xsl:call-template>					
				</xsl:variable>		
				<xsl:text>Core.findDomainDescByKey("</xsl:text><xsl:value-of select="$valor1"/><xsl:text>", </xsl:text><xsl:value-of select="$valor_convert"/><xsl:text>)</xsl:text>					
			</xsl:when>		
		</xsl:choose>		
	</xsl:template>	
</xsl:stylesheet>