<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.getDao">
	
		<xsl:variable name="dao" select="substring-after(@type,'get-dao-')"/>
		
		<xsl:variable name="daolow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao"/>
	       		
	       	</xsl:call-template>
	       	
		</xsl:variable>
	
		<xsl:variable name="dad" select="../../field"/>
		
		<xsl:variable name="typedad" select="substring-before($dad,'::')"/>
		
		<xsl:variable name="fieldType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="fieldValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="otherdaofield" select="substring-after(value/block/field,'::')"/>
		
		<xsl:variable name="nameCap">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$fieldValue"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="otherdao_obj">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='dao_rela']"/>
				
			</xsl:call-template>
			
		</xsl:variable>

		<xsl:variable name="otherdao">
		
			<xsl:call-template name="replace-all">
			
				<xsl:with-param name="text" select="$otherdao_obj"/>
				
				<xsl:with-param name="replace" select="substring-before($otherdao_obj,'.')"/>
				
				<xsl:with-param name="by" select="''"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:value-of select="$daolow"/><xsl:text>.get</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>()</xsl:text><xsl:value-of select="$otherdao"/>		
		
	</xsl:template>
	
	<xsl:template name="blockly.element.setDao">
	
		<xsl:variable name="dao" select="substring-after(@type,'set-dao-')"/>
		
		<xsl:variable name="daolow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao"/>
	       		
	       	</xsl:call-template>
	       	
		</xsl:variable>
		
		<xsl:variable name="inline" select="@inline"/>
		
		<xsl:variable name="fieldType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="fieldValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="childblocktype" select="value[@name='value1']/block/@type"/>
		
		<xsl:variable name="fieldTypechild" select="substring-before(value/block/field,'::')"/>
		
		<xsl:variable name="fieldvaluechild" select="substring-after(value/block/field,'::')"/>
		
		<xsl:variable name="paramkey" select="value/block/field"/>
			
		<xsl:variable name="nameCap">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$fieldValue"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="valorA">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='value1']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="daoset">
		
			<xsl:choose>
				
				<xsl:when test= "$inline='true'" >
				
					<xsl:variable name="valorparam">
					
						<xsl:call-template name="blockly.getValue">
						
							<xsl:with-param name="value" select="value[@name='value1']"/>
							
						</xsl:call-template>
						
					</xsl:variable>
					
					<xsl:variable name="type_param" select="substring-before(value/block/field,'::')"/>
					
					<xsl:variable name="foreign_name" select="value/block/@type"/>
					
					<xsl:variable name="paramlow">
					
				       	<xsl:call-template name="LowerCase">
				       	
				       		<xsl:with-param name="text" select="$fieldType"/>
				       		
				       	</xsl:call-template>
				       	
				   	</xsl:variable>
				   	
				   	<xsl:choose>
				   	
				   		<xsl:when test="$foreign_name = 'dao_obj'">
							
							<xsl:value-of select="$daolow"/><xsl:text>.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$valorparam"/><xsl:text>);</xsl:text>
						
						</xsl:when>

						<xsl:when test="$foreign_name = 'core_get_param'">
					   	
						   	<xsl:value-of select="$fieldType"/><xsl:text> </xsl:text><xsl:value-of select="$paramlow"/><xsl:text>_foreign = session.find(</xsl:text><xsl:value-of select="$fieldType"/><xsl:text>.class, </xsl:text><xsl:value-of select="$valorparam"/><xsl:text>);</xsl:text>
							
							<xsl:value-of select="$newlineTab1"></xsl:value-of>
							
							<xsl:value-of select="$daolow"/><xsl:text>.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$paramlow"/><xsl:text>_foreign);</xsl:text>
						
						</xsl:when>
				   	
					   	<xsl:when test="$type_param != 'Integer'">
					   	
						   	<xsl:value-of select="$fieldType"/><xsl:text> </xsl:text><xsl:value-of select="$paramlow"/><xsl:text>_foreign = session.find(</xsl:text><xsl:value-of select="$fieldType"/><xsl:text>.class, Core.toInt(</xsl:text><xsl:value-of select="$valorparam"/><xsl:text>));</xsl:text>
							
							<xsl:value-of select="$newlineTab1"></xsl:value-of>
							
							<xsl:value-of select="$daolow"/><xsl:text>.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$paramlow"/><xsl:text>_foreign);</xsl:text>
						
						</xsl:when>
						
						<xsl:otherwise>
						
							<xsl:value-of select="$fieldType"/><xsl:text> </xsl:text><xsl:value-of select="$paramlow"/><xsl:text>_foreign = session.find(</xsl:text><xsl:value-of select="$fieldType"/><xsl:text>.class, </xsl:text><xsl:value-of select="$valorparam"/><xsl:text>);</xsl:text>
							
							<xsl:value-of select="$newlineTab1"></xsl:value-of>
							
							<xsl:value-of select="$daolow"/><xsl:text>.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$paramlow"/><xsl:text>_foreign);</xsl:text>
						
						</xsl:otherwise>
				   	
				   	</xsl:choose>
		
				</xsl:when>
					
				<xsl:otherwise>
				
					<xsl:value-of select="$tab2"></xsl:value-of>
				
					<xsl:value-of select="$daolow"/><xsl:text>.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text>
					
							<xsl:call-template name="convert_blocks">
							
								<xsl:with-param name="daolow" select="$daolow"></xsl:with-param>
								
								<xsl:with-param name="value" select="$valorA"></xsl:with-param>
								
								<xsl:with-param name="valueblock" select="$fieldValue"></xsl:with-param>
								
								<xsl:with-param name="from" select="$fieldTypechild"></xsl:with-param>
								
								<xsl:with-param name="to" select="$fieldType"></xsl:with-param>
								
								<xsl:with-param name="neto" select="neto"></xsl:with-param>
								
								<xsl:with-param name="valuechild" select="$fieldvaluechild"></xsl:with-param>
								
							</xsl:call-template>
							
						<xsl:text>);</xsl:text>
					
				</xsl:otherwise>
			
			</xsl:choose>
		
		</xsl:variable>
		
		<xsl:value-of select="$daoset"></xsl:value-of>
		
	</xsl:template>

</xsl:stylesheet>
		