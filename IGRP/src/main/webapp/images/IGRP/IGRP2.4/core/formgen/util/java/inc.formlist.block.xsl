<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="blockly.element.formlist" >	
		<xsl:variable name="table" select="substring-after(@type,'forrmlist_')"/>
		<xsl:variable name="mutation" select="mutation/@count"/>		
		<xsl:variable name="dao_form" select="field[@name='dao']"/>	
			
		<xsl:variable name="daolow">		
	       	<xsl:call-template name="LowerCase">	       	
	       		<xsl:with-param name="text" select="$dao_form"/>	       		
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
		
		<xsl:variable name="table_up">		
	       	<xsl:call-template name="InitCap">	       	
	       		<xsl:with-param name="text" select="$table"/>	       		
	       	</xsl:call-template>	       	
	   	</xsl:variable>
	   	
	   	<xsl:variable name="sep_row">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
			</xsl:call-template>			
		</xsl:variable>
	
		<xsl:variable name="code">		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>					
			<xsl:text>try{</xsl:text>		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:value-of select="$dao_form"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao_form"/><xsl:text>().find();</xsl:text>			
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:value-of select="$andWheres"/>			
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao_form"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$daolow"/><xsl:text>List = </xsl:text><xsl:value-of select="$daofilter"/><xsl:text>.all();</xsl:text>			
			<xsl:value-of select="$newlineTab1"/>			
			<xsl:text>if ( Core.isNotNull(</xsl:text><xsl:value-of select="$daolow"/><xsl:text>List) ) {</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>List &lt;</xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>&gt; </xsl:text><xsl:text> separatorlistDocs =new ArrayList&lt;&gt;(); </xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:value-of select="$daolow"/><xsl:text>List.forEach(</xsl:text><xsl:value-of select="$daolow"/><xsl:text> -> {</xsl:text> 			
			<xsl:value-of select="$newlineTab4"></xsl:value-of>			
			<xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text> row = new </xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>();</xsl:text>			
			<xsl:value-of select="concat($newlineTab4,$sep_row)"></xsl:value-of>			
			<xsl:value-of select="$newlineTab4"></xsl:value-of>			
			<xsl:text>separatorlistDocs.add(row);</xsl:text>			 
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>});</xsl:text> 			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>model.set</xsl:text><xsl:value-of select="$table_up"/> <xsl:text>( separatorlistDocs);</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>}catch ( Exception e ) {</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>e.printStackTrace();</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>}</xsl:text> 			
		</xsl:variable>		
		<xsl:value-of select="$code"></xsl:value-of>
	</xsl:template>
	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.save_formlist" >	
		<xsl:variable name="table" select="substring-after(@type,'save_forlist_')"/>	
		<xsl:variable name="dao_sep" select="field[@name='dao']"/>	
				
		<xsl:variable name="daolow">		
	       	<xsl:call-template name="LowerCase">	       	
	       		<xsl:with-param name="text" select="$dao_sep"/>	       		
	       	</xsl:call-template>	       	
		</xsl:variable>
		
		<xsl:variable name="typedad" select="../../@type"/>		
		<xsl:variable name="table_up">		
	       	<xsl:call-template name="InitCap">	       	
	       		<xsl:with-param name="text" select="$table"/>	       		
	       	</xsl:call-template>	       	
	   	</xsl:variable>
	   	
	   	<xsl:variable name="sep_insercao">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
			</xsl:call-template>			
		</xsl:variable>
		
		<xsl:variable name="edited">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='edited']"/>				
			</xsl:call-template>			
		</xsl:variable>
		
		<xsl:variable name="valueblock" select="substring-after(value[@name='edited']/block/field,'::')"/> 		
		<xsl:variable name="type_childblock" select="substring-before(value[@name='edited']/block/field,'::')"/>		
		<xsl:variable name="block_namechild" select="value[@name='edited']/block/@type"/>
				
		<xsl:variable name="edited_convert">		
			<xsl:call-template name="utils.edited">				
				<xsl:with-param name="value" select="$edited"></xsl:with-param>				
				<xsl:with-param name="valueblock" select="$valueblock"></xsl:with-param>				
				<xsl:with-param name="from" select="$type_childblock"></xsl:with-param>				
				<xsl:with-param name="to" select="'Integer'"></xsl:with-param>			
				<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>				
			</xsl:call-template>					
		</xsl:variable>
	
		<xsl:variable name="code">		
			<xsl:choose>				
				<xsl:when test="$typedad != 'inserir_dao' and not(contains($typedad,'save_formu_')) ">				
					<xsl:call-template name="utils.session.begin">						
					</xsl:call-template>					
				</xsl:when>					
			</xsl:choose>		

			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>for ( </xsl:text>			
			<xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text> row : model.get</xsl:text><xsl:value-of select="$table_up"/><xsl:text>()){</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:value-of select="$dao_sep"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>();</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>if(Core.isNotNullOrZero( </xsl:text><xsl:value-of select="$edited"/><xsl:text>)){</xsl:text>			
			<xsl:value-of select="$newlineTab5"></xsl:value-of>			
			<xsl:value-of select="$daolow"/><xsl:text> = session.find(</xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>.class, </xsl:text><xsl:value-of select="$edited_convert"/><xsl:text>);</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="concat($newlineTab3,$sep_insercao)"></xsl:value-of> 			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>session.persist(</xsl:text><xsl:value-of select="$daolow"/><xsl:text>);</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>}</xsl:text>
			
			<xsl:choose>			
				<xsl:when test="not(contains($edited, 'row.get'))">				
					<xsl:value-of select="$newlineTab1"></xsl:value-of>					
					<xsl:text>if(Core.isNotNullOrZero( </xsl:text><xsl:value-of select="$edited"/><xsl:text>)){</xsl:text>				
				</xsl:when>					
			</xsl:choose>

			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>String [] </xsl:text><xsl:value-of select="$daolow"/><xsl:text>deletedIdsArray = model.getP_</xsl:text><xsl:value-of select="$table"/><xsl:text>_del();</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>if ( Core.isNotNull( </xsl:text><xsl:value-of select="$daolow"/><xsl:text>deletedIdsArray ) ) {</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>for ( String docId : </xsl:text><xsl:value-of select="$daolow"/><xsl:text>deletedIdsArray ) {</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>if ( Core.isNotNull( docId ) &amp;&amp; !docId.isEmpty() ) {</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:value-of select="$dao_sep"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = session.find(</xsl:text><xsl:value-of select="$dao_sep"/><xsl:text>.class, Core.toInt(docId));</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>session.delete(</xsl:text><xsl:value-of select="$daolow"></xsl:value-of><xsl:text>);</xsl:text>		
			<xsl:value-of select="$newlineTab3"></xsl:value-of>			
			<xsl:text>}</xsl:text>		
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>}</xsl:text>
			
			<xsl:choose>			
				<xsl:when test="not(contains($edited, 'row.get'))">				
					<xsl:value-of select="$newlineTab1"></xsl:value-of>				
					<xsl:text>}</xsl:text>				
				</xsl:when>					
			</xsl:choose>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:choose>				
				<xsl:when test="$typedad != 'inserir_dao' and not(contains($typedad,'save_formu_')) ">				
					<xsl:call-template name="utils.session.end">							
					</xsl:call-template>					
				</xsl:when>		
			</xsl:choose>		
		</xsl:variable>		
		<xsl:value-of select="$code"></xsl:value-of>		
	</xsl:template>	
</xsl:stylesheet>
		