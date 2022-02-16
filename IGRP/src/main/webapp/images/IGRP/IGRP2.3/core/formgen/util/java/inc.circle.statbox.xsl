<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">		
	<xsl:template name="blockly.element.circle_stat_box" >		
		<xsl:variable name="mutation" select="mutation/@count"/>	
		<xsl:variable name="dao" select="field[@name='dao']"/>	
		<xsl:variable name="daolow">
	       	<xsl:call-template name="LowerCase">       	
	       		<xsl:with-param name="text" select="$dao"/>     		
	       	</xsl:call-template>	       	
		</xsl:variable>			
		<xsl:variable name="collecto">		
			<xsl:call-template name="blockly.getValue">				
				<xsl:with-param name="value" select="value[@name='filter']"/>				
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
		<xsl:variable name="filters">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='filter']"/>				
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
		<xsl:text>if(Core.isNotNull(</xsl:text><xsl:value-of select="$daolow"/><xsl:text>List)){</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>	
		<xsl:text>int total = </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.size();</xsl:text>	
		<xsl:value-of select="$newlineTab2"/>			
		<xsl:text>Long value = </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List.stream()</xsl:text><xsl:value-of select="$filters"/><xsl:text>.collect(Collectors.counting());</xsl:text>
		<xsl:value-of select="$newlineTab2"/>	
		<xsl:text>double percent = Precision.round(value * 100 / (double)total , 2);</xsl:text>							
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
	
	<xsl:template name="blockly.element.filterr" >
		<xsl:param name="indexy" select="1"/>
	
		<xsl:variable name="total" select="mutation/@count"/>
		
		<xsl:variable name="index">
			<xsl:choose>
				<xsl:when test="$indexy != ''">
					<xsl:value-of select="$indexy"></xsl:value-of>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="1"></xsl:value-of>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:if test="$index &lt;= $total">
			<xsl:variable name="value1Name" select="concat('FILTER',$index)"/>
			<xsl:variable name="operatorName" select="concat('FILTER',$index,'WHERE')"/>
			<xsl:variable name="value2Name" select="concat('FILTER',$index,'STATE2')"/>
			<xsl:variable name="dao" select="substring-after(value[@name=$value1Name]/block/@type,'et-dao-')"/>	
			<xsl:variable name="daolow">
		       	<xsl:call-template name="LowerCase">       	
		       		<xsl:with-param name="text" select="$dao"/>     		
		       	</xsl:call-template>	       	
			</xsl:variable>		
						
			<xsl:variable name="operator">
				<xsl:call-template name="utils.meaning">
					<xsl:with-param name="key" select="field[@name=$operatorName]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="value2">
				<xsl:call-template name="blockly.getValue">			
							<xsl:with-param name="value" select="value[@name=$value2Name]"/>				
						</xsl:call-template>
			</xsl:variable>								
			
			<xsl:variable name="value1">
				<xsl:choose>
					<xsl:when test="$daolow != ''">
						<xsl:call-template name="blockly.getValue">			
							<xsl:with-param name="value" select="value[@name=$value1Name]"/>				
						</xsl:call-template>		
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>This field must be a DAO Field!</xsl:text>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:variable>
			
			<xsl:variable name="typevalue1">		
				<xsl:choose>
					<xsl:when test="value[@name=$value1Name]/block/value/block/value/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/value/block/value/block/field,'::')"/>				
					</xsl:when>
					<xsl:when test="value[@name=$value1Name]/block/value/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/value/block/field,'::')"/>				
					</xsl:when>				
					<xsl:when test="value[@name=$value1Name]/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/field,'::')"/>				
					</xsl:when>					
					<xsl:otherwise>				
						<xsl:value-of select="substring-before(value[@name=$value1Name]/block/field,'::')"/>				
					</xsl:otherwise>				
				</xsl:choose>		
			</xsl:variable>	
			
			<xsl:variable name="typevalue2">		
				<xsl:choose>
					<xsl:when test="value[@name=$value2Name]/block/value/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/value/block/field,'::')"/>				
					</xsl:when>				
					<xsl:when test="value[@name=$value2Name]/block/value/block/field != ''">				
						<xsl:value-of select="substring-before(value/block/value/block/field,'::')"/>				
					</xsl:when>					
					<xsl:otherwise>				
						<xsl:value-of select="substring-before(value[@name=$value2Name]/block/field,'::')"/>				
					</xsl:otherwise>				
				</xsl:choose>		
			</xsl:variable>
			
			<xsl:variable name="value2_converted">
				<xsl:call-template name="convert_blocks">											
					<xsl:with-param name="value" select="$value2"></xsl:with-param>												
					<xsl:with-param name="from" select="$typevalue2"></xsl:with-param>						
					<xsl:with-param name="to" select="$typevalue1"></xsl:with-param>															
				</xsl:call-template>			
			</xsl:variable>
			
			<xsl:text>.filter(</xsl:text><xsl:value-of select="$daolow"/><xsl:text> -> </xsl:text>
			<xsl:if test="field[@name=$operatorName] = 'par_not_equall'">
				<xsl:text>!</xsl:text>
			</xsl:if>
			<xsl:value-of select="$value1"/><xsl:value-of select="$operator"/><xsl:value-of select="$value2_converted"/>
			<xsl:if test="contains(field[@name=$operatorName], 'par_')">
				<xsl:text>)</xsl:text>
			</xsl:if>
			<xsl:text>)</xsl:text>
					
			<xsl:call-template name="blockly.element.filterr">
				<xsl:with-param name="indexy" select="$index + 1"/>
			</xsl:call-template>		
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>