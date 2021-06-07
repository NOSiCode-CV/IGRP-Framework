<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">		
	<xsl:template name="blockly.element.statbox" >		
		<xsl:variable name="mutation" select="mutation/@count"/>	
		<xsl:variable name="dao" select="field[@name='dao']"/>
		<xsl:variable name="collecto_type" select="substring-before(value[@name='statistics']/block/field,'::')"/>		
		<xsl:variable name="daolow">
	       	<xsl:call-template name="LowerCase">       	
	       		<xsl:with-param name="text" select="$dao"/>     		
	       	</xsl:call-template>	       	
		</xsl:variable>	
		<xsl:variable name="collectorField_1" select="substring-after(value[@name='statistics']/block/field,'::')"/>		
		<xsl:variable name="collectorField_2">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$collectorField_1"/>				
			</xsl:call-template>			
		</xsl:variable>
		<xsl:variable name="collecto">		
			<xsl:call-template name="blockly.getValue">				
				<xsl:with-param name="value" select="value[@name='statistics']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="collecto_convert">
			<xsl:call-template name="convert_blocks">
				<xsl:with-param name="daolow" select="$daolow"></xsl:with-param>
				<xsl:with-param name="value" select="$collecto"></xsl:with-param>
				<xsl:with-param name="valueblock" select="wherevalue"></xsl:with-param>
				<xsl:with-param name="from" select="$collecto_type"></xsl:with-param>
				<xsl:with-param name="to" select="'Long'"></xsl:with-param>
				<xsl:with-param name="neto" select="neto"></xsl:with-param>
				<xsl:with-param name="valuechild" select="valuechild"></xsl:with-param>
				<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>
				<xsl:with-param name="block_name" select="block_name"></xsl:with-param>
			</xsl:call-template>	
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
		<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List  = </xsl:text><xsl:value-of select="$daofilter"/><xsl:text>.all();</xsl:text>		
		<xsl:value-of select="$newlineTab1"/>					
		<xsl:text>LongSummaryStatistics value = </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.stream().collect(Collectors.summarizingLong(</xsl:text><xsl:value-of select="$daolow"/><xsl:text> -> </xsl:text><xsl:value-of select="$collecto_convert"/><xsl:text>));</xsl:text>								
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>if(!</xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.isEmpty()){</xsl:text>		
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
						<xsl:with-param name="neto" select="$typeneto"></xsl:with-param>					
						<xsl:with-param name="valuechild" select="$valuechild"></xsl:with-param>					
						<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>					
						<xsl:with-param name="block_name" select="block_name"></xsl:with-param>					
					</xsl:call-template>						
					</xsl:otherwise>
				</xsl:choose>						
			<xsl:text>);</xsl:text>			
		</xsl:variable>		
		<xsl:value-of select="$stat_set"></xsl:value-of>		
	</xsl:template>	
		
</xsl:stylesheet>