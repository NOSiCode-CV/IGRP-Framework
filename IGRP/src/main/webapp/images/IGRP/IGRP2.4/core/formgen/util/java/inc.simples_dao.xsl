<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:template name="blockly.element.list_simple_dao">		
		<xsl:variable name="mutation" select="mutation/@count"/>
		<xsl:variable name="find" select="field[@name='find']"/>
		<xsl:variable name="dao" select="field[@name='dao']"/>	
		<xsl:variable name="checkbox" select="field[@name='checkbox']"/>	
		<xsl:variable name="removeTry" select="field[@name='removeTry']"/>	
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
		<xsl:variable name="findValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$find"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="insercao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value"
					select="statement[@name='value2']" />
			</xsl:call-template>
		</xsl:variable>	
		<xsl:variable name="edit_pa">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='get_pa']"/>				
			</xsl:call-template>			
		</xsl:variable>				
		<xsl:variable name="valueblock" select="substring-after(value[@name='get_pa']/block/field,'::')"/> 	
		<xsl:variable name="type_childblock" select="substring-before(value[@name='get_pa']/block/field,'::')"/>		
		<xsl:variable name="block_namechild" select="value[@name='get_pa']/block/@type"/>	
		<xsl:variable name="edited_convert">	
			<xsl:call-template name="utils.edited">				
				<xsl:with-param name="value" select="$edit_pa"></xsl:with-param>				
				<xsl:with-param name="valueblock" select="$valueblock"></xsl:with-param>				
				<xsl:with-param name="from" select="$type_childblock"></xsl:with-param>				
				<xsl:with-param name="to" select="'Integer'"></xsl:with-param>				
				<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>				
			</xsl:call-template>					
		</xsl:variable>	
		<xsl:variable name="code">
			<xsl:choose>		
				<xsl:when test="$mutation > 0 or $find='limit' or $find='TODOSS'">				
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>					
					<xsl:value-of select="$andWheres"/>					
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:choose>
						<xsl:when test="$find = 'UMM'">
							<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$dao_low"/><xsl:text> = </xsl:text><xsl:value-of select="$daofilter"/>
							<xsl:if test="$checkbox = 'TRUE'">				
								<xsl:text>.keepConnection()</xsl:text>									
							</xsl:if>
							<xsl:value-of select="$findValue"/>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:value-of select="$insercao"/>
							<xsl:value-of select="$newlineTab2"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List = </xsl:text><xsl:value-of select="$daofilter"/>
							<xsl:if test="$checkbox = 'TRUE'">				
								<xsl:text>.keepConnection()</xsl:text>									
							</xsl:if>
							<xsl:value-of select="$findValue"/>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>if(</xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List != null){</xsl:text>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:text>for(</xsl:text><xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$dao_low"/><xsl:text> : </xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List){</xsl:text>		
							<xsl:value-of select="$newlineTab3"/>	
							<xsl:value-of select="$insercao"/>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:text>}</xsl:text>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>}</xsl:text>
						</xsl:otherwise>				
					</xsl:choose>					
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="$newlineTab2"/>			
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$dao_low"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().findOne(</xsl:text><xsl:value-of select="$edited_convert"/><xsl:text>);</xsl:text>	
					<xsl:value-of select="$newlineTab2"/>
					<xsl:value-of select="$insercao"/>
					<xsl:value-of select="$newlineTab1"/>					
				</xsl:otherwise>				
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$removeTry = 'TRUE'">
				<xsl:value-of select="$code"/>							
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="utils.try">
					<xsl:with-param name="code" select="$code"></xsl:with-param>
					<xsl:with-param name="exceptionCode">
						<xsl:text>e.printStackTrace();</xsl:text>
					</xsl:with-param>
				</xsl:call-template>				
			</xsl:otherwise>
		</xsl:choose>			
	</xsl:template>
	
	<xsl:template name="blockly.element.insert_simple_dao">
		<xsl:variable name="dao" select="field[@name='dao']" />
		<xsl:variable name="daolow">
			<xsl:call-template name="LowerCase">
				<xsl:with-param name="text" select="$dao" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="insercao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value"
					select="statement[@name='value2']" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="code">
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>try{</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:value-of select="$dao"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="$daolow" /><xsl:text>  = new </xsl:text><xsl:value-of select="$dao" /><xsl:text>();</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:value-of select="$insercao"></xsl:value-of>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:value-of select="$daolow" /><xsl:text>.insert();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}catch ( Exception e ) {</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>e.printStackTrace();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}	</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
		</xsl:variable>
		<xsl:value-of select="$code"></xsl:value-of>
	</xsl:template>
	
	<xsl:template name="blockly.element.update_simple_dao">
		<xsl:variable name="dao" select="field[@name='dao']"/>	
		<xsl:variable name="checkbox" select="field[@name='KEEP']"/>	
		<xsl:variable name="mutation" select="mutation/@count"/>		
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
		<xsl:variable name="edit_pa">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='get_pa']"/>				
			</xsl:call-template>			
		</xsl:variable>				
		<xsl:variable name="valueblock" select="substring-after(value[@name='get_pa']/block/field,'::')"/> 	
		<xsl:variable name="type_childblock" select="substring-before(value[@name='get_pa']/block/field,'::')"/>		
		<xsl:variable name="block_namechild" select="value[@name='get_pa']/block/@type"/>	
		<xsl:variable name="edited_convert">	
			<xsl:call-template name="utils.edited">				
				<xsl:with-param name="value" select="$edit_pa"></xsl:with-param>				
				<xsl:with-param name="valueblock" select="$valueblock"></xsl:with-param>				
				<xsl:with-param name="from" select="$type_childblock"></xsl:with-param>				
				<xsl:with-param name="to" select="'Integer'"></xsl:with-param>				
				<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>				
			</xsl:call-template>					
		</xsl:variable>	
		<xsl:variable name="edicao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value"
					select="statement[@name='value2']" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="code">
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>try{</xsl:text>	
			<xsl:choose>		
				<xsl:when test="$mutation > 0">				
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>					
					<xsl:value-of select="$andWheres"/>					
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = </xsl:text><xsl:value-of select="$daofilter"></xsl:value-of>
					<xsl:if test="$checkbox = 'TRUE'">				
						<xsl:text>.keepConnection()</xsl:text>									
					</xsl:if>
					<xsl:text>.one();</xsl:text>	
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="$newlineTab2"/>			
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().findOne(</xsl:text><xsl:value-of select="$edited_convert"/><xsl:text>);</xsl:text>						
				</xsl:otherwise>				
			</xsl:choose>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>if (</xsl:text><xsl:value-of select="$daolow"/><xsl:text> != null &amp;&amp; !</xsl:text><xsl:value-of select="$daolow"/><xsl:text>.hasError()) {</xsl:text>					
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:value-of select="$edicao"></xsl:value-of>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:value-of select="$daolow" /><xsl:text>.update();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>else</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>Core.setMessageError();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}catch ( Exception e ) {</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>e.printStackTrace();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}	</xsl:text>
		</xsl:variable>
		<xsl:value-of select="$code"></xsl:value-of>
	</xsl:template>
	
	<xsl:template name="blockly.element.apagar" >		
		<xsl:variable name="dao" select="field[@name='dao']"/>	
		<xsl:variable name="checkbox" select="field[@name='KEEP']"/>		
		<xsl:variable name="mutation" select="mutation/@count"/>		
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
		<xsl:variable name="edit_pa">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='get_pa']"/>				
			</xsl:call-template>			
		</xsl:variable>				
		<xsl:variable name="valueblock" select="substring-after(value[@name='get_pa']/block/field,'::')"/> 	
		<xsl:variable name="type_childblock" select="substring-before(value[@name='get_pa']/block/field,'::')"/>		
		<xsl:variable name="block_namechild" select="value[@name='get_pa']/block/@type"/>	
		<xsl:variable name="edited_convert">	
			<xsl:call-template name="utils.edited">				
				<xsl:with-param name="value" select="$edit_pa"></xsl:with-param>				
				<xsl:with-param name="valueblock" select="$valueblock"></xsl:with-param>				
				<xsl:with-param name="from" select="$type_childblock"></xsl:with-param>				
				<xsl:with-param name="to" select="'Integer'"></xsl:with-param>				
				<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>				
			</xsl:call-template>					
		</xsl:variable>	
		
		<xsl:choose>			
			<xsl:when test="$mutation > 0">				
				<xsl:value-of select="$newlineTab2"/>					
				<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>					
				<xsl:value-of select="$andWheres"/>					
				<xsl:value-of select="$newlineTab2"/>					
				<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = </xsl:text><xsl:value-of select="$daofilter"></xsl:value-of>
				<xsl:if test="$checkbox = 'TRUE'">				
						<xsl:text>.keepConnection()</xsl:text>									
				</xsl:if>
				<xsl:text>.one();</xsl:text>	
			</xsl:when>				
			<xsl:otherwise>				
				<xsl:value-of select="$newlineTab2"/>			
				<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().findOne(</xsl:text><xsl:value-of select="$edited_convert"/><xsl:text>);</xsl:text>						
			</xsl:otherwise>				
		</xsl:choose>				
		<xsl:value-of select="$newlineTab1"></xsl:value-of>			
		<xsl:text>if (</xsl:text><xsl:value-of select="$daolow"/><xsl:text> != null &amp;&amp; !</xsl:text><xsl:value-of select="$daolow"/><xsl:text>.hasError()) {</xsl:text>		
		<xsl:value-of select="$newlineTab2"></xsl:value-of>			
		<xsl:text>boolean del = </xsl:text><xsl:value-of select="$daolow"/><xsl:text>.delete(</xsl:text><xsl:value-of select="$edited_convert"/><xsl:text>);</xsl:text>		
		<xsl:value-of select="$newlineTab2"></xsl:value-of>	 		
		<xsl:text>if (del)</xsl:text>		
		<xsl:value-of select="$newlineTab3"></xsl:value-of>		
		<xsl:text>Core.setMessageSuccess();</xsl:text>		
		<xsl:value-of select="$newlineTab2"></xsl:value-of>		
		<xsl:text>else</xsl:text>		
		<xsl:value-of select="$newlineTab3"></xsl:value-of>		
		<xsl:text>Core.setMessageError();</xsl:text>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>} </xsl:text>	
		<xsl:value-of select="$newlineTab1"></xsl:value-of>	
	</xsl:template>

</xsl:stylesheet>