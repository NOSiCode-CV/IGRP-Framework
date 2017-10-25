<<<<<<< HEAD
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
			<xsl:value-of select="document($url)/your_code"/>
		</xsl:variable>	
		<xsl:value-of select="$newline"/>
     	<xsl:value-of select="$begin_reserve_code_controller_import"></xsl:value-of>		
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
		 		<xsl:value-of select="$import_igrp"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$newline"/>
     		</xsl:otherwise>
     	</xsl:choose>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
		<!--<xsl:call-template name="import-class-models"></xsl:call-template>  -->
		<xsl:value-of select="$newline"/>
 	</xsl:template>
 	
	<!-- create actions based in button -->
	<xsl:template name="createActions">
         <xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or  (count(/rows/content//tools-bar) &gt; 0) or (count(/rows/content//context-menu/item) &gt; 0)">
            <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type='verticalmenu']/item">   <!-- Button in tools-bar -->
          	<xsl:call-template name="actions">
				<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
				<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
				<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
				<xsl:with-param name="title_"><xsl:value-of select="@rel"/></xsl:with-param>
				<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
            </xsl:call-template>
           </xsl:for-each>
           <xsl:for-each select="//tools-bar/item">   <!-- Button in form -->
          	<xsl:call-template name="actions">
				<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
				<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
				<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
				<xsl:with-param name="title_"><xsl:value-of select="@rel"/></xsl:with-param>
				<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
            </xsl:call-template>
           </xsl:for-each>           
           <xsl:for-each select="//context-menu/item">   <!-- Button in table -->
            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="actions">
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="@rel"/></xsl:with-param>
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
			<xsl:value-of select="document($url)/your_code"/>
		</xsl:variable>	
		
		<xsl:value-of select="$newline"/>	
		<xsl:value-of select="$tab"/>
     	<xsl:value-of select="$begin_reserve_code_controller_actions"></xsl:value-of>
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
		<xsl:param name="title_"/>
		<xsl:call-template name="gen-action">
			<xsl:with-param name="action_name_"><xsl:value-of select="$title_"/></xsl:with-param>
			<xsl:with-param name="page_"><xsl:value-of select="$page_"/></xsl:with-param>
			<xsl:with-param name="app_"><xsl:value-of select="$app_"/></xsl:with-param>
			<xsl:with-param name="link_"><xsl:value-of select="$link_"/></xsl:with-param>
			<xsl:with-param name="type_render_"><xsl:value-of select="'redirect'"/></xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
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
			
		<xsl:variable name="action">
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
			<xsl:value-of select="document($url_)/your_code"/>
		</xsl:variable>	
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		<xsl:choose>
			<xsl:when test="$your_code_exception != ''">
				<xsl:value-of select="concat('public Response action',$action,'() ',$your_code_exception,'{')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('public Response action',$action,'() throws IOException, IllegalArgumentException, IllegalAccessException{')"/>
			</xsl:otherwise>
		</xsl:choose>
     	<xsl:value-of select="$newline"/>	
     	<xsl:value-of select="$tab2"/>     	
     	<!--         Actions modified by programmer -->     	
     	<xsl:value-of select="$begin_reserve_code_controller_on_action"></xsl:value-of>		
		
     	<xsl:variable name="url">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=c_on_action&amp;ac=',$action,'&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>	     	
		<xsl:variable name="your_code">
			<xsl:value-of select="document($url)/your_code"/>
		</xsl:variable>	
		<xsl:if test="$your_code!=''">
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="$your_code"/>	
		</xsl:if>
		<xsl:choose>
			<xsl:when  test="$page_ != '' and $your_code=''">
				<xsl:choose>
					<xsl:when test="$type_render_='render'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('if(Igrp.getMethod().equalsIgnoreCase(',$double_quotes,'post',$double_quotes,')){')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>		
						<xsl:value-of select="$tab"/>				
						<xsl:value-of select="'model.load();'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="'}'"/>	
						
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,'View',' view = new ',$model,'View(model);')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="'return this.renderView(view);'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab"/>  
					</xsl:when>
					<xsl:when test="$type_render_='redirect'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('if(Igrp.getMethod().equalsIgnoreCase(',$double_quotes,'post',$double_quotes,')){')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="$tab"/>					
						<xsl:value-of select="'model.load();'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="'}'"/>
						
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app__,$double_quotes,',',$double_quotes,$page_,$double_quotes,',',$double_quotes,$link__,$double_quotes,');')"/>
						<xsl:value-of select="$newline"/>  
						<xsl:value-of select="$tab"/>
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
					<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
					<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app,$double_quotes,',',$double_quotes,$page,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>
					<xsl:value-of select="$newline"/>  
					<xsl:value-of select="$tab"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>   	
		<xsl:value-of select="$tab"/>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
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
=======
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
			<xsl:value-of select="document($url)/your_code"/>
		</xsl:variable>	
		<xsl:value-of select="$newline"/>
     	<xsl:value-of select="$begin_reserve_code_controller_import"></xsl:value-of>		
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
		 		<xsl:value-of select="$import_igrp"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$newline"/>
     		</xsl:otherwise>
     	</xsl:choose>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
		<!--<xsl:call-template name="import-class-models"></xsl:call-template>  -->
		<xsl:value-of select="$newline"/>
 	</xsl:template>
 	
	<!-- create actions based in button -->
	<xsl:template name="createActions">
         <xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or  (count(/rows/content//tools-bar) &gt; 0) or (count(/rows/content//context-menu/item) &gt; 0)">
            <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type='verticalmenu']/item">   <!-- Button in tools-bar -->
          	<xsl:call-template name="actions">
				<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
				<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
				<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
				<xsl:with-param name="title_"><xsl:value-of select="@rel"/></xsl:with-param>
				<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
            </xsl:call-template>
           </xsl:for-each>
           <xsl:for-each select="//tools-bar/item">   <!-- Button in form -->
          	<xsl:call-template name="actions">
				<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
				<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
				<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
				<xsl:with-param name="title_"><xsl:value-of select="@rel"/></xsl:with-param>
				<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
            </xsl:call-template>
           </xsl:for-each>           
           <xsl:for-each select="//context-menu/item">   <!-- Button in table -->
            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="actions">
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="link_"><xsl:value-of select="./link"/></xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="@rel"/></xsl:with-param>
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
			<xsl:value-of select="document($url)/your_code"/>
		</xsl:variable>	
		
		<xsl:value-of select="$newline"/>	
		<xsl:value-of select="$tab"/>
     	<xsl:value-of select="$begin_reserve_code_controller_actions"></xsl:value-of>
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
		<xsl:param name="title_"/>
		<xsl:call-template name="gen-action">
			<xsl:with-param name="action_name_"><xsl:value-of select="$title_"/></xsl:with-param>
			<xsl:with-param name="page_"><xsl:value-of select="$page_"/></xsl:with-param>
			<xsl:with-param name="app_"><xsl:value-of select="$app_"/></xsl:with-param>
			<xsl:with-param name="link_"><xsl:value-of select="$link_"/></xsl:with-param>
			<xsl:with-param name="type_render_"><xsl:value-of select="'redirect'"/></xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
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
			
		<xsl:variable name="action">
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
			<xsl:value-of select="document($url_)/your_code"/>
		</xsl:variable>	
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		<xsl:choose>
			<xsl:when test="$your_code_exception != ''">
				<xsl:value-of select="concat('public Response action',$action,'() ',$your_code_exception,'{')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('public Response action',$action,'() throws IOException, IllegalArgumentException, IllegalAccessException{')"/>
			</xsl:otherwise>
		</xsl:choose>
     	<xsl:value-of select="$newline"/>	
     	<xsl:value-of select="$tab2"/>     	
     	<!--         Actions modified by programmer -->     	
     	<xsl:value-of select="$begin_reserve_code_controller_on_action"></xsl:value-of>		
		
     	<xsl:variable name="url">
     		<xsl:value-of select="concat($preserve_url,'&amp;type=c_on_action&amp;ac=',$action,'&amp;app=',$app_name,'&amp;page=',$page_name)"></xsl:value-of>
     	</xsl:variable>	     	
		<xsl:variable name="your_code">
			<xsl:value-of select="document($url)/your_code"/>
		</xsl:variable>	
		<xsl:if test="$your_code!=''">
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="$your_code"/>	
		</xsl:if>
		<xsl:choose>
			<xsl:when  test="$page_ != '' and $your_code=''">
				<xsl:choose>
					<xsl:when test="$type_render_='render'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('if(Igrp.getMethod().equalsIgnoreCase(',$double_quotes,'post',$double_quotes,')){')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>		
						<xsl:value-of select="$tab"/>				
						<xsl:value-of select="'model.load();'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="'}'"/>	
						
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,'View',' view = new ',$model,'View(model);')"/>
						<xsl:call-template name="setSqlChart"></xsl:call-template>
						<xsl:call-template name="setSqlTable"></xsl:call-template>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="'return this.renderView(view);'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab"/>  
					</xsl:when>
					<xsl:when test="$type_render_='redirect'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($model,' model = new ',$model,'();')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('if(Igrp.getMethod().equalsIgnoreCase(',$double_quotes,'post',$double_quotes,')){')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="$tab"/>					
						<xsl:value-of select="'model.load();'"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>	
						<xsl:value-of select="'}'"/>
						
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app__,$double_quotes,',',$double_quotes,$page_,$double_quotes,',',$double_quotes,$link__,$double_quotes,');')"/>
						<xsl:value-of select="$newline"/>  
						<xsl:value-of select="$tab"/>
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
					<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
					<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app,$double_quotes,',',$double_quotes,$page,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>
					<xsl:value-of select="$newline"/>  
					<xsl:value-of select="$tab"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>   	
		<xsl:value-of select="$tab"/>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
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
 	<!-- view.chart_1.setSqlQuery("select 'Eixo Y' EixoY, 'Eixo X' EixoX, 100 Valor FROM dual"); -->
 	<xsl:template name="setSqlChart">
 		<xsl:for-each select="//content/*[@type='chart']">
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
	 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
	 		<xsl:choose>
	 			<xsl:when test="./chart_type='pie'">
	 				<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(',$double_quotes,$sql_chart2d,$double_quotes,');')"/>
	 			</xsl:when>
	 			<xsl:otherwise>
	 				<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(',$double_quotes,$sql_chart3d,$double_quotes,');')"/>
	 			</xsl:otherwise>
	 		</xsl:choose>
	 	</xsl:for-each>
 	</xsl:template>
 	
 	
 	<!-- view.chart_1.setSqlQuery("select 'name' name, 1 id FROM dual"); -->
 	<xsl:template name="setSqlTable">
 		<xsl:for-each select="//content/*[@type='table']">
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
	 		<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
	 		<xsl:variable name="sql_fields">
	 			<xsl:for-each select="fields/*">
	 				<xsl:value-of select="concat($simple_quotes,local-name(),$simple_quotes,' ',local-name(),', ')"/>
	 			</xsl:for-each>
	 		</xsl:variable>
			<xsl:value-of select="concat('view.',$instance_name,'.setSqlQuery(',$double_quotes,'SELECT ',substring($sql_fields,1,string-length($sql_fields)-2),' FROM dual',$double_quotes,');')"/>
	 	</xsl:for-each>
 	</xsl:template>
>>>>>>> branch 'master' of https://github.com/NOSiCode-CV/IGRP-Framework.git
</xsl:stylesheet>