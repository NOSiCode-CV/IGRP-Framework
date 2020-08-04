<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="blockly.element.grafico" >
	
		<xsl:variable name="mutation" select="mutation/@count"/>

		<xsl:variable name="grafico" select="substring-after(@type,'grafico_')"/>
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="checkbox" select="field[@name='3D']"/>
		
		<xsl:variable name="graficoup">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$grafico"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="daolow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao"/>
	       		
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
		
		<!-- ######################################################## -->
		
		<xsl:variable name="eixoy" select="*[@name='value2']/block/next/block/value/block/field"/>
		
		<xsl:variable name="eixoy_filho" select="*[@name='value2']/block/next/block/value/block/value/block/field"/>
		
		<xsl:variable name="typey_filho" select="substring-before($eixoy_filho,'::')"/>
		
		<xsl:variable name="valuey_filho_low" select="substring-after($eixoy_filho,'::')"/>
		
		<xsl:variable name="valuey_filho">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$valuey_filho_low"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="rowtypechildY" select="substring-before($eixoy,'::')"/>
		
		<xsl:variable name="y_split_1" select="substring-after($eixoy,'::')"/>
		
		<xsl:variable name="y_split_2">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$y_split_1"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="y_split" select="concat('get',$y_split_2)"/>
		
		<!-- ######################################################## -->
		
		<xsl:variable name="eixoz" select="*[@name='value2']/block/next/block/next/block/value/block/field"/>
		
		<xsl:variable name="eixoz_filho" select="*[@name='value2']/block/next/block/next/block/value/block/value/block/field"/>
		
		<xsl:variable name="typez_filho" select="substring-before($eixoz_filho,'::')"/>
		
		<xsl:variable name="valuez_filho_low" select="substring-after($eixoz_filho,'::')"/>
		
		<xsl:variable name="valuez_filho">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$valuez_filho_low"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="rowtypechildZ" select="substring-before($eixoz,'::')"/>
		
		<xsl:variable name="z_split_1" select="substring-after($eixoz,'::')"/>
		
		<xsl:variable name="z_split_2">
		
			<xsl:call-template name="InitCap">
			
				<xsl:with-param name="text" select="$z_split_1"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="z_split" select="concat('get',$z_split_2)"/>
		
		<xsl:variable name="options">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='value2']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<!-- ######################################################## -->
		
		<xsl:value-of select="$newlineTab1"/>
			 
		<xsl:text>try{</xsl:text>
			
		<xsl:value-of select="$newlineTab1"/>
		
		<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>
			
		<xsl:value-of select="$andWheres"/>
		
		<xsl:value-of select="$newlineTab1"/>
		
		<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"/><xsl:text>&gt; p  = </xsl:text><xsl:value-of select="$daofilter"/><xsl:text>.all();</xsl:text>
		
		<xsl:value-of select="$newlineTab1"/>
		
		<xsl:choose>
		
			<xsl:when test="$eixoz != ''">
			
				<xsl:variable name="rowtypemap">
			
					<xsl:choose>
					
						<xsl:when test="contains($rowtypechildZ,'_FK#')">
						
							<xsl:variable name="replaced_field">
					
								<xsl:call-template name="replace-all">
								
									<xsl:with-param name="text" select="$rowtypechildZ"/>
									
									<xsl:with-param name="replace" select="'_FK#'"/>
									
									<xsl:with-param name="by" select="''"/>
									
								</xsl:call-template>
								
							</xsl:variable>
							
							<xsl:value-of select="$replaced_field"></xsl:value-of>
						
						</xsl:when>
						
						<xsl:otherwise>
							
							<xsl:value-of select="$rowtypechildZ"></xsl:value-of>
						
						</xsl:otherwise>
						
					</xsl:choose>	
	
				</xsl:variable>
				
				<xsl:choose>
				
					<xsl:when test="$eixoz_filho != ''">
					
						<xsl:text>Map&lt;</xsl:text><xsl:value-of select="$typez_filho"/><xsl:text>, Long&gt; z_value = p.stream().collect(Collectors.groupingBy(e -> e.</xsl:text><xsl:value-of select="$z_split"/><xsl:text>().get</xsl:text><xsl:value-of select="$valuez_filho"/><xsl:text>(),Collectors.counting()));</xsl:text>
					
					</xsl:when>
					
					<xsl:otherwise>
					
						<xsl:text>Map&lt;</xsl:text><xsl:value-of select="$rowtypemap"/><xsl:text>, Long&gt; z_value = p.stream().collect(Collectors.groupingBy(</xsl:text><xsl:value-of select="$dao"/><xsl:text>::</xsl:text><xsl:value-of select="$z_split"/><xsl:text>,Collectors.counting()));</xsl:text>
				
					</xsl:otherwise>
				
				</xsl:choose>
			
			</xsl:when>
			
			<xsl:otherwise>
			
				<xsl:variable name="rowtypemap">
		
					<xsl:choose>
					
						<xsl:when test="contains($rowtypechildY,'_FK#')">
						
							<xsl:variable name="replaced_field">
					
								<xsl:call-template name="replace-all">
								
									<xsl:with-param name="text" select="$rowtypechildY"/>
									
									<xsl:with-param name="replace" select="'_FK#'"/>
									
									<xsl:with-param name="by" select="''"/>
									
								</xsl:call-template>
								
							</xsl:variable>
							
							<xsl:value-of select="$replaced_field"></xsl:value-of>
						
						</xsl:when>
						
						<xsl:otherwise>
							
							<xsl:value-of select="$rowtypechildY"></xsl:value-of>
						
						</xsl:otherwise>
						
					</xsl:choose>	

				</xsl:variable>
			
				<xsl:choose>
				
					<xsl:when test="$eixoy_filho != ''">
					
						<xsl:text>Map&lt;</xsl:text><xsl:value-of select="$typey_filho"/><xsl:text>, Long&gt; y_value = p.stream().collect(Collectors.groupingBy(e -> e.</xsl:text><xsl:value-of select="$y_split"/><xsl:text>().get</xsl:text><xsl:value-of select="$valuey_filho"/><xsl:text>(),Collectors.counting()));</xsl:text>
					
					</xsl:when>
					
					<xsl:otherwise>
					
						<xsl:text>Map&lt;</xsl:text><xsl:value-of select="$rowtypemap"/><xsl:text>, Long&gt; y_value = p.stream().collect(Collectors.groupingBy(</xsl:text><xsl:value-of select="$dao"/><xsl:text>::</xsl:text><xsl:value-of select="$y_split"/><xsl:text>,Collectors.counting()));</xsl:text>
				
					</xsl:otherwise>
				
				</xsl:choose>
			
			</xsl:otherwise>
		
		</xsl:choose>
		
		<xsl:value-of select="$newlineTab1"/>
		
		<xsl:text>if(p != null &amp;&amp; !p.isEmpty()){</xsl:text>
		
		<xsl:value-of select="$newlineTab2"/>

		<xsl:text>model.set</xsl:text><xsl:value-of select="$graficoup"/><xsl:text>(new ArrayList&lt;</xsl:text><xsl:value-of select="$graficoup"/><xsl:text>&gt;());</xsl:text>
		
		<xsl:value-of select="$newlineTab2"/>
		
		<xsl:text>p.stream().forEach(</xsl:text><xsl:value-of select="$daolow"></xsl:value-of><xsl:text>->{</xsl:text>
		
		<xsl:value-of select="$newlineTab3"></xsl:value-of>
		
		<xsl:value-of select="$graficoup"/><xsl:text> c = new </xsl:text><xsl:value-of select="$graficoup"/><xsl:text>();</xsl:text>
		
		<xsl:value-of select="$options"/>
	
		<xsl:value-of select="$newlineTab3"/>
		
		<xsl:text>model.get</xsl:text><xsl:value-of select="$graficoup"/><xsl:text>().add(c);</xsl:text>
		
		<xsl:value-of select="$newlineTab2">
		
		</xsl:value-of><xsl:text>});</xsl:text>
		
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
	
	
	<!-- //////////////////////////////////////// EIXO X //////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.eixo_x" >
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='eixo']/block/field,'::')"/>
	
		<xsl:variable name="eixo">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='eixo']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="eixo_convert">
		
			<xsl:call-template name="convert_blocks">
					
				<xsl:with-param name="daolow" select="daolow"></xsl:with-param>
				
				<xsl:with-param name="value" select="$eixo"></xsl:with-param>
				
				<xsl:with-param name="valueblock" select="valueblock"></xsl:with-param>
				
				<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>
				
				<xsl:with-param name="to" select="'String'"></xsl:with-param>
				
				<xsl:with-param name="neto" select="neto"></xsl:with-param>
				
				<xsl:with-param name="valuechild" select="value_namee"></xsl:with-param>
				
				<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>
				
				<xsl:with-param name="block_name" select="block_name"></xsl:with-param>
				
			</xsl:call-template>
					
		</xsl:variable>
		
		<xsl:value-of select="$newlineTab3"></xsl:value-of>

		<xsl:text>c.setEixoX(</xsl:text><xsl:value-of select="$eixo_convert"/><xsl:text>);</xsl:text>
		
	</xsl:template>
	
	<!-- //////////////////////////////////////// EIXO Y /////////////////////////////////////////////////////////////////// -->
	
	
	<xsl:template name="blockly.element.eixo_y" >
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='eixo']/block/field,'::')"/>
		
		<xsl:variable name="block_check" select="../../../../../block/field[@name='3D']"/>
		
		<xsl:variable name="z_exist" select ="next/block[@type='EixoZ']"/>
	
		<xsl:variable name="eixo">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='eixo']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:choose>
		
			<xsl:when test="$z_exist != ''">
			
				<xsl:variable name="eixo_convert">
		
					<xsl:call-template name="convert_blocks">
							
						<xsl:with-param name="daolow" select="daolow"></xsl:with-param>
						
						<xsl:with-param name="value" select="$eixo"></xsl:with-param>
						
						<xsl:with-param name="valueblock" select="valueblock"></xsl:with-param>
						
						<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>
						
						<xsl:with-param name="to" select="'String'"></xsl:with-param>
						
						<xsl:with-param name="neto" select="neto"></xsl:with-param>
						
						<xsl:with-param name="valuechild" select="value_namee"></xsl:with-param>
						
						<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>
						
						<xsl:with-param name="block_name" select="block_name"></xsl:with-param>
						
					</xsl:call-template>
							
				</xsl:variable>
				
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
	
				<xsl:text>c.setEixoY(</xsl:text><xsl:value-of select="$eixo_convert"/><xsl:text>);</xsl:text>
			
			</xsl:when>
		
			<xsl:otherwise>
					
				<xsl:value-of select="$newlineTab3"></xsl:value-of>
				
				<xsl:text>c.setEixoY(y_value.get(</xsl:text><xsl:value-of select="$eixo"/><xsl:text>));</xsl:text>
				
			</xsl:otherwise>

		</xsl:choose>
			
	</xsl:template>
	
	<!-- //////////////////////////////////////// EIXO Z /////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.eixo_z" >
	
		<xsl:variable name="eixo">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="*[@name='eixo']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
				
		<xsl:value-of select="$newlineTab3"></xsl:value-of>
		
		<xsl:text>c.setEixoZ(z_value.get(</xsl:text><xsl:value-of select="$eixo"/><xsl:text>));</xsl:text>
		
	</xsl:template>
	
</xsl:stylesheet>