<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
	
	<xsl:template name="gen-sql">
 		<xsl:param name="type_op" select="'insert'"/>
 		
 		<xsl:variable name="condition">
			<xsl:for-each select="//fields/*[@iskey = 'true']">
				<xsl:variable name="name">
					<xsl:choose>
		 				<xsl:when test="@type='hidden'">
				 			<xsl:call-template name="lowerCase">
				 				<xsl:with-param name="text" select="@tag"/>
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
			     	<xsl:choose> 			
			 			<xsl:when test="starts-with($name, 'p_')">
							<xsl:call-template name="replace-all">
						        <xsl:with-param name="text" select="$name"/>
						        <xsl:with-param name="replace" select="'p_'"/>
						        <xsl:with-param name="by" select="''"/>
						     </xsl:call-template>
					     </xsl:when>
					     <xsl:otherwise>
					     	<xsl:value-of select="$name"/>
					     </xsl:otherwise>
		 			</xsl:choose> 	
				</xsl:variable>
				 			
		 		<xsl:value-of select="concat($name_,'=:',$name_)"/>
				<xsl:if test="position() != last()">
					<xsl:value-of select="' AND '"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
			
 		<xsl:if test ="$type_op != 'delete' and $type_op !='select'">
	 		<xsl:for-each select="//fields/*">
				<xsl:choose>
					<xsl:when test="@isAutoincrement">
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
			 				<xsl:when test="@type='hidden'">
					 			<xsl:call-template name="addTypeQuery">
									<xsl:with-param name="type" select="@java-type"/>
									<xsl:with-param name="name" select="@tag"/>
								</xsl:call-template>
			 				</xsl:when>
			 				<xsl:otherwise>
			 					<xsl:call-template name="addTypeQuery">
									<xsl:with-param name="type" select="@java-type"/>
									<xsl:with-param name="name" select="name()"/>
									<xsl:with-param name="format" select="@data-format"/>
								</xsl:call-template>
			 				</xsl:otherwise>
			 			</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test ="$type_op ='update' or $type_op ='select'">
			
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('.where(',$double_quotes,$condition,$double_quotes,')')"/>
			<xsl:for-each select="//fields/*[@iskey = 'true']">
				<xsl:choose>
	 				<xsl:when test="@type='hidden'">
			 			<xsl:call-template name="addTypeQuery">
							<xsl:with-param name="type" select="@java-type"/>
							<xsl:with-param name="name" select="@tag"/>
						</xsl:call-template>
	 				</xsl:when>
	 				<xsl:otherwise>
	 					<xsl:call-template name="addTypeQuery">
							<xsl:with-param name="type" select="@java-type"/>
							<xsl:with-param name="name" select="name()"/>
							<xsl:with-param name="format" select="@data-format"/>
						</xsl:call-template>
	 				</xsl:otherwise>
	 			</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test ="$type_op = 'delete'">			
			<xsl:value-of select="concat('.where(',$double_quotes,$condition,$double_quotes,')')"/>
	 		<xsl:for-each select="//fields/*[@iskey = 'true']">
				<xsl:call-template name="addTypeQueryWithParam">
					<xsl:with-param name="type" select="@java-type"/>
					<xsl:with-param name="name" select="@name"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="$type_op !='select'">
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'.execute();'"/>
		</xsl:if>
 	</xsl:template>
 
    
 	<xsl:template name="setTypeValue">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		
 		<xsl:variable name="name_">
 			<xsl:call-template name="CamelCaseWord">
 				<xsl:with-param name="text" select="$name"/>
 			</xsl:call-template>
 		</xsl:variable>
 		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
 		<xsl:choose>
 			<xsl:when test="$type='String' or $type='Date'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParam(',$double_quotes,$name,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Integer' or $type='int' or $type='Long'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamInt(',$double_quotes,$name,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Float' or $type='float'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamFloat(',$double_quotes,$name,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Double' or $type='double'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamDouble(',$double_quotes,$name,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Short' or $type='short'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamShort(',$double_quotes,$name,$double_quotes,'));')"/>
 			</xsl:when>
 			<xsl:when test="$type='Long' or $type='long'">
 				<xsl:value-of select="concat('model.set',$name_,'(Core.getParamLong(',$double_quotes,$name,$double_quotes,'));')"/>
 			</xsl:when>
 		</xsl:choose> 		
 	</xsl:template>
 	
 	<xsl:template name="addTypeQueryWithParam">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		
 		<xsl:variable name="name_"> 
	 		<xsl:choose>	 			
				<xsl:when test="starts-with($name, 'p_')">
					<xsl:call-template name="replace-all">
				        <xsl:with-param name="text" select="$name"/>
				        <xsl:with-param name="replace" select="'p_'"/>
				        <xsl:with-param name="by" select="''"/>
				     </xsl:call-template>
			     </xsl:when>
			     <xsl:otherwise>
			     	<xsl:value-of select="$name"/>
			     </xsl:otherwise>
	 		</xsl:choose>
		</xsl:variable>
 		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="$tab2"/>
 		<xsl:choose>
 			<xsl:when test="$type='String'">
 				<xsl:value-of select="concat('.addString(',$double_quotes,$name_,$double_quotes,',Core.getParam(',$double_quotes,$name,$double_quotes,'))')"/>
 			</xsl:when>
 			<xsl:when test="$type='Integer' or $type='int'">
 				<xsl:value-of select="concat('.addInt(',$double_quotes,$name_,$double_quotes,',Core.getParamInt(',$double_quotes,$name,$double_quotes,'))')"/>
 			</xsl:when>
 			<xsl:when test="$type='Float' or $type='float'">
 				<xsl:value-of select="concat('.addFloat(',$double_quotes,$name_,$double_quotes,',Core.getParamFloat(',$double_quotes,$name,$double_quotes,'))')"/>
 			</xsl:when>
 			<xsl:when test="$type='Double' or $type='double'">
 				<xsl:value-of select="concat('.addDouble(',$double_quotes,$name_,$double_quotes,',Core.getParamDouble(',$double_quotes,$name,$double_quotes,'))')"/>
 			</xsl:when>
 			<xsl:when test="$type='Short' or $type='short'">
 				<xsl:value-of select="concat('.addShort(',$double_quotes,$name_,$double_quotes,',Core.getParamShort(',$double_quotes,$name,$double_quotes,'))')"/>
 			</xsl:when>
 			<xsl:when test="$type='Long' or $type='long'">
 				<xsl:value-of select="concat('.addLong(',$double_quotes,$name_,$double_quotes,',Core.getParamLong(',$double_quotes,$name,$double_quotes,'))')"/>
 			</xsl:when>
 		</xsl:choose> 		
 	</xsl:template>
 	
 	
	<xsl:template name="addTypeQuery">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		<xsl:param name="format" select="''"/>
 		
 		<xsl:variable name="name__">
 			<xsl:choose> 			
	 			<xsl:when test="starts-with($name, 'p_')">
					<xsl:call-template name="replace-all">
				        <xsl:with-param name="text" select="$name"/>
				        <xsl:with-param name="replace" select="'p_'"/>
				        <xsl:with-param name="by" select="''"/>
				     </xsl:call-template>
			     </xsl:when>
			     <xsl:otherwise>
			     	<xsl:value-of select="$name"/>
			     </xsl:otherwise>
 			</xsl:choose>
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
 				<xsl:value-of select="concat('.addDate(',$double_quotes,$name__,$double_quotes,',model.get',$name_,'(),',$double_quotes,$format,$double_quotes,')')"/>
 			</xsl:when>
 		</xsl:choose> 		
 	</xsl:template>
 	
 	<xsl:template name="set-params-context-menu">
 		<xsl:for-each select="//content/*[@type='table']/fields/*[@iskey='true']">
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:choose>
 				<xsl:when test="@type='hidden'">
					<xsl:value-of select="concat('view.',@tag,'.setParam(true);')"/>
 				</xsl:when>
 				<xsl:otherwise>
					<xsl:value-of select="concat('view.',local-name(),'.setParam(true);')"/>
 				</xsl:otherwise>
 			</xsl:choose>
		</xsl:for-each>
 	</xsl:template>
 	
 	<xsl:template name="sql-select">
 		<xsl:for-each select="//fields/*">
 			<xsl:variable name="name">
				<xsl:choose>
	 				<xsl:when test="@type='hidden'">
			 			<xsl:call-template name="lowerCase">
			 				<xsl:with-param name="text" select="@tag"/>
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
			     <xsl:choose> 			
		 			<xsl:when test="starts-with($name, 'p_')">
					<xsl:call-template name="replace-all">
				        <xsl:with-param name="text" select="$name"/>
				        <xsl:with-param name="replace" select="'p_'"/>
				        <xsl:with-param name="by" select="''"/>
				     </xsl:call-template>
				     </xsl:when>
				     <xsl:otherwise>
				     	<xsl:value-of select="$name"/>
				     </xsl:otherwise>
	 			</xsl:choose> 			
			</xsl:variable>
			<xsl:value-of select="concat($name_,' as ',$name)"/>
 			<xsl:if test="position() != last()">
 				<xsl:value-of select="','"/>
 			</xsl:if>
		</xsl:for-each>
 	</xsl:template>
 	
 	
 	<xsl:template name="setParam">
 		<xsl:for-each select="//content/*[@type='table']/fields/*[@iskey='true']">
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:choose>
 				<xsl:when test="@type='hidden'">
					<xsl:value-of select="concat('view.',@tag,'.setParam(true);')"/>
 				</xsl:when>
 				<xsl:otherwise>
					<xsl:value-of select="concat('view.',local-name(),'.setParam(true);')"/>
 				</xsl:otherwise>
 			</xsl:choose>
		</xsl:for-each>
 	</xsl:template>
 	
 	<xsl:template name="set-param-update">
 		<xsl:for-each select="//content/*[@type='table']/fields/*[@iskey='true']">
 			<xsl:value-of select="concat('this.addQueryString(',$double_quotes,'target',$double_quotes,',',$double_quotes,'_blank',$double_quotes,');')"/>
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
 			<xsl:value-of select="concat('this.addQueryString(',$double_quotes,'isEdit',$double_quotes,',',$double_quotes,'true',$double_quotes,');')"/>
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
 			<xsl:value-of select="concat('this.addQueryString(',$double_quotes,@name,$double_quotes,',Core.getParam(',$double_quotes,@name,$double_quotes,'));')"/>
		</xsl:for-each>
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
 	
</xsl:stylesheet>