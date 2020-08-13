<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.listar" >
	
		<xsl:variable name="mutation" select="mutation/@count"/>
		
		<xsl:variable name="find" select="field[@name='find']"/>
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="fill" select="field[@name='FILL']"/>
		
		<xsl:variable name="table" select="substring-after(@type,'listar_')"/>
		
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
			
		<xsl:variable name="code">
		
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
		
			<xsl:value-of select="$newlineTab1"/>
			
			<xsl:value-of select="$dao"/><xsl:text> </xsl:text><xsl:value-of select="$daofilter"/><xsl:text> = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>().find();</xsl:text>
			
			<xsl:value-of select="$andWheres"/>
			
			<xsl:value-of select="$newlineTab1"/>
			
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"/><xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_low"/><xsl:text>List = </xsl:text><xsl:value-of select="$daofilter"></xsl:value-of><xsl:value-of select="$findValue"></xsl:value-of>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>Table = new ArrayList&lt;&gt;</xsl:text><xsl:text>();</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of> 
			
			<xsl:text>if(</xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>List != null){</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>for(</xsl:text><xsl:value-of select="$dao"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text> : </xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>List){</xsl:text>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text> row = new </xsl:text><xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>();</xsl:text> 
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:value-of select="$row"></xsl:value-of>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
			<xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>Table.add(row);</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>}</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>model.set</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>(</xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>Table);</xsl:text>
			
			<xsl:if test="$fill = 'TRUE' and $mutation &gt;= '1' ">
			
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
				<xsl:text>}</xsl:text>
				
			</xsl:if>
		
		</xsl:variable>
		
		<xsl:call-template name="utils.try">
			
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			
			<xsl:with-param name="exceptionCode">
				
				<xsl:text>e.printStackTrace();</xsl:text>
				
			</xsl:with-param>
			
		</xsl:call-template>
		
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
			
			<xsl:variable name="valueDao" select = "substring-after(value[@name=$value1Name]/block[contains(@type,'et-dao-')]/field,'::')"></xsl:variable>
			
			<xsl:variable name="wheretypechild" select="substring-before(value[@name=$value2Name]/block/field,'::')"/>
			
			<xsl:variable name="block_namechild" select="value[@name=$value2Name]/block/@type"/>
			
			<xsl:variable name="wheretype" select="substring-before(value[@name=$value1Name]/block/field,'::')"/>
				
			<xsl:variable name="wherevalue" select="substring-after(substring-before(value[@name=$value2Name]/block/field,'//'),'::')"/>
			
			<xsl:variable name="wherevalue3" select="substring-after(substring-before(value[@name=$value3Name]/block/field,'//'),'::')"/>
			
			<xsl:variable name="whererange" select="substring-after(value[@name=$value2Name]/block/field,'//')"/>
			
			<xsl:variable name="filter">
			
				<xsl:call-template name="utils.meaning">
				
					<xsl:with-param name="key" select="field[@name=$filterName]"/>
					
				</xsl:call-template>
				
			</xsl:variable>
			
			<xsl:variable name="value1">
			
				<xsl:choose>
				
					<xsl:when test="$valueDao != ''">
					
						<xsl:variable name="value_otherDao" select = "substring-after(value[@name=$value1Name]/block/value/block/field,'::')"></xsl:variable>
			
						<xsl:choose>
						
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
				
					<xsl:with-param name="daolow" select="daolow"></xsl:with-param>
					
					<xsl:with-param name="value" select="$valor2_"></xsl:with-param>
					
					<xsl:with-param name="valueblock" select="$wherevalue"></xsl:with-param>
					
					<xsl:with-param name="from" select="$wheretypechild"></xsl:with-param>
					
					<xsl:with-param name="to" select="$wheretype"></xsl:with-param>
					
					<xsl:with-param name="neto" select="neto"></xsl:with-param>
					
					<xsl:with-param name="valuechild" select="valuechild"></xsl:with-param>
					
					<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>
					
					<xsl:with-param name="block_name" select="block_name"></xsl:with-param>
					
				</xsl:call-template>
						
			</xsl:variable>
			
			<xsl:variable name="valor3_">
			
				<xsl:call-template name="blockly.elements">
				
					<xsl:with-param name="elements" select="$values[@name=$value3Name]/block"></xsl:with-param>
					
				</xsl:call-template>
				
			</xsl:variable>
								
			<xsl:variable name="value3">
			
				<xsl:call-template name="convert_blocks">
				
					<xsl:with-param name="daolow" select="daolow"></xsl:with-param>
					
					<xsl:with-param name="value" select="$valor3_"></xsl:with-param>
					
					<xsl:with-param name="valueblock" select="$wherevalue"></xsl:with-param>
					
					<xsl:with-param name="from" select="$wheretypechild"></xsl:with-param>
					
					<xsl:with-param name="to" select="$wheretype"></xsl:with-param>
					
					<xsl:with-param name="neto" select="neto"></xsl:with-param>
					
					<xsl:with-param name="valuechild" select="valuechild"></xsl:with-param>
					
					<xsl:with-param name="block_namechild" select="block_namechild"></xsl:with-param>
					
					<xsl:with-param name="block_name" select="block_name"></xsl:with-param>
					
				</xsl:call-template>
						
			</xsl:variable>
			
			<xsl:choose>
			
				<xsl:when test="$filter ='.andWhere' or $filter ='.orWhere' or $filter ='.having' or $filter ='.where'">
				
					<xsl:choose>
					
					<xsl:when test="contains($operator,'like')">
					
						<xsl:value-of select="$newlineTab1"/>
					
						<xsl:text>if(Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$value2"/><xsl:text>)){</xsl:text>
		
						<xsl:value-of select="$newlineTab2"/>
						
						<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:value-of select="$operator"/><xsl:text>"%"+</xsl:text><xsl:value-of select="$value2"/><xsl:text>.trim()+"%");</xsl:text>
						
						<xsl:value-of select="$newlineTab1"/>
						
						<xsl:text>}</xsl:text>
					
					</xsl:when>
					
					<xsl:otherwise>
					
						<xsl:value-of select="$newlineTab1"/>
					
						<xsl:text>if(Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$value2"/><xsl:text>)){</xsl:text>
		
						<xsl:value-of select="$newlineTab2"/>
						
						<xsl:value-of select="$daofilter"/><xsl:value-of select="$filter"/><xsl:text>(</xsl:text><xsl:value-of select="$value1"/><xsl:value-of select="$operator"/><xsl:value-of select="$value2"/><xsl:text>);</xsl:text>
						
						<xsl:value-of select="$newlineTab1"/>
						
						<xsl:text>}</xsl:text>
					
					</xsl:otherwise>
					
					</xsl:choose>
					
				</xsl:when>
				
				<xsl:when test="$filter ='.whereIn' or $filter ='.whereNotIn'">
				
					<xsl:value-of select="$newlineTab1"/>
				
					<xsl:text>if(Core.isNotNullOrZero(</xsl:text><xsl:value-of select="$value2"/><xsl:text>)){</xsl:text>
	
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
							
							<xsl:text>String datas[]= model.get</xsl:text><xsl:value-of select="$upvaluefield1"/><xsl:text>().trim().split("/");</xsl:text>
							
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
		