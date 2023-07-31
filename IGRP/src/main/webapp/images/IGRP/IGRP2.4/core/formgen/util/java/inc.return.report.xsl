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
	
	<xsl:template name="blockly.element.set_app_params" >		
		<xsl:variable name="mutation" select="mutation/@count"/>
		<xsl:variable name="codeReport" select="field[@name='codeReport']"/>
		<xsl:variable name="Params">	
			<xsl:call-template name="listar.ParamsReport">
				<xsl:with-param name="total" select="$mutation"/>
			</xsl:call-template>
		</xsl:variable>				
		<xsl:value-of select="$Params"/>			
	</xsl:template>
	
	<xsl:template name="listar.ParamsReport">
		<xsl:param name="total"/>
		<xsl:param name="index" select="1"/>
		
		<xsl:variable name="tipoBloco" select="@type"></xsl:variable>
				
		<xsl:if test="$index &lt;= $total">
			<xsl:variable name="valueName" select="field[@name=concat('paramy',$index)]"/>
			<xsl:variable name="valueValue">		
				<xsl:call-template name="blockly.getValue">			
					<xsl:with-param name="value" select="value[@name=concat('PARAM',$index)]"/>				
				</xsl:call-template>			
			</xsl:variable>	
			
			<xsl:variable name="code">
				<xsl:choose>
					<xsl:when test="$tipoBloco = 'set_app_params' or $tipoBloco = 'core_fn_link'">
						<xsl:text>+"&amp;</xsl:text><xsl:value-of select="$valueName"/><xsl:text>=" +</xsl:text><xsl:value-of select="$valueValue"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>.addParam("</xsl:text><xsl:value-of select="$valueName"/><xsl:text>", </xsl:text>
						<xsl:value-of select="$valueValue"/><xsl:text>)</xsl:text>
					</xsl:otherwise>	
				</xsl:choose>
			</xsl:variable>
			<xsl:value-of select="$code"/>
			
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
			<xsl:variable name="concatType">		
				<xsl:choose>
					<xsl:when test="value[@name=concat('CONCAT',$index)]/block/value/block/value/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/value/block/value/block/field,'::')"/>				
					</xsl:when>
					<xsl:when test="value[@name=concat('CONCAT',$index)]/block/value/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/value/block/field,'::')"/>				
					</xsl:when>				
					<xsl:when test="value[@name=concat('CONCAT',$index)]/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/field,'::')"/>				
					</xsl:when>					
					<xsl:otherwise>				
						<xsl:value-of select="substring-before(value[@name=concat('CONCAT',$index)]/block/field,'::')"/>				
					</xsl:otherwise>				
				</xsl:choose>		
			</xsl:variable>	
			<xsl:variable name="concatValue_convert">		
				<xsl:call-template name="convert_blocks">									
					<xsl:with-param name="value" select="$valueValue"></xsl:with-param>						
					<xsl:with-param name="from" select="$concatType"></xsl:with-param>				
					<xsl:with-param name="to" select="'String'"></xsl:with-param>															
				</xsl:call-template>					
			</xsl:variable>		
			<xsl:text>.concat(</xsl:text><xsl:value-of select="$concatValue_convert"/><xsl:text>)</xsl:text>		
			<xsl:call-template name="listar.paramsConcat">
				<xsl:with-param name="total" select="$total"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>		
		</xsl:if>		
	</xsl:template>
	
</xsl:stylesheet>