<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
	<!--
		Declare fields and create instance in class view
    	if(type=='declare'){
     		Field text_1;
     		Field text_2;
     		...
     	}elseif(type=='instance'){
	     	text_1 = new TextField("text_1");
			text_1.setLabel("Text");
	     	text_2 = new TextField("text_2");
			text_2.setLabel("Text");
			...
		}
	-->
     <xsl:template name="gen-field-view">
		<xsl:param name="type" /> 
        <xsl:for-each select="//rows/content/*/fields/*">        		
			<xsl:variable name="tag_name">
				<xsl:choose>
					<xsl:when test="@type='hidden'">
						<xsl:value-of select="@tag"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="name()"/>
					</xsl:otherwise>
				</xsl:choose>
		 	</xsl:variable>
	 		<xsl:variable name="container_type">
		 		<xsl:value-of select="../../@type"/>
		 	</xsl:variable>
            <!--<xsl:if test="not(@name=preceding::node()/@name)"> -->
				<xsl:choose>
					<xsl:when test="$type='declare'">
						<xsl:value-of select="$tab"/> 
						<xsl:choose>
							<xsl:when test="@type='hidden'">
								<xsl:if test="$container_type='formlist'">
									<xsl:value-of select="concat('public Field ',@tag,'_desc;')"/>
									<xsl:value-of select="$newline"/>
									<xsl:value-of select="$tab"/>
								</xsl:if>
								<xsl:value-of select="concat('public Field ',@tag,';')"/>
							</xsl:when>
							<xsl:when test="@type='checkbox' or @type='radio'">
								<xsl:value-of select="concat('public Field ',name(),';')"/>
								<xsl:value-of select="$newline"/>
								<xsl:value-of select="$tab"/>
								<xsl:value-of select="concat('public Field ',name(),'_check',';')"/>
							</xsl:when>
							<xsl:when test="@type='link' and @desc='true'">
								<xsl:value-of select="concat('public Field ',name(),';')"/>
								<xsl:value-of select="$newline"/>
								<xsl:value-of select="$tab"/>
								<xsl:value-of select="concat('public Field ',name(),'_desc',';')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('public Field ',name(),';')"/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:value-of select="$newline"/>
					</xsl:when>
					<xsl:when test="$type='instance'">
						<xsl:value-of select="$tab2"/>
						
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
						
					
					 	
					 	<xsl:if test="@persist='true' ">
					 		<xsl:variable name="p_value">
					 			
					 			<xsl:choose>
					 				<xsl:when test="value/@type='action'">
					 					<xsl:variable name="_app" select="concat($double_quotes,value/app,$double_quotes)"/>
					 					<xsl:variable name="_page" select="concat($double_quotes,value/page,$double_quotes)"/>
					 					<xsl:variable name="_action" select="concat($double_quotes,value/action,$double_quotes)"/>
					 					<xsl:value-of select="concat('Core.getIGRPLink(',$_app,',',$_page,',',$_action,')')"/>
					 				</xsl:when>
					 				<xsl:otherwise>
					 					<xsl:value-of select="concat('gt(',$double_quotes,normalize-space(value),$double_quotes,')')"/>
					 				</xsl:otherwise>
					 			</xsl:choose>
					 			
					 		</xsl:variable>
					 	
							<xsl:value-of select="concat($tag_name,'.setValue(',$p_value,');')"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/> 
						</xsl:if>
						 
						<xsl:if test="@action and @app and @page and @custom_action=''">
							<xsl:variable name="_app" select="concat($double_quotes,@app,$double_quotes)"/>
					 		<xsl:variable name="_page" select="concat($double_quotes,@page,$double_quotes)"/>
					 		<xsl:variable name="_action" select="concat($double_quotes,@action,$double_quotes)"/>

							<xsl:variable name="linkUrl">
								<xsl:value-of select="concat('Core.getIGRPLink(',$_app,',',$_page,',',$_action,')')"/>
							</xsl:variable>
							
							<xsl:value-of select="concat($tag_name,'.setValue(',$linkUrl,')')"/>;

							<xsl:value-of select="$tab2"/> 
						</xsl:if>
						
						<xsl:if test="@type='lookup' or @lookup='true'">
						
							<xsl:variable name="lookupName" select="name()"/>
							
							<xsl:variable name="lu_app" select="@app"/>
						
							<xsl:variable name="lu_act" select="@action"/>
							<xsl:variable name="lu_page">

                                <xsl:choose>

                                    <xsl:when test="contains(@page, '@')">

                                        <xsl:value-of select="substring-after(@page, '@')"/>

                                    </xsl:when>

                                    <xsl:otherwise>

                                        <xsl:value-of select="@page"/>

                                    </xsl:otherwise>

                                </xsl:choose>

                            </xsl:variable>
							<xsl:variable name="lookup_action">
								<xsl:value-of select="concat($double_quotes,$lu_app,$double_quotes)"/><xsl:text>,</xsl:text>
								<xsl:value-of select="concat($double_quotes,$lu_page,$double_quotes)"/><xsl:text>,</xsl:text>
								<xsl:value-of select="concat($double_quotes,$lu_act,$double_quotes)"/>
							</xsl:variable>			
				
							<xsl:value-of select="$lookupName"/><xsl:text>.setLookup(</xsl:text><xsl:value-of select="$lookup_action"/><xsl:text>);</xsl:text>
							
							<xsl:value-of select="concat($newline,$tab2)"/>
							
							<xsl:value-of select="$lookupName"/><xsl:text>.addParam("target","_blank");</xsl:text>
							<xsl:value-of select="concat($newline,$tab2)"/>
							
							<xsl:for-each select="lookupParams/param">
							
								<xsl:variable name="lookupParamSuffix">
									
									<xsl:if test="../@is-table = 'true'">_fk</xsl:if>
								
								</xsl:variable>
							
								<xsl:variable name="lookupParam">
									<xsl:value-of select="concat($double_quotes,@field-target,$lookupParamSuffix,$double_quotes,',',$double_quotes,.,$double_quotes)"/>
								</xsl:variable>
				
								<xsl:value-of select="$lookupName"/><xsl:text>.addLookupParam(</xsl:text><xsl:value-of select="$lookupParam"/><xsl:text>);</xsl:text>
								
								<xsl:value-of select="concat($newline,$tab2)"/>
								
							</xsl:for-each>
							
						</xsl:if>
			
						 <xsl:if test="@type='link' and @desc='true'">
							<xsl:value-of select="concat($tag_name,'_desc',' = new ')"/>
							<xsl:call-template name="typeFieldClass">
					    		<xsl:with-param name="type" select="@type" />
					    	</xsl:call-template>
							<xsl:value-of select="concat('(','model',',',$double_quotes,$tag_name,'_desc',$double_quotes,');')"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:value-of select="concat($tag_name,'_desc','.setLabel(gt(',$double_quotes,./label,$double_quotes,'));')"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
						</xsl:if>
		
						<!-- 
							add recursive properies
							date_1.propertie().add("name","p_date_1").add("type","date");
						-->
							
						<xsl:value-of select="concat($tag_name,'.propertie()')"/>
						
						<!-- For rules -->
						<xsl:if test="./rules">
							<xsl:variable name="app_" select="/rows/app" />
							<xsl:variable name="page_" select="/rows/page" />
							<xsl:for-each select="./rules/rule"> 
								<xsl:variable name="action_" select="./proc" />
								<xsl:value-of select="concat('.add(',$double_quotes,'remote',$double_quotes,',', 'Core.getIGRPLink(',$double_quotes, $app_, $double_quotes, ',', $double_quotes, $page_, $double_quotes, ',', $double_quotes, $action_, $double_quotes ,')',')')"/>
		    				</xsl:for-each>
						</xsl:if>
						
						
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
				 		<xsl:if test="($container_type='table' or $container_type='formlist' or $container_type='separatorlist') and (@type='checkbox' or @type='radio')">
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
					 		<xsl:value-of select="concat($tag_name,'_check = new ')"/>
					 		
							<xsl:call-template name="typeFieldClass">
					    		<xsl:with-param name="type" select="@type" />
					    	</xsl:call-template>
				
							<xsl:value-of select="concat('(','model',',',$double_quotes,$tag_name,'_check',$double_quotes,');')"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:value-of select="concat($tag_name,'_check','.propertie()')"/>
							<xsl:for-each select="@*">
								<xsl:call-template name="filterComponentsAttrs"/>
			    			</xsl:for-each>
							<xsl:value-of select="';'"/>
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab2"/>
					 	</xsl:if>
					 	<xsl:value-of select="$newline"/>
					</xsl:when>
					<xsl:when test="$type='set-model'">
						
						<xsl:variable name="isPersist">
							<xsl:choose>
								<xsl:when test="@persist='true'">true</xsl:when>
								<xsl:otherwise>false</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						
						<xsl:variable name="action_persist">
							<xsl:if test="@type = 'link'">
								<xsl:choose>
									<xsl:when test="@custom_action != ''">true</xsl:when>
									<xsl:otherwise>false</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</xsl:variable>
						
						<xsl:if test="$isPersist = 'false' ">
						
							<xsl:variable name="filter_pg">
								<xsl:value-of select="$newline"/>
								<xsl:value-of select="$tab2"/>
							 	<xsl:value-of select="concat($tag_name,'.setValue(model);')"/>
							 </xsl:variable>
							 
							 <xsl:choose>
							 
								 <xsl:when test="contains($filter_pg,'filter_pg')">
								 
								 	<xsl:text>/*</xsl:text><xsl:value-of select="$filter_pg"></xsl:value-of><xsl:text>*/</xsl:text>
								 
								 </xsl:when>
								 
								 <xsl:otherwise>
								 
								 	<xsl:value-of select="$filter_pg"></xsl:value-of>
								 
								 </xsl:otherwise>
							 
							 </xsl:choose>
							
					 	</xsl:if>
					 	
					 	<xsl:if test="@type = 'link' and @desc='true'">
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab2"/>
					 		<xsl:value-of select="concat($tag_name,'_desc','.setValue(model);')"/>
					 	</xsl:if>
					 	
					</xsl:when>
				</xsl:choose>				
				<!-- <xsl:value-of select="$newline"/> -->
			<!-- </xsl:if> -->
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
	    		<xsl:when test="$type='lookup' or @lookup='true'">
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
   		<xsl:param name="multiple" select="''" /> 
   		
   		<xsl:variable name="addArray">
   			<xsl:choose>
   				<xsl:when test="$multiple='true'">
   					<xsl:value-of select="'[]'"/>
   				</xsl:when>
   				<xsl:otherwise>
   					<xsl:value-of select="''"/>
   				</xsl:otherwise>
   			</xsl:choose>
   		</xsl:variable>
    		 			
	    	<xsl:choose>
	    		<xsl:when test="$javaType !=''">
	    			<xsl:value-of select="concat($javaType,$addArray)" />
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:choose>
			    		<xsl:when test="$type='checkbox' or $type='radio' or $type='range' or $type='number'  or $type='radiolist'">
			    			<xsl:value-of select="'Integer'" />
			    		</xsl:when>
			    		<xsl:when test="$type ='file'"><xsl:value-of select="concat('UploadFile',$addArray)" /></xsl:when>
			    		<xsl:when test="$type ='checkboxlist'"><xsl:value-of select="'String[]'" /></xsl:when>
			    		<xsl:otherwise>
			    			<xsl:value-of select="concat('String',$addArray)" />
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
    	<xsl:param name="multiple" select="''"/>
    	
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
	    			<xsl:with-param name="multiple" select="$multiple"/>
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
		    				<xsl:with-param name="parameter_set" select="'new IGRPLink(app,page,action)'"/>		    				
		    			</xsl:call-template>	 
						<xsl:value-of select="$newline"/>
				  	    <xsl:value-of select="$tab"/>
		    			<xsl:value-of select="concat('public IGRPLink set',$name_,'(String link){')" />
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab2"/>
		    				<xsl:value-of select="concat('this.',$name,' = new IGRPLink(link);')" />
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab2"/>
					  	    <xsl:value-of select="concat('return this.',$name,';')"/>
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab"/>
		    			<xsl:value-of select="'}'" />	
						<xsl:value-of select="$newline"/>
				  	    <xsl:value-of select="$tab"/>
		    			<xsl:value-of select="concat('public IGRPLink set',$name_,'(Report link){')" />
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab2"/>
		    				<xsl:value-of select="concat('this.',$name,' = new IGRPLink(link);')" />
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab2"/>
					  	    <xsl:value-of select="concat('return this.',$name,';')"/>
							<xsl:value-of select="$newline"/>
					  	    <xsl:value-of select="$tab"/>
		    			<xsl:value-of select="'}'" />	
		    		</xsl:when>
		    		<xsl:when test="$type='UploadFile'">
		    			<xsl:call-template name="genMethod-Get-Set">
		    				<xsl:with-param name="type" select="'UploadFile'"/>
		    				<xsl:with-param name="type_content" select="$type_content"/>
		    				<xsl:with-param name="name" select="$name"/>
		    				<xsl:with-param name="tab_" select="$tab_"/>
		    				<xsl:with-param name="tab2_" select="$tab2_"/>
		    				<xsl:with-param name="java_type_return" select="'UploadFile'"/>
		    				<xsl:with-param name="multiple" select="$multiple"/>
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
	    					<xsl:with-param name="multiple" select="$multiple"/>
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
    	<xsl:param name="multiple" select="''"/>  
    	
    		<xsl:variable name="name_">
			<xsl:call-template name="gen-className">
				<xsl:with-param name="className">
					<xsl:value-of select="$name" />
				</xsl:with-param>
			</xsl:call-template>
    		</xsl:variable> 
    		
    		<xsl:variable name="addArray">
    			<xsl:choose>
    				<xsl:when test="$multiple='true'">
    					<xsl:value-of select="'[]'"/>
    				</xsl:when>
    				<xsl:otherwise>
    					<xsl:value-of select="''"/>
    				</xsl:otherwise>
    			</xsl:choose>
    		</xsl:variable>
    		<!-- Gen Method Set -->
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab_"/>   			
   			<xsl:choose>
   				<xsl:when test="$parameter!=''">
   					<xsl:choose>
							<xsl:when test="$type ='link'">
		   					<xsl:value-of select="concat('public IGRPLink set',$name_,'(',$parameter,'){')" />
							</xsl:when>
						<xsl:otherwise>
		   					<xsl:value-of select="concat('public void set',$name_,'(',$parameter,$addArray,'){')" />
						</xsl:otherwise>
					</xsl:choose>   					
   				</xsl:when>
   				<xsl:otherwise>
   					<xsl:value-of select="concat('public void set',$name_,'(',$java_type_return,$addArray,' ',$name,'){')" />
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
   			<xsl:if test="$type='link'">
   				 <xsl:value-of select="$tab"/>
		  		 <xsl:value-of select="concat('return this.',$name,';')"/>
		  		 <xsl:value-of select="$newline"/>
   				 <xsl:value-of select="$tab_"/>
				</xsl:if>
   			<xsl:value-of select="'}'"/>
    		<!-- En gen Method Set -->
    		
    		<!-- Gen Method Get -->
   			<xsl:value-of select="$newline"/>
   			<xsl:value-of select="$tab_"/>
   			<xsl:choose>
				<xsl:when test="$type = 'link' and $parameter !=''">
					<xsl:value-of select="concat('public ','IGRPLink',' get',$name_,'(){')" />		   				
				</xsl:when>				
				<xsl:otherwise>
		   			<xsl:value-of select="concat('public ',$java_type_return,$addArray,' get',$name_,'(){')" />
				</xsl:otherwise>
			</xsl:choose>					
   		
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
   			<xsl:if test="($type='img')">	    			
   				<xsl:call-template name="genMethod-Get-Set">
    				<xsl:with-param name="type" select="'as'"/>
    				<xsl:with-param name="type_content" select="''"/>
    				<xsl:with-param name="name" select="concat($name,'_uuid')"/>
    				<xsl:with-param name="tab_" select="$tab_"/>
    				<xsl:with-param name="tab2_" select="$tab2_"/>
    				<xsl:with-param name="java_type_return" select="$java_type_return"/>
    			</xsl:call-template>
   			</xsl:if>
    </xsl:template>

</xsl:stylesheet>