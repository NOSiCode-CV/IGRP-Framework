<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>

    <!-- Join all templates to create controller -->
    <xsl:template name="create-controller">    
     	<xsl:call-template name="import-packages-controller"></xsl:call-template>
     	<xsl:value-of select="$newline"/>
 		<xsl:value-of select="concat('public class ',$class_name,'Controller extends Controller {')"/>
<!-- 	 		<xsl:value-of select="$tab2"/> -->
<!-- 	     	<xsl:value-of select="$newline"/> -->
	 		<xsl:call-template name="actionIndex"></xsl:call-template>	 		
	 		<xsl:call-template name="actionEditCalendar"></xsl:call-template>	 	
	 		<xsl:call-template name="createActions"></xsl:call-template> 	
 		<xsl:value-of select="'}'"/>
    </xsl:template>  
    
    <!-- create actions based in rules (Fields) -->
 	<xsl:template name="createActions_"> 	
 		<xsl:variable name="app_" select="/rows/app" />
		<xsl:variable name="page_" select="/rows/page" />		
 		<xsl:for-each select="//rules/rule"> 		
 			<xsl:variable name="action_" select="./proc" />
 		</xsl:for-each> 		
 	</xsl:template>
 	

     <!-- import all class to using in controller -->
 	<xsl:template name="import-packages-controller">
 		<xsl:value-of select="concat('package ',$package_name)"/>		
		<!-- Imports class -->
		<xsl:variable name="url">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=c_import','&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>
     	<xsl:variable name="your_code">
		<!--<xsl:value-of select="document($url)/your_code"/> -->
		</xsl:variable>	
		<xsl:value-of select="$newline"/>
		<!-- <xsl:value-of select="$begin_reserve_code_controller_import"></xsl:value-of> -->
		<xsl:choose>
     		<xsl:when test="$your_code !=''">
				<xsl:value-of select="$your_code"/>		
     		</xsl:when>
     		<xsl:otherwise>
     			<xsl:value-of select="$newline"/>
		 		<xsl:value-of select="$import_controller"/>
				<xsl:value-of select="$newline"/>
		 		<xsl:value-of select="$import_exception"/>
				<xsl:value-of select="$newline"/>
		 		<xsl:value-of select="$import_response"/>
     		</xsl:otherwise>
     	</xsl:choose>
     	<xsl:value-of select="$newline"></xsl:value-of>
     	<xsl:call-template name="blockly.imports"/>
     	
     	<xsl:call-template name="start-code">
     		<xsl:with-param name="type" select="'packages_import'"/>
     		<xsl:with-param name="url" select="$url"/>
     		<xsl:with-param name="tabCode" select="false()"/>
     	</xsl:call-template>
     	
     		<xsl:value-of select="$tab2"/>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
     

 
		<!--<xsl:call-template name="import-class-models"></xsl:call-template>  -->
	
 	</xsl:template>
 	
 	
 	
	<!-- create actions based in button -->
	<xsl:template name="createActions">
         <xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or  (count(/rows/content//tools-bar) &gt; 0) or (count(/rows/content//context-menu/item) &gt; 0)">
            <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type='verticalmenu']/item">   <!-- Button in tools-bar -->
            	<xsl:if test="not(@rel=preceding::node()/@rel)">
		          	<xsl:call-template name="actions">
						<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
						<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
						<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
						<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
						<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
						<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
		            </xsl:call-template>
		        </xsl:if>
           </xsl:for-each>
           <xsl:for-each select="//tools-bar/item">   <!-- Button in form -->
           	<xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="actions">
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
	            </xsl:call-template>
	        </xsl:if>
           </xsl:for-each>           
           <xsl:for-each select="//context-menu/item">   <!-- Button in table -->
            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="actions">
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
	            </xsl:call-template>
            </xsl:if>
           </xsl:for-each>
        </xsl:if>
		<!--         Actions created by programmer -->
		
		<xsl:variable name="url">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=c_actions','&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>
     	
     	<xsl:variable name="your_code">
			<!--  <xsl:value-of select="document($url)/your_code"/> -->
		</xsl:variable>				
			<xsl:call-template name="blockly.element.custom.global"></xsl:call-template> 
			<xsl:text>/* Start-Code-Block (custom-actions)  */</xsl:text>	
			<xsl:call-template name="blockly.elements">
				<xsl:with-param name="elements" select="//rows/blockly/xml/block/statement[@name='custom_actions']/block"/>
			</xsl:call-template> 
		<xsl:text>/* End-Code-Block  */</xsl:text>	
     	<xsl:call-template name="start-code">
     		<xsl:with-param name="type" select="'custom_actions'"/>
     		<xsl:with-param name="url" select="$url"/>
     		<xsl:with-param name="tabCode" select="false()"/>
     	</xsl:call-template>
     	
     	<xsl:choose>
     		<xsl:when test="$url !=''">
				<xsl:value-of select="$your_code"/>	
     		</xsl:when>
     		<xsl:otherwise>
				<xsl:value-of select="$newline"/>
     		</xsl:otherwise>
     	</xsl:choose>

     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
	</xsl:template>
	
	<xsl:template name="actions">
		<xsl:param name="page_"/>
		<xsl:param name="app_"/>
		<xsl:param name="target_"/>
		<xsl:param name="link_"/>
		<xsl:param name="rel" select="''"/>
		<xsl:param name="code" select="''"/>
		<xsl:variable name="button_name">
			<xsl:value-of select="$rel"/>
        	<xsl:if test="$rel =''">
    			<xsl:value-of select="$code"/>
        	</xsl:if>
        </xsl:variable>

		<xsl:call-template name="gen-action">
			<xsl:with-param name="action_name_"><xsl:value-of select="$button_name"/></xsl:with-param>
			<xsl:with-param name="page_"><xsl:value-of select="$page_"/></xsl:with-param>
			<xsl:with-param name="app_"><xsl:value-of select="$app_"/></xsl:with-param>
			<xsl:with-param name="link_"><xsl:value-of select="$link_"/></xsl:with-param>
			<xsl:with-param name="type_render_"><xsl:value-of select="'redirect'"/></xsl:with-param>
		</xsl:call-template>

	</xsl:template>
	
	<xsl:template name="gen-action">
		<xsl:param name="action_name_"/>
		<xsl:param name="page_" select="''"/>
		<xsl:param name="app_" select="''"/>
		<xsl:param name="link_" select="''"/>
		<xsl:param name="type_render_"/>
		<xsl:param name="extra" select="''"/>
		
		<xsl:variable name="model">
   			<xsl:value-of select="$page_"></xsl:value-of>
		</xsl:variable>
		
		<xsl:variable name="actionCamel">
			<xsl:choose>
				<xsl:when test="$type_render_!='render_message'">
					<xsl:call-template name="CamelCaseWord">
			    		<xsl:with-param name="text">
			    			<xsl:value-of select="$action_name_"></xsl:value-of>
			    		</xsl:with-param>
			    	</xsl:call-template>
		    	</xsl:when>
		    	<xsl:otherwise>
	    			<xsl:value-of select="$action_name_"></xsl:value-of>
		    	</xsl:otherwise>
	    	</xsl:choose>
		</xsl:variable>		
		<xsl:variable name="action">
			<xsl:call-template name="replace-all">
		        <xsl:with-param name="text" select="$actionCamel" />
		        <xsl:with-param name="replace" select="'-'" />
		        <xsl:with-param name="by" select="''" />
		    </xsl:call-template>
		</xsl:variable>	
		<xsl:variable name="app__">
			<xsl:call-template name="lowerCase">
	    		<xsl:with-param name="text">
	    			<xsl:value-of select="$app_"></xsl:value-of>
	    		</xsl:with-param>
	    	</xsl:call-template>
		</xsl:variable>			
		
		<xsl:variable name="link__">
			<xsl:call-template name="lowerCase">
	    		<xsl:with-param name="text">
	    			<xsl:value-of select="$link_"></xsl:value-of>
	    		</xsl:with-param>
	    	</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="url_">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=exception_after_action&amp;ac=',$action,'&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>	

     	<xsl:variable name="your_code_exception">
			<!--  <xsl:value-of select="document($url_)/your_code"/> -->
		</xsl:variable>	
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>

		<xsl:variable name="preserveActionsExceptionsUrl__old" select="concat('/*----#EXECEP(',$url_,',throws IOException, IllegalArgumentException, IllegalAccessException,',$action,')EXECEP#----*/')"/>

		<xsl:variable name="preserveActionsExceptionsUrl" select="'throws IOException, IllegalArgumentException, IllegalAccessException'"/>


		<xsl:value-of select="concat('public Response action',$action,'() ',$preserveActionsExceptionsUrl,'{')"/>

		<!-- <xsl:choose>
			<xsl:when test="$your_code_exception != ''">
				<xsl:value-of select="concat('public Response action',$action,'() ',$your_code_exception,'{')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('public Response action',$action,'() throws IOException, IllegalArgumentException, IllegalAccessException{')"/>
			</xsl:otherwise>
		</xsl:choose> -->
<!--      	<xsl:value-of select="$newline"/>	 -->
<!--      	<xsl:value-of select="$tab2"/>     	 -->
     	<!--         Actions modified by programmer -->     	
     	
     	<!-- <xsl:value-of select="$begin_reserve_code_controller_on_action"></xsl:value-of> -->		
		
     	<xsl:variable name="url">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=c_on_action&amp;ac=',$action,'&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>	   	

     	<xsl:call-template name="begin_reserve_code_action">
     		<xsl:with-param name="type" select="$action"/>
     		<xsl:with-param name="url" select="$url"/>
     	</xsl:call-template>
     	
     	<xsl:value-of select="$extra"/>
     	
		<xsl:variable name="your_code">
			
		</xsl:variable>	

		<xsl:if test="$your_code!=''">
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="$your_code"/>	
		</xsl:if>

		<xsl:choose>
			<xsl:when  test="$page_ != ''">
				<xsl:choose>
					<xsl:when test="$type_render_='render'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>						
						<xsl:call-template name="newlineTab2"/>						
						<xsl:value-of select="'model.load();'"/>
						<xsl:call-template name="setBoxUrl"/>
						<xsl:for-each select="//rows/content/*[@type!='table' and @type!='workflow']/fields/*">  
							<xsl:if test="@action and @app and @page and @custom_action='' and ../../@type != 'formlist' and ../../@type != 'separatorlist'"> 
								<xsl:variable name="name_">
				    			<xsl:call-template name="CamelCaseWord">
							        <xsl:with-param name="text">
							        	<xsl:value-of select="name()"/>
							        </xsl:with-param>
						        </xsl:call-template>
				    			</xsl:variable> 				    			
								<xsl:variable name="_app" select="concat($double_quotes,@app,$double_quotes)"/>
						 		<xsl:variable name="_page" select="concat($double_quotes,@page,$double_quotes)"/>
						 		<xsl:variable name="_action" select="concat($double_quotes,@action,$double_quotes)"/>					
								<xsl:value-of select="concat('model.set',$name_,'(',$_app,',',$_page,',',$_action,');')"/>						
								<xsl:call-template name="newlineTab2"/>		
								
							</xsl:if>	
						</xsl:for-each> 							
						<xsl:if test="//rows/content/*[@type='carousel']">
							
							<xsl:for-each select="//content/*[@type='carousel' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]">
							
								<xsl:variable name="tagName" select="name()"/>	
								<xsl:text>model.load</xsl:text>
								<xsl:call-template name="CamelCaseWord">
					 				<xsl:with-param name="text" select="$tagName"/>
					 			</xsl:call-template>
								<xsl:value-of select="concat('(',$newline,$tab2,$tab2,'Core.query(null,',$double_quotes,'SELECT ')"/>
									
									<xsl:for-each select="table/value/row ">
									
										<xsl:variable name="labelTag" select="concat($tagName,'_label')"/>
										
										<xsl:variable name="imgTag" select="concat($tagName,'_img')"/>
										
										<xsl:variable name="carouselRowLabel" select="*[name() = $labelTag]"/>										
										<xsl:variable name="carouselRowImg" select="*[name() = $imgTag]"/>									
										<xsl:value-of select="concat( $simple_quotes, $carouselRowLabel, $simple_quotes, ' as ', $labelTag,',',$simple_quotes,$carouselRowImg,$simple_quotes,' as ', $imgTag )"/>
									
										<xsl:if test="position() != last()">
											<xsl:value-of select="concat($double_quotes,'+', $newline, $tab2,$tab2,$tab2,$tab2,$double_quotes, ' UNION SELECT ' )"/>
										</xsl:if>
										
									</xsl:for-each>								
								<xsl:value-of select="concat($double_quotes,')',$newline,$tab2,' );')"/>								
								<!--  view.chart_1.loadQuery(Core.query(null,"SELECT 'X1' as EixoX, 'Y1' as EixoY, 15 as valor"
                                      +" UNION SELECT 'X2' as EixoX, 'Y2' as EixoY, 10 as valor"
                                      +" UNION SELECT 'X2' as EixoX, 'Y2' as EixoY, 23 as valor"
                                      +" UNION SELECT 'X3' as EixoX, 'Y3' as EixoY, 40 as valor"));-->					
								
							</xsl:for-each>
								<xsl:call-template name="newlineTab2"/>
						</xsl:if>	
							
						<xsl:for-each select="//rows/content/*[@type='view']">
							<xsl:variable name="img_tag" select="concat( name(),'_img' )"/>
							<xsl:variable name="img" select="fields/*[name() = $img_tag]"/>
							<xsl:variable name="img_tag_upper">
								<xsl:call-template name="CamelCaseWord">
							        <xsl:with-param name="text">
							        	<xsl:value-of select="$img_tag"/>
							        </xsl:with-param>
						        </xsl:call-template>
							</xsl:variable>
							<xsl:if test="$img">	
								<xsl:value-of select="concat('model.set',$img_tag_upper,'(',$double_quotes,$img,$double_quotes,');')"/>
								<xsl:call-template name="newlineTab2"/>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:if test="//rows/content/*[@type!='table' and @type!='workflow']/fields/*[@type='texteditor']">
								<xsl:text> //model.setLink_upload_img(this.getConfig().getResolveUrl("igrp","file","save-image-txt&amp;p_page_name="+Core.getCurrentPage()));</xsl:text>
								<xsl:value-of select="$newlineTab2"/>	
						</xsl:if>	
						
						
						<xsl:value-of select="concat($model,'View',' view = new ',$model,'View();')"/>					
						<xsl:call-template name="setParam"/>
						<xsl:call-template name="setSqlCombobox_">						
							<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>						
		     	       </xsl:call-template> 
						<xsl:if test="//content/*[@type='statbox' or @type='smallbox' or @type='circlestatbox' or @type='quickbuttonbox'] or //rows/content/*[@type='chart']  or //rows/content/*[@type='separatorlist'] or //rows/content/*[@type='formlist']  or //rows/content/*[@type='table' or @type='workflow'] or //rows/content/*[@type='table']/fields/*[@iskey='true'] or //rows/content/*/fields/*[@type='select'] or //rows/content/*/fields/*[@type='radiolist'] or //rows/content/*/fields/*[@type='checkboxlist']">
							<xsl:call-template name="start-example"/>				    					    		
							<xsl:call-template name="setSqlTable"/>					
							<xsl:call-template name="setSqlChart"/>						
							<xsl:call-template name="setSqlCombobox"/>					
							<xsl:call-template name="setBoxValue"/>	
							<xsl:call-template name="end-example"/>
						</xsl:if>
						<xsl:value-of select="$newlineTab2"/>		
						<xsl:text>/* Start-Code-Block (index) */</xsl:text>	
						<xsl:call-template name="blockly.elements">
							<xsl:with-param name="elements" select="//rows/blockly/xml/block/statement[@name='index']/block"/>
						</xsl:call-template> 
						<xsl:text>/* End-Code-Block (index) */</xsl:text>	
						<xsl:call-template name="start-code">
				     		<xsl:with-param name="type" select="concat($action,'')"/>
				     		<xsl:with-param name="url" select="$url"/>				    
				     	</xsl:call-template>			     
							
				     	<xsl:value-of select="'view.setModel(model);'"/>
				     	<xsl:call-template name="newlineTab2"/>
				     	
						<xsl:value-of select="'return this.renderView(view);'"/>					
					</xsl:when>
					
					<xsl:when test="$type_render_='redirect'">
					
						
						<xsl:call-template name="newlineTab2"/>														
						<xsl:value-of select="concat($class_name,' model = new ',$class_name,'();')"/>
					    <xsl:call-template name="newlineTab2"/>		
					    					    	
						<xsl:value-of select="'model.load();'"/>
						<xsl:call-template name="start-example"/>						
						<xsl:value-of select="concat(' ',' this.addQueryString(',$double_quotes,'p_id',$double_quotes,',',$double_quotes,'12',$double_quotes,'); //to send a query string in the URL')"/>							
						<xsl:call-template name="newlineTab2"/>	
										
						<xsl:for-each select="//content/*[@type='table' or @type='workflow']">
		 					<xsl:for-each select="fields/*[@iskey='true']">	
		 					<xsl:choose>
		 						<xsl:when test="@type='hidden'">
		 							<xsl:value-of select="concat(' ',' this.addQueryString(',$double_quotes,'p_',@tag,$double_quotes,',','Core.getParam(',$double_quotes,'p_',@tag,$double_quotes,'));')"/>					
								</xsl:when>
		 						<xsl:otherwise>
		 							<xsl:value-of select="concat(' ',' this.addQueryString(',$double_quotes,'p_',local-name(),$double_quotes,',','Core.getParam(',$double_quotes,'p_',local-name(),$double_quotes,'));')"/>				
								</xsl:otherwise>
		 					</xsl:choose>	 	
		 					<xsl:call-template name="newlineTab2"/>			 						
	 						</xsl:for-each> 	 			
						</xsl:for-each>
						
						<xsl:value-of select="concat('  return this.forward(',$double_quotes,$app__,$double_quotes,',',$double_quotes,$page_,$double_quotes,',',$double_quotes,'index',$double_quotes,',this.queryString()); //if submit, loads the values')"/>							
						
						<xsl:call-template name="newlineTab2"/>
						<xsl:value-of select="'  Use model.validate() to validate your model'"/>
						<xsl:call-template name="newlineTab2"/>
						
						<xsl:call-template name="end-example"/>	
										
						<xsl:call-template name="newlineTab2"/>
						<xsl:text>/* Start-Code-Block (</xsl:text><xsl:value-of select="$action_name_"></xsl:value-of><xsl:text>)  */</xsl:text>	
						<xsl:call-template name="blockly.elements">
							<xsl:with-param name="elements" select="//rows/blockly/xml/block/statement[@name=$action_name_]/block"/>
						</xsl:call-template> 			
						<xsl:text>/* End-Code-Block  */</xsl:text>	
						<xsl:call-template name="start-code">
				     		<xsl:with-param name="type" select="concat($action,'')"/>
				     		<xsl:with-param name="url" select="$url"/>
				     		<!--  <xsl:with-param name="text" select="concat('return null;',$newline,$newline)"/> -->
				     	</xsl:call-template>

				     	<xsl:if test="not(@custom_return) or @custom_return!='true'">
					     	<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app__,$double_quotes,',',$double_quotes,$page_,$double_quotes,',',$double_quotes,'index',$double_quotes,', this.queryString());')"/>
					   	</xsl:if>
						
					</xsl:when>
					<xsl:when test="$type_render_='render_message'">
					
					
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="'//Your code here'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="'Response response = new Response();'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="'response.setContentType(Response.FORMAT_XML);'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('response.setContent(',$double_quotes,'your message',$double_quotes,');')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>  
						<xsl:value-of select="'return response;'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab"/>  
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$your_code=''">
					  <xsl:call-template name="newlineTab2"/>		
						<xsl:value-of select="concat($class_name,' model = new ',$class_name,'();')"/>
					    <xsl:call-template name="newlineTab2"/>							    					    	
						<xsl:value-of select="'model.load();'"/>
						<xsl:call-template name="start-example"/>		
						<xsl:value-of select="concat(' ','this.addQueryString(',$double_quotes,'p_id',$double_quotes,',',$double_quotes,'12',$double_quotes,'); //to send a query string in the URL')"/>							
						<xsl:call-template name="newlineTab2"/>	
										
						<xsl:for-each select="//content/*[@type='table' or @type='workflow']">
		 					<xsl:for-each select="fields/*[@iskey='true']">	
		 					<xsl:choose>
		 						<xsl:when test="@type='hidden'">
		 							<xsl:value-of select="concat(' ','this.addQueryString(',$double_quotes,'p_',@tag,$double_quotes,',','Core.getParam(',$double_quotes,'p_',@tag,$double_quotes,'));')"/>					
								</xsl:when>
		 						<xsl:otherwise>
		 							<xsl:value-of select="concat(' ','this.addQueryString(',$double_quotes,'p_',local-name(),$double_quotes,',','Core.getParam(',$double_quotes,'p_',local-name(),$double_quotes,'));')"/>				
								</xsl:otherwise>
		 					</xsl:choose>	 	
		 					<xsl:call-template name="newlineTab2"/>			 						
	 						</xsl:for-each> 	 			
						</xsl:for-each>
						
						<xsl:value-of select="concat(' return this.forward(',$double_quotes,$app,$double_quotes,',',$double_quotes,$page,$double_quotes,',',$double_quotes,'index',$double_quotes,',this.queryString()); //if submit, loads the values')"/>							
						<xsl:call-template name="end-example"/>			
						
					
					<xsl:call-template name="start-code">
			     		<xsl:with-param name="type" select="$action"/>
			     		<xsl:with-param name="url" select="$url"/>
			     	</xsl:call-template>
			     	
					<xsl:call-template name="newlineTab2"/>		
					<xsl:if test="not(@custom_return) or @custom_return!='true'">
							<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app,$double_quotes,',',$double_quotes,$page,$double_quotes,',',$double_quotes,'index',$double_quotes,', this.queryString());')"/>
					</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>  

		<xsl:value-of select="$tab"/>

     	<!-- <xsl:value-of select="$end_reserve_code"></xsl:value-of> -->

     	<xsl:call-template name="end_reserve_code_action">
     		<xsl:with-param name="type" select="$action"/>
     	</xsl:call-template>

		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="'}'"/>
 		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
	</xsl:template>
	
	<xsl:template name="gen-lookups">
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($newline,$tab2)"/>
		
		<xsl:for-each select="rows/content/*[not(@type='table')]/fields/*[@type='lookup']">
			
			<xsl:variable name="lookupName" select="name()"/>
			
			<xsl:variable name="lu_app" select="@app"/>
			<xsl:variable name="lu_page" select="@page"/>
			<xsl:variable name="lu_act" select="@action"/>
			
			<xsl:variable name="lookup_action">
				<xsl:value-of select="concat($double_quotes,$lu_app,$double_quotes)"/><xsl:text>,</xsl:text>
				<xsl:value-of select="concat($double_quotes,$lu_page,$double_quotes)"/><xsl:text>,</xsl:text>
				<xsl:value-of select="concat($double_quotes,$lu_act,$double_quotes)"/>
			</xsl:variable>			

			<xsl:text>view.</xsl:text><xsl:value-of select="$lookupName"/><xsl:text>.setLookup(</xsl:text><xsl:value-of select="$lookup_action"/><xsl:text>);</xsl:text>
			
			<xsl:value-of select="concat($newline,$tab2)"/>
			
			<xsl:for-each select="lookupParams/param">
			
				<xsl:variable name="lookupParam">
					<xsl:value-of select="concat($double_quotes,@name,$double_quotes,',',$double_quotes,.,$double_quotes)"/>
				</xsl:variable>

				<xsl:text>view.</xsl:text><xsl:value-of select="$lookupName"/><xsl:text>.addParam(</xsl:text><xsl:value-of select="$lookupParam"/><xsl:text>);</xsl:text>
				
				<xsl:value-of select="concat($newline,$tab2)"/>
				
			</xsl:for-each>
			<xsl:value-of select="concat($newline,$tab2)"/>
		</xsl:for-each>
		
	</xsl:template>
	
 	<!-- add actionIndex() - it is default method in any controller -->
	<xsl:template name="actionIndex">
		<xsl:call-template name="gen-action">
			<xsl:with-param name="action_name_"><xsl:value-of select="'index'"/></xsl:with-param>
			<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
			<xsl:with-param name="type_render_"><xsl:value-of select="'render'"/></xsl:with-param>
		</xsl:call-template>
 	</xsl:template>

	<!-- add action edit calendar -->
	<xsl:template name="actionEditCalendar">
		<xsl:for-each select="/rows/content/*[@gen-remote='true']">			
			<xsl:variable name="actionName">
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text"><xsl:value-of select="name()"/></xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			<xsl:choose>
                <xsl:when test="@type='calendar'">
					
					<xsl:call-template name="gen-action">
						<xsl:with-param name="action_name_"><xsl:value-of select="concat('EditEvents',$actionName)"/></xsl:with-param>
						<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
						<xsl:with-param name="type_render_"><xsl:value-of select="'render_message'"/></xsl:with-param>
					</xsl:call-template>
					
					
					<xsl:call-template name="gen-action">
						<xsl:with-param name="action_name_"><xsl:value-of select="concat('Load',$actionName)"/></xsl:with-param>
						<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
						<xsl:with-param name="type_render_"><xsl:value-of select="'render_message'"/></xsl:with-param>
					</xsl:call-template> 
					
					<xsl:call-template name="gen-action">
						<xsl:with-param name="action_name_"><xsl:value-of select="concat('Click',$actionName)"/></xsl:with-param>
						<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
						<xsl:with-param name="app_"><xsl:value-of select="$app"/></xsl:with-param>
						<xsl:with-param name="type_render_"><xsl:value-of select="'redirect'"/></xsl:with-param>
					</xsl:call-template>
					
				</xsl:when>
				<xsl:when test="@type='treemenu'">
				    <xsl:text>/*</xsl:text>
					<xsl:variable name="params">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('String p_id = Core.getParam(',$double_quotes,'p_id',$double_quotes,');')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('String p_active = Core.getParam(',$double_quotes,'p_active',$double_quotes,');')"/>
					</xsl:variable>
					
					<xsl:call-template name="gen-action">
					
						<xsl:with-param name="action_name_"><xsl:value-of select="concat('Remote_',name())"/></xsl:with-param>
						<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
						<xsl:with-param name="type_render_"><xsl:value-of select="'render_message'"/></xsl:with-param>
						<xsl:with-param name="extra" select="$params"/>
					</xsl:call-template>
					<xsl:text>*/</xsl:text>
				</xsl:when>
				<xsl:otherwise>
                   	
                </xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
 	</xsl:template>
 	
 	<xsl:template name="addLegendColor">
 		<xsl:for-each select="//content/*[@type='table' or @type='workflow']">
 			<xsl:if test="fields/*[@type='color']">
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
		 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>			
				<xsl:value-of select="newlineTab2"/>				
				<xsl:value-of select="concat('view.',$instance_name,'.addLegendColor(',$double_quotes,'Cor 1',$double_quotes,',Core.getPinkColor());')"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('view.',$instance_name,'.addLegendColor(',$double_quotes,'Cor 2',$double_quotes,',Core.getAmberColor());')"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
			</xsl:if>
	 	</xsl:for-each>
 	</xsl:template>
 	
 	<!-- view.chart_1.loadQuery(Core.query(null,"SELECT 2010 Ano,265 X1, 658 X2, 498 X3,698 X4").union().select("SELECT 2009 Ano,784 X1, 258 X2, 594 X3, 498 X4").union().select("SELECT 2015 Ano,1010 X1, 698 X2, 366 X3, 498 X4")); -->
 	<xsl:template name="setSqlChart">
 		<xsl:for-each select="//content/*[@type='chart']">
	 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable> 		
	 		<xsl:value-of select="concat('view.',$instance_name,'.loadQuery(Core.query(null,',$double_quotes,$sql_chart,$double_quotes,'));')"/>
	 		<xsl:call-template name="newlineTab2"/>		
	 	</xsl:for-each>
 	</xsl:template>
 	
 	
 	<!-- view.table_1.setSqlQuery("select 'name' name, 1 id FROM dual"); -->
 	<xsl:template name="setSqlTable"> 	
 		<xsl:for-each select="//content/*[@type='table' or @type='workflow' or @type='formlist' or @type='separatorlist' ]">
	 		<xsl:variable name="instance_name">
	 			<xsl:value-of select="local-name()"/>
	 		</xsl:variable>
	 		<xsl:variable name="sql_fields">
	 			<xsl:for-each select="fields/*">	
	 				<xsl:variable name="vlocal-name">
	 					<xsl:value-of select="local-name()"/>
	 				</xsl:variable> 			
	 				<xsl:value-of select="concat($simple_quotes,//table/value/row/*[@name=concat('p_',$vlocal-name)],$simple_quotes,' as ',local-name())"/>
	 				<xsl:if test="position() != last()">,</xsl:if>
	 			</xsl:for-each>
	 		</xsl:variable>
 			<xsl:text>model.load</xsl:text>
 			<xsl:call-template name="CamelCaseWord">
 				<xsl:with-param name="text" select="name()"/>
 			</xsl:call-template>
 			<xsl:value-of select="concat('(Core.query(null,',$double_quotes,'SELECT ',$sql_fields,' ',$double_quotes,'));')"/> 	
 			<xsl:call-template name="newlineTab2"/>				
		</xsl:for-each>		
 	</xsl:template>
 	
 	<!-- view.pd_id.setParam(true); -->
 	<xsl:template name="setParam">
 		<xsl:for-each select="//content/*[@type='table' or @type='workflow']">
	 		<xsl:for-each select="fields/*[@iskey='true']">	
	 		<xsl:call-template name="newlineTab2"/>	
	 			<xsl:choose>
	 				<xsl:when test="@type='hidden'">
						<xsl:value-of select="concat('view.',@tag,'.setParam(true);')"/>
	 				</xsl:when>
	 				<xsl:otherwise>
						<xsl:value-of select="concat('view.',local-name(),'.setParam(true);')"/>
	 				</xsl:otherwise>
	 			</xsl:choose>	 			
 			</xsl:for-each> 	 			
		</xsl:for-each>
 	</xsl:template>
 	
 	<!-- view.select1.setSqlQuery("select 'id' as id,'name' as name FROM dual"); -->
 	<xsl:template name="setSqlCombobox">
 		<xsl:for-each select="//content/*">
	 		<xsl:for-each select="fields/*[@type='select' or @type='radiolist' or @type='checkboxlist']">
	 		
	 			<xsl:if test="@domain=''">				  
				  	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>	 			
				 		<xsl:choose>
				 			<xsl:when test="@schemaName!='' and @tableName!='' and @keyMap!='' and @conn!=''">
				 					<xsl:value-of select="concat('view.',$instance_name,'.setQuery(Core.query(',$double_quotes,@conn,$double_quotes,',',$double_quotes,@schemaName,$double_quotes,',',$double_quotes,@tableName,$double_quotes,',',$double_quotes,@keyMap,$double_quotes,',',$double_quotes,@keyMap,$double_quotes,'));')"/>
				 			</xsl:when>
				 			<xsl:otherwise>
				 				<xsl:value-of select="concat('view.',$instance_name,'.setQuery(Core.query(null,',$double_quotes,'SELECT ',$simple_quotes,'id',$simple_quotes,' as ID,',$simple_quotes,'name',$simple_quotes,' as NAME ',$double_quotes,'));')"/>
				 			</xsl:otherwise>
				 		</xsl:choose>	
				 		<xsl:call-template name="newlineTab2"/>				  
				</xsl:if>				 		
			</xsl:for-each>			
	 	</xsl:for-each>
 	</xsl:template>
 	
 	
 	
 	<!-- view.select1.setSqlQuery("select 'id' as id,'name' as name FROM dual"); -->
 	<xsl:template name="setSqlCombobox_">
 		<xsl:param name="app_"/>
 		<xsl:for-each select="//content/*">
	 		<xsl:for-each select="fields/*[@type='select' or @type='radiolist' or @type='checkboxlist']">	 		
	 			<xsl:if test="@domain!=''">	
	 			<xsl:call-template name="newlineTab2"/>		 			
								<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
								<xsl:choose>
									<xsl:when test="contains(@domain,'«')">								
										<xsl:choose>
											<xsl:when test="@type='select'">
												<xsl:value-of
													select="concat('view.',$instance_name,'.loadDomain(',$double_quotes, substring-before(@domain,' « '), $double_quotes,',',$double_quotes,substring-after(@domain,' « '),$double_quotes,',',$double_quotes,'-- Selecionar --' ,$double_quotes,');')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat('view.',$instance_name,'.loadDomainByApp(',$double_quotes,substring-before(@domain,' « '),$double_quotes,',',$double_quotes,substring-after(@domain,' « '),$double_quotes,');')" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="@type='select'">
												<xsl:value-of
													select="concat('view.',$instance_name,'.loadDomain(',$double_quotes, @domain, $double_quotes,',',$double_quotes,'-- Selecionar --' ,$double_quotes,');')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat('view.',$instance_name,'.loadDomain(',$double_quotes, @domain,$double_quotes,');')" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
	 						</xsl:choose>
	 						

				</xsl:if>	 			
			</xsl:for-each>			
	 	</xsl:for-each>
 	</xsl:template>
 	
 	
 	<!-- statbox, smallbox, circlestatbox  -->
 	<xsl:template name="setBoxUrl">
 		<xsl:for-each select="//content/*[@type='statbox' or @type='smallbox' or @type='circlestatbox']/fields/*">
	 		 
	 			<xsl:call-template name="newlineTab2"/>
	 			
	 			<xsl:variable name="instance_name">
	 				<xsl:call-template name="CamelCaseWord">
	 					<xsl:with-param name="text"><xsl:value-of select="name()" /></xsl:with-param>
	 				</xsl:call-template>
	 			</xsl:variable>	 			 					
 				<xsl:value-of select="concat('model.','set', $instance_name,'(',$double_quotes, ./value, $double_quotes,');')"/>  			
 						
	 	</xsl:for-each>
	 	<xsl:for-each select="//content/*[@type='quickbuttonbox' or @type='infopanel']/fields/*">
	 		 
	 			<xsl:call-template name="newlineTab2"/>
	 			
	 			<xsl:variable name="instance_name">
	 				<xsl:call-template name="CamelCaseWord">
	 					<xsl:with-param name="text"><xsl:value-of select="name()" /></xsl:with-param>
	 				</xsl:call-template>
	 			</xsl:variable>
	 			<xsl:choose>
	 			<xsl:when test="@type!='link'">	 			
 					<xsl:value-of select="concat('model.','set', $instance_name,'(',$double_quotes, ./value, $double_quotes,');')"/> 
 				</xsl:when>
 				<xsl:otherwise>
 					<xsl:value-of select="concat('model.','set', $instance_name,'(','Core.getIGRPLink(',$double_quotes,./value/app,$double_quotes,',',$double_quotes,./value/page,$double_quotes,',',$double_quotes,./value/action,$double_quotes,'));')"/>
				</xsl:otherwise>
				</xsl:choose>
	 	</xsl:for-each>
	 	<xsl:call-template name="newlineTab2"/>
 	</xsl:template>
 	
 	<xsl:template name="setBoxValue">
 		<xsl:for-each select="//content/*[@type='statbox' or @type='smallbox' or @type='circlestatbox']">
	 		 	
	 			<xsl:variable name="_url" select="./fields/*[@name = concat(@name,'_url')]/value" />
	 			<xsl:variable name="_val" select="./fields/*[@name = concat(@name,'_val')]/value" /> 			
	 			
	 			<xsl:variable name="instance_name">
	 				<xsl:call-template name="CamelCaseWord">
	 					<xsl:with-param name="text"><xsl:value-of select="name()" /></xsl:with-param>
	 				</xsl:call-template>
	 			</xsl:variable>
	 			
 				<xsl:value-of select="concat('model.','set', $instance_name,'_url(','Core.getIGRPLink(',$double_quotes,'your app',$double_quotes,',',$double_quotes,'your page',$double_quotes,',',$double_quotes,'your action',$double_quotes,'));')"/>
				<xsl:call-template name="newlineTab2"/>
<!-- 	 			<xsl:value-of select="concat('model.','set', $instance_name,'_val(',$double_quotes, ./fields/*[contains(@name, '_val')]/value, $double_quotes,');')"/> 		 -->
<!-- 	 			<xsl:call-template name="newlineTab2"/>			 -->
	 	</xsl:for-each>
	
 	</xsl:template>
 	
 	
      
</xsl:stylesheet>
