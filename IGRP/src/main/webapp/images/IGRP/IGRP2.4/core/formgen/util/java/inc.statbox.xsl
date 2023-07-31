<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">		
	<xsl:template name="blockly.element.statbox" >		
		<xsl:variable name="mutation" select="mutation/@count"/>	
		<xsl:variable name="dao" select="field[@name='dao']"/>
		<xsl:variable name="statistDrop" select="field[@name='statistDrop']"/>
		<xsl:variable name="valueDao" select = "substring-after(value[@name='statisValue']/block[contains(@type,'et-dao-')]/field,'::')"/>
		<xsl:variable name="value_otherDao" select = "substring-after(value[@name='statisValue']/block/value/block/field,'::')"/>			
		<xsl:variable name="daolow">
	       	<xsl:call-template name="LowerCase">       	
	       		<xsl:with-param name="text" select="$dao"/>     		
	       	</xsl:call-template>	       	
		</xsl:variable>	
		<xsl:variable name="statValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$statistDrop"/>
			</xsl:call-template>
		</xsl:variable>	
		<xsl:variable name="collecto">		
			<xsl:call-template name="blockly.getValue">				
				<xsl:with-param name="value" select="value[@name='statisValue']"/>				
			</xsl:call-template>			
		</xsl:variable>
		<xsl:variable name="value1">
			<xsl:choose>
				<xsl:when test="$valueDao != ''">
					<xsl:choose>
						<xsl:when test="$value_otherDao != ''">
							<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao"/><xsl:text>"</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"></xsl:value-of><xsl:text>"</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>This field must be a DAO Field!</xsl:text>
				</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>	
		<xsl:variable name="daofilter" select="concat($daolow,'filter')"/>		
		<xsl:variable name="andWheres">		
			<xsl:call-template name="listar.andWheres">			
				<xsl:with-param name="daofilter" select="$daofilter"/>			
				<xsl:with-param name="total" select="$mutation"/>				
				<xsl:with-param name="valueAttrName" select="'ADD'"/>				
				<xsl:with-param name="values" select="value"/>		
			</xsl:call-template>			
		</xsl:variable>					
		<xsl:variable name="options">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
			</xsl:call-template>			
		</xsl:variable>
		<xsl:value-of select="$newlineTab1"/>			 
		<xsl:text>try{</xsl:text>			
		<xsl:value-of select="$newlineTab1"/>	
		<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>			
		<xsl:value-of select="$andWheres"/>		
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>Object value  = </xsl:text><xsl:value-of select="$daofilter"/><xsl:value-of select="$statValue"/>
		<xsl:if test="$statistDrop != 'get_counting' ">
			<xsl:value-of select="$value1"/>
		</xsl:if>			
		<xsl:text>);</xsl:text>						
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>if(Core.isNotNull(value)){</xsl:text>		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$options"/>			
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>}</xsl:text>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>}catch ( Exception e ) {</xsl:text>		
		<xsl:value-of select="$newlineTab2"></xsl:value-of>		
		<xsl:text>e.printStackTrace();</xsl:text>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>}</xsl:text> 		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
	</xsl:template>	
	
	<xsl:template name="blockly.element.statfields" >	
		<xsl:variable name="typechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>		
		<xsl:variable name="valuechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>		
		<xsl:variable name="typeneto" select="substring-before(value[@name='fields_model']/block/value[@name='dao_rela']/block/field,'::')"/>		
		<xsl:variable name="statType" select="substring-before(substring-after(@type,'statfields_'),'::')"/>		
		<xsl:variable name="statValue" select="substring-after(@type,'::')"/>
		<xsl:variable name="collector" select="field[@name='collectors']"/>	
		<xsl:variable name="collectorValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$collector"/>
			</xsl:call-template>
		</xsl:variable>		
		<xsl:variable name="nameCap">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$statValue"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="valorA">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='fields_model']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="stat_set">		
			<xsl:value-of select="$tab2"></xsl:value-of>		
			<xsl:text>model.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text>
				<xsl:choose>
					<xsl:when test="$collector = 'percent' ">
						<xsl:text>String.valueOf(</xsl:text><xsl:value-of select="$collectorValue"/><xsl:text>)</xsl:text>
					</xsl:when>
					<xsl:when test="$collector = 'value' ">
						<xsl:text>String.valueOf(value)</xsl:text>
					</xsl:when>
					<xsl:when test="$collector != '' ">
						<xsl:text>String.valueOf(value</xsl:text><xsl:value-of select="$collectorValue"/><xsl:text>)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
					<xsl:call-template name="convert_blocks">				
						<xsl:with-param name="daolow" select="daolow"></xsl:with-param>					
						<xsl:with-param name="value" select="$valorA"></xsl:with-param>					
						<xsl:with-param name="valueblock" select="$statValue"></xsl:with-param>					
						<xsl:with-param name="from" select="$typechild"></xsl:with-param>					
						<xsl:with-param name="to" select="$statType"></xsl:with-param>													
					</xsl:call-template>						
					</xsl:otherwise>
				</xsl:choose>						
			<xsl:text>);</xsl:text>			
		</xsl:variable>		
		<xsl:value-of select="$stat_set"></xsl:value-of>		
	</xsl:template>	
		
</xsl:stylesheet>