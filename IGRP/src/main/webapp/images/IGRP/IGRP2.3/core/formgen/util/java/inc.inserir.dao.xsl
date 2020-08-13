<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.inserir_dao" >
		
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="typedad" select="../../@type"/>
		
		<xsl:variable name="daolow">
		
	       	<xsl:call-template name="LowerCase">
	       	
	       		<xsl:with-param name="text" select="$dao"/>
	       		
	       	</xsl:call-template>
	       	
		</xsl:variable>
	   	
	   	<xsl:variable name="insercao">
	   	
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="statement[@name='value2']"/>
				
			</xsl:call-template>
			
			
		</xsl:variable>
		
		<xsl:variable name="operator">
		
			<xsl:call-template name="utils.meaning">
			
				<xsl:with-param name="key" select="field[@name='where_signal']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="valueDao" select = "substring-after(value[@name='where1']/block[contains(@type,'et-dao-')]/field,'::')"></xsl:variable>
		
		<xsl:variable name="id_dao">
			
			<xsl:choose>
			
				<xsl:when test="$valueDao != ''">
				
					<xsl:text>"</xsl:text><xsl:value-of select="$valueDao"></xsl:value-of><xsl:text>"</xsl:text>
					
				</xsl:when>
				
			</xsl:choose>
				
		</xsl:variable>
		
		<xsl:variable name="param">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="value[@name='where2']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="param_id">
		
			<xsl:call-template name="blockly.getValue">
			
				<xsl:with-param name="value" select="value[@name='param_id']"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="checkbox" select="field[@name='EDIT']"/>
		
		<xsl:variable name="hasMutation" select="mutation"></xsl:variable>
		
		<xsl:variable name="code">
		
			<xsl:choose>
			
				<xsl:when test="$typedad != 'inserir_dao' and not(contains($typedad,'save_formu_')) ">
			
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>Session session = null;</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>Transaction transaction = null;</xsl:text>
					
					
					
					<xsl:choose>
		
						<xsl:when test="$checkbox = 'TRUE'">
						
							<xsl:value-of select="$newlineTab1"></xsl:value-of>
							
							<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>
							
						</xsl:when>
					
					</xsl:choose>					
					
					
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>try{</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
					<xsl:text>if (model.validate()) {</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>session = Core.getSession(Core.defaultConnection());</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>transaction = session.getTransaction();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>transaction.begin();</xsl:text>
				
				</xsl:when>

			</xsl:choose>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
		
			<xsl:value-of select="$dao"></xsl:value-of><xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text>  = new </xsl:text><xsl:value-of select="$dao"/><xsl:text>();</xsl:text>
			
			<xsl:choose>
		
				<xsl:when test="$checkbox = 'TRUE'">
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>if(Core.isNotNull(isEdit)) {</xsl:text>
					
					<xsl:value-of select="$newlineTab3"></xsl:value-of>
					
					<xsl:text> </xsl:text><xsl:value-of select="$daolow"/><xsl:text> = session.find(</xsl:text><xsl:value-of select="$dao"></xsl:value-of><xsl:text>.class, </xsl:text><xsl:value-of select="$param_id"></xsl:value-of><xsl:text>);</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>}</xsl:text>

					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>if (</xsl:text><xsl:value-of select="$daolow"/><xsl:text> != null){</xsl:text>
			
				</xsl:when>
			
			</xsl:choose>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:value-of select="$insercao"></xsl:value-of>
			
			<xsl:choose>
		
				<xsl:when test="$checkbox = 'TRUE'">
				
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
				
					<xsl:text>}</xsl:text>
					
				</xsl:when>
			
			</xsl:choose>
				
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>session.persist(</xsl:text><xsl:value-of select="$daolow"/><xsl:text>);</xsl:text>
			
			<xsl:if test="$hasMutation">
			
				<xsl:variable name="separatorix">
					
					<xsl:call-template name="separadorplate">
					
						<xsl:with-param name="total" select="mutation/@count"/>
						
						<xsl:with-param name="valueseparator" select="'SEPARATOR'"/>
					
					</xsl:call-template>
					
				</xsl:variable>
				
				<xsl:value-of select="$separatorix"></xsl:value-of>
				
			</xsl:if>
			
			<xsl:choose>
			
				<xsl:when test="$typedad != 'inserir_dao' and not(contains($typedad,'save_formu_')) ">
				
					<xsl:value-of select="$newlineTab2"></xsl:value-of>	
					
					<xsl:text>transaction.commit();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>	
					
					<xsl:text>Core.setMessageSuccess();</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>}</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>else</xsl:text>
							
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>Core.setMessageError();</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>}catch ( Exception e ) {</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
		
					<xsl:text>e.printStackTrace();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>Core.setMessageError("Error: "+ e.getMessage());</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>if (transaction != null)</xsl:text>
					
					<xsl:value-of select="$newlineTab3"></xsl:value-of>
					
					<xsl:text>transaction.rollback();</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:text>}finally {</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>
					
					<xsl:text>if (session != null &amp;&amp; session.isOpen()) {</xsl:text>
					
					<xsl:value-of select="$newlineTab3"></xsl:value-of>	
						
					<xsl:text>session.close();</xsl:text>
					
					<xsl:value-of select="$newlineTab2"></xsl:value-of>	
					
					<xsl:text>}</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>	
					
					<xsl:text>}</xsl:text>
					
					<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
					<xsl:choose>
		
						<xsl:when test="$checkbox = 'TRUE'">
							
							<xsl:value-of select="$newlineTab1"></xsl:value-of>
							
							<xsl:text>if(Core.isNotNull(isEdit)) {</xsl:text>
							
							<xsl:value-of select="$newlineTab2"></xsl:value-of>
							
							<xsl:text>this.addQueryString("isEdit", "true");</xsl:text>
							
							<xsl:value-of select="$newlineTab2"></xsl:value-of>
							
							<xsl:text>return this.forward("</xsl:text><xsl:value-of select="$app-title"/><xsl:text>","</xsl:text><xsl:value-of select="$page-title"/><xsl:text>","index",this.queryString());</xsl:text>
							
							<xsl:value-of select="$newlineTab1"></xsl:value-of>
							
							<xsl:text>}</xsl:text>
							
						</xsl:when>
					
					</xsl:choose>		
				
				</xsl:when>
	
			</xsl:choose>			

		</xsl:variable>
			
		<xsl:value-of select="$code"></xsl:value-of>	
	
	</xsl:template>
	
	<xsl:template name="separadorplate" >
	
		<xsl:param name="total"/>
		
		<xsl:param name="valueseparator" />
		
		<xsl:param name="index" select="1"/>
		
		<xsl:if test="$index &lt;= $total">
		
			<xsl:variable name="separadora" select="concat($valueseparator,$index)"/>
			
			<xsl:variable name="separadorixa">
			
				<xsl:call-template name="blockly.getValue">
				
					<xsl:with-param name="value" select="*[@name=$separadora]"/>
					
				</xsl:call-template>
				
			</xsl:variable>
			
			<xsl:if test="$separadorixa">
			
				<xsl:value-of select="$separadorixa"/>
				
			</xsl:if>
					
			<xsl:call-template name="separadorplate">
			
				<xsl:with-param name="total" select="$total"/>
					
				<xsl:with-param name="valueseparator" select="$valueseparator"/>
				
				<xsl:with-param name="index" select="$index + 1"/>
				
			</xsl:call-template>
		
		</xsl:if>
		
	</xsl:template>
	
</xsl:stylesheet>