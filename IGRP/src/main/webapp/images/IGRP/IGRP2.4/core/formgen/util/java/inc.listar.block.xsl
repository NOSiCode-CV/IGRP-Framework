<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.listar" >		
		<xsl:variable name="mutation" select="mutation/@count"/>
		<xsl:variable name="order" select="field[@name='orderdrop']"/>
		<xsl:variable name="find" select="field[@name='find']"/>
		<xsl:variable name="dao" select="field[@name='dao']"/>
		<xsl:variable name="fill" select="field[@name='FILL']"/>	
		<xsl:variable name="rowNum" select="field[@name='row_num']"/>
		<xsl:variable name="blockTipe" select="@type"/>	
		
		<xsl:variable name="table">
			<xsl:choose>
				<xsl:when test="contains($blockTipe,'listartre_')">
					<xsl:value-of select="substring-after(@type,'listartre_')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-after(@type,'listar_')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
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
		
		<xsl:variable name="orderValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$order"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="findValue">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="$find"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="table_up">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="$table"/>
	       	</xsl:call-template>
	   	</xsl:variable>
	   	
	   	<xsl:variable name="row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>	
			</xsl:call-template>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$rowNum = '2' or $rowNum = '3'">
				<xsl:text></xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$newlineTab1"/>
				<xsl:text>try{</xsl:text>
				<xsl:value-of select="$newlineTab2"/>
			</xsl:otherwise>
		</xsl:choose>
					
		<xsl:if test="$fill = 'TRUE'">
			<xsl:variable name="searchs_total">
				<xsl:for-each select="*[contains(@name,'STATE2')]">
					<xsl:variable name="searchs">
						<xsl:call-template name="blockly.getValue">
							<xsl:with-param name="value" select="."/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="concat('Core.isNotNullOrZero(',$searchs,')||')"></xsl:value-of>	
				</xsl:for-each>
			</xsl:variable>
			
			<xsl:variable name="ifs">
				<xsl:text>if(</xsl:text><xsl:value-of select="$searchs_total"/><xsl:text>){</xsl:text>
				<xsl:value-of select="$newlineTab1"/>
			</xsl:variable>	
			
			<xsl:variable name="searchs_tot">
				<xsl:call-template name="replace-all">
					<xsl:with-param name="text" select="$ifs"/>
					<xsl:with-param name="replace" select="'||)'"/>
					<xsl:with-param name="by" select="')'"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:if test="$mutation &gt;= '1'">
				<xsl:value-of select="$searchs_tot"></xsl:value-of>
			</xsl:if>
		</xsl:if>
		<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>
		<xsl:value-of select="$andWheres"/>
		<xsl:value-of select="$newlineTab1"/>
		<xsl:if test="$find != 'UMM'">
			<xsl:text>List&lt;</xsl:text>
		</xsl:if>
		<xsl:value-of select="$dao"/>
		<xsl:if test="$find != 'UMM'">
			<xsl:text>&gt;</xsl:text>
		</xsl:if>	
		<xsl:text> </xsl:text><xsl:value-of select="$dao_low"/>			
		<xsl:if test="$find != 'UMM'">
			<xsl:text>List</xsl:text>
		</xsl:if>	
		<xsl:text> = </xsl:text><xsl:value-of select="$daofilter"/><xsl:value-of select="$orderValue"/><xsl:value-of select="$findValue"/>		
		<xsl:choose>
			<xsl:when test="$rowNum = '2' or $rowNum = '3'">
				<xsl:text></xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$newlineTab1"/>
				<xsl:text>List&lt;</xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>&gt; </xsl:text>
				<xsl:choose>
					<xsl:when test="contains($blockTipe,'listartre_')">
						<xsl:text>treeMenu</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$dao_low"/>
					</xsl:otherwise>
				</xsl:choose>	
				<xsl:text>Table = new ArrayList&lt;&gt;</xsl:text><xsl:text>();</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$newlineTab1"/> 
		<xsl:text>if(Core.isNotNull(</xsl:text><xsl:value-of select="$dao_low"/>
		<xsl:if test="$find != 'UMM'">
			<xsl:text>List</xsl:text>
		</xsl:if>	
		<xsl:text>)){</xsl:text>
		<xsl:value-of select="$newlineTab2"/>
		<xsl:if test="$find != 'UMM'">
			<xsl:text>for(</xsl:text><xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$dao_low"/><xsl:text> : </xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List){</xsl:text>		
		</xsl:if>
		<xsl:value-of select="$newlineTab3"/>	
		<xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text> row</xsl:text><xsl:value-of select="$rowNum"/><xsl:text>  = new </xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$table_up"/><xsl:text>();</xsl:text> 
		<xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$row"/>
		<xsl:choose>
			<xsl:when test="contains($blockTipe,'listartre_')">
				<xsl:value-of select="$newlineTab3"/>
				<xsl:text>treeMenu</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$newlineTab3"/>
				<xsl:value-of select="$dao_low"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>Table.add(row</xsl:text><xsl:value-of select="$rowNum"/><xsl:text>);</xsl:text>	
		<xsl:if test="$find != 'UMM'">
			<xsl:value-of select="$newlineTab2"/>
			<xsl:text>}</xsl:text>
		</xsl:if>		
		<xsl:choose>
			<xsl:when test="$rowNum = '2' or $rowNum = '3'">
				<xsl:text></xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$newlineTab2"/>
				<xsl:text>model.set</xsl:text><xsl:value-of select="$table_up"/><xsl:text>(</xsl:text>
				<xsl:choose>
					<xsl:when test="contains($blockTipe,'listartre_')">
						<xsl:text>treeMenu</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$dao_low"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>Table);</xsl:text>
			</xsl:otherwise>
		</xsl:choose>	
		<xsl:value-of select="$newlineTab1"/>
		<xsl:text>}</xsl:text>	
		<xsl:if test="$fill = 'TRUE' and $mutation &gt;= '1' ">
			<xsl:value-of select="$newlineTab1"/>
			<xsl:text>}</xsl:text>
		</xsl:if>		
		<xsl:choose>
			<xsl:when test="$rowNum = '2' or $rowNum = '3'">
				<xsl:text></xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$newlineTab1"/>
				<xsl:text>}catch(Exception e){</xsl:text>
				<xsl:value-of select="$newlineTab2"/>
				<xsl:text>e.printStackTrace();</xsl:text>
				<xsl:value-of select="$newlineTab1"/>
				<xsl:text>}</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	
	<xsl:template name="blockly.element.row">
		<xsl:variable name="rowtypechild">		
			<xsl:choose>
				<xsl:when test="value/block[@type='getrowStartEnd'] != ''">							
					<xsl:value-of select="'String'"/>				
				</xsl:when>	
				<xsl:when test="value/block/value/block/value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value/block/block/value/value/block/value/block/field,'::')"/>				
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
		<xsl:variable name="rowvaluechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>
		<xsl:variable name="rowtypeneto" select="substring-before(value[@name='fields_model']/block/value[@name='dao_rela']/block/field,'::')"/>
		<xsl:variable name="rowType" select="substring-before(substring-after(@type,'rowtable'),'::')"/>
		<xsl:variable name="rowValue" select="substring-after(@type,'::')"/>
		<xsl:variable name="rowNum" select="field[@name='row_num']"/>
		
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
			<xsl:value-of select="$tab2"/>
			<xsl:text>row</xsl:text>
			<xsl:if test="$rowNum != ''">
				<xsl:value-of select="$rowNum"/>
			</xsl:if>
			<xsl:text>.set</xsl:text><xsl:value-of select="$nameCap"/><xsl:text>(</xsl:text>
				<xsl:call-template name="convert_blocks">
					<xsl:with-param name="value" select="$valorA"></xsl:with-param>
					<xsl:with-param name="valueblock" select="$rowValue"></xsl:with-param>
					<xsl:with-param name="from" select="$rowtypechild"></xsl:with-param>
					<xsl:with-param name="to" select="$rowType"></xsl:with-param>
				</xsl:call-template>
			<xsl:text>);</xsl:text>
		</xsl:variable>
		
		<xsl:value-of select="$rowset"/>
	</xsl:template>
	
	<xsl:template name="listar.andWheres">
		<xsl:param name="daofilter"/>
		<xsl:param name="total"/>
		<xsl:param name="valueAttrName" />
		<xsl:param name="values"/>
		<xsl:param name="index" select="1"/>
		
		<xsl:if test="$index &lt;= $total">
			<xsl:variable name="filterName" select="concat('ADD',$index,'FILTER')"/>
			<xsl:variable name="value1Name" select="concat($valueAttrName,$index)"/>
			<xsl:variable name="operatorName" select="concat('ADD',$index,'WHERE')"/>
			<xsl:variable name="value2Name" select="concat($value1Name,'STATE2')"/>
			<xsl:variable name="value3Name" select="concat($value1Name,'STATE3')"/>
			<xsl:variable name="valueDao" select = "substring-after(value[@name=$value1Name]/block[contains(@type,'et-dao-')]/field,'::')"/>
			<xsl:variable name="wheretypechild" select="substring-before(value[@name=$value2Name]/block/field,'::')"/>
			<xsl:variable name="block_namechild" select="value[@name=$value2Name]/block/@type"/>
			<xsl:variable name="value_otherDao" select = "substring-after(value[@name=$value1Name]/block/value/block/field,'::')"/>
			<xsl:variable name="value_otherDao3" select = "substring-after(value[@name=$value1Name]/block/value/block/value/block/field,'::')"/>
			<xsl:variable name="value_otherDao4" select = "substring-after(value[@name=$value1Name]/block/value/block/value/block/value/block/field,'::')"/>
			<xsl:variable name="wheretype">
				<xsl:choose>
					<xsl:when test="$value_otherDao4 != ''">
						<xsl:value-of select="substring-before(value[@name=$value1Name]/block/value/block/value/block/value/block/field,'::')"/>
					</xsl:when>
					<xsl:when test="$value_otherDao3 != ''">
						<xsl:value-of select="substring-before(value[@name=$value1Name]/block/value/block/value/block/field,'::')"/>
					</xsl:when>
					<xsl:when test="$value_otherDao != ''">
						<xsl:value-of select="substring-before(value[@name=$value1Name]/block/value/block/field,'::')"/>
					</xsl:when>					
					<xsl:otherwise>
						<xsl:value-of select="substring-before(value[@name=$value1Name]/block/field,'::')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="wherevalue" select="substring-after(substring-before(value[@name=$value2Name]/block/field,'//'),'::')"/>
			<xsl:variable name="wherevalue3" select="substring-after(substring-before(value[@name=$value3Name]/block/field,'//'),'::')"/>
			<xsl:variable name="whererange" select="substring-after(value[@name=$value2Name]/block/field,'//')"/>

			<xsl:variable name="filter">
				<xsl:call-template name="utils.meaning">
					<xsl:with-param name="key" select="field[@name=$filterName]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="operator">
				<xsl:call-template name="utils.meaning">
					<xsl:with-param name="key" select="field[@name=$operatorName]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="valor2_">
				<xsl:call-template name="blockly.elements">
					<xsl:with-param name="elements" select="$values[@name=$value2Name]/block"></xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
								
			<xsl:variable name="value2">
				<xsl:call-template name="convert_blocks">
					<xsl:with-param name="value" select="$valor2_"></xsl:with-param>
					<xsl:with-param name="valueblock" select="$wherevalue"></xsl:with-param>
					<xsl:with-param name="from" select="$wheretypechild"></xsl:with-param>
					<xsl:with-param name="to" select="$wheretype"></xsl:with-param>
					<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>
				</xsl:call-template>	
			</xsl:variable>
			
			<xsl:variable name="valor3_">
				<xsl:call-template name="blockly.elements">
					<xsl:with-param name="elements" select="$values[@name=$value3Name]/block"></xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
								
			<xsl:variable name="value3">
				<xsl:call-template name="convert_blocks">
					<xsl:with-param name="value" select="$valor3_"></xsl:with-param>
					<xsl:with-param name="valueblock" select="$wherevalue"></xsl:with-param>
					<xsl:with-param name="from" select="$wheretypechild"></xsl:with-param>
					<xsl:with-param name="to" select="$wheretype"></xsl:with-param>
				</xsl:call-template>		
			</xsl:variable>
			
			<xsl:variable name="value1">
				<xsl:choose>
					<xsl:when test="$valueDao != ''">
						<xsl:choose>
						<xsl:when test="$value_otherDao4 != ''">
								<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao3"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao4"/><xsl:text>"</xsl:text>
							</xsl:when>
							<xsl:when test="$value_otherDao3 != ''">
								<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao3"/><xsl:text>"</xsl:text>
							</xsl:when>
							<xsl:when test="$value_otherDao != ''">
								<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"/><xsl:text>.</xsl:text><xsl:value-of select="$value_otherDao"/><xsl:text>"</xsl:text>
							</xsl:when>											
							<xsl:otherwise>
								<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"></xsl:value-of><xsl:text>"</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>This field must be a DAO Field!</xsl:text>
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:variable>
			
			<xsl:choose>
				<xsl:when test="$filter ='.andWhere' or $filter ='.orWhere' or $filter ='.having' or $filter ='.where'">
					<xsl:choose>
						<xsl:when test="contains($operator,'like')">
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>if(Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$valor2_"/><xsl:text>)){</xsl:text>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:value-of select="$operator"/><xsl:text>"%"+</xsl:text><xsl:value-of select="$value2"/><xsl:text>.trim()+"%");</xsl:text>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>}</xsl:text>
						</xsl:when>	
						<xsl:when test="$block_namechild = 'text' ">
							<xsl:value-of select="$newlineTab1"/>
							<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:value-of select="$operator"/><xsl:value-of select="$value2"/><xsl:text>);</xsl:text>
						</xsl:when>		
						<xsl:otherwise>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>if(Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$valor2_"/><xsl:text>)){</xsl:text>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:value-of select="$operator"/><xsl:value-of select="$value2"/><xsl:text>);</xsl:text>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>}</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				
				<xsl:when test="$filter ='.whereIn' or $filter ='.whereNotIn'">
					<xsl:value-of select="$newlineTab1"/>
					<xsl:text>if(Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$valor2_"/><xsl:text>)){</xsl:text>
					<xsl:value-of select="$newlineTab2"/>
					<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:text>,</xsl:text><xsl:value-of select="$value2"/><xsl:text>);</xsl:text>
					<xsl:value-of select="$newlineTab1"/>
					<xsl:text>}</xsl:text>
				</xsl:when>
				
				<xsl:when test="$filter ='.andWhereIsNull' or $filter ='.andWhereNotNull' or $filter ='.orWhereIsNull' or $filter ='.orWhereNotNull' ">
					<xsl:value-of select="$newlineTab1"/>
					<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:text>);</xsl:text>
				</xsl:when>
				
				<xsl:when test="$filter ='.andWhereBetween' or $filter ='.orWhereBetween'">
					<xsl:variable name="upvaluefield1">
						<xsl:call-template name="InitCap">
							<xsl:with-param name="text" select="$wherevalue"/>	
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:variable name="upvaluefield2">
						<xsl:call-template name="InitCap">
							<xsl:with-param name="text" select="$wherevalue3"/>
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:choose>
					
						<xsl:when test="$whererange != ''">
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>if(Core.isNotNullOrZero(model.get</xsl:text><xsl:value-of select="$upvaluefield1"/><xsl:text>())){</xsl:text>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:text>String datas[]= model.get</xsl:text><xsl:value-of select="$upvaluefield1"/><xsl:text>().trim().split(" / ");</xsl:text>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:text>, Core.formatDate(datas[0], "dd-mm-yyyy", "yyyy-mm-dd"),Core.formatDate(datas[1], "dd-mm-yyyy", "yyyy-mm-dd"));</xsl:text>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>}</xsl:text>
						</xsl:when>
						
						<xsl:otherwise>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>if(Core.isNotNullOrZero(model.get</xsl:text><xsl:value-of select="$upvaluefield1"/><xsl:text>()) &amp;&amp; Core.isNotNullOrZero(model.get</xsl:text><xsl:value-of select="$upvaluefield2"/><xsl:text>())){</xsl:text>
							<xsl:value-of select="$newlineTab2"/>
							<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:text>,</xsl:text><xsl:value-of select="$value2"/><xsl:text>,</xsl:text><xsl:value-of select="$value3"/><xsl:text>);</xsl:text>
							<xsl:value-of select="$newlineTab1"/>
							<xsl:text>}</xsl:text>
						</xsl:otherwise>
					
					</xsl:choose>

				</xsl:when>

			</xsl:choose>
					
			<xsl:call-template name="listar.andWheres">
				<xsl:with-param name="daofilter" select="$daofilter"/>
				<xsl:with-param name="total" select="$total"/>
				<xsl:with-param name="valueAttrName" select="$valueAttrName"/>
				<xsl:with-param name="values" select="$values"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		
		</xsl:if>
		
	</xsl:template>
	
</xsl:stylesheet>