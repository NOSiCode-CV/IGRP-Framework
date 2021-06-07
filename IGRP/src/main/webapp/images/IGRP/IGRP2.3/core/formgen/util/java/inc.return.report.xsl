<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.custombutReport" >		
		<xsl:variable name="mutation" select="mutation/@count"/>
		<xsl:variable name="codeReport" select="field[@name='codeReport']"/>
		<xsl:variable name="Params">	
			<xsl:call-template name="listar.ParamsReport">
				<xsl:with-param name="total" select="$mutation"/>
			</xsl:call-template>
		</xsl:variable>				
		<xsl:text>return Core.getLinkReport("</xsl:text><xsl:value-of select="$codeReport"/><xsl:text>", new Report()</xsl:text>
		<xsl:value-of select="$Params"/><xsl:text>);</xsl:text>			
	</xsl:template>
	
	<xsl:template name="listar.ParamsReport">
		<xsl:param name="total"/>
		<xsl:param name="index" select="1"/>		
		<xsl:if test="$index &lt;= $total">
			<xsl:variable name="valueName" select="field[@name=concat('paramy',$index)]"/>
			<xsl:variable name="valueValue">		
				<xsl:call-template name="blockly.getValue">			
					<xsl:with-param name="value" select="value[@name=concat('PARAM',$index)]"/>				
				</xsl:call-template>			
			</xsl:variable>	
			<xsl:text>.addParam("</xsl:text><xsl:value-of select="$valueName"/><xsl:text>", </xsl:text>
			<xsl:value-of select="$valueValue"/><xsl:text>)</xsl:text>	
			<xsl:call-template name="listar.ParamsReport">
				<xsl:with-param name="total" select="$total"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>		
		</xsl:if>		
	</xsl:template>
	
	<xsl:template name="blockly.element.concaty" >		
		<xsl:variable name="mutation" select="mutation/@count"/>
		<xsl:variable name="concatValue">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='concat_value']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="concats">	
			<xsl:call-template name="listar.paramsConcat">
				<xsl:with-param name="total" select="$mutation"/>
			</xsl:call-template>
		</xsl:variable>				
		<xsl:value-of select="$concatValue"/><xsl:value-of select="$concats"/>		
	</xsl:template>
	
	<xsl:template name="listar.paramsConcat">
		<xsl:param name="total"/>
		<xsl:param name="index" select="1"/>		
		<xsl:if test="$index &lt;= $total">
			<xsl:variable name="valueValue">		
				<xsl:call-template name="blockly.getValue">			
					<xsl:with-param name="value" select="value[@name=concat('CONCAT',$index)]"/>				
				</xsl:call-template>			
			</xsl:variable>	
			<xsl:text>.concat(</xsl:text><xsl:value-of select="$valueValue"/><xsl:text>)</xsl:text>		
			<xsl:call-template name="listar.paramsConcat">
				<xsl:with-param name="total" select="$total"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>		
		</xsl:if>		
	</xsl:template>
	
</xsl:stylesheet>