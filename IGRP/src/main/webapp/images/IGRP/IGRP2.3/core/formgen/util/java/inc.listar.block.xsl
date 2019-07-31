<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.listar" >
	
		<xsl:variable name="mutation" select="mutation/@count"/>
		
		<xsl:variable name="find" select="field[@name='find']"/>
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="andWheres">
			
			<xsl:call-template name="listar.andWheres">
			
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
		
		<xsl:variable name="dao_low">
	       	<xsl:call-template name="LowerCase">
	       		<xsl:with-param name="text" select="$dao"/>
	       	</xsl:call-template>
	   	</xsl:variable>
		
		<xsl:variable name="table" select="field[@name='table']"/>
		
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

			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>&gt; </xsl:text><xsl:value-of select="$dao_low"></xsl:value-of>
			<xsl:text>List = new </xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text>().find()</xsl:text><xsl:value-of select="$andWheres"></xsl:value-of>
			<xsl:value-of select="$findValue"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>List&lt;</xsl:text><xsl:value-of select="$page-title"></xsl:value-of>
			<xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>&gt; </xsl:text>
			<xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>Table = new ArrayList&lt;</xsl:text>
			<xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text>
			<xsl:value-of select="$table_up"></xsl:value-of><xsl:text>&gt;</xsl:text><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of> 
			<xsl:text>if (</xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>List != null){</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:value-of select="$tab"></xsl:value-of>
			<xsl:text>for(</xsl:text><xsl:value-of select="$dao"></xsl:value-of>
			<xsl:text> obj : </xsl:text><xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>List){</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:value-of select="$tab2"></xsl:value-of>
			<xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text>
			<xsl:value-of select="$table_up"></xsl:value-of><xsl:text> row = new </xsl:text>
			<xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text><xsl:value-of select="$table_up">
			</xsl:value-of><xsl:text>();</xsl:text> 
			<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:value-of select="$tab2"></xsl:value-of>
			<xsl:value-of select="$row"></xsl:value-of>
			<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:value-of select="$tab2"></xsl:value-of> 
			<xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>Table.add(row);</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of><xsl:value-of select="$tab"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>model.set</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>(</xsl:text>
			<xsl:value-of select="$dao_low"></xsl:value-of><xsl:text>Table);</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:value-of select="$newline"></xsl:value-of>
			<!--  <xsl:text>} catch (Exception e) {</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>e.printStackTrace();</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>}</xsl:text>-->
		
		</xsl:variable>
		
		<xsl:call-template name="utils.try">
			
			<xsl:with-param name="code" select="$code"></xsl:with-param>
			
			<xsl:with-param name="exceptionCode">
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				<xsl:text>e.printStackTrace();</xsl:text>
				<xsl:value-of select="$newline"></xsl:value-of>
			</xsl:with-param>
			
		</xsl:call-template>
		
	</xsl:template>
	
	<xsl:template name="listar.andWheres">
	
		<xsl:param name="total"/>
		
		<xsl:param name="valueAttrName" />
			
		<xsl:param name="values"/>
		
		<xsl:param name="index" select="1"/>

		<xsl:if test="$index &lt;= $total">
		
			<xsl:variable name="value1Name" select="concat($valueAttrName,$index)"/>
			
			<xsl:variable name="operatorName" select="concat('ADD',$index,'WHERE')"/>
			
			<xsl:variable name="value2Name" select="concat($value1Name,'STATE2')"/>
			
			<xsl:variable name="value1">
				<xsl:call-template name="blockly.elements">
					<xsl:with-param name="elements" select="$values[@name=$value1Name]/block"></xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="operator">
				<xsl:call-template name="utils.meaning">
					<xsl:with-param name="key" select="field[@name=$operatorName]"/>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="value2">
				<xsl:call-template name="blockly.elements">
					<xsl:with-param name="elements" select="$values[@name=$value2Name]/block"></xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:if test="$value1 and $operator and $value2">

				<xsl:text>.andWhere(</xsl:text>
					
					<xsl:value-of select="concat($value1,$operator,$value2)"></xsl:value-of>
				
				<xsl:text>)</xsl:text>
				
				<xsl:value-of select="$newlineTab2"/>
			
			</xsl:if>
					
			<xsl:call-template name="listar.andWheres">
			
				<xsl:with-param name="total" select="$total"/>
					
				<xsl:with-param name="valueAttrName" select="$valueAttrName"/>
					
				<xsl:with-param name="values" select="$values"/>
				
				<xsl:with-param name="index" select="$index + 1"/>
				
			</xsl:call-template>
		
		</xsl:if>
		
	</xsl:template>
	

</xsl:stylesheet>
		