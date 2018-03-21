<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="XSL_FUNCTIONS.xsl" />
	
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
		<xsl:value-of select="$import_query_helper"/>
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
 		 <xsl:call-template name="actionSave"/>
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
			<xsl:variable name="conditions">
				<xsl:call-template name="gen-sql">
					<xsl:with-param name="type_op" select="'select'"/>
				</xsl:call-template>
			</xsl:variable>	
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:value-of select="concat($page_name,'View',' view = new ',$page_name,'View();')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'index'"/>
	     	</xsl:call-template>
	     	<xsl:variable name="columns">
				<xsl:call-template name="sql-select"/>
			</xsl:variable>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  		
			<xsl:value-of select="concat('QueryHelper queryTable = Core.query(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,'SELECT ',$columns,' FROM ',/rows/plsql/package_copy_db,$double_quotes,');')"/>	
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="'model.loadTable_1(queryTable);'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>  
			<xsl:call-template name="gen-sql-combobox"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/> 		
			<xsl:value-of select="concat('String isEdit = Core.getParam(',$double_quotes,'isEdit',$double_quotes,');')"/>
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('if(',$isEdit,') {')"/>	
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>		
				<xsl:value-of select="concat('QueryHelper query = Core.query(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,'SELECT ',$columns,' FROM ',/rows/plsql/package_copy_db,$double_quotes,')',$conditions,';')"/>
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
			<xsl:call-template name="set-params-context-menu"/>		
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
			<xsl:value-of select="'Object r = null;'"/>	 					
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:call-template name="gen-saved-or-update"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="concat('','if(r != null){')"/>
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
 	
 	
 	<xsl:template name="actionUpdate">
 		<xsl:param name="appToGo"/>
 		<xsl:param name="pageToGo"/>
 		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:value-of select="'public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{'"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:variable name="params">
				<xsl:call-template name="set-param-update"/>
			</xsl:variable>
			<xsl:call-template name="start-code-crud">
	     		<xsl:with-param name="type" select="'update'"/>
	     	</xsl:call-template>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:call-template name="end-code-crud"/>
	     	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('return this.redirect(',$double_quotes,$appToGo,$double_quotes,',',$double_quotes,$pageToGo,$double_quotes,',',$double_quotes,'index',$double_quotes,$params,');')"/>
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
			<xsl:call-template name="set-update-keys-value"/>		
			<xsl:value-of select="concat('Object r = Core.delete(',$double_quotes,/rows/plsql/package_instance,$double_quotes,',',$double_quotes,/rows/plsql/package_copy_db,$double_quotes,')')"/>
			<xsl:call-template name="gen-sql">
				<xsl:with-param name="type_op" select="'delete'"/>
			</xsl:call-template>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'if( r!=null)'"/>
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
 	
 	
</xsl:stylesheet>