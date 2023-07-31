<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="XSL_COMMON.xsl" />
	
	<xsl:template name="create-controller">
		<xsl:value-of select="$newline"/>
     	<xsl:call-template name="import-packages-controller"></xsl:call-template>
     	<xsl:value-of select="$newline"/>
 		<xsl:value-of select="concat('public class ',$class_name,'Controller extends Controller {')"/>
	     	<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:call-template name="actionIndex"/>
	 		<xsl:value-of select="$newline"/>
 		 	<xsl:call-template name="otherActions"/>
	 		<xsl:value-of select="$newline"/>
		<xsl:value-of select="'}'"/>
	</xsl:template>
	
	
     <!-- import all class to using in controller -->
 	<xsl:template name="import-packages-controller">
		<xsl:value-of select="concat('package ',$package_name)"/>	
		<xsl:value-of select="$newline"/>
		<!-- <xsl:value-of select="$begin_reserve_code_controller_import"></xsl:value-of> -->
		<!--      	
		<xsl:call-template name="begin_reserve_code_action">
     		<xsl:with-param name="type" select="'PACKAGES_IMPORT'"/>
     		<xsl:with-param name="url" select="$url"/>
     	</xsl:call-template> 
     	-->

 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_controller"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_exception"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_response"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_igrp"/>
		<xsl:value-of select="$newline"/>
     	<xsl:call-template name="start-code">
     		<xsl:with-param name="type" select="'packages_import'"/>
     		<xsl:with-param name="url" select="''"/>
     		<xsl:with-param name="tabCode" select="false()"/>
     	</xsl:call-template>
     	<xsl:value-of select="$end_reserve_code"></xsl:value-of>
		<!--<xsl:call-template name="import-class-models"></xsl:call-template>  -->
		<xsl:value-of select="$newline"/>
 	</xsl:template>
 	
 	<xsl:template name="otherActions">
 		 <xsl:for-each select="/rows/content/*[@type = 'toolsbar']/item">   <!-- Button in form -->
           	<xsl:if test="not(@rel=preceding::node()/@rel)">
         			<xsl:call-template name="actionRedirected">
         				<xsl:with-param name="actionName" select="@rel"/>
			 		<xsl:with-param name="appToGo" select="./app"/>
			 		<xsl:with-param name="pageToGo" select="./page"/>
		 		</xsl:call-template>
	        </xsl:if>
         </xsl:for-each>
         
         <xsl:for-each select="//context-menu/item">   <!-- Button in form -->
           	<xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:choose>
	          		<xsl:when test="@rel='delete'">
	          			<xsl:call-template name="actionDelete"/>
	          		</xsl:when>
	          		<xsl:when test="@rel='update'">
	          			<xsl:call-template name="actionUpdate">
					 		<xsl:with-param name="appToGo" select="./app"/>
					 		<xsl:with-param name="pageToGo" select="./page"/>
				 		</xsl:call-template>
	          		</xsl:when>
	          	</xsl:choose>
	        </xsl:if>
         </xsl:for-each>
 	</xsl:template>
 	
 	<xsl:template name="actionIndex">
 		
 		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="'public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat($page_name,' model = new ',$page_name,'();')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>			
			<xsl:value-of select="'model.load();'"/>			
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat($page_name,'View',' view = new ',$page_name,'View();')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			
			<xsl:variable name="columns">
				<xsl:call-template name="sql-select"/>
			</xsl:variable>
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'index'"/>
	     	</xsl:call-template>	     	
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  		
			<xsl:value-of select="concat('QueryInterface query = Core.query(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,'SELECT ',$columns,' FROM ',/rows/plsql/package_copy_html,'.',/rows/plsql/package_copy_db,$double_quotes,');')"/>	
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="'model.loadTable_1(query);'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="set-params-context-menu"/>		
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="end-code-crud"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'view.setModel(model);'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="setParam"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'return this.renderView(view);'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>  
		<xsl:value-of select="'}'"/> 
 	</xsl:template>
 	
 	<xsl:template name="actionRedirected">
 		<xsl:param name="actionName"/>
 		<xsl:param name="appToGo"/>
 		<xsl:param name="pageToGo"/>
 		
 		<xsl:variable name="actionName_">
 			<xsl:call-template name="CamelCaseWord">
 				<xsl:with-param name="text" select="$actionName"/>
 			</xsl:call-template>
 		</xsl:variable>
 		
 		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="concat('public Response action',$actionName_,'() throws IOException, IllegalArgumentException, IllegalAccessException{')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="$actionName"/>
	     	</xsl:call-template>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="end-code-crud"/>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			
			<xsl:value-of select="concat('return this.redirect(',$double_quotes,$appToGo,$double_quotes,',',$double_quotes,$pageToGo,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>  
		<xsl:value-of select="'}'"/> 
 	</xsl:template>
 	
 	<xsl:template name="actionUpdate">
 		<xsl:param name="appToGo"/>
 		<xsl:param name="pageToGo"/>
 		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="'public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'update'"/>
	     	</xsl:call-template>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="set-param-update"/>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="end-code-crud"/>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('return this.redirect(',$double_quotes,$appToGo,$double_quotes,',',$double_quotes,$pageToGo,$double_quotes,',',$double_quotes,'index',$double_quotes,',this.queryString());')"/>
			<xsl:value-of select="$newline"/>  
			<xsl:value-of select="$tab"/>
		<xsl:value-of select="'}'"/> 
 	</xsl:template>
 	
 	<xsl:template name="actionDelete">
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="'public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat($page_name,'.Table_1 model = new ',$page_name,'.Table_1();')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'delete'"/>
	     	</xsl:call-template>			
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>		
			<xsl:value-of select="concat('ResultSet r = Core.delete(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_html,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
			<xsl:call-template name="gen-sql">
				<xsl:with-param name="type_op" select="'delete'"/>
			</xsl:call-template>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'if(!r.hasError())'"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="'Core.setMessageSuccess();'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'else'"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="$tab"/>
			<xsl:value-of select="'Core.setMessageError();'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="end-code-crud"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('return this.redirect(',$double_quotes,$app_name,$double_quotes,',',$double_quotes,$page_name,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>  
		<xsl:value-of select="'}'"/> 
 	</xsl:template>
 	
 	
 	<xsl:template name="setType">
 		<xsl:param name="name"/>
 		<xsl:param name="type"/>
 		<xsl:call-template name="setTypeValue">
 			<xsl:with-param name="name" select="$name"/>
 			<xsl:with-param name="type" select="$type"/>
 		</xsl:call-template>
 	</xsl:template>
 	
</xsl:stylesheet>