<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.verticalmenu" >	
		<xsl:variable name="table" select="substring-after(@type,'verticalmenu_')"/>	
		<xsl:variable name="mutation" select="mutation/@count"/>		
		<xsl:variable name="dao_form" select="field[@name='dao']"/>	
		<xsl:variable name="refreshCheck" select="field[@name='AJAX']"/>	
		<xsl:variable name="refreshcompo" select="field[@name='namecompo']"/>	
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
			<xsl:value-of select="$daolow"/><xsl:text>List.forEach(</xsl:text><xsl:value-of select="$daolow"/><xsl:text> -> {</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>	
			<xsl:text>IGRPButton btn_</xsl:text><xsl:value-of select="$table"/><xsl:text> = new IGRPButton(</xsl:text> 	
			<xsl:value-of select="$sep_row"></xsl:value-of>
			<xsl:text>,"", "");</xsl:text>
			<xsl:value-of select="$newlineTab4"/>
			<xsl:text>btn_</xsl:text><xsl:value-of select="$table"/><xsl:text>.propertie.add("type","specific").add("rel","</xsl:text><xsl:value-of select="$table"/><xsl:text>").add("refresh_components","</xsl:text>
			<xsl:if test="$refreshCheck = 'TRUE'">
				<xsl:value-of select="$refreshcompo"/>
			</xsl:if>
			<xsl:text>");</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>	
			<xsl:text>view.</xsl:text><xsl:value-of select="$table"/><xsl:text>.addButton(btn_</xsl:text><xsl:value-of select="$table"/><xsl:text>);</xsl:text>			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>});</xsl:text> 	
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
	
	<xsl:template name="blockly.element.set_title_vertical">
		<xsl:variable name="valor">		
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="value[@name='set_title']"/>				
			</xsl:call-template>			
		</xsl:variable>
		<xsl:variable name="valortype">		
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
		<xsl:variable name="valor_convert">	
			<xsl:call-template name="utils.edited">				
				<xsl:with-param name="value" select="$valor"></xsl:with-param>							
				<xsl:with-param name="from" select="$valortype"></xsl:with-param>				
				<xsl:with-param name="to" select="'String'"></xsl:with-param>							
			</xsl:call-template>					
		</xsl:variable>		
		
		<xsl:value-of select="$valor_convert"></xsl:value-of><xsl:text>, "</xsl:text><xsl:value-of select="$app-title"/><xsl:text>", </xsl:text>
	</xsl:template>
	
	<xsl:template name="blockly.element.set_app_page">
		<xsl:variable name="page" select="field[@name='page']"/>		
		<xsl:text>"</xsl:text><xsl:value-of select="$page"/><xsl:text>", "index" </xsl:text>
	</xsl:template>
	
	<xsl:template name="blockly.element.set_app_target">
		<xsl:variable name="target" select="field[@name='target']"/>	
		<xsl:text>, "</xsl:text><xsl:value-of select="$target"/><xsl:text>"</xsl:text>
	</xsl:template>
	
	<xsl:template name="blockly.element.set_app_icon">
		<xsl:variable name="style" select="field[@name='style']"/>
		<xsl:variable name="icon" select="field[@name='icon_name']"/>	
		<xsl:text>, "</xsl:text><xsl:value-of select="$style"/><xsl:text>|</xsl:text><xsl:value-of select="$icon"/><xsl:text>"</xsl:text>
	</xsl:template>
	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
</xsl:stylesheet>
		