<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:include href="inc.listar.block.xsl"/>	
	<xsl:include href="inc.separator.block.xsl"/>	
	<xsl:include href="inc.convert.xsl"/>	
	<xsl:include href="inc.formlist.block.xsl"/>	
	<xsl:include href="inc.if.controls.xsl"/>	
	<xsl:include href="inc.default.blocks.xsl"/>
	<xsl:include href="inc.inserir.dao.xsl"/>	
	<xsl:include href="inc.simples_dao.xsl"/>	
	<xsl:include href="inc.set_get.model.xsl"/>	
	<xsl:include href="inc.set_get.dao.xsl"/>	
	<xsl:include href="inc.set_get.service.xsl"/>
	<xsl:include href="inc.grafico.xsl"/>
	<xsl:include href="inc.helpers.xsl"/>	
	<xsl:include href="inc.services.xsl"/>	
	<xsl:include href="inc.return.report.xsl"/>	
	<xsl:include href="inc.statbox.xsl"/>	
	<xsl:include href="inc.select.xsl"/>
	<xsl:include href="inc.vertical.tree.menu.xsl"/>
	<xsl:include href="inc.circle.statbox.xsl"/>		
	
	<xsl:template name="blockly.element.controller">	
		<xsl:call-template name="blockly.getValue">
			<xsl:with-param name="value" select="statement"></xsl:with-param>			
			<xsl:with-param name="startEndCode" select="true()"></xsl:with-param>		
		</xsl:call-template>	
	</xsl:template>	
	
	
	<xsl:template name="blockly.element.core">	
		<xsl:variable name="core_value">		
			<xsl:call-template name="utils.core.meaning">			
				<xsl:with-param name="key" select="field[@name='CORE_FUNCTION']"/>				
			</xsl:call-template>			
		</xsl:variable>			
		<xsl:value-of select="$core_value"></xsl:value-of>		
	</xsl:template>
					
	<xsl:template name="blockly.element.index_editar" >		
		<xsl:variable name="dao" select="field[@name='dao']"/>		
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
	   	<xsl:variable name="edicao">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
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
		<xsl:variable name="code_edit">	
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>try{</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>if (Core.isNotNull(isEdit)) {</xsl:text>			
			<xsl:choose>			
				<xsl:when test="$mutation > 0">				
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>					
					<xsl:value-of select="$andWheres"/>					
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = </xsl:text><xsl:value-of select="$daofilter"></xsl:value-of><xsl:text>.one();</xsl:text>	
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="$newlineTab2"/>			
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().findOne(</xsl:text><xsl:value-of select="$edited_convert"/><xsl:text>);</xsl:text>						
				</xsl:otherwise>				
			</xsl:choose>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>if (</xsl:text><xsl:value-of select="$daolow"/><xsl:text>!=null &amp;&amp; !</xsl:text><xsl:value-of select="$daolow"/><xsl:text>.hasError()) {</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:value-of select="$edicao"></xsl:value-of>		
			<xsl:value-of select="$newlineTab2"></xsl:value-of>		
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>}catch ( Exception e ) {</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>e.printStackTrace();</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>}</xsl:text> 			
		</xsl:variable>		
		<xsl:value-of select="$code_edit"></xsl:value-of>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.index_view" >		
		<xsl:variable name="dao" select="field[@name='dao']"/>		
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
		<xsl:variable name="button" select="field[@name='button']"/>	   	
	   	<xsl:variable name="edicao">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value2']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="param">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='param_id']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="edit_pa">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='get_pa']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="param_id_type" select="substring-before(value[@name='get_pa']/block/field,'::')"/>		
		<xsl:variable name="param_convert">		
			<xsl:call-template name="convert_blocks">									
				<xsl:with-param name="value" select="$edit_pa"></xsl:with-param>						
				<xsl:with-param name="from" select="$param_id_type"></xsl:with-param>				
				<xsl:with-param name="to" select="'Integer'"></xsl:with-param>															
			</xsl:call-template>					
		</xsl:variable>		
		<xsl:variable name="code_edit">		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>					
			<xsl:text>try{</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:choose>			
				<xsl:when test="$mutation > 0">				
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>					
					<xsl:value-of select="$andWheres"/>					
					<xsl:value-of select="$newlineTab2"/>					
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = </xsl:text><xsl:value-of select="$daofilter"></xsl:value-of><xsl:text>.one();</xsl:text>	
				</xsl:when>				
				<xsl:otherwise>				
					<xsl:value-of select="$newlineTab2"/>				
					<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().findOne(</xsl:text><xsl:value-of select="$param_convert"/><xsl:text>);</xsl:text>						
				</xsl:otherwise>				
			</xsl:choose>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>if (</xsl:text><xsl:value-of select="$daolow"/><xsl:text>!=null &amp;&amp; !</xsl:text><xsl:value-of select="$daolow"/><xsl:text>.hasError()) {</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:value-of select="$edicao"></xsl:value-of>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>}</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>				
			<xsl:text>}catch ( Exception e ) {</xsl:text>			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>			
			<xsl:text>e.printStackTrace();</xsl:text>			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>			
			<xsl:text>}</xsl:text> 			
		</xsl:variable>		
		<xsl:value-of select="$code_edit"></xsl:value-of>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.editar_dao" >				
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>this.addQueryString("isEdit", "true");</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.enviar_p" >	
		<xsl:variable name="paramkey" select="field[@name='iskey']"/>				
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>this.addQueryString("p_</xsl:text><xsl:value-of select="$paramkey"/><xsl:text>", Core.getParam("p_</xsl:text><xsl:value-of select="$paramkey"/><xsl:text>"));</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.param_dao" >	
		<xsl:variable name="param" select="field[@name='param']"/>		
		<xsl:variable name="valor">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='dao_field']"/>				
			</xsl:call-template>			
		</xsl:variable>				
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>this.addQueryString("p_</xsl:text><xsl:value-of select="$param"/><xsl:text>",</xsl:text><xsl:value-of select="$valor"/><xsl:text>);</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.rediret_p" >		
		<xsl:variable name="paramget" select="field[@name='param']"/>		
		<xsl:variable name="button" select="field[@name='button']"/>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"/><xsl:text>.addParameter("p_</xsl:text><xsl:value-of select="$paramget"/><xsl:text>", Core.getParam("p_</xsl:text><xsl:value-of select="$paramget"/><xsl:text>"));</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.send_par_dao" >		
		<xsl:variable name="paramget" select="field[@name='param']"/>		
		<xsl:variable name="button" select="field[@name='button']"/>		
		<xsl:variable name="valor">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='dao_field']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:value-of select="$newlineTab1"></xsl:value-of>	
		<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"/><xsl:text>.addParameter("p_</xsl:text><xsl:value-of select="$paramget"/><xsl:text>", </xsl:text><xsl:value-of select="$valor"/><xsl:text>);</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.custom_return" >		
		<xsl:variable name="return" select="field[@name='return']"/>		
		<xsl:variable name="page" select="field[@name='page']"/>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>return this.</xsl:text><xsl:value-of select="$return"/><xsl:text>("</xsl:text><xsl:value-of select="$app-title"/><xsl:text>","</xsl:text><xsl:value-of select="$page"/><xsl:text>","index",this.queryString());</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.add_isedit" >
		<xsl:variable name="button" select="field[@name='button']"/>				
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"/><xsl:text>.addParameter("isEdit", "true");</xsl:text>		
	</xsl:template>	
	
	<xsl:template name="blockly.element.dao_obj" >	
		<xsl:variable name="dao" select="field[@name='dao']"/>		
		<xsl:variable name="daolow">	
	       	<xsl:call-template name="LowerCase">       	
	       		<xsl:with-param name="text" select="$dao"/>	       		
	       	</xsl:call-template>	       	
		</xsl:variable>
		<xsl:value-of select="$daolow"/>	
	</xsl:template>
	
	<xsl:template name="blockly.element.dao_count" >	
		<xsl:variable name="dao" select="field[@name='dao']"/>		
		<xsl:variable name="daolow">		
	       	<xsl:call-template name="LowerCase">	       	
	       		<xsl:with-param name="text" select="$dao"/>	       		
	       	</xsl:call-template>	       	
		</xsl:variable>		
		<xsl:variable name="double_quotes">"</xsl:variable>
		<xsl:value-of select="$double_quotes"/><xsl:value-of select="$double_quotes"/><xsl:value-of select="concat('+total_',$daolow)"/>	
	</xsl:template>
	
	<xsl:template name="blockly.element.core_get_param" >		
		<xsl:variable name="paramget" select="field[@name='param']"/>
		<xsl:text>Core.getParamInt("p_</xsl:text><xsl:value-of select="$paramget"></xsl:value-of><xsl:text>")</xsl:text>		
	</xsl:template>
	
	<xsl:template name="blockly.element.set_custom_line" >	
		<xsl:variable name="valor">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='value1']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="paramget" select="field[@name='param']"/>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>				
		<xsl:value-of select="$paramget"></xsl:value-of><xsl:value-of select="$valor"></xsl:value-of>			
	</xsl:template>
	
	<xsl:template name="blockly.element.comment_code" >	
		<xsl:variable name="valor">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value1']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>		
		<xsl:text>/*</xsl:text>		
		<xsl:value-of select="$valor"></xsl:value-of>		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>			
		<xsl:text>*/</xsl:text>				
	</xsl:template>
	
	<xsl:template name="blockly.element.get_custom_line" >	
		<xsl:variable name="valor">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='value1']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="paramget" select="field[@name='param']"/>		
		<xsl:value-of select="$paramget"></xsl:value-of><xsl:value-of select="$valor"></xsl:value-of>		
	</xsl:template>
	
	<xsl:template name="blockly.element.instance_dao" >		
		<xsl:variable name="dao" select="field[@name='dao']"/>		
		<xsl:variable name="daolow">		
	       	<xsl:call-template name="LowerCase">	       	
	       		<xsl:with-param name="text" select="$dao"/>	       		
	       	</xsl:call-template>	       	
		</xsl:variable>		
		<xsl:variable name="findone">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='findone']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="code">		
		<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>()</xsl:text>		
		<xsl:choose>		
			<xsl:when  test="$findone != ''">			
				<xsl:text>.findOne(</xsl:text><xsl:value-of select="$findone"></xsl:value-of><xsl:text>);</xsl:text>				
			</xsl:when>			
			<xsl:otherwise>			
				<xsl:text>;</xsl:text>				
			</xsl:otherwise>			
		</xsl:choose>		
		</xsl:variable>		
		<xsl:value-of select="$code"></xsl:value-of>		
	</xsl:template>

	<xsl:template name="blockly.element.checkbox_table" >	
		<xsl:variable name="checkbox" select="field[@name='checkbox']"/>		
		<xsl:variable name="unsel" select="field[@name='UNSEL']"/>		
	   	<xsl:variable name="selecteds">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="statement[@name='value_selected']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:variable name="unselecteds">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="statement[@name='value_unselected']"/>				
			</xsl:call-template>			
		</xsl:variable>		
		<xsl:value-of select="$newlineTab1"/>				
		<xsl:text>try{</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>		
		<xsl:text>CheckBoxHelper cb = Core.extractCheckBox(view.</xsl:text><xsl:value-of select="$checkbox"/><xsl:text>);</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>				
		<xsl:text>List&lt;String&gt; selecteds = cb.getChekedIds();</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>		
		<xsl:text>for(String checks : selecteds){</xsl:text>		
 		<xsl:value-of select="$selecteds"/> 		
		<xsl:value-of select="$newlineTab2"/>				
		<xsl:text>}</xsl:text>		
		<xsl:choose>		
			<xsl:when test="$unsel = 'TRUE'">
				<xsl:value-of select="$newlineTab2"/>			
				<xsl:text>List&lt;String&gt; unselecteds = cb.getUncheckedIds();</xsl:text>				
				<xsl:value-of select="$newlineTab2"/>			
				<xsl:text>for(String unchecks : unselecteds){</xsl:text>				
		 		<xsl:value-of select="$unselecteds"/> 				
				<xsl:value-of select="$newlineTab2"/>						
				<xsl:text>}</xsl:text>				
			</xsl:when>	
		</xsl:choose>		
		<xsl:value-of select="$newlineTab1"/>				
		<xsl:text>}catch ( Exception e ) {</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>		
		<xsl:text>e.printStackTrace();</xsl:text>		
		<xsl:value-of select="$newlineTab2"/>		
		<xsl:text>Core.setMessageError("Error: "+ e.getMessage());</xsl:text>		
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>}</xsl:text>			
	</xsl:template>
	
	<xsl:template name="blockly.element.checkss" >	
		<xsl:variable name="check_sel" select="substring-after(field,'::')"/>				
		<xsl:value-of select="$check_sel"/>	
	</xsl:template>
		
	<xsl:template name="blockly.element.custom.global">		
		<xsl:variable name="hasLinkField" select="//*[contains(field,'Link::')]"></xsl:variable>		
		<xsl:if test="$hasLinkField[1]">	
		</xsl:if>		
	</xsl:template>
	
	<xsl:template name="blockly.element">	
		<xsl:param name="element" select="."/>		
		<xsl:param name="parent"/>		
		<xsl:variable name="block-type" select="$element/@type"/>
		
		<xsl:choose>			
			<xsl:when test="$block-type = 'logic_operation'">			
				<xsl:call-template name="blockly.element.logic_operation"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'logic_compare'">			
				<xsl:call-template name="blockly.element.logic_compare"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'logic_boolean'">			
				<xsl:call-template name="blockly.element.logic_boolean"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'logic_negate'">			
				<xsl:call-template name="blockly.element.logic_negate"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'tentar'">			
				<xsl:call-template name="blockly.element.tentar"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'logic_null'">			
				<xsl:call-template name="blockly.element.logic_null"></xsl:call-template>				
			</xsl:when>				
			<xsl:when test="$block-type = 'controls_if'">			
				<xsl:call-template name="blockly.element.controls_if"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'controls_repeat_ext'">			
				<xsl:call-template name="blockly.element.controls_repeat_ext"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'math_number'">			
				<xsl:call-template name="blockly.element.math_number"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'controls_whileUntil'">			
				<xsl:call-template name="blockly.element.controls_whileUntil"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'controls_flow_statements'">		
				<xsl:call-template name="blockly.element.controls_flow_statements"></xsl:call-template>			
			</xsl:when>
			<xsl:when test="$block-type = 'math_arithmetic'">			
				<xsl:call-template name="blockly.element.math_arithmetic"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'text'">			
				<xsl:call-template name="blockly.element.text"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'controls_for'">			
				<xsl:call-template name="blockly.element.controls_for"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'text_print'">			
				<xsl:call-template name="blockly.element.text_print"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'controller'">		
				<xsl:call-template name="blockly.element.controller"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains( $block-type,'get-dao-' )">			
				<xsl:call-template name="blockly.element.getDao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains( $block-type,'set-dao-' )">			
				<xsl:call-template name="blockly.element.setDao"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains( $block-type,'get-service-' )">			
				<xsl:call-template name="blockly.element.getService"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains( $block-type,'set-service-' )">			
				<xsl:call-template name="blockly.element.setService"></xsl:call-template>				
			</xsl:when>				
			<xsl:when test="$block-type = 'inserir_dao'">			
				<xsl:call-template name="blockly.element.inserir_dao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'save_formu_')">			
				<xsl:call-template name="blockly.element.inserir_dao"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'editar_dao'">			
				<xsl:call-template name="blockly.element.editar_dao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'index_editar'">			
				<xsl:call-template name="blockly.element.index_editar"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'formuu_')">			
				<xsl:call-template name="blockly.element.index_editar"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'vieww_')">			
				<xsl:call-template name="blockly.element.index_view"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'get_model'">			
				<xsl:call-template name="blockly.element.get_model"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'mod_form')">			
				<xsl:call-template name="blockly.element.get_model"></xsl:call-template>
			</xsl:when>			
			<xsl:when test="contains($block-type, 'mod_view')">			
				<xsl:call-template name="blockly.element.get_model"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'set_model'">		
				<xsl:call-template name="blockly.element.set_model"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'model_form_')">		
				<xsl:call-template name="blockly.element.set_model"></xsl:call-template>			
			</xsl:when>			
			<xsl:when test="contains( $block-type,'core_fun' )">			
				<xsl:call-template name="blockly.element.core"></xsl:call-template>				
			</xsl:when>					
			<xsl:when test="$block-type = 'enviar_p'">		
				<xsl:call-template name="blockly.element.enviar_p"></xsl:call-template>				
			</xsl:when>		
			<xsl:when test="$block-type = 'param_dao'">			
				<xsl:call-template name="blockly.element.param_dao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'rediret_p'">			
				<xsl:call-template name="blockly.element.rediret_p"></xsl:call-template>			
			</xsl:when>		
			<xsl:when test="$block-type = 'send_par_dao'">			
				<xsl:call-template name="blockly.element.send_par_dao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'custombutton'">			
				<xsl:call-template name="blockly.element.custom_return"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'listar_')">			
				<xsl:call-template name="blockly.element.listar"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains($block-type, 'listartre_')">			
				<xsl:call-template name="blockly.element.listar"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains( $block-type,'rowtable' )">			
				<xsl:call-template name="blockly.element.row"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'fill_combo'">		
				<xsl:call-template name="blockly.element.fill_combo"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'option_combo'">			
				<xsl:call-template name="blockly.element.option_combo">				
					<xsl:with-param name="parent" select="$parent"></xsl:with-param>					
				</xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'combo_dao'">			
				<xsl:call-template name="blockly.element.combo_dao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'option_dao'">			
				<xsl:call-template name="blockly.element.option_dao">				
					<xsl:with-param name="parent" select="$parent"></xsl:with-param>					
				</xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains( $block-type,'separator_')">			
				<xsl:call-template name="blockly.element.separator"></xsl:call-template>			
			</xsl:when>		
			<xsl:when test="contains( $block-type,'save_sepator_')">		
				<xsl:call-template name="blockly.element.save_separator"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains( $block-type,'sep_row_')">			
				<xsl:call-template name="blockly.element.sep_row"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'get_row_sep_')">		
				<xsl:call-template name="blockly.element.get_row_sep"></xsl:call-template>			
			</xsl:when>		
			<xsl:when test="contains($block-type,'forrmlist_')">			
				<xsl:call-template name="blockly.element.formlist"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'save_forlist_')">			
				<xsl:call-template name="blockly.element.save_formlist"></xsl:call-template>				
			</xsl:when>				
			<xsl:when test="contains($block-type, 'get_row_form_')">			
				<xsl:call-template name="blockly.element.get_row_sep"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'core_get_param'">			
				<xsl:call-template name="blockly.element.core_get_param"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'grafico_')">			
				<xsl:call-template name="blockly.element.grafico"></xsl:call-template>				
			</xsl:when>		
			<xsl:when test="$block-type = 'add_isedit'">			
				<xsl:call-template name="blockly.element.add_isedit"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'instance_dao'">			
				<xsl:call-template name="blockly.element.instance_dao"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'dao_obj'">			
				<xsl:call-template name="blockly.element.dao_obj"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'set_custom_line'">			
				<xsl:call-template name="blockly.element.set_custom_line"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'get_custom_line'">			
				<xsl:call-template name="blockly.element.get_custom_line"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'comment_code'">			
				<xsl:call-template name="blockly.element.comment_code"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'list_simple_dao'">			
				<xsl:call-template name="blockly.element.list_simple_dao"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'insert_simple_dao'">		
				<xsl:call-template name="blockly.element.insert_simple_dao"></xsl:call-template>			
			</xsl:when>					
			<xsl:when test="$block-type = 'update_simple_dao'">		
				<xsl:call-template name="blockly.element.update_simple_dao"></xsl:call-template>			
			</xsl:when>
			<xsl:when test="$block-type = 'apagar'">		
				<xsl:call-template name="blockly.element.apagar"></xsl:call-template>				
			</xsl:when>				
			<xsl:when test="$block-type = 'EixoX'">			
				<xsl:call-template name="blockly.element.eixo_x"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'EixoY_Z'">		
				<xsl:call-template name="blockly.element.eixo_y_z"></xsl:call-template>			
			</xsl:when>			
			<xsl:when test="$block-type = 'EixoY'">		
				<xsl:call-template name="blockly.element.eixo_y"></xsl:call-template>			
			</xsl:when>			
			<xsl:when test="$block-type = 'EixoZ'">			
				<xsl:call-template name="blockly.element.eixo_z"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'checkbox_table'">			
				<xsl:call-template name="blockly.element.checkbox_table"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'checkss'">			
				<xsl:call-template name="blockly.element.checkss"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'sttbox_')">			
				<xsl:call-template name="blockly.element.statbox"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="contains($block-type, 'statfields_')">		
				<xsl:call-template name="blockly.element.statfields"></xsl:call-template>				
			</xsl:when>			
			<xsl:when test="$block-type = 'dao_count'">			
				<xsl:call-template name="blockly.element.dao_count"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'set_visible'">			
				<xsl:call-template name="blockly.element.set_visible"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'set_visible_row'">			
				<xsl:call-template name="blockly.element.set_visible_row"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'set_readonly'">			
				<xsl:call-template name="blockly.element.set_readonly"></xsl:call-template>				
			</xsl:when>		
			<xsl:when test="$block-type = 'set_disabled'">			
				<xsl:call-template name="blockly.element.set_disabled"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'set_label'">			
				<xsl:call-template name="blockly.element.set_label"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'set_title'">			
				<xsl:call-template name="blockly.element.set_title"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="contains($block-type, 'lstar_service_')">		
				<xsl:call-template name="blockly.element.listar_service"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'list_simple_service'">			
				<xsl:call-template name="blockly.element.list_simple_service"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'insert_simple_service'">		
				<xsl:call-template name="blockly.element.insert_simple_service"></xsl:call-template>			
			</xsl:when>					
			<xsl:when test="$block-type = 'update_simple_service'">		
				<xsl:call-template name="blockly.element.update_simple_service"></xsl:call-template>			
			</xsl:when>
			<xsl:when test="$block-type = 'apagar_service'">		
				<xsl:call-template name="blockly.element.apagar_service"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'custombutReport'">		
				<xsl:call-template name="blockly.element.custombutReport"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'concaty'">		
				<xsl:call-template name="blockly.element.concaty"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'set_sepator'">		
				<xsl:call-template name="blockly.element.set_sepator"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'set_remote'">		
				<xsl:call-template name="blockly.element.set_remote"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'set_properties'">		
				<xsl:call-template name="blockly.element.set_properties"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="contains($block-type, 'verticalmenu_')">		
				<xsl:call-template name="blockly.element.verticalmenu"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains($block-type, 'set_title_vertical')">		
				<xsl:call-template name="blockly.element.set_title_vertical"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains($block-type, 'set_app_page')">		
				<xsl:call-template name="blockly.element.set_app_page"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains($block-type, 'set_app_params')">		
				<xsl:call-template name="blockly.element.set_app_params"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="contains($block-type, 'set_app_target')">		
				<xsl:call-template name="blockly.element.set_app_target"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="contains($block-type, 'set_app_icon')">		
				<xsl:call-template name="blockly.element.set_app_icon"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains($block-type, 'get_row_tree_')">		
				<xsl:call-template name="blockly.element.get_row_tree"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'getrowStartEnd'">	
				<xsl:call-template name="blockly.element.getrowStartEnd"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="contains($block-type, 'circle_statbox_')">	
				<xsl:call-template name="blockly.element.circle_stat_box"></xsl:call-template>				
			</xsl:when>	
			<xsl:when test="$block-type = 'filterr'">	
				<xsl:call-template name="blockly.element.filterr"></xsl:call-template>				
			</xsl:when>
			<xsl:when test="$block-type = 'core_fn_link'">	
				<xsl:call-template name="blockly.element.core_fn_link"></xsl:call-template>				
			</xsl:when>																							
			<xsl:otherwise>			
				<xsl:text>Block not found</xsl:text>				
			</xsl:otherwise>		
		</xsl:choose>		
		<xsl:if test="$element/next">	
			<xsl:value-of select="$newlineTab1"/>		
			<xsl:call-template name="blockly.elements">			
				<xsl:with-param name="parent" select="$parent"/>				
				<xsl:with-param name="elements" select="$element/next/*"/>				
			</xsl:call-template>			
		</xsl:if>			
	</xsl:template>	
	<xsl:template name="blockly.elements">
		<xsl:param name="elements"/>		
		<xsl:param name="parent"/>		
		<xsl:param name="startEndCode" select="false()"/>		

		<xsl:for-each select="$elements">		
			<xsl:variable name="name_action" select="../@name"/>			
			<xsl:if test="$startEndCode">			
			<xsl:text>/* Start-Code-Block (</xsl:text><xsl:value-of select="$name_action"></xsl:value-of><xsl:text>) */</xsl:text>			
			<xsl:value-of select="$newline"></xsl:value-of>			
			</xsl:if>			
			<xsl:call-template name="blockly.element">			
				<xsl:with-param name="parent" select="$parent"/>				
			</xsl:call-template>			
			<xsl:if test="$startEndCode">		
				<xsl:text>/* End-Code-Block */</xsl:text>			
				<xsl:value-of select="$newline"></xsl:value-of>			
				<xsl:value-of select="$newline"></xsl:value-of>			
			</xsl:if>			
		</xsl:for-each>
	</xsl:template>	
</xsl:stylesheet>