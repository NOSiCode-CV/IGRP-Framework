<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
	
	<xsl:template name="gen-sql">
 		<xsl:param name="type_op" select="'insert'"/>
 		
 		<xsl:if test ="$type_op != 'delete' and $type_op !='select'">
	 		<xsl:for-each select="//content/*[@type='form']/fields/*">
				<xsl:choose>
					<xsl:when test="@isAutoincrement">
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
			 				<xsl:when test="@type='hidden'">
					 			<xsl:call-template name="add-type-query">
									<xsl:with-param name="type" select="@java-type"/>
									<xsl:with-param name="name" select="@name"/>
								</xsl:call-template>
			 				</xsl:when>
			 				<xsl:otherwise>
			 					<xsl:call-template name="add-type-query">
									<xsl:with-param name="type" select="@java-type"/>
									<xsl:with-param name="name" select="name()"/>
								</xsl:call-template>
			 				</xsl:otherwise>
			 			</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test ="$type_op ='update' or $type_op ='delete'  or $type_op ='select'">
			<xsl:variable name="condition">
				<xsl:for-each select="//content/*[@type='form']/fields/*[@iskey = 'true']">
					<xsl:variable name="name">
						<xsl:choose>
			 				<xsl:when test="@type='hidden'">
					 			<xsl:call-template name="lowerCase">
					 				<xsl:with-param name="text" select="@name"/>
					 			</xsl:call-template>
			 				</xsl:when>
			 				<xsl:otherwise>
			 					<xsl:call-template name="lowerCase">
					 				<xsl:with-param name="text" select="name()"/>
					 			</xsl:call-template>
			 				</xsl:otherwise>
			 			</xsl:choose>
					</xsl:variable>
					
					<xsl:variable name="name_">
						<xsl:call-template name="replace-all">
					        <xsl:with-param name="text" select="$name"/>
					        <xsl:with-param name="replace" select="'p_'"/>
					        <xsl:with-param name="by" select="''"/>
					     </xsl:call-template>
					</xsl:variable>
					 			
			 		<xsl:value-of select="concat($name_,'=:',$name_)"/>
					<xsl:if test="position() != last()">
						<xsl:value-of select="' AND '"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('.where(',$double_quotes,$condition,$double_quotes,')')"/>
			<xsl:for-each select="//content/*[@type='form']/fields/*[@iskey = 'true']">
				<xsl:choose>
	 				<xsl:when test="@type='hidden'">
			 			<xsl:call-template name="add-type-query">
							<xsl:with-param name="type" select="@java-type"/>
							<xsl:with-param name="name" select="@name"/>
						</xsl:call-template>
	 				</xsl:when>
	 				<xsl:otherwise>
	 					<xsl:call-template name="add-type-query">
							<xsl:with-param name="type" select="@java-type"/>
							<xsl:with-param name="name" select="name()"/>
						</xsl:call-template>
	 				</xsl:otherwise>
	 			</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="$type_op !='select'">
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'.execute();'"/>
		</xsl:if>
 	</xsl:template>
 
    
 	<xsl:template name="set-model-value">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		
 		<xsl:variable name="name_">
 			<xsl:call-template name="CamelCaseWord">
 				<xsl:with-param name="text" select="$name"/>
 			</xsl:call-template>
 		</xsl:variable>
		
		<xsl:variable name="name__">
			<xsl:call-template name="replace-all">
		        <xsl:with-param name="text" select="$name"/>
		        <xsl:with-param name="replace" select="'p_'"/>
		        <xsl:with-param name="by" select="''"/>
		     </xsl:call-template>
		</xsl:variable>
					
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
 		<xsl:choose>
 			<xsl:when test="$type='String' or $type='Date'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParam(',$double_quotes,'p_',$name__,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Integer' or $type='int' or $type='Long'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamInt(',$double_quotes,'p_',$name__,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Float' or $type='float'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamFloat(',$double_quotes,'p_',$name__,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Double' or $type='double'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamDouble(',$double_quotes,'p_',$name__,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Short' or $type='short'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamShort(',$double_quotes,'p_',$name__,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Long' or $type='long'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamLong(',$double_quotes,'p_',$name__,$double_quotes,'));')"/>
 			</xsl:when>
 		</xsl:choose> 		
 	</xsl:template>
 	
	<xsl:template name="add-type-query">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		
 		<xsl:variable name="name__">
			<xsl:call-template name="replace-all">
		        <xsl:with-param name="text" select="$name"/>
		        <xsl:with-param name="replace" select="'p_'"/>
		        <xsl:with-param name="by" select="''"/>
		     </xsl:call-template>
		</xsl:variable>
					
 		<xsl:variable name="name_">
 			<xsl:call-template name="CamelCaseWord">
 				<xsl:with-param name="text" select="$name"/>
 			</xsl:call-template>
 		</xsl:variable>
 		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="$tab2"/>
 		<xsl:choose>
 			<xsl:when test="$type='String'">
 				<xsl:value-of select="concat('.addString(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Integer' or $type='int'">
 				<xsl:value-of select="concat('.addInt(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Float' or $type='float'">
 				<xsl:value-of select="concat('.addFloat(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Double' or $type='double'">
 				<xsl:value-of select="concat('.addDouble(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Short' or $type='short'">
 				<xsl:value-of select="concat('.addShort(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Long' or $type='long'">
 				<xsl:value-of select="concat('.addLong(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Date'">
 				<xsl:value-of select="concat('.addDate(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 		</xsl:choose> 		
 	</xsl:template>
 	
 	
 	<xsl:template name="set-params-context-menu">
 		<xsl:for-each select="//content/*[@type='table']/fields/*[@iskey='true']">
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:choose>
 				<xsl:when test="@type='hidden'">
					<xsl:value-of select="concat('view.',@name,'.setParam(true);')"/>
 				</xsl:when>
 				<xsl:otherwise>
					<xsl:value-of select="concat('view.',local-name(),'.setParam(true);')"/>
 				</xsl:otherwise>
 			</xsl:choose>
		</xsl:for-each>
 	</xsl:template>
 	
 	<xsl:template name="sql-select">
 		<xsl:for-each select="//content/*[@type='form']/fields/*">
 			<xsl:variable name="name">
				<xsl:choose>
	 				<xsl:when test="@type='hidden'">
			 			<xsl:call-template name="lowerCase">
			 				<xsl:with-param name="text" select="@name"/>
			 			</xsl:call-template>
	 				</xsl:when>
	 				<xsl:otherwise>
	 					<xsl:call-template name="lowerCase">
			 				<xsl:with-param name="text" select="name()"/>
			 			</xsl:call-template>
	 				</xsl:otherwise>
	 			</xsl:choose>
			</xsl:variable>
			<xsl:variable name="name_">
				<xsl:call-template name="replace-all">
			        <xsl:with-param name="text" select="$name"/>
			        <xsl:with-param name="replace" select="'p_'"/>
			        <xsl:with-param name="by" select="''"/>
			     </xsl:call-template>
			</xsl:variable>
			<xsl:value-of select="concat($name_,' as ',$name)"/>
 			<xsl:if test="position() != last()">
 				<xsl:value-of select="','"/>
 			</xsl:if>
		</xsl:for-each>
 	</xsl:template>
 	
 	
 	<xsl:template name="set-param-update">
 		<xsl:value-of select="concat('this.addQueryString(',$double_quotes,'target',$double_quotes,',',$double_quotes,'_blank',$double_quotes,')')"/>
 		<xsl:value-of select="concat('.addQueryString(',$double_quotes,'isEdit',$double_quotes,',',$double_quotes,'true',$double_quotes,')')"/>
 		<xsl:for-each select="//content/*[@type='table']/fields/*[@iskey='true']">
 			<xsl:value-of select="concat('.addQueryString(',$double_quotes,@name,$double_quotes,',','Core.getParam(',$double_quotes,@name,$double_quotes,'))')"/>
 		</xsl:for-each>
 		<xsl:value-of select="';'"/>
 	</xsl:template>
 	
 	
 	<xsl:template name="set-update-keys-value">
		<xsl:for-each select="//content/*[@type='form']/fields/*[@iskey='true']">	 				
 			<xsl:choose>
 				<xsl:when test="@type='hidden'">
					<xsl:call-template name="setType">
						<xsl:with-param name="name" select="@name"/>
						<xsl:with-param name="type" select="@java-type"/>
					</xsl:call-template>
 				</xsl:when>
 				<xsl:otherwise>	 					
					<xsl:call-template name="setType">
						<xsl:with-param name="name" select="name()"/>
						<xsl:with-param name="type" select="@java-type"/>
					</xsl:call-template>
 				</xsl:otherwise>
 			</xsl:choose>
		</xsl:for-each>
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>	
 	</xsl:template>
 	
 	<xsl:template name="setType">
 		<xsl:param name="name"/>
 		<xsl:param name="type"/>
 		<xsl:call-template name="set-model-value">
 			<xsl:with-param name="name" select="$name"/>
 			<xsl:with-param name="type" select="$type"/>
 		</xsl:call-template>
 	</xsl:template>
 	
	<xsl:variable name="isEdit">
		<xsl:text>Core.isNotNull(isEdit)</xsl:text>
	</xsl:variable>

 	<xsl:template name="gen-saved-or-update">		
		 	<xsl:choose>
		 		<xsl:when test="/rows/plsql/package_copy_html!=''">
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
					<xsl:value-of select="concat('String isEdit = Core.getParam(',$double_quotes,'isEdit',$double_quotes,');')"/>
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
		 			<xsl:value-of select="concat('if(',$isEdit,'){')"/>		 				
	 					<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/> 
						<xsl:value-of select="$tab"/> 
		 				<xsl:value-of select="concat('r = Core.update(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_html,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql">
							<xsl:with-param name="type_op" select="'update'"/>
						</xsl:call-template>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
	 				<xsl:value-of select="'}else{'"/>	 					
 						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>  
						<xsl:value-of select="$tab"/> 
		 				<xsl:value-of select="concat('r = Core.insert(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_html,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>						
	 				<xsl:value-of select="'}'"/>
		 		</xsl:when>
		 		<xsl:otherwise>
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
		 			<xsl:value-of select="concat('if(',$isEdit,'){')"/>
		 				<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
		 				<xsl:value-of select="concat('r = Core.update(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql">
							<xsl:with-param name="type_op" select="'update'"/>
						</xsl:call-template>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
	 				<xsl:value-of select="'}else{'"/>
	 					<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/> 
						<xsl:value-of select="$tab"/> 
		 				<xsl:value-of select="concat(' r = Core.insert(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
	 				<xsl:value-of select="'}'"/>
		 		</xsl:otherwise>
		 	</xsl:choose> 	
			
 	</xsl:template>
 	 	
	<xsl:template name="if-update">
		<xsl:variable name="if">
			<xsl:for-each select="//content/*[@type='form']/fields/*[@iskey = 'true']">			
				<xsl:variable name="name_">
					<xsl:choose>
		 				<xsl:when test="@type='hidden'">
				 			<xsl:call-template name="CamelCaseWord">
				 				<xsl:with-param name="text" select="@name"/>
				 			</xsl:call-template>
		 				</xsl:when>
		 				<xsl:otherwise>
		 					<xsl:call-template name="CamelCaseWord">
				 				<xsl:with-param name="text" select="name()"/>
				 			</xsl:call-template>
		 				</xsl:otherwise>
		 			</xsl:choose>
		 		</xsl:variable>
				<xsl:value-of select="concat('Core.isNotNullOrZero(model.get',$name_,'())')"/>
				<xsl:if test="position() != last()">
					<xsl:value-of select="'&amp;&amp;'"/>
				</xsl:if>
			</xsl:for-each>	
		</xsl:variable>	
		<xsl:choose>
			<xsl:when test="$if =''">
				<xsl:value-of select="'1==0'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$if"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
 	<xsl:template name="start-code-crud">
 		<xsl:param name="type"/>
 		
 		 <xsl:variable name="typeLower">
            <xsl:call-template name="lowerCase">
                <xsl:with-param name="text" select="$type"/>
            </xsl:call-template>
        </xsl:variable>
        
 		<xsl:text>/*----#start-code(</xsl:text>
        <xsl:value-of select="$typeLower"/>
        <xsl:text>)----*/</xsl:text>
 	</xsl:template>
 	
	<xsl:template name="end-code-crud">
 		<xsl:text>/*----#end-code----*/</xsl:text>
 	</xsl:template>
 	
 	<xsl:template name="gen-sql-combobox">
 		<xsl:for-each select="//content/*[@type='form']/fields/*[@tableName]">
 			<xsl:value-of select="concat('view.',name(),'.setSqlQuery(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,'SELECT ',@keyMap,' as ID, ',@keyMap,' as NAME',' FROM ',@schemaName,'.',@tableName,$double_quotes,');')"/>
 			<xsl:if test="position() != last()"> 				
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
 			</xsl:if>
 		</xsl:for-each>
 	</xsl:template>
 	
</xsl:stylesheet>