<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:include href="inc.meanings.xsl"/>
	
	<xsl:include href="inc.core.meanings.xsl"/>

	<xsl:template name="utils.try">
		
		<xsl:param name="code"/>
		
		<xsl:param name="exceptionCode"/>
		
		<xsl:value-of select="$newlineTab1"/>

		<xsl:text>try{</xsl:text>
		
		<xsl:value-of select="$newlineTab1"/>
		
		<xsl:if test="$code">
			
			<xsl:call-template name="utils.try.catch">
			
				<xsl:with-param name="code" select="$code"/>
				
			</xsl:call-template>
			
			<xsl:call-template name="utils.try.end">
			
				<xsl:with-param name="exceptionCode" select="$exceptionCode"/>
				
			</xsl:call-template>
			
		</xsl:if>
	
	</xsl:template>
	
	<xsl:template name="utils.try.catch">
		
		<xsl:param name="code"/>
		
		<xsl:value-of select="$code"/>
		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		
		<xsl:text>}catch(Exception e){</xsl:text>
		
	</xsl:template>
	
	<xsl:template name="utils.try.end">
	
		<xsl:param name="exceptionCode"/>
		
		<xsl:if test="$exceptionCode">
			
			<xsl:value-of select="$newlineTab1"/>
			
			<xsl:value-of select="$exceptionCode"/>
			
			<xsl:value-of select="$newlineTab1"/>
			
		</xsl:if>
	
		<xsl:text>}</xsl:text>
		
		<xsl:value-of select="$newlineTab1"></xsl:value-of>
		
	</xsl:template>
	
	<xsl:template name="utils.arguments">
	
		<xsl:param name="args"/>
		
		<xsl:text>(</xsl:text>
		
		<xsl:value-of select="$args"/>
		
		<xsl:text>)</xsl:text>
	
	</xsl:template>
	
	<xsl:template name="utils.session.begin">
	
		<xsl:param name="isedit"/>
	
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
			<xsl:text>Session session = null;</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>Transaction transaction = null;</xsl:text>
			
			<xsl:if test="$isedit">
						
				<xsl:value-of select="$newlineTab1"></xsl:value-of>
				
				<xsl:text>String isEdit = Core.getParam("isEdit");</xsl:text>
				
			</xsl:if>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
					
			<xsl:text>try{</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
		
			<xsl:text>if (model.validate()) {</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>session = Core.getSession(Core.defaultConnection());</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>transaction = session.getTransaction();</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>if(!transaction.isActive())</xsl:text>
			
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			
        	<xsl:text>transaction.begin();</xsl:text>

	</xsl:template>
	
	<xsl:template name="utils.session.end">
	
		<xsl:param name="isedit"/>
	
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
		
		<xsl:if test="$isedit">
		
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>if(Core.isNotNull(isEdit)) {</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>this.addQueryString("isEdit", "true");</xsl:text>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			
			<xsl:text>return this.forward("</xsl:text><xsl:value-of select="$app-title"/><xsl:text>","</xsl:text><xsl:value-of select="$page-title"/><xsl:text>","index",this.queryString());</xsl:text>
			
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			
			<xsl:text>}</xsl:text>
		
		</xsl:if>
	
	</xsl:template>
	
	<xsl:template name="utils.edited">
	
		<xsl:param name="value"/>
			
		<xsl:param name="valueblock"/>
		
		<xsl:param name="from"/>
		
		<xsl:param name="to"/>
		
		<xsl:param name="block_namechild"/>
	
		<xsl:variable name="edited_convert">		
			<xsl:call-template name="convert_blocks">				
				<xsl:with-param name="value" select="$value"></xsl:with-param>				
				<xsl:with-param name="valueblock" select="$valueblock"></xsl:with-param>				
				<xsl:with-param name="from" select="$from"></xsl:with-param>				
				<xsl:with-param name="to" select="$to"></xsl:with-param>				
				<xsl:with-param name="block_namechild" select="$block_namechild"></xsl:with-param>				
			</xsl:call-template>					
		</xsl:variable>
		
		<xsl:value-of select="$edited_convert"/>		
		
	</xsl:template>

</xsl:stylesheet>