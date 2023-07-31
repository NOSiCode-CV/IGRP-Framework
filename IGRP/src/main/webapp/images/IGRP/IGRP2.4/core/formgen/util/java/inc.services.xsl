<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:template name="blockly.element.listar_service" >		
		<xsl:variable name="table" select="substring-after(@type,'lstar_service_')"/>
		<xsl:variable name="servicesoap" select="field[@name='service']"/>	
		<xsl:variable name="service" select="substring-before(field[@name='service'],'Soap')"/>	
		<xsl:variable name="daoservice" select="substring-after(field[@name='operdrop'],'//')"/>
		<xsl:variable name="operation" select="substring-after(substring-before(field[@name='operdrop'],'//'),'::')"/>
		<xsl:variable name="totalParams" select="substring-after(substring-before(field[@name='operdrop'],'::'),'$$')"/>
		<xsl:variable name="find" select="field[@name='find']"/>				
		<xsl:variable name="servicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$service"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>
	   	<xsl:variable name="daoservicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$daoservice"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>	     		     	
	   	<xsl:variable name="servicefilter" select="concat($servicelow,'filter')"/>			
		<xsl:variable name="table_up">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="$table"/>
	       	</xsl:call-template>
	   	</xsl:variable>	
	   	<xsl:variable name="params">	
			<xsl:call-template name="listar.params">
				<xsl:with-param name="total" select="$totalParams"/>
			</xsl:call-template>
		</xsl:variable>   	
	   	<xsl:variable name="row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>	
			</xsl:call-template>
		</xsl:variable>		
		<xsl:variable name="code">	
			<xsl:value-of select="$service"/><xsl:text> </xsl:text><xsl:value-of select="$servicelow"/><xsl:text> = new </xsl:text><xsl:value-of select="$service"/><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>List&lt;</xsl:text>
			</xsl:if>			
			<xsl:value-of select="$daoservice"/>		
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>&gt;</xsl:text>
			</xsl:if>			
			<xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>List</xsl:text>
			</xsl:if>
			<xsl:text> = </xsl:text><xsl:value-of select="$servicelow"/><xsl:text>.get</xsl:text><xsl:value-of select="$servicesoap"/><xsl:text>().</xsl:text><xsl:value-of select="$operation"/><xsl:text>(</xsl:text>		
			<xsl:value-of select="$params"/><xsl:text>);</xsl:text> 
			<xsl:value-of select="$newlineTab1"/> 
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$servicelow"/><xsl:text>Table = new ArrayList&lt;&gt;</xsl:text><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"/> 
			<xsl:text>if(</xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>List</xsl:text>
			</xsl:if>						
			<xsl:text> != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>for(</xsl:text><xsl:value-of select="$daoservice"/><xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/><xsl:text> : </xsl:text><xsl:value-of select="$daoservicelow"/><xsl:text>List){</xsl:text>		
			</xsl:if>			
			<xsl:value-of select="$newlineTab3"/>	
			<xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text> row = new </xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>();</xsl:text> 
			<xsl:value-of select="$newlineTab1"/>
			<xsl:value-of select="$row"/>
			<xsl:value-of select="$newlineTab3"/>
			<xsl:value-of select="$servicelow"/><xsl:text>Table.add(row);</xsl:text>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>}</xsl:text>
				<xsl:value-of select="$newlineTab1"/>		
			</xsl:if>				
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
			<xsl:text>model.set</xsl:text><xsl:value-of select="$table_up"/><xsl:text>(</xsl:text><xsl:value-of select="$servicelow"/><xsl:text>Table);</xsl:text>
		</xsl:variable>		
		<xsl:call-template name="utils.try">
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			<xsl:with-param name="exceptionCode">
				<xsl:text>e.printStackTrace();</xsl:text>
			</xsl:with-param>
		</xsl:call-template>		
	</xsl:template>
	
	<xsl:template name="listar.params">
		<xsl:param name="total"/>
		<xsl:param name="index" select="0"/>		
		<xsl:if test="$index &lt; $total">
			<xsl:variable name="paramInd" select="concat('param',$index)"/>		
			<xsl:variable name="paramy" select = "value/@name"/>	
			<xsl:variable name="paramType" select = "substring-before($paramy,'%%')"/>
			<xsl:variable name="modeltype" select="substring-before(value[contains(@name,$paramInd)]/block/field,'::')"/>		
			<xsl:variable name="valor">	   	
				<xsl:call-template name="blockly.getValue">			
					<xsl:with-param name="value" select="value[contains(@name,$paramInd)]"/>				
				</xsl:call-template>			
			</xsl:variable>					
			<xsl:variable name="valor_convert">		
				<xsl:call-template name="convert_blocks">								
					<xsl:with-param name="value" select="$valor"></xsl:with-param>						
					<xsl:with-param name="from" select="$modeltype"></xsl:with-param>				
					<xsl:with-param name="to" select="$paramType"></xsl:with-param>											
				</xsl:call-template>					
			</xsl:variable>				
			<xsl:value-of select="$valor_convert"/>
			<xsl:if test="$index != $total - 1">
				<xsl:text>, </xsl:text>
			</xsl:if>									
			<xsl:call-template name="listar.params">
				<xsl:with-param name="total" select="$total"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>		
		</xsl:if>		
	</xsl:template>
	
	<xsl:template name="blockly.element.list_simple_service">		
		<xsl:variable name="servicesoap" select="field[@name='service']"/>	
		<xsl:variable name="service" select="substring-before(field[@name='service'],'Soap')"/>	
		<xsl:variable name="daoservice" select="substring-after(field[@name='operdrop'],'//')"/>
		<xsl:variable name="operation" select="substring-after(substring-before(field[@name='operdrop'],'//'),'::')"/>
		<xsl:variable name="totalParams" select="substring-after(substring-before(field[@name='operdrop'],'::'),'$$')"/>
		<xsl:variable name="find" select="field[@name='find']"/>				
		<xsl:variable name="servicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$service"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>
	   	<xsl:variable name="daoservicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$daoservice"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>	     		     	
	   	<xsl:variable name="servicefilter" select="concat($servicelow,'filter')"/>			
	   	<xsl:variable name="params">	
			<xsl:call-template name="listar.params">
				<xsl:with-param name="total" select="$totalParams"/>
			</xsl:call-template>
		</xsl:variable>   	
	   	<xsl:variable name="row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>	
			</xsl:call-template>
		</xsl:variable>		
		<xsl:variable name="code">	
			<xsl:value-of select="$service"/><xsl:text> </xsl:text><xsl:value-of select="$servicelow"/><xsl:text> = new </xsl:text><xsl:value-of select="$service"/><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>List&lt;</xsl:text>
			</xsl:if>			
			<xsl:value-of select="$daoservice"/>		
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>&gt;</xsl:text>
			</xsl:if>			
			<xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>List</xsl:text>
			</xsl:if>
			<xsl:text> = </xsl:text><xsl:value-of select="$servicelow"/><xsl:text>.get</xsl:text><xsl:value-of select="$servicesoap"/><xsl:text>().</xsl:text><xsl:value-of select="$operation"/><xsl:text>(</xsl:text>		
			<xsl:value-of select="$params"/><xsl:text>);</xsl:text> 
			<xsl:value-of select="$newlineTab1"/> 
			<xsl:text>if(</xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>List</xsl:text>
			</xsl:if>						
			<xsl:text> != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>for(</xsl:text><xsl:value-of select="$daoservice"/><xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/><xsl:text> : </xsl:text><xsl:value-of select="$daoservicelow"/><xsl:text>List){</xsl:text>		
			</xsl:if>			
			<xsl:value-of select="$newlineTab1"/>
			<xsl:value-of select="$row"/>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:if test="$find='TODOSS' or $find='limit'">
				<xsl:text>}</xsl:text>
				<xsl:value-of select="$newlineTab1"/>		
			</xsl:if>				
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
		</xsl:variable>		
		<xsl:call-template name="utils.try">
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			<xsl:with-param name="exceptionCode">
				<xsl:text>e.printStackTrace();</xsl:text>
			</xsl:with-param>
		</xsl:call-template>		
	</xsl:template>
	
	<xsl:template name="blockly.element.insert_simple_service">
		<xsl:variable name="servicesoap" select="field[@name='service']"/>	
		<xsl:variable name="service" select="substring-before(field[@name='service'],'Soap')"/>	
		<xsl:variable name="daoservice" select="substring-after(field[@name='operdrop'],'//')"/>
		<xsl:variable name="operation" select="substring-after(substring-before(field[@name='operdrop'],'//'),'::')"/>
		<xsl:variable name="totalParams" select="substring-after(substring-before(field[@name='operdrop'],'::'),'$$')"/>				
		<xsl:variable name="servicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$service"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>
	   	<xsl:variable name="daoservicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$daoservice"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>	     		     	
	   	<xsl:variable name="servicefilter" select="concat($servicelow,'filter')"/>			
	   	<xsl:variable name="params">	
			<xsl:call-template name="listar.params">
				<xsl:with-param name="total" select="$totalParams"/>
			</xsl:call-template>
		</xsl:variable>   	
	   	<xsl:variable name="row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>	
			</xsl:call-template>
		</xsl:variable>		
		<xsl:variable name="code">	
			<xsl:value-of select="$service"/><xsl:text> </xsl:text><xsl:value-of select="$servicelow"/><xsl:text> = new </xsl:text><xsl:value-of select="$service"/><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:value-of select="$daoservice"/>		
			<xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:text> = </xsl:text><xsl:value-of select="$servicelow"/><xsl:text>.get</xsl:text><xsl:value-of select="$servicesoap"/><xsl:text>().</xsl:text><xsl:value-of select="$operation"/><xsl:text>(</xsl:text>		
			<xsl:value-of select="$params"/><xsl:text>);</xsl:text> 
			<xsl:value-of select="$newlineTab1"/> 
			<xsl:text>if(</xsl:text><xsl:value-of select="$daoservicelow"/>									
			<xsl:text> != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"/>		
			<xsl:value-of select="$newlineTab1"/>
			<xsl:value-of select="$row"/>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:value-of select="$daoservicelow" /><xsl:text>.insert();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
		</xsl:variable>		
		<xsl:call-template name="utils.try">
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			<xsl:with-param name="exceptionCode">
				<xsl:text>e.printStackTrace();</xsl:text>
			</xsl:with-param>
		</xsl:call-template>		
	</xsl:template>
	
	<xsl:template name="blockly.element.update_simple_service">
		<xsl:variable name="servicesoap" select="field[@name='service']"/>	
		<xsl:variable name="service" select="substring-before(field[@name='service'],'Soap')"/>	
		<xsl:variable name="daoservice" select="substring-after(field[@name='operdrop'],'//')"/>
		<xsl:variable name="operation" select="substring-after(substring-before(field[@name='operdrop'],'//'),'::')"/>
		<xsl:variable name="totalParams" select="substring-after(substring-before(field[@name='operdrop'],'::'),'$$')"/>				
		<xsl:variable name="servicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$service"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>
	   	<xsl:variable name="daoservicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$daoservice"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>	     		     	
	   	<xsl:variable name="servicefilter" select="concat($servicelow,'filter')"/>			
	   	<xsl:variable name="params">	
			<xsl:call-template name="listar.params">
				<xsl:with-param name="total" select="$totalParams"/>
			</xsl:call-template>
		</xsl:variable>   	
	   	<xsl:variable name="row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>	
			</xsl:call-template>
		</xsl:variable>		
		<xsl:variable name="code">	
			<xsl:value-of select="$service"/><xsl:text> </xsl:text><xsl:value-of select="$servicelow"/><xsl:text> = new </xsl:text><xsl:value-of select="$service"/><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:value-of select="$daoservice"/>		
			<xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:text> = </xsl:text><xsl:value-of select="$servicelow"/><xsl:text>.get</xsl:text><xsl:value-of select="$servicesoap"/><xsl:text>().</xsl:text><xsl:value-of select="$operation"/><xsl:text>(</xsl:text>		
			<xsl:value-of select="$params"/><xsl:text>);</xsl:text> 
			<xsl:value-of select="$newlineTab1"/> 
			<xsl:text>if(</xsl:text><xsl:value-of select="$daoservicelow"/>									
			<xsl:text> != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"/>		
			<xsl:value-of select="$newlineTab1"/>
			<xsl:value-of select="$row"/>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:value-of select="$daoservicelow" /><xsl:text>.update();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
		</xsl:variable>		
		<xsl:call-template name="utils.try">
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			<xsl:with-param name="exceptionCode">
				<xsl:text>e.printStackTrace();</xsl:text>
			</xsl:with-param>
		</xsl:call-template>		
	</xsl:template>
	
	<xsl:template name="blockly.element.apagar_service" >		
	<xsl:variable name="servicesoap" select="field[@name='service']"/>	
		<xsl:variable name="service" select="substring-before(field[@name='service'],'Soap')"/>	
		<xsl:variable name="daoservice" select="substring-after(field[@name='operdrop'],'//')"/>
		<xsl:variable name="operation" select="substring-after(substring-before(field[@name='operdrop'],'//'),'::')"/>
		<xsl:variable name="totalParams" select="substring-after(substring-before(field[@name='operdrop'],'::'),'$$')"/>				
		<xsl:variable name="servicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$service"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>
	   	<xsl:variable name="daoservicelow">	
	       	<xsl:call-template name="LowerCase">    	
	       		<xsl:with-param name="text" select="$daoservice"/>   		
	       	</xsl:call-template>  	
	   	</xsl:variable>	     		     	
	   	<xsl:variable name="servicefilter" select="concat($servicelow,'filter')"/>			
	   	<xsl:variable name="params">	
			<xsl:call-template name="listar.params">
				<xsl:with-param name="total" select="$totalParams"/>
			</xsl:call-template>
		</xsl:variable>   	
	   	<xsl:variable name="row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>	
			</xsl:call-template>
		</xsl:variable>		
		<xsl:variable name="code">	
			<xsl:value-of select="$service"/><xsl:text> </xsl:text><xsl:value-of select="$servicelow"/><xsl:text> = new </xsl:text><xsl:value-of select="$service"/><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:value-of select="$daoservice"/>		
			<xsl:text> </xsl:text><xsl:value-of select="$daoservicelow"/>			
			<xsl:text> = </xsl:text><xsl:value-of select="$servicelow"/><xsl:text>.get</xsl:text><xsl:value-of select="$servicesoap"/><xsl:text>().</xsl:text><xsl:value-of select="$operation"/><xsl:text>(</xsl:text>		
			<xsl:value-of select="$params"/><xsl:text>);</xsl:text> 
			<xsl:value-of select="$newlineTab1"/> 
			<xsl:text>if(</xsl:text><xsl:value-of select="$daoservicelow"/>									
			<xsl:text> != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"/>		
			<xsl:value-of select="$newlineTab1"/>
			<xsl:value-of select="$row"/>
			<xsl:value-of select="$newlineTab2"/>
			<xsl:value-of select="$daoservicelow" /><xsl:text>.delete();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
		</xsl:variable>		
		<xsl:call-template name="utils.try">
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			<xsl:with-param name="exceptionCode">
				<xsl:text>e.printStackTrace();</xsl:text>
			</xsl:with-param>
		</xsl:call-template>		
	</xsl:template>

</xsl:stylesheet>