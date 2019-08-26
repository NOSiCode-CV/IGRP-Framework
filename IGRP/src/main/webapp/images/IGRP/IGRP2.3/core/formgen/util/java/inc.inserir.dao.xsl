<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.inserir_dao" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
	   	
	   	<xsl:variable name="insercao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="param" select="field[@name='param_id']"/>
		
		<xsl:variable name="hasMutation" select="mutation"></xsl:variable>
		
		<xsl:variable name="code">
		
			<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text> obj  = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>if (Core.isNotNull(isEdit)) {</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			 <xsl:text> obj = obj.findOne(Core.getParamInt("</xsl:text><xsl:value-of select="$param"></xsl:value-of><xsl:text>"));</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$insercao"></xsl:value-of>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>if (obj != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>if (Core.isNull(isEdit)) {</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>obj.insert();</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}else{</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>obj.update();</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text> }else{</xsl:text> 
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageError();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:if test="$hasMutation">
			
				<xsl:variable name="separatorix">
					
					<xsl:call-template name="separadorplate">
					
						<xsl:with-param name="total" select="mutation/@count"/>
						
						<xsl:with-param name="valueseparator" select="'SEPARATOR'"/>
					
					</xsl:call-template>
					
				</xsl:variable>
				
				<xsl:value-of select="$separatorix"></xsl:value-of>
				
			</xsl:if>
		</xsl:variable>
		
		<xsl:call-template name="utils.try">
			
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			
			<xsl:with-param name="exceptionCode">
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				<xsl:text>e.printStackTrace();</xsl:text>
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				<xsl:text>Core.setMessageError();</xsl:text>
			</xsl:with-param>
			
		</xsl:call-template>
		
	</xsl:template>
	
	<xsl:template name="separadorplate" >
	
		<xsl:param name="total"/>
		
		<xsl:param name="valueseparator" />
		
		<xsl:param name="index" select="1"/>
		
		<xsl:if test="$index &lt;= $total">
		
			<xsl:variable name="separadora" select="concat($valueseparator,$index)"/>
			
			<xsl:variable name="separadorixa">
				<xsl:call-template name="blockly.getValue">
					<xsl:with-param name="value" select="*[@name=$separadora]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:if test="$separadorixa">
				<xsl:value-of select="$separadorixa"/>
			</xsl:if>
					
			<xsl:call-template name="separadorplate">
			
				<xsl:with-param name="total" select="$total"/>
					
				<xsl:with-param name="valueseparator" select="$valueseparator"/>
				
				<xsl:with-param name="index" select="$index + 1"/>
				
			</xsl:call-template>
		
		</xsl:if>
		
	</xsl:template>
	
</xsl:stylesheet>