<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="blockly.element.get_model">		
		<xsl:variable name="fieldType" select="substring-before(field,'::')"/>		
		<xsl:variable name="fieldValue">		
			<xsl:choose>			
				<xsl:when test="substring-after(field,'//') != '' ">				
					<xsl:value-of select="substring-after(substring-before(field,'//'),'::')"></xsl:value-of>				
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="substring-after(field,'::')"></xsl:value-of>				
				</xsl:otherwise>				
			</xsl:choose>					
		</xsl:variable>		
		<xsl:variable name="nameCap">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$fieldValue"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="gettingmodel">		
			<xsl:text>model.get</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>			
			<xsl:call-template name="utils.arguments"/>			
		</xsl:variable>		
		<xsl:value-of select="$gettingmodel"></xsl:value-of>		
	</xsl:template>
	
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 
	
	<xsl:template name="blockly.element.set_model">		
		<xsl:variable name="block_name" select="@type"/> 		
		<xsl:variable name="block_namechild" select="value/block/@type"/> 	
		<xsl:variable name="modelType">		
			<xsl:choose>			
				<xsl:when test="substring-before(field,'::') != ''">				
					<xsl:value-of select="substring-before(field,'::')"></xsl:value-of>				
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="substring-before(substring-after(@type,'model_form_'),'::')"/>			
				</xsl:otherwise>			
			</xsl:choose>		
		</xsl:variable>		
		<xsl:variable name="modelValue">		
			<xsl:choose>			
				<xsl:when test="substring-after(field,'//') != '' ">				
					<xsl:value-of select="substring-after(substring-before(field,'//'),'::')"></xsl:value-of>				
				</xsl:when>	
				<xsl:when test="substring-after(@type,'//') != '' ">				
					<xsl:value-of select="substring-after(substring-before(@type,'//'),'::')"></xsl:value-of>				
				</xsl:when>			
				<xsl:when test="substring-after(field,'::') != ''">				
					<xsl:value-of select="substring-after(field,'::')"></xsl:value-of>			
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="substring-after(@type,'::')"/>				
				</xsl:otherwise>			
			</xsl:choose>		
		</xsl:variable>		
		<xsl:variable name="modeltypechild">		
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
		<xsl:variable name="nameCap">		
			<xsl:call-template name="InitCap">			
				<xsl:with-param name="text" select="$modelValue"/>				
			</xsl:call-template>			
		</xsl:variable>		
	   	<xsl:variable name="setting">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value1']"/>				
			</xsl:call-template>				
		</xsl:variable>		
		<xsl:choose>		
			<xsl:when test="$modelType = 'Image' or $modelType = 'Section' or $modelType = 'File'">			
				<xsl:value-of select="$tab2"></xsl:value-of>				
				<xsl:text>view.</xsl:text><xsl:value-of select="$modelValue"></xsl:value-of><xsl:text>.setValue(</xsl:text>				
					<xsl:call-template name="convert_blocks">										
						<xsl:with-param name="value" select="$setting"></xsl:with-param>						
						<xsl:with-param name="valueblock" select="$modelValue"></xsl:with-param>						
						<xsl:with-param name="from" select="$modeltypechild"></xsl:with-param>						
						<xsl:with-param name="to" select="$modelType"></xsl:with-param>												
						<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>						
						<xsl:with-param name="block_name" select="$block_name"></xsl:with-param>						
					</xsl:call-template>					
				<xsl:text>);</xsl:text>			
			</xsl:when>			
			<xsl:otherwise>			
				<xsl:value-of select="$tab2"></xsl:value-of>			
				<xsl:text>model.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of><xsl:text>(</xsl:text>				
					<xsl:call-template name="convert_blocks">											
						<xsl:with-param name="value" select="$setting"></xsl:with-param>						
						<xsl:with-param name="valueblock" select="$modelValue"></xsl:with-param>						
						<xsl:with-param name="from" select="$modeltypechild"></xsl:with-param>						
						<xsl:with-param name="to" select="$modelType"></xsl:with-param>										
						<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>						
						<xsl:with-param name="block_name" select="$block_name"></xsl:with-param>						
					</xsl:call-template>					
				<xsl:text>);</xsl:text>		
			</xsl:otherwise>	
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
		