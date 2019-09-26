<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="inc.listar.block.xsl"/>
	
	<xsl:include href="inc.separator.block.xsl"/>
	
	<xsl:include href="inc.convert.xsl"/>
	
	<xsl:include href="inc.formlist.block.xsl"/>
	
	<xsl:include href="inc.if.controls.xsl"/>
	
	<xsl:include href="inc.default.blocks.xsl"/>
	
	<xsl:include href="inc.inserir.dao.xsl"/>
	
	<xsl:template name="blockly.element.controller">
		
		<xsl:call-template name="blockly.getValue">
			<xsl:with-param name="value" select="statement"></xsl:with-param>
			<xsl:with-param name="startEndCode" select="true()"></xsl:with-param>
		</xsl:call-template>

	</xsl:template>
	
	<xsl:template name="blockly.element.row">
	
		<xsl:variable name="rowType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="rowvaluechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="rowtypeneto" select="substring-before(value[@name='fields_model']/block/value[@name='value1']/block/field,'::')"/>
		
		<xsl:variable name="rowValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="nameCap">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$rowValue"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="valorA">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='fields_model']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="rowset">
		
			<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
			<xsl:text>(</xsl:text>
				<xsl:call-template name="convert_blocks">
					<xsl:with-param name="value" select="$valorA"></xsl:with-param>
					<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>
					<xsl:with-param name="to" select="$rowType"></xsl:with-param>
					<xsl:with-param name="neto" select="$rowtypeneto"></xsl:with-param>
					<xsl:with-param name="valuechild" select="$rowvaluechild"></xsl:with-param>
				</xsl:call-template>
			<xsl:text>);</xsl:text>
			
		</xsl:variable>
		
		<xsl:value-of select="$rowset"></xsl:value-of>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.model_get">
		
		<xsl:variable name="fieldType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="fieldValue" select="substring-after(field,'::')"/>
		
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
	
	<xsl:template name="blockly.element.model_set">
		
		<xsl:variable name="modelType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="modelValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="modeltypechild" select="substring-before(value[@name='value1']/block/field,'::')"/>
		
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
		
		<xsl:variable name="modelset">
		
			<xsl:text>model.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
			<xsl:text>(</xsl:text>
				<xsl:call-template name="convert_blocks">
					<xsl:with-param name="value" select="$setting"></xsl:with-param>
					<xsl:with-param name="from" select="$modeltypechild"></xsl:with-param>
					<xsl:with-param name="to" select="$modelType"></xsl:with-param>
					<xsl:with-param name="neto" select="neto"></xsl:with-param>
					<xsl:with-param name="valuechild" select="$modelValue"></xsl:with-param>
				</xsl:call-template>
			<xsl:text>);</xsl:text>
			
		</xsl:variable>
		
		<xsl:value-of select="$modelset"></xsl:value-of>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.getDao">
	
		<xsl:variable name="dad" select="../../field"/>
		
		<xsl:variable name="typedad" select="substring-before($dad,'::')"/>
		
		<xsl:variable name="fieldType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="fieldValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="nameCap">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$fieldValue"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="otherdao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value1']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="otherdao2">
			
			<xsl:call-template name="replace-all">
			
				<xsl:with-param name="text" select="$otherdao"/>
				
				<xsl:with-param name="replace" select="'obj'"/>
				
				<xsl:with-param name="by" select="''"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
			<xsl:text>obj.get</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>()</xsl:text>
			<xsl:value-of select="$otherdao2"/>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.setDao">
		
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
				
				<xsl:when test="contains( $childblocktype,'param_foreign' )" >
				
					<xsl:variable name="valorparam">
						<xsl:call-template name="blockly.getValue">
							<xsl:with-param name="value" select="value[@name='value1']/block/value[@name='value1']"/>
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:variable name="type_param" select="substring-before(value/block/value/block/field,'::')"/>
					
					<xsl:variable name="paramlow">
				       	<xsl:call-template name="LowerCase">
				       		<xsl:with-param name="text" select="$fieldType"/>
				       	</xsl:call-template>
				   	</xsl:variable>
				   	
				   	<xsl:choose>
				   	
				   	<xsl:when test="$type_param != 'Integer'">
					   	<xsl:value-of select="$fieldType"></xsl:value-of><xsl:text> </xsl:text>
						<xsl:value-of select="$paramlow"></xsl:value-of><xsl:text> = session.find(</xsl:text><xsl:value-of select="$fieldType"></xsl:value-of>
						<xsl:text>.class, Core.toInt(</xsl:text><xsl:value-of select="$valorparam"></xsl:value-of><xsl:text>));</xsl:text>
						<xsl:value-of select="$newlineTab1"></xsl:value-of>
						<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$paramlow"></xsl:value-of><xsl:text>);</xsl:text>
					</xsl:when>
					
					<xsl:otherwise>
						<xsl:value-of select="$fieldType"></xsl:value-of><xsl:text> </xsl:text>
						<xsl:value-of select="$paramlow"></xsl:value-of><xsl:text> = session.find(</xsl:text><xsl:value-of select="$fieldType"></xsl:value-of>
						<xsl:text>.class, </xsl:text><xsl:value-of select="$valorparam"></xsl:value-of><xsl:text>);</xsl:text>
						<xsl:value-of select="$newlineTab1"></xsl:value-of>
						<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$paramlow"></xsl:value-of><xsl:text>);</xsl:text>
					</xsl:otherwise>
				   	
				   	</xsl:choose>
		
				
				</xsl:when>
					
				<xsl:otherwise>
				
					<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/>
						<xsl:text>(</xsl:text>
							<xsl:call-template name="convert_blocks">
								<xsl:with-param name="value" select="$valorA"></xsl:with-param>
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
	
	<xsl:template name="blockly.element.core">
	
		<xsl:variable name="core_set">
			<xsl:call-template name="utils.core.meaning">
				<xsl:with-param name="key" select="field[@name='core_set']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="core_get">
			<xsl:call-template name="utils.core.meaning">
				<xsl:with-param name="key" select="field[@name='core_get']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="core_param"  select="field"></xsl:variable>
		
		<xsl:variable name="valor">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='value1']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="Core">
			<xsl:choose>
				<xsl:when test="$core_set != ''">
					<xsl:value-of select="$core_set"></xsl:value-of><xsl:text>(</xsl:text><xsl:value-of select="$valor"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$core_get != ''">
					<xsl:value-of select="$core_get"></xsl:value-of><xsl:text>(</xsl:text><xsl:value-of select="$valor"></xsl:value-of><xsl:text>)</xsl:text>
				</xsl:when>
				
				<xsl:when test="$core_param != ''">
					<xsl:text>Core.getParamInt("p_</xsl:text><xsl:value-of select="$core_param"></xsl:value-of><xsl:text>")</xsl:text>
				</xsl:when>
			
			</xsl:choose>
		</xsl:variable>
		
		<xsl:value-of select="$Core"></xsl:value-of>
		
	</xsl:template>			
	
	<xsl:template name="blockly.element.edit">
		
		<xsl:text>isEdit</xsl:text>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.index_editar" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="param" select="field[@name='param_id']"/>
		
		<xsl:variable name="button" select="field[@name='button']"/>
	   	
	   	<xsl:variable name="edicao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="code_edit">
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>if (Core.isNotNull(isEdit)) {</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:value-of select="$dao"></xsl:value-of><xsl:text> obj = new </xsl:text> <xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>().findOne(Core.getParamInt("</xsl:text><xsl:value-of select="$param"></xsl:value-of><xsl:text>"));</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>if (obj!=null) {</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:value-of select="$edicao"></xsl:value-of>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}</xsl:text>
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
		<xsl:text>this.addQueryString("</xsl:text><xsl:value-of select="$paramkey"></xsl:value-of><xsl:text>", Core.getParam("p_</xsl:text>
		<xsl:value-of select="$paramkey"></xsl:value-of><xsl:text>"));</xsl:text>
		
	</xsl:template>

	<xsl:template name="blockly.element.fill_combo" >
	
		<xsl:variable name="combo" select="field"/>
		
		<xsl:variable name="options">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="code">
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:text>LinkedHashMap&lt;String, String&gt; </xsl:text>
			<xsl:value-of select="$combo"></xsl:value-of>
			<xsl:text> = new LinkedHashMap&lt;&gt;();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$combo"></xsl:value-of><xsl:text>.put(null, gt("-- Selecionar --"));</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:value-of select="$options"></xsl:value-of>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:text>view.</xsl:text><xsl:value-of select="$combo"></xsl:value-of>
			<xsl:text>.setValue(</xsl:text><xsl:value-of select="$combo"></xsl:value-of>
			<xsl:text>);</xsl:text>	
			<xsl:value-of select="$newline"></xsl:value-of>
			
		</xsl:variable>
		
		<xsl:value-of select="$code"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.option_combo" >
		
		<xsl:param name="parent"/>
		
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
		
		<xsl:variable name="combo" select="$parent/field"/>
				
		<xsl:value-of select="$combo"></xsl:value-of>
		<xsl:text>.put(</xsl:text><xsl:value-of select="$double_quotes"></xsl:value-of><xsl:value-of select="$valor"></xsl:value-of>
		<xsl:value-of select="$double_quotes"></xsl:value-of><xsl:text>,gt(</xsl:text>
		<xsl:value-of select="$double_quotes"></xsl:value-of><xsl:value-of select="$descricao"></xsl:value-of>
		<xsl:value-of select="$double_quotes"></xsl:value-of>
		<xsl:text>));</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.rediret_p" >
		
		<xsl:variable name="paramget" select="field[@name='param']"/>
		
		<xsl:variable name="button" select="field[@name='button']"/>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"></xsl:value-of>
		<xsl:text>.addParameter("</xsl:text><xsl:value-of select="$paramget"></xsl:value-of><xsl:text>", Core.getParam("</xsl:text><xsl:value-of select="$paramget"></xsl:value-of><xsl:text>"));</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.add_isedit" >
	
		<xsl:variable name="button" select="field[@name='button']"/>
				
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"></xsl:value-of>
		<xsl:text>.addParameter("isEdit", "true");</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.dao_obj" >

		<xsl:text>obj</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.corre_get_param" >
		
		<xsl:variable name="paramget" select="field[@name='param']"/>

		<xsl:text>Core.getParamInt("</xsl:text><xsl:value-of select="$paramget"></xsl:value-of><xsl:text>")</xsl:text>
		
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
		
		<xsl:variable name="findone">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='findone']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="code">
		<xsl:value-of select="$dao"></xsl:value-of><xsl:text> obj = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
		<xsl:text>()</xsl:text>
		
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
	
	<xsl:template name="blockly.element.apagar" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="paramGet" select="field[@name='iskey']"/>
		
		<xsl:variable name="getDelete">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='valor1']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:value-of select="$newlineTab1"></xsl:value-of>	
		<xsl:value-of select="$dao"></xsl:value-of><xsl:text> obj = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
		<xsl:text>().findOne(Core.getParamInt("p_</xsl:text><xsl:value-of select="$paramGet"></xsl:value-of><xsl:text>"));</xsl:text>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>	
		<xsl:text>if (obj != null &amp;&amp;  !obj.hasError()) {</xsl:text>
		<xsl:value-of select="$newlineTab2"></xsl:value-of>	
		<xsl:text>boolean del = obj.delete(</xsl:text><xsl:value-of select="$getDelete"></xsl:value-of><xsl:text>);</xsl:text>
		<xsl:value-of select="$newlineTab2"></xsl:value-of>	 
		<xsl:text>if (del == true)</xsl:text>
		<xsl:value-of select="$newlineTab3"></xsl:value-of>
		<xsl:text>Core.setMessageSuccess("Deleted from DB successfully!");</xsl:text>
		<xsl:value-of select="$newlineTab2"></xsl:value-of>
		<xsl:text>else</xsl:text>
		<xsl:value-of select="$newlineTab3"></xsl:value-of>
		<xsl:text>Core.setMessageError("Error deleting person from DB!");</xsl:text>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		<xsl:text>} else {</xsl:text>
		<xsl:value-of select="$newlineTab2"></xsl:value-of>
		<xsl:text>Core.setMessageError(obj.getError().toString());</xsl:text>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.grafico" >
	
		<xsl:variable name="rowtypechildX" select="substring-before(value[@name='eixoX']/block/field,'::')"/>
		
		<xsl:variable name="rowtypechildY" select="substring-before(value[@name='eixoY']/block/field,'::')"/>
		
		<xsl:variable name="rowtypechildZ" select="substring-before(value[@name='eixoZ']/block/field,'::')"/>
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="grafico" select="field[@name='grafico']"/>
		
		<xsl:variable name="checkbox" select="field[@name='3D']"/>
		
		<xsl:variable name="graficoup">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$grafico"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="eixox">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='eixoX']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="eixoy">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='eixoY']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		
			<xsl:variable name="eixoz">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='eixoZ']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		
	<xsl:value-of select="$newlineTab1"></xsl:value-of>
	<xsl:text>List&lt;</xsl:text><xsl:value-of select="$graficoup"></xsl:value-of>
	<xsl:text>&gt; </xsl:text><xsl:value-of select="$grafico"></xsl:value-of>
	<xsl:text> = new ArrayList &lt;&gt;();</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of>
	<xsl:value-of select="$dao"></xsl:value-of><xsl:text> p = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of><xsl:text>();</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of>
	<xsl:text>p.findAll().stream().forEach(obj->{</xsl:text>
	<xsl:value-of select="$newlineTab2"></xsl:value-of>
	<xsl:value-of select="$graficoup"></xsl:value-of><xsl:text> c = new </xsl:text><xsl:value-of select="$graficoup"></xsl:value-of><xsl:text>();</xsl:text>
	<xsl:choose>
			<xsl:when test="$rowtypechildX = 'Date'">
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					<xsl:text>c.setEixoX(""+</xsl:text><xsl:value-of select="$eixox"></xsl:value-of><xsl:text>);</xsl:text>
			</xsl:when>
			<xsl:otherwise>
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					<xsl:text>c.setEixoX(</xsl:text><xsl:value-of select="$eixox"></xsl:value-of><xsl:text>);</xsl:text>
			</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
			<xsl:when test="$rowtypechildY = 'Date'">
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					<xsl:text>c.setEixoY(""+</xsl:text><xsl:value-of select="$eixoy"></xsl:value-of><xsl:text>);</xsl:text>
			</xsl:when>
			<xsl:otherwise>
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					<xsl:text>c.setEixoY(</xsl:text><xsl:value-of select="$eixoy"></xsl:value-of><xsl:text>);</xsl:text>
			</xsl:otherwise>
	</xsl:choose>
	<xsl:choose>
			<xsl:when test="$checkbox = 'TRUE'">
				<xsl:choose>
						<xsl:when test="$rowtypechildZ = 'Date'">
								<xsl:value-of select="$newlineTab2"></xsl:value-of>
								<xsl:text>c.setEixoZ(""+</xsl:text><xsl:value-of select="$eixoz"></xsl:value-of><xsl:text>);</xsl:text>
				
						</xsl:when>
						<xsl:otherwise>
								<xsl:value-of select="$newlineTab2"></xsl:value-of>
								<xsl:text>c.setEixoZ(</xsl:text><xsl:value-of select="$eixoz"></xsl:value-of><xsl:text>);</xsl:text>
						</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
			</xsl:otherwise>
	</xsl:choose>
	<xsl:value-of select="$newlineTab2"></xsl:value-of>
	<xsl:value-of select="$grafico"></xsl:value-of><xsl:text>.add(c);</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:text>});</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:text>model.set</xsl:text>
	<xsl:value-of select="$graficoup"></xsl:value-of><xsl:text>(</xsl:text><xsl:value-of select="$grafico"></xsl:value-of><xsl:text>);</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of>
	
		
	</xsl:template>
	
	<xsl:template name="blockly.element.combo_dao" >
	
		<xsl:variable name="mutation" select="mutation/@count"/>
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="combo" select="field[@name='selecao']"/>
		
		<xsl:variable name="andWheres">
			
			<xsl:call-template name="listar.andWheres">
			
				<xsl:with-param name="total" select="$mutation"/>
				
				<xsl:with-param name="valueAttrName" select="'ADD'"/>
				
				<xsl:with-param name="values" select="value"/>
			
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="dao_low">
	       	<xsl:call-template name="LowerCase">
	       		<xsl:with-param name="text" select="$dao"/>
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
			<xsl:text>List &lt;</xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_low"></xsl:value-of>
			<xsl:text>List = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>().find()</xsl:text><xsl:value-of select="$andWheres"></xsl:value-of>
			<xsl:text>.all();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>	
			<xsl:text>view.</xsl:text><xsl:value-of select="$combo"></xsl:value-of>
			<xsl:text>.setValue(</xsl:text><xsl:value-of select="$options_dao"></xsl:value-of>
			<xsl:text>);</xsl:text>	
			<xsl:value-of select="$newline"></xsl:value-of>
		</xsl:variable>
		
		<xsl:value-of select="$code"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.option_dao" >
	
	<xsl:param name="parent"/>
	
	<xsl:variable name="dao" select="../../field[@name='dao']"/>
	
	<xsl:variable name="valor1" select = "substring-after(value[@name='key_val']/block/field,'::')"/>
	
	<xsl:variable name="valor2" select = "substring-after(value[@name='value_val']/block/field,'::')"/>
	
		<xsl:variable name="dao_low">
	       	<xsl:call-template name="LowerCase">
	       		<xsl:with-param name="text" select="$dao"/>
	       	</xsl:call-template>
	   	</xsl:variable>
		
		<xsl:variable name="combo" select="$parent/field"/>
				
		<xsl:text>Core.toMap(</xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>List, "</xsl:text><xsl:value-of select="$valor1"></xsl:value-of><xsl:text>","</xsl:text>
		<xsl:value-of select="$valor2"></xsl:value-of><xsl:text>")</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.custom.global">
		
		<xsl:variable name="hasLinkField" select="//*[contains(field,'Link::')]"></xsl:variable>
		
		<xsl:if test="$hasLinkField[1]">
		
<!-- 			<xsl:text>public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException {</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>int fileId = Core.getParamInt("file_id");</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>CLob c = Core.getFile(fileId);</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>byte[] content = c.getC_lob_content();</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>String name = c.getName();</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>String contentType = c.getMime_type();</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>boolean download = false;</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>return this.xSend(content, name, contentType, download);</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
<!-- 			<xsl:text>}</xsl:text> -->
<!-- 			<xsl:value-of select="$newlineTab1"></xsl:value-of> -->
			
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template name="blockly.element">
	
		<xsl:param name="element" select="."/>
		
		<xsl:param name="parent"/>
		
		<xsl:variable name="block-type" select="$element/@type"/>

		<xsl:choose>
		
			<xsl:when test="$block-type = 'controller'">
				<xsl:call-template name="blockly.element.controller"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="contains( $block-type,'listar_' )">
				<xsl:call-template name="blockly.element.listar"></xsl:call-template>
			</xsl:when>
			
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
			
			<xsl:when test="$block-type = 'edit'">
				<xsl:call-template name="blockly.element.edit"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'controls_if'">
				<xsl:call-template name="blockly.element.controls_if"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="contains( $block-type,'get-dao-' )">
				<xsl:call-template name="blockly.element.getDao"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="contains( $block-type,'set-dao-' )">
				<xsl:call-template name="blockly.element.setDao"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'model_get'">
				<xsl:call-template name="blockly.element.model_get"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'model_set'">
				<xsl:call-template name="blockly.element.model_set"></xsl:call-template>
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
			
			<xsl:when test="$block-type = 'text_print'">
				<xsl:call-template name="blockly.element.text_print"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="contains( $block-type,'core' )">
				<xsl:call-template name="blockly.element.core"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'inserir_dao'">
				<xsl:call-template name="blockly.element.inserir_dao"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'editar_dao'">
				<xsl:call-template name="blockly.element.editar_dao"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'index_editar'">
				<xsl:call-template name="blockly.element.index_editar"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="contains( $block-type,'rowtable' )">
				<xsl:call-template name="blockly.element.row"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'controls_for'">
				<xsl:call-template name="blockly.element.controls_for"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'fill_combo'">
				<xsl:call-template name="blockly.element.fill_combo"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'option_combo'">
				<xsl:call-template name="blockly.element.option_combo">
					<xsl:with-param name="parent" select="$parent"></xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'option_dao'">
				<xsl:call-template name="blockly.element.option_dao">
					<xsl:with-param name="parent" select="$parent"></xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'apagar'">
				<xsl:call-template name="blockly.element.apagar"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'enviar_p'">
				<xsl:call-template name="blockly.element.enviar_p"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'rediret_p'">
				<xsl:call-template name="blockly.element.rediret_p"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'separator'">
				<xsl:call-template name="blockly.element.separator"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'formlist'">
				<xsl:call-template name="blockly.element.formlist"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'sep_row'">
				<xsl:call-template name="blockly.element.sep_row"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'sep_form'">
				<xsl:call-template name="blockly.element.sep_row"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'save_separator'">
				<xsl:call-template name="blockly.element.save_separator"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'save_formlist'">
				<xsl:call-template name="blockly.element.save_formlist"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'get_row_sep'">
				<xsl:call-template name="blockly.element.get_row_sep"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'get_row_form'">
				<xsl:call-template name="blockly.element.get_row_sep"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'corre_get_param'">
				<xsl:call-template name="blockly.element.corre_get_param"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'grafico'">
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
			
			<xsl:when test="$block-type = 'combo_dao'">
				<xsl:call-template name="blockly.element.combo_dao"></xsl:call-template>
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