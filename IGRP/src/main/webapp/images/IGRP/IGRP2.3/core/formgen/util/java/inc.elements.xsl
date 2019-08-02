<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:include href="inc.listar.block.xsl"/>
	
	<xsl:template name="blockly.element.controller">
		
		<xsl:call-template name="blockly.getValue">
			<xsl:with-param name="value" select="statement"></xsl:with-param>
			<xsl:with-param name="startEndCode" select="true()"></xsl:with-param>
		</xsl:call-template>

	</xsl:template>
	
	<xsl:template name="blockly.element.row">
	
		<xsl:variable name="rowType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>
		
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
			<xsl:choose>
				<xsl:when test="$rowType = 'Link'">
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>("</xsl:text><xsl:value-of select="$app-title"></xsl:value-of><xsl:text>","</xsl:text>
					<xsl:value-of select="$page-title"></xsl:value-of><xsl:text>","download&amp;file_id="+</xsl:text>
					<xsl:value-of select="$valorA"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$rowtypeneto != '' ">
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(</xsl:text><xsl:value-of select="$valorA"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$rowType = 'String' and $rowtypechild = 'Integer' ">
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(""+</xsl:text><xsl:value-of select="$valorA"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$rowType = 'hidden' and $rowtypechild = 'Integer' ">
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(""+</xsl:text><xsl:value-of select="$valorA"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
					
				<xsl:when test="$rowType = 'String' and $rowtypechild = 'Date' ">
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(""+</xsl:text><xsl:value-of select="$valorA"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:otherwise>
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(</xsl:text><xsl:value-of select="$valorA"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:otherwise>
			
			</xsl:choose>
			
		</xsl:variable>
		
		<xsl:value-of select="$rowset"></xsl:value-of>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.model_get">
	
		<xsl:variable name="typedad" select="../../field"/>
		
		<xsl:variable name="fieldType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="fieldValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="nameCap">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$fieldValue"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="gettingmodel">
			<xsl:choose>
				<xsl:when test="$fieldType = 'File'">
						<xsl:text>""+(Core.saveFile("p_</xsl:text><xsl:value-of select="$fieldValue"></xsl:value-of>
						<xsl:text>"))</xsl:text>
				</xsl:when>
				
				<xsl:otherwise>
						<xsl:text>model.get</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
						<xsl:call-template name="utils.arguments"/>
				</xsl:otherwise>
			
			</xsl:choose>
			
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
			
			<xsl:choose>
				
				<xsl:when test="$modeltypechild = 'Date' ">
					<xsl:text>model.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(""+</xsl:text><xsl:value-of select="$setting"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$modeltypechild = 'Integer' ">
					<xsl:text>model.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(""+</xsl:text><xsl:value-of select="$setting"></xsl:value-of><xsl:text>);</xsl:text>
				</xsl:when>
					
				<xsl:otherwise>
					<xsl:text>model.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>(</xsl:text><xsl:value-of select="$setting"></xsl:value-of>
					<xsl:text>);</xsl:text>
				</xsl:otherwise>
			
			</xsl:choose>
		
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
		
		<xsl:variable name="childstrange" select="value[@name='value1']/block[@type='core_get_param']"/>
		
		<xsl:variable name="childstrangeValue" select="value[@name='value1']/block[@type='core_get_param']/field"/>
		
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
		
		<xsl:variable name="Daosetting">
			
			<xsl:choose>
				
				<xsl:when test="$fieldType = 'Date'">
					<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(Core.formatDate(</xsl:text><xsl:value-of select="$valorA"></xsl:value-of>
					<xsl:text>, "dd-mm-yyyy", "yyyy-mm-dd"));</xsl:text>
				</xsl:when>
				
				<xsl:when test="$fieldType = 'Integer'">
					<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(Core.toInt(</xsl:text><xsl:value-of select="$valorA"></xsl:value-of>
					<xsl:text>));</xsl:text>
				</xsl:when>
				
				<xsl:when test="$fieldType = 'String'">
					<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text><xsl:value-of select="$valorA"></xsl:value-of>
					<xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$childstrange != '' ">
				
					<xsl:value-of select="$fieldType"></xsl:value-of>
					<xsl:text> foreign = new </xsl:text><xsl:value-of select="$fieldType"></xsl:value-of>
					<xsl:text>().findOne(Core.getParamInt("p_</xsl:text><xsl:value-of select="$childstrangeValue"></xsl:value-of>
					<xsl:text>"));</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(foreign);</xsl:text>
					
				</xsl:when>
					
				<xsl:otherwise>
				
					<xsl:text>obj.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text>
					<xsl:value-of select="$valorA"></xsl:value-of>
					<xsl:text>);</xsl:text>
					
				</xsl:otherwise>
			
			</xsl:choose>
		
		</xsl:variable>
		
		<xsl:value-of select="$Daosetting"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.strDao">
	
	<xsl:variable name="fieldType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="fieldValue" select="substring-after(field,'::')"/>
		
		<xsl:value-of select="$fieldValue"/>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.logic_operation">
		
   		<xsl:variable name="valorA">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='A']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="operator">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='OP']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="valorB">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='B']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:value-of select="concat($valorA,$operator,$valorB)"></xsl:value-of>
			
	</xsl:template>
	
	<xsl:template name="blockly.element.logic_compare">
	
		<xsl:variable name="valorA">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='A']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="operator">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='OP']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="valorB">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='B']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:value-of select="concat($valorA,$operator,$valorB)"></xsl:value-of>

	</xsl:template>
	
	<xsl:template name="blockly.element.logic_boolean">
	
		<xsl:variable name="operator">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='BOOL']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:value-of select="$operator"></xsl:value-of>

	</xsl:template>
	
	<xsl:template name="blockly.element.logic_null">
	
		<xsl:text>null</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.logic_negate">
	
		<xsl:variable name="valor">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='BOOL']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>!</xsl:text><xsl:value-of select="$valor"></xsl:value-of>

	</xsl:template>	

	<xsl:template name="blockly.element.tentar">
	
		<xsl:variable name="code">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="excpCode">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='value4']"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="utils.try"/>
		<xsl:value-of select="$code"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:call-template name="utils.try.catch">
		</xsl:call-template>
		<xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$excpCode"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:call-template name="utils.try.end">
		</xsl:call-template>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.math_number">
	
		<xsl:value-of select="field[@name='NUM']"></xsl:value-of>

	</xsl:template>
	
	<xsl:template name="blockly.element.controls_repeat_ext">
	
		<xsl:variable name="valor1">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='TIMES']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="valor2">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='DO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>for(int i=0; i&lt;</xsl:text><xsl:value-of select="$valor1"></xsl:value-of>
		<xsl:text>;i++){</xsl:text><xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$valor2"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:text>}</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.controls_flow_statements">
		
		<xsl:variable name="break_cont">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='FLOW']"/>
			</xsl:call-template>
		</xsl:variable>
	
		
		<xsl:value-of select="$break_cont"></xsl:value-of>
	</xsl:template>		
	
	<xsl:template name="blockly.element.controls_whileUntil">
		
		<xsl:variable name="whileuntil">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='MODE']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="condition">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='BOOL']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="do">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='DO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>while(</xsl:text><xsl:value-of select="$whileuntil"></xsl:value-of>
		<xsl:text>(</xsl:text><xsl:value-of select="$condition"></xsl:value-of>
		<xsl:text>)){</xsl:text><xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$do"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:text>}</xsl:text>

	</xsl:template>

	<xsl:template name="blockly.element.math_arithmetic">
	
		<xsl:variable name="valor1">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='A']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="signal">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='OP']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="valor2">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='B']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:value-of select="concat($valor1,$signal,$valor2)"></xsl:value-of>

	</xsl:template>	
	
	<xsl:template name="blockly.element.text">
		
		<xsl:text>"</xsl:text><xsl:value-of select="field[@name='TEXT']"></xsl:value-of><xsl:text>"</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.text_print">
	
		<xsl:variable name="valor">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='TEXT']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>System.out.println(</xsl:text><xsl:value-of select="$valor"></xsl:value-of><xsl:text>);</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.controls_for">
	
		<xsl:variable name="variavel" select="field[@name='VAR']"/>
	
		<xsl:variable name="de">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='FROM']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="ate">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='TO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="incremento">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='BY']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="DO">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='DO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>for(int </xsl:text><xsl:value-of select="$variavel"></xsl:value-of>
		<xsl:text>=</xsl:text><xsl:value-of select="$de"></xsl:value-of><xsl:text>; </xsl:text>
		<xsl:value-of select="$variavel"></xsl:value-of><xsl:text>&lt;</xsl:text>
		<xsl:value-of select="$ate"></xsl:value-of><xsl:text>; </xsl:text>
		<xsl:value-of select="$variavel"></xsl:value-of><xsl:text>+=</xsl:text>
		<xsl:value-of select="$incremento"></xsl:value-of><xsl:text>){</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$DO"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>}</xsl:text>
		

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

	<xsl:template name="blockly.element.controls_if" >
		
		<xsl:variable name="valueif1">
				<xsl:call-template name="blockly.getValue">
					<xsl:with-param name="value" select="*[@name='IF0']"/>
				</xsl:call-template>
		</xsl:variable>
			
		<xsl:variable name="valueif2">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='DO0']"/>
			</xsl:call-template>
		</xsl:variable>

		<xsl:text>if(</xsl:text><xsl:value-of select="$valueif1"></xsl:value-of><xsl:text>){</xsl:text>
		<xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$valueif2"/>
		<xsl:value-of select="$newline"/>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$newline"/>

		<xsl:variable name="hasMutation" select="mutation"></xsl:variable>
		
		<xsl:if test="$hasMutation">
		
			<xsl:variable name="elseif_count" select="mutation/@elseif"/>
			
			<xsl:variable name="haselse" select="mutation/@else"/>
			
			<xsl:variable name="elseif_code">
			
				<xsl:call-template name="MutationValue">
				
					<xsl:with-param name="total" select="$elseif_count"/>
					
					<xsl:with-param name="valueAttrName" select="'IF'"/>
					
					<xsl:with-param name="statement" select="'DO'"/>
				
				</xsl:call-template>
				
			</xsl:variable>
			
			<xsl:value-of select="$elseif_code"/>
			
			<xsl:if test="$haselse">
	
				<xsl:variable name="else">
					<xsl:call-template name="blockly.getValue">
						<xsl:with-param name="value" select="*[@name='ELSE']"/>
					</xsl:call-template>
				</xsl:variable>	
			
			<xsl:text>else{</xsl:text>
			<xsl:value-of select="$newlineTab1"/>
			<xsl:value-of select="$else"/>
			<xsl:value-of select="$newline"/>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newline"/>
	
			</xsl:if>
			
		</xsl:if>
	
	</xsl:template>
	
	<xsl:template name="MutationValue">
	
		<xsl:param name="total"/>
		
		<xsl:param name="valueAttrName" />
			
		<xsl:param name="statement"/>
		
		<xsl:param name="index" select="1"/>

		<xsl:if test="$index &lt;= $total">
		
			<xsl:variable name="value1Name" select="concat($valueAttrName,$index)"/>
			
			<xsl:variable name="value2Name" select="concat($statement,$index)"/>
			
			<xsl:variable name="value1">
				<xsl:call-template name="blockly.getValue">
					<xsl:with-param name="value" select="*[@name=$value1Name]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="value2">
				<xsl:call-template name="blockly.getValue">
					<xsl:with-param name="value" select="*[@name=$value2Name]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:if test="$value1 and $value2">

				<xsl:text>else if(</xsl:text>
					
					<xsl:value-of select="$value1"></xsl:value-of>
				
				<xsl:text>){</xsl:text>
				
				<xsl:value-of select="$newlineTab1"/>
				<xsl:value-of select="$value2"/>
				<xsl:value-of select="$newline"/>
				<xsl:text>}</xsl:text>
				<xsl:value-of select="$newline"/>
			
			</xsl:if>
					
			<xsl:call-template name="MutationValue">
			
				<xsl:with-param name="total" select="$total"/>
					
				<xsl:with-param name="valueAttrName" select="$valueAttrName"/>
					
				<xsl:with-param name="statement" select="$statement"/>
				
				<xsl:with-param name="index" select="$index + 1"/>
				
			</xsl:call-template>
		
		</xsl:if>
		
	</xsl:template>

	<xsl:template name="blockly.element.inserir_dao" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
	   	
	   	<xsl:variable name="insercao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="find">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='find']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="Check" select="field[@name='Checkbox']"/>
		
		<xsl:variable name="param">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='PARAM']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="paramvalue" select="substring-after(value[@name='PARAM']/block/field,'::')"/>
		
		<xsl:variable name="paramtype" select="substring-before(value[@name='PARAM']/block/field,'::')"/>
		
		<xsl:variable name="Check_">
			<xsl:choose>
				<xsl:when test="$paramtype = 'Integer'">
					<xsl:text>.findOne(Core.getParamInt("param"));</xsl:text>
				</xsl:when>
				
				<xsl:when test="$paramtype = 'hidden'">
					<xsl:text>.findOne(Core.getParamInt("param"));</xsl:text>
				</xsl:when>
				
				<xsl:when test="$paramtype = 'String'">
					<xsl:text>.findOne(Core.getParam("p_</xsl:text><xsl:value-of select="$paramteste"></xsl:value-of><xsl:text>"));</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		
	
		<xsl:variable name="code">
		
			<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text> obj  = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>if (Core.isNotNull(isEdit)) {</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			 <xsl:text> obj = obj.findOne(Core.getParamInt("param"));</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$insercao"></xsl:value-of>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>if (obj != null){</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>if (Core.isNull(isEdit)) {</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>obj.insert();</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}else{</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>obj.update();</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}
			}else{</xsl:text> 
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>Core.setMessageError();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text> 
		
		</xsl:variable>
		
		<xsl:call-template name="utils.try">
			
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			
			<xsl:with-param name="exceptionCode">
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				<xsl:text>e.printStackTrace();</xsl:text>
				<xsl:value-of select="$newline"></xsl:value-of>
				<xsl:text>Core.setMessageError();</xsl:text>
			</xsl:with-param>
			
		</xsl:call-template>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.index_editar" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="button" select="field[@name='button']"/>
	   	
	   	<xsl:variable name="edicao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="find">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='find']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="paramGet" select="field[@name='iskey']"/>
		
		<xsl:variable name="paramvalue" select="substring-after(value[@name='PARAM']/block/field,'::')"/>
		
		<xsl:variable name="paramType" select="substring-before(value[@name='PARAM']/block/field,'::')"/>
		
		<xsl:variable name="param">
			
				<xsl:text>int param = Core.getParamInt("p_</xsl:text><xsl:value-of select="$paramGet"></xsl:value-of><xsl:text>");</xsl:text>
			
		</xsl:variable>

		<xsl:variable name="code_edit">
			
			<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:value-of select="$param"></xsl:value-of>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>if (Core.isNotNull(isEdit)) {</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$dao"></xsl:value-of><xsl:text> obj = new </xsl:text> <xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>().findOne(param);</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>if (obj!=null) {</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:value-of select="$edicao"></xsl:value-of>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"></xsl:value-of><xsl:text>.addParameter("param", param);</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>view.btn_</xsl:text><xsl:value-of select="$button"></xsl:value-of><xsl:text>.addParameter("isEdit", "true");</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>}</xsl:text>
		</xsl:variable>
		
		<xsl:value-of select="$code_edit"></xsl:value-of>
		
		
	</xsl:template>
	
	<xsl:template name="blockly.element.editar_dao" >
	
		<xsl:variable name="paramvalue" select="substring-after(value[@name='PARAM']/block/field,'::')"/>
		
		<xsl:variable name="paramtype" select="substring-after(value[@name='PARAM']/block/field,'::')"/>
		
		<xsl:variable name="paramkey" select="field[@name='iskey']"/>
				
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>this.addQueryString("isEdit", "true");</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>this.addQueryString("p_</xsl:text><xsl:value-of select="$paramkey"></xsl:value-of><xsl:text>", Core.getParam("p_</xsl:text>
		<xsl:value-of select="$paramkey"></xsl:value-of><xsl:text>"));</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.enviar_p" >
	
		
		<xsl:variable name="paramkey" select="field[@name='iskey']"/>
				
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>this.addQueryString("p_</xsl:text><xsl:value-of select="$paramkey"></xsl:value-of><xsl:text>", Core.getParam("p_</xsl:text>
		<xsl:value-of select="$paramkey"></xsl:value-of><xsl:text>"));</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.action_button" >
	   	
	   	<xsl:variable name="name_button" select="substring-after(@type,'action_')"></xsl:variable>
	   	
	   	<xsl:variable name="code">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='CODE']"/>
			</xsl:call-template>
		</xsl:variable>
	   	
		<xsl:text>/* Start-Code-Block (</xsl:text><xsl:value-of select="$name_button"></xsl:value-of><xsl:text>) */</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$code"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>/* End-Code-Block */</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>
	</xsl:template>

	<xsl:template name="blockly.element.fill_combo" >
	
		<xsl:variable name="combo" select="field"/>
		
		<xsl:variable name="options">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
				<xsl:with-param name="parent" select="."></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
				
		<xsl:text>LinkedHashMap&lt;String, String&gt; </xsl:text>
		<xsl:value-of select="$combo"></xsl:value-of>
		<xsl:text> = new LinkedHashMap&lt;&gt;();</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$combo"></xsl:value-of><xsl:text>.put(null, gt("-- Selecionar --"));</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>	
		<xsl:value-of select="$options"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>	
		<xsl:text>view.</xsl:text><xsl:value-of select="$combo"></xsl:value-of>
		<xsl:text>.setValue(</xsl:text><xsl:value-of select="$combo"></xsl:value-of>
		<xsl:text>);</xsl:text>	
		<xsl:value-of select="$newline"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.option_combo" >
		
		<xsl:param name="parent"/>
		
		<xsl:variable name="nameCap">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="field"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="combo" select="$parent/field"/>
				
		<xsl:value-of select="$combo"></xsl:value-of>
		<xsl:text>.put(</xsl:text><xsl:value-of select="$double_quotes"></xsl:value-of><xsl:value-of select="$nameCap"></xsl:value-of>
		<xsl:value-of select="$double_quotes"></xsl:value-of><xsl:text>,gt(</xsl:text>
		<xsl:value-of select="$double_quotes"></xsl:value-of><xsl:value-of select="$nameCap"></xsl:value-of>
		<xsl:value-of select="$double_quotes"></xsl:value-of>
		<xsl:text>));</xsl:text>
		
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
	
	<xsl:value-of select="$dao"></xsl:value-of><xsl:text> obj = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
	<xsl:text>().findOne(Core.getParamInt("p_</xsl:text><xsl:value-of select="$paramGet"></xsl:value-of><xsl:text>"));</xsl:text>
	<xsl:value-of select="$newline"></xsl:value-of>	
	<xsl:text>if (obj != null &amp;&amp;  !obj.hasError()) {</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of>	
	<xsl:text>boolean del = obj.delete(</xsl:text><xsl:value-of select="$getDelete"></xsl:value-of><xsl:text>);</xsl:text>
	<xsl:value-of select="$newlineTab1"></xsl:value-of>	 
		<xsl:text>if (del == true)</xsl:text>
		<xsl:text>Core.setMessageSuccess("Deleted from DB successfully!");</xsl:text>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>else</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
				<xsl:text>Core.setMessageError("Error deleting person from DB!");</xsl:text>
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
		<xsl:text>} else {</xsl:text>
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		<xsl:text>Core.setMessageError(obj.getError().toString());</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.custom.global">
		
		<xsl:variable name="hasLinkField" select="//*[contains(field,'Link::')]"></xsl:variable>
		
		<xsl:if test="$hasLinkField[1]">
		
			<xsl:text>public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException {</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>int fileId = Core.getParamInt("file_id");</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>CLob c = Core.getFile(fileId);</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>byte[] content = c.getC_lob_content();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>String name = c.getName();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>String contentType = c.getMime_type();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>boolean download = false;</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>return this.xSend(content, name, contentType, download);</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
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
			
			<xsl:when test="$block-type = 'listar'">
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
			
			<xsl:when test="contains( $block-type,'str-dao-' )">
				<xsl:call-template name="blockly.element.strDao"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="contains( $block-type,'action_' )">
				<xsl:call-template name="blockly.element.action_button"></xsl:call-template>
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
			
			<xsl:when test="$block-type = 'row'">
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
			
			<xsl:when test="$block-type = 'apagar'">
				<xsl:call-template name="blockly.element.apagar"></xsl:call-template>
			</xsl:when>
			
			<xsl:when test="$block-type = 'enviar_p'">
				<xsl:call-template name="blockly.element.enviar_p"></xsl:call-template>
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