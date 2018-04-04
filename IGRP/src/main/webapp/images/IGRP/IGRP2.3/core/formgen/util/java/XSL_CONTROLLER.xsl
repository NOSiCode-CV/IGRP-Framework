<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>

    <!-- Join all templates to create controller -->
    <xsl:template name="create-controller">
    	<xsl:value-of select="$newline"/>
     	<xsl:call-template name="import-packages-controller"></xsl:call-template>
     	<xsl:value-of select="$newline"/>
 		<xsl:value-of select="concat('public class ',$class_name,'Controller extends Controller {')"/>
	 		<xsl:value-of select="$tab2"/>
	     	<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="actionIndex"></xsl:call-template>
	 		<xsl:call-template name="actionEditCalendar"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
	 		 <xsl:call-template name="createActions"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="'}'"/>
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
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$import_query_helper"/>
     		</xsl:otherwise>
     	</xsl:choose>
     	<xsl:call-template name="start-code">
     		<xsl:with-param name="type" select="'packages_import'"/>
     		<xsl:with-param name="url" select="$url"/>
     		<xsl:with-param name="tabCode" select="false()"/>
     	</xsl:call-template>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
		<!--<xsl:call-template name="import-class-models"></xsl:call-template>  -->
		<xsl:value-of select="$newline"/>
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
		
     	<xsl:call-template name="start-code">
     		<xsl:with-param name="type" select="'custom_actions'"/>
     		<xsl:with-param name="url" select="$url"/>
     		<xsl:with-param name="tabIndent" select="'1'"/>
     	</xsl:call-template>
     	
     	<xsl:choose>
     		<xsl:when test="$url !=''">
				<xsl:value-of select="$your_code"/>	
     		</xsl:when>
     		<xsl:otherwise>
				<xsl:value-of select="$newline"/>
     		</xsl:otherwise>
     	</xsl:choose>
		<xsl:value-of select="$newline"/>
	    <xsl:value-of select="$tab"/>
	    <xsl:value-of select="$newline"/>
	    <xsl:value-of select="$tab"/>
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
     	<xsl:value-of select="$newline"/>	
     	<xsl:value-of select="$tab2"/>     	
     	<!--         Actions modified by programmer -->     	
     	
     	<!-- <xsl:value-of select="$begin_reserve_code_controller_on_action"></xsl:value-of> -->		

     	<xsl:variable name="url">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=c_on_action&amp;ac=',$action,'&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>	   

     	<xsl:call-template name="begin_reserve_code_action">
     		<xsl:with-param name="type" select="$action"/>
     		<xsl:with-param name="url" select="$url"/>
     	</xsl:call-template>
     	
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

						<xsl:value-of select="concat($model,'View',' view = new ',$model,'View();')"/>
						
						<xsl:call-template name="newlineTab2"/>		

						<xsl:value-of select="'model.load();'"/>
						
						<!-- <xsl:call-template name="start-code">
				     		<xsl:with-param name="type" select="concat($action,'-load')"/>
				     		<xsl:with-param name="url" select="$url"/>
				     	</xsl:call-template> -->

						<!-- <xsl:value-of select="concat($model,'View',' view = new ',$model,'View(model);')"/> -->

						<xsl:if test="//rows/content/*[@type='chart'] or //rows/content/*[@type='table'] or //rows/content/*[@type='table']/fields/*[@iskey='true'] or //rows/content/*/fields/*[@type='select']">
							
							<xsl:call-template name="start-example"/>
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:call-template name="setSqlTable"/>
							<xsl:call-template name="setSqlChart"/>						
							<xsl:call-template name="setSqlCombobox"/>
							<xsl:call-template name="setParam"/>

							<xsl:call-template name="end-example"/>

						</xsl:if>
						

						<xsl:call-template name="start-code">
				     		<xsl:with-param name="type" select="concat($action,'')"/>
				     		<xsl:with-param name="url" select="$url"/>
				     	</xsl:call-template>

				     	<xsl:call-template name="newlineTab2"/>

				     	<xsl:value-of select="'view.setModel(model);'"/>

				     	<xsl:call-template name="newlineTab2"/>
				     	<xsl:call-template name="newlineTab2"/>

						<xsl:value-of select="'return this.renderView(view);'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab"/>  
					</xsl:when>
					<xsl:when test="$type_render_='redirect'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($class_name,' model = new ',$class_name,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>			
						<xsl:value-of select="'model.load();'"/>

						<xsl:call-template name="start-example"/>
						
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="concat('','if(model.save(model)){')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>		
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="concat('','Core.setMessageSuccess();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="' }else{'"/>						
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>		
						<xsl:value-of select="$tab"/>						
						<xsl:value-of select="concat('','Core.setMessageError();')"/>
						<xsl:value-of select="$newline"/>

						<xsl:value-of select="$tab2"/>

						<xsl:value-of select="concat(' return this.forward(',$double_quotes,$app__,$double_quotes,',',$double_quotes,$page_,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>							
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>				
						<xsl:value-of select="concat('}','')"/>

						<xsl:call-template name="end-example"/>
			
						<xsl:call-template name="start-code">
				     		<xsl:with-param name="type" select="concat($action,'')"/>
				     		<xsl:with-param name="url" select="$url"/>
				     		<!--  <xsl:with-param name="text" select="concat('return null;',$newline,$newline)"/> -->
				     	</xsl:call-template>

				     	<xsl:if test="not(@custom_return) or @custom_return!='true'">
					     	<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app__,$double_quotes,',',$double_quotes,$page_,$double_quotes,',',$double_quotes,'index',$double_quotes,', this.queryString());')"/>
							<xsl:value-of select="$newline"/>  
							<xsl:value-of select="$tab"/> 
				     	</xsl:if>
						
					</xsl:when>
					<xsl:when test="$type_render_='render_message'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="'//programming your save edit calendar'"/>
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
					
					<xsl:call-template name="start-code">
			     		<xsl:with-param name="type" select="$action"/>
			     		<xsl:with-param name="url" select="$url"/>
			     	</xsl:call-template>
			     	
					<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
					<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app,$double_quotes,',',$double_quotes,$page,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>
					<xsl:value-of select="$newline"/>  
					<xsl:value-of select="$tab"/>
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
		<xsl:for-each select="/rows/content/*[@type ='calendar']">
		<xsl:variable name="actionName">
			<xsl:call-template name="CamelCaseWord">
				<xsl:with-param name="text"><xsl:value-of select="name()"/></xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="gen-action">
			<xsl:with-param name="action_name_"><xsl:value-of select="concat('EditEvents',$actionName)"/></xsl:with-param>
			<xsl:with-param name="page_"><xsl:value-of select="$class_name"/></xsl:with-param>
			<xsl:with-param name="type_render_"><xsl:value-of select="'render_message'"/></xsl:with-param>
		</xsl:call-template>
		</xsl:for-each>
 	</xsl:template>
 	
 	<xsl:template name="addLegendColor">
 		<xsl:for-each select="//content/*[@type='table']">
 			<xsl:if test="fields/*[@type='color']">
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
		 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>			
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('view.',$instance_name,'.addLegendColor(',$double_quotes,'Cor 1',$double_quotes,',Core.getPinkColor());')"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('view.',$instance_name,'.addLegendColor(',$double_quotes,'Cor 2',$double_quotes,',Core.getAmberColor());')"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
			</xsl:if>
	 	</xsl:for-each>
 	</xsl:template>
 	
 	<!-- view.chart_1.setSqlQuery("select 'Eixo Y' EixoY, 'Eixo X' EixoX, 100 Valor FROM dual"); -->
 	<xsl:template name="setSqlChart">
 		<xsl:for-each select="//content/*[@type='chart']">

	 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
 			<xsl:call-template name="generateCommentConnectionName"/>
	 		<xsl:choose>
	 			<xsl:when test="./chart_type='pie'">
	 				<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(null,',$double_quotes,$sql_chart2d,$double_quotes,');')"/>
	 			</xsl:when>
	 			<xsl:otherwise>
	 				<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(null,',$double_quotes,$sql_chart3d,$double_quotes,');')"/>
	 			</xsl:otherwise>
	 		</xsl:choose>
	 	</xsl:for-each>
 	</xsl:template>
 	
 	
 	<!-- view.table_1.setSqlQuery("select 'name' name, 1 id FROM dual"); -->
 	<xsl:template name="setSqlTable">
 		<xsl:for-each select="//content/*[@type='table']">
	 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
	 		<xsl:variable name="sql_fields">
	 			<xsl:for-each select="fields/*">
	 				<xsl:value-of select="concat($simple_quotes,local-name(),$simple_quotes,' as ',local-name())"/>
	 				<xsl:if test="position() != last()">,</xsl:if>
	 			</xsl:for-each>
	 		</xsl:variable>
 			<xsl:text>model.load</xsl:text>
 			<xsl:call-template name="CamelCaseWord">
 				<xsl:with-param name="text" select="name()"/>
 			</xsl:call-template>
 			<xsl:value-of select="concat('(Core.query(',$double_quotes,'SELECT ',$sql_fields,' ',$double_quotes,'));')"/>
 				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
		</xsl:for-each>
 	</xsl:template>
 	
 	<!-- view.pd_id.setParam(true); -->
 	<xsl:template name="setParam">
 		<xsl:for-each select="//content/*[@type='table']">
	 		<xsl:for-each select="fields/*[@iskey='true']">	
	 			<xsl:choose>
	 				<xsl:when test="@type='hidden'">
						<xsl:value-of select="concat('view.',@name,'.setParam(true);')"/>
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
	 		<xsl:for-each select="fields/*[@type='select']">
		 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
	 			<xsl:call-template name="generateCommentConnectionName"/>
		 		<xsl:choose>
		 			<xsl:when test="@schemaName!='' and @tableName!='' and @keyMap!='' and @conn!=''">
		 					<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(',$double_quotes,@conn,$double_quotes,',',$double_quotes,@schemaName,$double_quotes,',',$double_quotes,@tableName,$double_quotes,',',$double_quotes,@keyMap,$double_quotes,',',$double_quotes,@keyMap,$double_quotes,');')"/>
		 			</xsl:when>
		 			<xsl:otherwise>
		 				<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(null,',$double_quotes,'SELECT ',$simple_quotes,'id',$simple_quotes,' as ID,',$simple_quotes,'name',$simple_quotes,' as NAME ',$double_quotes,');')"/>
		 			</xsl:otherwise>
		 		</xsl:choose>
			</xsl:for-each>
	 	</xsl:for-each>
 	</xsl:template>
</xsl:stylesheet>
