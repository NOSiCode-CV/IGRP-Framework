<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="utils.meaning" >		
		<xsl:param name="key"/>		
		<xsl:choose>		
			<xsl:when test="$key = 'andWhere'">		
				<xsl:text>.andWhere</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'andWhereIsNull'">			
				<xsl:text>.andWhereIsNull</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'andWhereNotNull'">		
				<xsl:text>.andWhereNotNull</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'andWhereBetween'">			
				<xsl:text>.andWhereBetween</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'orWhere'">			
				<xsl:text>.orWhere</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'orWhereIsNull'">			
				<xsl:text>.orWhereIsNull</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'orWhereNotNull'">			
				<xsl:text>.orWhereNotNull</xsl:text>	
			</xsl:when>			
			<xsl:when test="$key = 'orWhereBetween'">			
				<xsl:text>.orWhereBetween</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'whereIn'">			
				<xsl:text>.whereIn</xsl:text>	
			</xsl:when>			
			<xsl:when test="$key = 'whereNotIn'">			
				<xsl:text>.whereNotIn</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'having'">			
				<xsl:text>.having</xsl:text>						
			</xsl:when>			
			<xsl:when test="$key = 'where'">			
				<xsl:text>.where</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_EQUAL'">				
				<xsl:text>," = ",</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_GT'">				
				<xsl:text>," &gt; ",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'WHERE_GTT'">				
				<xsl:text> &gt; </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_GTE'">				
				<xsl:text>," &gt;= ",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'WHERE_GTEE'">				
				<xsl:text> &gt;= </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_LT'">				
				<xsl:text>," &lt; ",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'WHERE_LTT'">				
				<xsl:text> &lt; </xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'IN'">				
				<xsl:text>,"IN",</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_LTE'">				
				<xsl:text>," &lt;= ",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'WHERE_LTEE'">				
				<xsl:text> &lt;= </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_DIF'">				
				<xsl:text>, " &lt;&gt; ", </xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'WHERE_EQ'">				
				<xsl:text>,"=",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'WHERE_EQQ'">				
				<xsl:text> = </xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'WHERE_DIF'">				
				<xsl:text>,"&lt;&gt;",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'WHERE_DIFF'">				
				<xsl:text> != </xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'WHERE_LIKE'">				
				<xsl:text>,"like",</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHERE_NOTLIKE'">				
				<xsl:text>,"notlike",</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'par_equall'">				
				<xsl:text>.equals(</xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'par_not_equall'">				
				<xsl:text>.equals(</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'par_contains'">				
				<xsl:text>.contains(</xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'par_equalsIgnoreCase'">				
				<xsl:text>.equalsIgnoreCase(</xsl:text>					
			</xsl:when>							
			<xsl:when test="$key = 'AND'">				
				<xsl:text> &amp;&amp; </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'OR'">				
				<xsl:text> || </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'EQ'">				
				<xsl:text> == </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'NEQ'">				
				<xsl:text> != </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'LT'">				
				<xsl:text> &lt; </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'LTE'">				
				<xsl:text> &lt;= </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'GT'">				
				<xsl:text> &gt; </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'GTE'">				
				<xsl:text> &gt;= </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'um'">				
				<xsl:text>.findOne</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'todos'">				
				<xsl:text>.findAll</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'TODOSS'">				
				<xsl:text>.all();</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'order_by_asc'">			
				<xsl:variable name="order_value" select="substring-after(value[@name='order_value']/block/field,'::')"/>				
				<xsl:text>.orderByAsc("</xsl:text><xsl:value-of select="$order_value"/><xsl:text>")</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'order_by_desc'">			
				<xsl:variable name="order_value" select="substring-after(value[@name='order_value']/block/field,'::')"/>				
				<xsl:text>.orderByDesc("</xsl:text><xsl:value-of select="$order_value"/><xsl:text>")</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'limit'">			
				<xsl:variable name="limit_value" select="field[@name='limit']"/>				
				<xsl:text>.limit(</xsl:text><xsl:value-of select="$limit_value"/><xsl:text>).all();</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'UMM'">				
				<xsl:text>.one();</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'TRUE'">				
				<xsl:text> true </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'FALSE'">				
				<xsl:text> false </xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'WHILE'">				
				<xsl:text></xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'UNTIL'">				
				<xsl:text>!</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'BREAK'">				
				<xsl:text>break;</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'CONTINUE'">				
				<xsl:text>continue;</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'ADD'">				
				<xsl:text>+</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'MINUS'">				
				<xsl:text>-</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'MULTIPLY'">				
				<xsl:text>*</xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'DIVIDE'">				
				<xsl:text>/</xsl:text>					
			</xsl:when>			
			<xsl:when test="$key = 'POWER'">				
				<xsl:text>^</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'percent'">				
				<xsl:text>percent</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'counting'">				
				<xsl:text>.getCount()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'summingLong'">				
				<xsl:text>.getSum()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'averagingInt'">				
				<xsl:text>.getAverage()</xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'maxBy'">				
				<xsl:text>.getMax()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'minBy'">				
				<xsl:text>.getMin()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'get_counting'">				
				<xsl:text>.getCount(</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'get_summingLong'">				
				<xsl:text>.getSum(</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'get_averagingInt'">				
				<xsl:text>.getAvg(</xsl:text>					
			</xsl:when>		
			<xsl:when test="$key = 'get_maxBy'">				
				<xsl:text>.getMax(</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'get_minBy'">				
				<xsl:text>.getMin(</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'no_add'">				
				<xsl:text>.noAdd()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'no_edit'">				
				<xsl:text>.noEdit()</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'no_delete'">				
				<xsl:text>.noDelete()</xsl:text>					
			</xsl:when>
			<xsl:when test="$key = 'add_propertie'">				
				<xsl:text>.addPropertie</xsl:text>					
			</xsl:when>	
			<xsl:when test="$key = 'add_message'">				
				<xsl:text>.addMessage</xsl:text>					
			</xsl:when>				
		</xsl:choose>		
	</xsl:template>	
</xsl:stylesheet>