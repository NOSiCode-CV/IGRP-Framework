<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="blockly.element.controls_if" >		
		<xsl:variable name="valueif1">		
				<xsl:call-template name="blockly.getValue">				
					<xsl:with-param name="value" select="*[@name='IF0']"/>					
				</xsl:call-template>				
		</xsl:variable>
			
		<xsl:variable name="valueif2">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='DO0']"/>				
			</xsl:call-template>			
		</xsl:variable>
		
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>if(</xsl:text><xsl:value-of select="$valueif1"></xsl:value-of><xsl:text>){</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>		
		<xsl:value-of select="$valueif2"/>		
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>}</xsl:text>		
		<xsl:value-of select="$newlineTab1"/>
		<xsl:variable name="hasMutation" select="mutation"></xsl:variable>
				
		<xsl:if test="$hasMutation">		
			<xsl:variable name="elseif_count" select="mutation/@elseif"/>			
			<xsl:variable name="haselse" select="mutation/@else"/>			
			<xsl:variable name="elseif_code">			
				<xsl:call-template name="MutationValue">				
					<xsl:with-param name="total" select="$elseif_count"/>					
					<xsl:with-param name="valueAttrName" select="'IF'"/>					
					<xsl:with-param name="statement" select="'DO'"/>				
				</xsl:call-template>				
			</xsl:variable>
			
			<xsl:value-of select="$elseif_code"/>
			
			<xsl:if test="$haselse">	
				<xsl:variable name="else">				
					<xsl:call-template name="blockly.getValue">					
						<xsl:with-param name="value" select="*[@name='ELSE']"/>						
					</xsl:call-template>					
				</xsl:variable>	
			
			<xsl:text>else{</xsl:text>			
			<xsl:value-of select="$newlineTab2"/>			
			<xsl:value-of select="$else"/>			
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="$newlineTab1"/>
				
			</xsl:if>
			
		</xsl:if>
	
	</xsl:template>
	
	<xsl:template name="MutationValue">	
		<xsl:param name="total"/>		
		<xsl:param name="valueAttrName" />			
		<xsl:param name="statement"/>		
		<xsl:param name="index" select="1"/>

		<xsl:if test="$index &lt;= $total">		
			<xsl:variable name="value1Name" select="concat($valueAttrName,$index)"/>			
			<xsl:variable name="value2Name" select="concat($statement,$index)"/>			
			<xsl:variable name="value1">			
				<xsl:call-template name="blockly.getValue">				
					<xsl:with-param name="value" select="*[@name=$value1Name]"/>					
				</xsl:call-template>				
			</xsl:variable>
			
			<xsl:variable name="value2">			
				<xsl:call-template name="blockly.getValue">				
					<xsl:with-param name="value" select="*[@name=$value2Name]"/>					
				</xsl:call-template>
				
			</xsl:variable>			
			<xsl:if test="$value1 and $value2">
				<xsl:text>else if(</xsl:text>					
					<xsl:value-of select="$value1"></xsl:value-of>				
				<xsl:text>){</xsl:text>				
				<xsl:value-of select="$newlineTab2"/>				
				<xsl:value-of select="$value2"/>				
				<xsl:value-of select="$newlineTab1"/>				
				<xsl:text>}</xsl:text>				
				<xsl:value-of select="$newlineTab1"/>			
			</xsl:if>
					
			<xsl:call-template name="MutationValue">		
				<xsl:with-param name="total" select="$total"/>					
				<xsl:with-param name="valueAttrName" select="$valueAttrName"/>					
				<xsl:with-param name="statement" select="$statement"/>				
				<xsl:with-param name="index" select="$index + 1"/>				
			</xsl:call-template>
		
		</xsl:if>
		
	</xsl:template>
	
	
</xsl:stylesheet>
		