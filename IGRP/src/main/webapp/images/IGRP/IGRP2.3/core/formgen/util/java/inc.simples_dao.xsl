<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.insert_simple_dao" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="daolow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao"/>
	       		
	       	</xsl:call-template>
	       	
		</xsl:variable>
	   	
	   	<xsl:variable name="insercao">
	   	
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="statement[@name='value2']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="code">

			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>try{</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
	
			<xsl:value-of select="$dao"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text>  = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>();</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:value-of select="$insercao"></xsl:value-of>
				
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:value-of select="$daolow"/><xsl:text>.insert();</xsl:text>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}catch ( Exception e ) {</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>

			<xsl:text>e.printStackTrace();</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>Core.setMessageError("Error: "+ e.getMessage());</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}	</xsl:text>

		</xsl:variable>
			
		<xsl:value-of select="$code"></xsl:value-of>	
	
	</xsl:template>
	
	<xsl:template name="blockly.element.update_simple_dao" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="daolow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao"/>
	       		
	       	</xsl:call-template>
	       	
		</xsl:variable>
	   	
	   	<xsl:variable name="insercao">
	   	
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="statement[@name='value2']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="param_id">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="value[@name='param_edit']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="code">

			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>try{</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
	
			<xsl:value-of select="$dao"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text>  = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().findOne(</xsl:text><xsl:value-of select="$param_id"/><xsl:text>);</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>if(Core.isNotNull(</xsl:text><xsl:value-of select="$daolow"/><xsl:text>)){</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:value-of select="$insercao"></xsl:value-of>
				
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:value-of select="$daolow"/><xsl:text>.update();</xsl:text>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>}</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}catch ( Exception e ) {</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>

			<xsl:text>e.printStackTrace();</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>Core.setMessageError("Error: "+ e.getMessage());</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}	</xsl:text>

		</xsl:variable>
			
		<xsl:value-of select="$code"></xsl:value-of>	
	
	</xsl:template>
	

	
</xsl:stylesheet>