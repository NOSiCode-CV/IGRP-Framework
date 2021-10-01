<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">		
		
	<xsl:template name="blockly.element.fill_combo" >	
		<xsl:variable name="combo" select="field"/>		
		<xsl:variable name="checkbox" select="field[@name='selecionar']"/>		
		<xsl:variable name="options">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
				<xsl:with-param name="parent" select="."></xsl:with-param>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="code">		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>LinkedHashMap&lt;String, String&gt; </xsl:text><xsl:value-of select="$combo"/><xsl:text> = new LinkedHashMap&lt;&gt;();</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:if test="$checkbox = 'TRUE'">				
				<xsl:value-of select="$combo"></xsl:value-of><xsl:text>.put(null, gt("-- Selecionar --"));</xsl:text>					
				<xsl:value-of select="$newlineTab1"></xsl:value-of>					
			</xsl:if>					
			<xsl:value-of select="$options"></xsl:value-of>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>view.</xsl:text><xsl:value-of select="$combo"/><xsl:text>.setValue(</xsl:text><xsl:value-of select="$combo"/><xsl:text>);</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
		</xsl:variable>	
		<xsl:value-of select="$code"></xsl:value-of>		
	</xsl:template>
	
	<xsl:template name="blockly.element.option_combo" >
		<xsl:param name="parent"/>	
		<xsl:variable name="combo" select="$parent/field"/>	
	   	<xsl:variable name="valor">   	
			<xsl:call-template name="blockly.getValue">		
				<xsl:with-param name="value" select="field[@name='opcao_val']"/>			
			</xsl:call-template>	
		</xsl:variable>	
		<xsl:variable name="descricao">		
			<xsl:call-template name="InitCap">		
				<xsl:with-param name="text" select="field[@name='opcao_des']"/>		
			</xsl:call-template>		
		</xsl:variable>		
		<xsl:value-of select="$combo"/><xsl:text>.put("</xsl:text><xsl:value-of select="$valor"/><xsl:text>", gt("</xsl:text><xsl:value-of select="$descricao"/><xsl:text>"));</xsl:text>
	</xsl:template>
	
	<xsl:template name="blockly.element.combo_dao" >	
		<xsl:variable name="mutation" select="mutation/@count"/>	
		<xsl:variable name="dao" select="field[@name='dao']"/>	
		<xsl:variable name="combo" select="field[@name='selecao']"/>	
		<xsl:variable name="checkbox" select="field[@name='selecionar']"/>	
		<xsl:variable name="dao_low">
	       	<xsl:call-template name="LowerCase">       	
	       		<xsl:with-param name="text" select="$dao"/>  		
	       	</xsl:call-template>       	
	   	</xsl:variable>
	   	<xsl:variable name="daofilter" select="concat($dao_low,'filter')"/>
		<xsl:variable name="andWheres">	
			<xsl:call-template name="listar.andWheres">
				<xsl:with-param name="daofilter" select="$daofilter"/>
				<xsl:with-param name="total" select="$mutation"/>
				<xsl:with-param name="valueAttrName" select="'ADD'"/>
				<xsl:with-param name="values" select="value"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="options_dao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='key_val']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>		
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="code">	
			<xsl:value-of select="$newlineTab1"></xsl:value-of>		
			<xsl:text>try{</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>					
			<xsl:value-of select="$andWheres"/>			
			<xsl:value-of select="$newlineTab1"/>		
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List = </xsl:text><xsl:value-of select="$daofilter"/><xsl:text>.all();</xsl:text>			
			<xsl:value-of select="$newlineTab1"/>		
			<xsl:text>LinkedHashMap&lt;String, String&gt; </xsl:text><xsl:value-of select="$combo"/><xsl:text> = new LinkedHashMap&lt;&gt;();</xsl:text>		
			<xsl:choose>			
				<xsl:when test="$checkbox = 'TRUE'">
					<xsl:value-of select="$newlineTab1"></xsl:value-of>				
					<xsl:value-of select="$combo"></xsl:value-of><xsl:text>.put(null, gt("-- Selecionar --"));</xsl:text>			
				</xsl:when>										
			</xsl:choose>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>		
			<xsl:text>for(</xsl:text><xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$dao_low"/><xsl:text> : </xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List){</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:value-of select="$options_dao"/>	
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>}</xsl:text>		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:text>view.</xsl:text><xsl:value-of select="$combo"/><xsl:text>.setValue(</xsl:text><xsl:value-of select="$combo"/><xsl:text>);</xsl:text>						
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:text>}catch ( Exception e ) {</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>e.printStackTrace();</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>		
			<xsl:text>}</xsl:text>
		</xsl:variable>		
		<xsl:value-of select="$code"></xsl:value-of>		
	</xsl:template>
	
	<xsl:template name="blockly.element.option_dao" >	
		<xsl:param name="parent"/>	
		<xsl:variable name="combo" select="$parent/field"/>	
		<xsl:variable name="valor1">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='key_val']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="valor2">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='value_val']"/>				
			</xsl:call-template>			
		</xsl:variable>	
	   	<xsl:variable name="valor1type">		
			<xsl:choose>
				<xsl:when test="value[@name='key_val']/block/value/block/value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value[@name='key_val']/block/value/block/value/block/value/block/field,'::')"/>				
				</xsl:when>	
				<xsl:when test="value[@name='key_val']/block/value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value[@name='key_val']/block/value/block/value/block/field,'::')"/>				
				</xsl:when>				
				<xsl:when test="value[@name='key_val']/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value[@name='key_val']/block/value/block/field,'::')"/>				
				</xsl:when>					
				<xsl:otherwise>				
					<xsl:value-of select="substring-before(value[@name='key_val']/block/field,'::')"/>				
				</xsl:otherwise>				
			</xsl:choose>		
		</xsl:variable>		
		<xsl:variable name="valor2type">		
			<xsl:choose>
				<xsl:when test="value[@name='value_val']/block/value/block/value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value[@name='value_val']/block/value/block/value/block/value/block/field,'::')"/>				
				</xsl:when>	
				<xsl:when test="value[@name='value_val']/block/value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value[@name='value_val']/block/value/block/value/block/field,'::')"/>				
				</xsl:when>				
				<xsl:when test="value[@name='value_val']/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value[@name='value_val']/block/value/block/field,'::')"/>				
				</xsl:when>					
				<xsl:otherwise>				
					<xsl:value-of select="substring-before(value[@name='value_val']/block/field,'::')"/>				
				</xsl:otherwise>				
			</xsl:choose>		
		</xsl:variable>		
		<xsl:variable name="valor1convert">		
			<xsl:call-template name="convert_blocks">								
				<xsl:with-param name="value" select="$valor1"></xsl:with-param>						
				<xsl:with-param name="from" select="$valor1type"></xsl:with-param>				
				<xsl:with-param name="to" select="'String'"></xsl:with-param>											
			</xsl:call-template>					
		</xsl:variable>		
		<xsl:variable name="valor2convert">		
			<xsl:call-template name="convert_blocks">								
				<xsl:with-param name="value" select="$valor2"></xsl:with-param>							
				<xsl:with-param name="from" select="$valor2type"></xsl:with-param>				
				<xsl:with-param name="to" select="'String'"></xsl:with-param>											
			</xsl:call-template>					
		</xsl:variable>				
		<xsl:value-of select="$combo"/><xsl:text>.put(</xsl:text><xsl:value-of select="$valor1convert"/><xsl:text>, gt(</xsl:text><xsl:value-of select="$valor2convert"/><xsl:text>));</xsl:text>
	</xsl:template>
	
</xsl:stylesheet>