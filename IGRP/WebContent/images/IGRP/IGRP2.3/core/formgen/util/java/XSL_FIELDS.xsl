<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    
	<!--
		Declare fields and create instance in class view
    	if(type=='declare'){
     		Field text_1;
     		Field text_2;
     		...
     	}else if(type=='instance'){
	     	text_1 = new TextField("text_1");
			text_1.setLabel("Text");
	     	text_2 = new TextField("text_2");
			text_2.setLabel("Text");
			...
		}else if(type=='set-model'){
			text_1.setValue(model);
		}
	-->
     <xsl:template name="gen-field-view">
		<xsl:param name="type" /> 
        <xsl:for-each select="//fields/*">
            <xsl:if test="not(@name=preceding::node()/@name)">
				<xsl:choose>
					<xsl:when test="$type='declare'">
						<xsl:value-of select="$tab"/>
						<xsl:choose>
							<xsl:when test="@type='hidden'">
								<xsl:value-of select="concat('public Field ',@name,';')"/>
							</xsl:when>
							<xsl:when test="@type='checkbox' or @type='radio'">
								<xsl:value-of select="concat('public Field ',name(),';')"/>
								<xsl:value-of select="$newline"/>
								<xsl:value-of select="$tab"/>
								<xsl:value-of select="concat('public Field ',name(),'_check',';')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('public Field ',name(),';')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$type='instance'">
						<xsl:value-of select="$tab2"/>
						<xsl:variable name="tag_name">
							<xsl:choose>
								<xsl:when test="@type='hidden'">
									<xsl:value-of select="@name"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
					 	</xsl:variable>
						
						<xsl:value-of select="concat($tag_name,' = new ')"/>
						<xsl:call-template name="typeFieldClass">
				    		<xsl:with-param name="type" select="@type" />
				    	</xsl:call-template>
						<xsl:value-of select="concat('(','model',',',$double_quotes,$tag_name,$double_quotes,');')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($tag_name,'.setLabel(gt(',$double_quotes,./label,$double_quotes,'));')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
					
						<xsl:variable name="container_type">
					 		<xsl:value-of select="../../@type"/>
					 	</xsl:variable>
					 	
					 	<xsl:if test="@persist='true' ">
							<xsl:value-of select="concat($tag_name,'.setValue(gt(',$double_quotes,normalize-space(./value),$double_quotes,'));')"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
						</xsl:if>
						
						<xsl:if test="@action and @app and @page and @custom_action=''">
							<xsl:variable name="linkUrl">
								<xsl:text>webapps?r=</xsl:text>
								<xsl:value-of select="@app"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="@page"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="@action"/>
							</xsl:variable>
							<xsl:value-of select="concat($tag_name,'.setValue(',$double_quotes,$linkUrl,$double_quotes,')')"/>;
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
						</xsl:if>

						<!-- 
							add recursive properies
							date_1.propertie().add("name","p_date_1").add("type","date");
						-->
						<xsl:value-of select="concat($tag_name,'.propertie()')"/>
						<xsl:for-each select="@*">
							<xsl:call-template name="filterComponentsAttrs"/>
		    			</xsl:for-each>
						<xsl:value-of select="';'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						
						<xsl:variable name="_tag">
							<xsl:value-of select="$tag_name"/>
						</xsl:variable>
<!-- 						<xsl:value-of select="$newline"/> -->
<!-- 						<xsl:value-of select="$tab2"/> -->
				 		<xsl:if test="$container_type='table' and (@type='checkbox' or @type='radio')">
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
					 		<xsl:value-of select="concat($tag_name,'_check = new ')"/>
					 		
							<xsl:call-template name="typeFieldClass">
					    		<xsl:with-param name="type" select="@type" />
					    	</xsl:call-template>
					    	<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:value-of select="concat('(','model',',',$double_quotes,$tag_name,'_check',$double_quotes,');')"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:value-of select="concat($tag_name,'_check','.propertie()')"/>
							<xsl:for-each select="@*">
								<xsl:call-template name="filterComponentsAttrs"/>
			    			</xsl:for-each>
							<xsl:value-of select="';'"/>
					 	</xsl:if>
					 	
					</xsl:when>
					<xsl:when test="$type='set-model'">
						<xsl:if test="@type !='select' and @type!='checkboxlist' and @type!='radiolist'">
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:variable name="tag_name">
								<xsl:choose>
									<xsl:when test="@type='hidden'">
										<xsl:value-of select="@name"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="name()"/>
									</xsl:otherwise>
								</xsl:choose>
						 	</xsl:variable>
						 	<xsl:value-of select="concat($tag_name,'.setValue(model);')"/>
							<xsl:value-of select="$newline"/>
					 	</xsl:if>
					</xsl:when>
				</xsl:choose>				
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	

	<!-- get type class field -->
	<xsl:template name="typeFieldClass">
    	<xsl:param name="type"/>    	
	    	<xsl:choose>
	    		<xsl:when test="$type='number'">
	    			<xsl:value-of select="'NumberField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='text'">
	    			<xsl:value-of select="'TextField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='hidden'">
	    			<xsl:value-of select="'HiddenField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='email'">
	    			<xsl:value-of select="'EmailField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='select'">
	    			<xsl:value-of select="'ListField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='image'">
	    			<xsl:value-of select="'ImageField'" />
	    		</xsl:when>	    		 
	    		<xsl:when test="$type='link'">
	    			<xsl:value-of select="'LinkField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='password'">
	    			<xsl:value-of select="'PasswordField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='separator'">
	    			<xsl:value-of select="'SeparatorField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='date'">
	    			<xsl:value-of select="'DateField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='checkbox'">
	    			<xsl:value-of select="'CheckBoxField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='checkboxlist'">
	    			<xsl:value-of select="'CheckBoxListField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='color'">
	    			<xsl:value-of select="'ColorField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='file'">
	    			<xsl:value-of select="'FileField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='lookup'">
	    			<xsl:value-of select="'LookupField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='plaintext'">
	    			<xsl:value-of select="'PlainTextField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='radio'">
	    			<xsl:value-of select="'RadioField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='radiolist'">
	    			<xsl:value-of select="'RadioListField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='textarea'">
	    			<xsl:value-of select="'TextAreaField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='texteditor'">
	    			<xsl:value-of select="'TextEditorField'" />
	    		</xsl:when>
	    		<xsl:when test="$type='virtualkeyboard'">
	    			<xsl:value-of select="'VirtaulKeyboardField'" />
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:value-of select="'TextField'" />
	    		</xsl:otherwise>  		
	    	</xsl:choose>    	
    </xsl:template>      

    <!-- get type java field -->
	<xsl:template name="get-variable-type-java">
    	<xsl:param name="type"/>
   		<xsl:param name="javaType" select="''" />     			
	    	<xsl:choose>
	    		<xsl:when test="$javaType !=''">
	    			<xsl:value-of select="$javaType" />
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:choose>
			    		<xsl:when test="$type='checkbox' or $type='radio' or $type='range' or $type='number'">
			    			<xsl:value-of select="'int'" />
			    		</xsl:when>
			    		<xsl:when test="$type ='checkboxlist' or $type='radiolist'"><xsl:value-of select="'int[]'" /></xsl:when>
			    		<xsl:otherwise>
			    			<xsl:value-of select="'String'" />
			    		</xsl:otherwise>
	    			</xsl:choose>	
	    		</xsl:otherwise>
	    	</xsl:choose>    	
    </xsl:template> 
	
	<!-- get type java field for different context-->
	<xsl:template name="get-java-type">
    	<xsl:param name="type"/>    
    	<xsl:param name="content"/> 
    	
    	<xsl:variable name="variable">
    		<xsl:call-template name="get-variable-type-java">
    			<xsl:with-param name="type" select="$type"/>
    		</xsl:call-template>
    	</xsl:variable>
    	
    	<xsl:choose>
    		<xsl:when test="$content='separatorlist' or $content='formlist'">    			
    			<xsl:value-of select="concat($variable,'[]')"/>
    		</xsl:when>
    		<xsl:otherwise>
    			<xsl:value-of select="$variable"/>
    		</xsl:otherwise>
    	</xsl:choose>
    	
    </xsl:template> 
    
    
    <!-- gen get and set method for field -->
	<xsl:template name="gen-method-set-get">
    	<xsl:param name="type"/> 
    	<xsl:param name="type_content" select="''"/>     
    	<xsl:param name="name"/>   
    	<xsl:param name="tab_" select="$tab"/>   
    	<xsl:param name="tab2_" select="$tab2"/>   
    	<xsl:param name="javaType" select="''"/>  
    	
    	<xsl:variable name="variable_type">
    		<xsl:call-template name="get-java-type">
    			<xsl:with-param name="type" select="$type"/>
    			<xsl:with-param name="content" select="$type_content"/>
    		</xsl:call-template>
    	</xsl:variable>

     <xsl:choose>
    		<xsl:when test="$javaType != ''">
    			<xsl:call-template name="genMethod-Get-Set">
    				<xsl:with-param name="type" select="$type"/>
    				<xsl:with-param name="type_content" select="$type_content"/>
    				<xsl:with-param name="name" select="$name"/>
    				<xsl:with-param name="tab_" select="$tab_"/>
    				<xsl:with-param name="tab2_" select="$tab2_"/>
   					<xsl:with-param name="java_type_return" select="$javaType"/>
    			</xsl:call-template>
    		</xsl:when>
    		<xsl:otherwise>
    			<xsl:choose>
    				<xsl:when test="$type='Pair'">
		    			<xsl:call-template name="genMethod-Get-Set">
		    				<xsl:with-param name="type" select="$type"/>
		    				<xsl:with-param name="type_content" select="$type_content"/>
		    				<xsl:with-param name="name" select="$name"/>
		    				<xsl:with-param name="tab_" select="$tab_"/>
		    				<xsl:with-param name="tab2_" select="$tab2_"/>
		    				<xsl:with-param name="java_type_return" select="'Pair'"/>
		    			</xsl:call-template>
		    		</xsl:when>	
		    		<xsl:when test="$type='arraylist'">
		    			<xsl:value-of select="$tab"/>
						<xsl:variable name="tableName">
			    			<xsl:call-template name="gen-className">
			    				<xsl:with-param name="className"><xsl:value-of select="$name"/> </xsl:with-param> 
			    			</xsl:call-template> 
			    		</xsl:variable>  		    			
				    	<xsl:call-template name="genMethod-Get-Set">
		    				<xsl:with-param name="type" select="$type"/>
		    				<xsl:with-param name="type_content" select="$type_content"/>
		    				<xsl:with-param name="name" select="$name"/>
		    				<xsl:with-param name="tab_" select="$tab_"/>
		    				<xsl:with-param name="tab2_" select="$tab2_"/>
		    				<xsl:with-param name="java_type_return" select="concat('List&lt;',$tableName,'&gt;')"/>
		    				<xsl:with-param name="parameter" select="concat('List&lt;',$tableName,'&gt;',' ',$name)"/>
		    			</xsl:call-template>	
		    		</xsl:when>
		    		<xsl:when test="$type='link'">
		    			<xsl:variable name="name_">
			    			<xsl:call-template name="CamelCaseWord">
						        <xsl:with-param name="text">
						        	<xsl:value-of select="$name"/>
						        </xsl:with-param>
					        </xsl:call-template>
			    		</xsl:variable> 
				    	<xsl:call-template name="genMethod-Get-Set">
		    				<xsl:with-param name="type" select="$type"/>
		    				<xsl:with-param name="type_content" select="$type_content"/>
		    				<xsl:with-param name="name" select="$name"/>
		    				<xsl:with-param name="tab_" select="$tab_"/>
		    				<xsl:with-param name="tab2_" select="$tab2_"/>
		    				<xsl:with-param name="java_type_return" select="'String'"/>
		    				<xsl:with-param name="parameter" select="'String app,String page,String action'"/>
		    				<xsl:with-param name="parameter_set" select="'new Config().getResolveUrl(app, page, action)'"/>
		    			</xsl:call-template>		
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:call-template name="genMethod-Get-Set">
		    				<xsl:with-param name="type" select="$type"/>
		    				<xsl:with-param name="type_content" select="$type_content"/>
		    				<xsl:with-param name="name" select="$name"/>
		    				<xsl:with-param name="tab_" select="$tab_"/>
		    				<xsl:with-param name="tab2_" select="$tab2_"/>
		    				<xsl:with-param name="java_type_return" select="$variable_type"/>
		    			</xsl:call-template>
		    		</xsl:otherwise>
	    		</xsl:choose>
    		</xsl:otherwise>
    	</xsl:choose>	
    </xsl:template>     
    
    
    <xsl:template name="genMethod-Get-Set">    	
    	<xsl:param name="type"/> 
    	<xsl:param name="type_content" select="''"/>     
    	<xsl:param name="name"/>   
    	<xsl:param name="tab_" select="$tab"/>   
    	<xsl:param name="tab2_" select="$tab2"/>        
    	<xsl:param name="java_type_return"/>  
    	<xsl:param name="parameter" select="''"/> 
    	<xsl:param name="parameter_set" select="''"/> 
    	<xsl:param name="return" select="''"/>  
    	
    		<xsl:variable name="name_">
    			<xsl:call-template name="CamelCaseWord">
			        <xsl:with-param name="text">
			        	<xsl:value-of select="$name"/>
			        </xsl:with-param>
		        </xsl:call-template>
    		</xsl:variable> 
    		
    		<!-- Gen Method Set -->
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab_"/>   			
   			<xsl:choose>
   				<xsl:when test="$parameter!=''">
   					<xsl:value-of select="concat('public void set',$name_,'(',$parameter,'){')" />
   				</xsl:when>
   				<xsl:otherwise>
   					<xsl:value-of select="concat('public void set',$name_,'(',$java_type_return,' ',$name,'){')" />
   				</xsl:otherwise>
   			</xsl:choose>
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab2_"/>
   			
   			<xsl:choose>
   				<xsl:when test="$parameter_set!=''">
   					<xsl:value-of select="concat('this.',$name,' = ',$parameter_set,';')"/>
   				</xsl:when>
   				<xsl:otherwise>
   					<xsl:value-of select="concat('this.',$name,' = ',$name,';')"/>
   				</xsl:otherwise>
   			</xsl:choose>
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab_"/>
   			<xsl:value-of select="'}'"/>
    		<!-- En gen Method Set -->
    		
    		<!-- Gen Method Get -->
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab_"/>					
   			<xsl:value-of select="concat('public ',$java_type_return,' get',$name_,'(){')" />
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab2_"/>
			<xsl:choose>
				<xsl:when test="$return !=''">
		   			<xsl:value-of select="concat('return ',$return)"/>
				</xsl:when>
				<xsl:otherwise>
		   			<xsl:value-of select="concat('return this.',$name,';')"/>
				</xsl:otherwise>
			</xsl:choose>
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab_"/>
   			<xsl:value-of select="'}'"/>
   			
   			<!-- End Method Get -->
   			
			<xsl:if test="$type='link'">	    			
   				<xsl:call-template name="genMethod-Get-Set">
    				<xsl:with-param name="type" select="'as'"/>
    				<xsl:with-param name="type_content" select="''"/>
    				<xsl:with-param name="name" select="concat($name,'_desc')"/>
    				<xsl:with-param name="tab_" select="$tab_"/>
    				<xsl:with-param name="tab2_" select="$tab2_"/>
    				<xsl:with-param name="java_type_return" select="$java_type_return"/>
    			</xsl:call-template>
   			</xsl:if>
   			
   			
			<xsl:if test="($type='checkbox' or $type='radio')">	    			
   				<xsl:call-template name="genMethod-Get-Set">
    				<xsl:with-param name="type" select="'as'"/>
    				<xsl:with-param name="type_content" select="''"/>
    				<xsl:with-param name="name" select="concat($name,'_check')"/>
    				<xsl:with-param name="tab_" select="$tab_"/>
    				<xsl:with-param name="tab2_" select="$tab2_"/>
    				<xsl:with-param name="java_type_return" select="$java_type_return"/>
    			</xsl:call-template>
   			</xsl:if>
    </xsl:template>

</xsl:stylesheet>