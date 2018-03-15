<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
			<xsl:value-of select="concat($page_name,'View',' view = new ',$page_name,'View();')"/>
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
			<xsl:value-of select="$tab"/> 
			<xsl:value-of select="'int r = 0;'"/>	 					
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:call-template name="gen-crud-sql"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	
			<xsl:value-of select="concat('','if(r>0){')"/>
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
			<xsl:value-of select="concat('return this.redirect(',$double_quotes,$appToGo,$double_quotes,',',$double_quotes,$pageToGo,$double_quotes,',',$double_quotes,'index',$double_quotes,');')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>  
		<xsl:value-of select="'}'"/> 
 	</xsl:template>
 	
 	<xsl:template name="gen-crud-sql">
		 	<xsl:choose>
		 		<xsl:when test="/rows/plsql/package_copy_html!=''">
		 			<xsl:value-of select="concat('String isEdit = Core.getParam(',$double_quotes,'isEdit',$double_quotes,');')"/>
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
		 			<xsl:value-of select="'if(Core.isNull(isEdit)){'"/>
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
		 			<xsl:value-of select="concat('String isEdit = Core.getParam(',$double_quotes,'isEdit',$double_quotes,');')"/>
		 			<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
		 			<xsl:value-of select="'if(Core.isNull(isEdit)){'"/>
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
 	
 	<xsl:template name="gen-sql">
 		<xsl:param name="type_op" select="'insert'"/>
 		
 		<xsl:for-each select="//fields/*">
			<xsl:choose>
				<xsl:when test="@isAutoincrement">
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="addTypeQuery">
						<xsl:with-param name="type" select="@java-type"/>
						<xsl:with-param name="name" select="name()"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:if test ="$type_op ='update'">
			<xsl:variable name="condition">
				<xsl:for-each select="//fields/*">
					<xsl:if test="@iskey = 'true'">
						<xsl:call-template name="addWhereCondition">
							<xsl:with-param name="type" select="@java-type"/>
							<xsl:with-param name="name" select="name()"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('.where(',$double_quotes,$condition,' 1=1',$double_quotes,')')"/>
			<xsl:for-each select="//fields/*">
				<xsl:if test="@iskey = 'true'">
					<xsl:call-template name="addTypeQuery">
						<xsl:with-param name="type" select="@java-type"/>
						<xsl:with-param name="name" select="name()"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="$tab2"/>
		<xsl:value-of select="'.execute();'"/>
 	</xsl:template>
 	
 	<xsl:template name="addWhereCondition">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		<xsl:value-of select="concat($name,' =: ',$name,' AND ')"/>
 	</xsl:template>
 	
 	<xsl:template name="addTypeQuery">
 		<xsl:param name="type"/>
 		<xsl:param name="name"/>
 		
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
 				<xsl:value-of select="concat('.addString(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Integer' or $type='int'">
 				<xsl:value-of select="concat('.addInt(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Float' or $type='float'">
 				<xsl:value-of select="concat('.addFloat(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Double' or $type='double'">
 				<xsl:value-of select="concat('.addDouble(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Short' or $type='short'">
 				<xsl:value-of select="concat('.addShort(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Long' or $type='Long'">
 				<xsl:value-of select="concat('.addLong(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 			<xsl:when test="$type='Date' or $type='Date'">
 				<xsl:value-of select="concat('.addDate(',$double_quotes,$name,$double_quotes,',model.get',$name_,'())')"/>
 			</xsl:when>
 		</xsl:choose>
 		
 	</xsl:template>
</xsl:stylesheet>