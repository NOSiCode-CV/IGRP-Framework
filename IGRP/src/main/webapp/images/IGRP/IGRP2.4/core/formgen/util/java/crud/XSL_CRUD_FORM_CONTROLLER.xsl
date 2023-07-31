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
	          	<xsl:choose>
	          		<xsl:when test="@rel='save'">
	          			<xsl:call-template name="actionSave"/>
	          		</xsl:when>
	          		<xsl:otherwise>
	          			<xsl:call-template name="actionRedirected">
	          				<xsl:with-param name="actionName" select="@rel"/>
					 		<xsl:with-param name="appToGo" select="./app"/>
					 		<xsl:with-param name="pageToGo" select="./page"/>
				 		</xsl:call-template>
	          		</xsl:otherwise>
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
			<xsl:variable name="conditions">
				<xsl:call-template name="gen-sql">
					<xsl:with-param name="type_op" select="'select'"/>
				</xsl:call-template>
			</xsl:variable>	
			<xsl:variable name="columns">
				<xsl:call-template name="sql-select"/>
			</xsl:variable>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:value-of select="concat($page_name,'View',' view = new ',$page_name,'View();')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'index'"/>
	     	</xsl:call-template>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  		
			<xsl:value-of select="concat('String isEdit = Core.getParam(',$double_quotes,'isEdit',$double_quotes,');')"/>;
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('if(',$isEditSave,') {')"/>	
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('QueryInterface query = Core.query(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,'SELECT ',$columns,' FROM ',/rows/plsql/package_copy_html,'.',/rows/plsql/package_copy_db,$double_quotes,')',$conditions,';')"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>	
				<xsl:value-of select="'model.load(query);'"/>			
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>			
				<xsl:value-of select="concat('view.btn_save.setLink(',$double_quotes,'save&amp;isEdit=true',$double_quotes,');')"/>	
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'}'"/>			
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="end-code-crud"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'view.setModel(model);'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:value-of select="'return this.renderView(view);'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>  
		<xsl:value-of select="'}'"/> 
 	</xsl:template>
 	
 	<xsl:template name="actionSave">
 		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="'public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat($page_name,' model = new ',$page_name,'();')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>			
			<xsl:value-of select="'model.load();'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'save'"/>
	     	</xsl:call-template>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/> 
			<xsl:value-of select="'ResultSet r = null;'"/>	 					
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:call-template name="gen-crud-sql"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="concat('','if(!r.hasError()){')"/>
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
			<xsl:value-of select="$tab"/>
			<xsl:value-of select="concat(' return this.forward(',$double_quotes,$app_name,$double_quotes,',',$double_quotes,$page_name,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>							
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>				
			<xsl:value-of select="concat('}','')"/>
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
 	
	<xsl:variable name="isEdit">
		<xsl:text>Core.isNull(isEdit)</xsl:text>
	</xsl:variable>
	<xsl:variable name="isEditSave">
		<xsl:text>Core.isNotNull(isEdit)</xsl:text>
	</xsl:variable>
	
 	<xsl:template name="gen-crud-sql">			
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('String isEdit = Core.getParam(',$double_quotes,'isEdit',$double_quotes,');')"/>;
		 	<xsl:choose>
		 		<xsl:when test="/rows/plsql/package_copy_html!=''">
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
		 			<xsl:value-of select="concat('if(',$isEdit,'){')"/>
		 				<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>  
						<xsl:value-of select="$tab"/> 
		 				<xsl:value-of select="concat('r = Core.insert(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_html,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
	 				<xsl:value-of select="'}else{'"/>
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
	 				<xsl:value-of select="'}'"/>
		 		</xsl:when>
		 		<xsl:otherwise>
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
		 			<xsl:value-of select="concat('if(',$isEdit,'){')"/>
		 				<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/> 
						<xsl:value-of select="$tab"/> 
		 				<xsl:value-of select="concat(' r = Core.insert(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
	 				<xsl:value-of select="'}else{'"/>
	 					<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
		 				<xsl:value-of select="concat('r = Core.update(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
	 					<xsl:value-of select="$tab2"/>
						<xsl:call-template name="gen-sql">
							<xsl:with-param name="type_op" select="'update'"/>
						</xsl:call-template>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
	 				<xsl:value-of select="'}'"/>
		 		</xsl:otherwise>
		 	</xsl:choose> 	
			
 	</xsl:template>
 	 	
	<xsl:template name="if-update">
		<xsl:variable name="if">
			<xsl:for-each select="//fields/*[@iskey = 'true']">			
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
</xsl:stylesheet>