<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
   	<!--
		Declare get and set mehtods in class model
    	public String getText(){
    		return this.text;
    	}
    	...
	-->
    <xsl:template name="gen-get-set-model">
    	<xsl:for-each select="/rows/content/*[@xml-type != 'table' and @type != 'formlist' and @type !='separatorlist']">
    		<xsl:for-each select="fields/*">
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
	            <xsl:if test="not(@name=preceding::node()/@name)">	
					
					<xsl:value-of select="$tab"/>
					
					<xsl:variable name="type_field_">
						<xsl:call-template name="get-variable-type-java">
				    		<xsl:with-param name="type" select="@type" />
				    		<xsl:with-param name="javaType" select="@java-type" />
   							<xsl:with-param name="multiple" select="@multiple"/>
				    	</xsl:call-template>
					</xsl:variable>
					
					<xsl:choose>
							<xsl:when test="@type='select' and @multiple='true'">
								<xsl:call-template name="gen-method-set-get">
									<xsl:with-param name="type" select="$type_field_" />
						    		<xsl:with-param name="name" select="$tag_name" />
						    		<xsl:with-param name="javaType" select="$type_field_"/>
						    	</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="gen-method-set-get">
									<xsl:with-param name="type" select="@type" />
						    		<xsl:with-param name="name" select="$tag_name" />
						    		<xsl:with-param name="javaType" select="@java-type"/>
	    							<xsl:with-param name="multiple" select="@multiple"/>
						    	</xsl:call-template>
							</xsl:otherwise>
			    	</xsl:choose>
			    	
					<xsl:value-of select="$newline"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	
	<!--
		Declare fields in class model
    	private String text;
    	private int id;
    	...
	-->
    <xsl:template name="declare-variables-model">
    	<xsl:for-each select="/rows/content/*[@xml-type != 'table' and @type != 'formlist' and @type !='separatorlist']">
    		<xsl:for-each select="fields/*">
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
	            <xsl:if test="not(@name=preceding::node()/@name)">		
	            	<xsl:call-template name="validation-field"/>
	            	
					<xsl:value-of select="$tab"/>
					<xsl:variable name="type_field">
						<xsl:call-template name="get-variable-type-java">
				    		<xsl:with-param name="type" select="@type" />
				    		<xsl:with-param name="javaType" select="@java-type" />
				    	</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes,@name,$double_quotes,')')"/>			
					<xsl:value-of select="$newline"/>			
					<xsl:value-of select="$tab"/>
					
					<xsl:choose>
						<xsl:when test="(@type='select' or @type='file') and @multiple='true'">
							<xsl:value-of select="concat('private ',$type_field,'[] ',$tag_name,';')"/>
						</xsl:when>
						<xsl:otherwise>	
							<xsl:choose>				
								<xsl:when test="@type='link'">
									<xsl:value-of select="concat('private ','IGRPLink ', $tag_name,';')"/>
								</xsl:when>
								<xsl:otherwise>						
									<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,';')"/>									
								</xsl:otherwise>	
							</xsl:choose>
						</xsl:otherwise>			
					</xsl:choose>
					
					
					<xsl:value-of select="$newline"/>
					<xsl:if test="@type='link'">	
						<xsl:value-of select="$tab"/>				
						<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes,@name,'_desc',$double_quotes,')')"/>			
						<xsl:value-of select="$newline"/>			
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_desc;')"/>				
						<xsl:value-of select="$newline"/>
					</xsl:if>
					<xsl:if test="(@type='checkbox' or @type='radio')">	 						
						<xsl:value-of select="$tab"/>				
						<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes,@name,'_check',$double_quotes,')')"/>			
						<xsl:value-of select="$newline"/>			
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_check;')"/>				
						<xsl:value-of select="$newline"/>
					</xsl:if>
					<xsl:if test="(@type='img' )">	 						
						<xsl:value-of select="$tab"/>				
						<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes,@name,'_uuid',$double_quotes,')')"/>			
						<xsl:value-of select="$newline"/>			
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_uuid;')"/>				
						<xsl:value-of select="$newline"/>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
    	</xsl:for-each> 

    	<xsl:for-each select="/rows/content/*[@xml-type = 'table' or @type = 'chart' or @type = 'formlist' or @type = 'separatorlist' or @type='carousel']">
    		<xsl:value-of select="$tab"/>
			<xsl:variable name="tableName">
    			<xsl:call-template name="gen-className">
    				<xsl:with-param name="className"><xsl:value-of select="name()"/> </xsl:with-param> 
    			</xsl:call-template> 
    		</xsl:variable>  
	 		<xsl:value-of select="$newline"/>			
			<xsl:value-of select="$tab"/>
			<xsl:if test="@type = 'formlist' or @type = 'separatorlist'">
				<xsl:value-of select="concat('@SeparatorList(name = ',$tableName,'.class)')"/>
				<xsl:value-of select="$newline"/>			
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="'@Valid'"/>
				<xsl:value-of select="$newline"/>			
				<xsl:value-of select="$tab"/>
			</xsl:if>
			<xsl:value-of select="concat('private List&lt;',$tableName,'&gt; ',name(),' = new ArrayList&lt;&gt;();')"/>
			<xsl:call-template name="gen-method-set-get">
	    		<xsl:with-param name="type_content" select="../../@type" />
	    		<xsl:with-param name="type" select="'arraylist'" />
	    		<xsl:with-param name="name" select="name()" />
	    	</xsl:call-template>
			<xsl:value-of select="$newline"/>	
			
			
			<xsl:if test="@type = 'formlist' or @type = 'separatorlist'">
			
				<xsl:value-of select="$tab"/> 
				<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes, 'p_',name(),'_id',$double_quotes,')')"/>			
				<xsl:value-of select="$newline"/>			
				<xsl:value-of select="$tab"/> 
				<xsl:value-of select="concat('private ','String[]',' ', 'p_',name(),'_id',';')"/>				
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes, 'p_',name(),'_del',$double_quotes,')')"/>			
				<xsl:value-of select="$newline"/>			
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="concat('private ','String[]',' ', 'p_',name(),'_del',';')"/>				
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes, 'p_',name(),'_edit',$double_quotes,')')"/>			
				<xsl:value-of select="$newline"/>			
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="concat('private ','String[]',' ', 'p_',name(),'_edit',';')"/>				
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/>
				<xsl:call-template name="gen-method-set-get">
		    		<xsl:with-param name="type" select="'String[]'" />
		    		<xsl:with-param name="name" select="concat('p_',name(),'_id')" />
		    		<xsl:with-param name="javaType" select="'String[]'"/>
		    	</xsl:call-template>
				<xsl:value-of select="$newline"/>
				
				<xsl:value-of select="$tab"/> 
				<xsl:call-template name="gen-method-set-get">
		    		<xsl:with-param name="type" select="'String[]'" />
		    		<xsl:with-param name="name" select="concat('p_',name(),'_del')" />
		    		<xsl:with-param name="javaType" select="'String[]'"/>
		    	</xsl:call-template>
				<xsl:value-of select="$newline"/>
		    	
		    	<xsl:value-of select="$tab"/> 
				<xsl:call-template name="gen-method-set-get">
		    		<xsl:with-param name="type" select="'String[]'" />
		    		<xsl:with-param name="name" select="concat('p_',name(),'_edit')" />
		    		<xsl:with-param name="javaType" select="'String[]'"/>
		    	</xsl:call-template>
	    	
			</xsl:if>
			<xsl:value-of select="$newline"/>
			
			
    	</xsl:for-each>  
    	
    	
	</xsl:template>

 	<!-- import all class to using in model -->
 	<xsl:template name="import-packages-model">
 		<xsl:value-of select="concat('package ',$package_name)"/>
		<xsl:value-of select="$newline"/>
		 <xsl:value-of select="$newline"/>
		 <xsl:value-of select="$import_bignumber"/>			 
 		<xsl:value-of select="$import_config_model"/>	
 		<xsl:value-of select="$import_table"/>		
 		<xsl:value-of select="$import_model"/>	
 		<xsl:value-of select="$import_annotations"/> 		
 		<xsl:value-of select="$import_query_helper"/>	
 		<xsl:value-of select="$import_separator_list"/>	
 		<xsl:value-of select="$import_separator_list_annotation"/>		
 		<xsl:value-of select="$import_date"/> 		
		<xsl:value-of select="$import_array_list"/>
		<xsl:value-of select="$import_list"/>	
		<xsl:value-of select="$import_chart2d"/>	
		<xsl:value-of select="$import_chart3d"/>	
		<xsl:value-of select="$import_file_upload"/>
		<xsl:value-of select="$import_validations_annotations"/>
 	</xsl:template>


 	<!-- Join all template to create a class model
 	Example:
 	
 	 public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

	public void loadMyapps_list(BaseQueryInterface query) {
		this.setMyapps_list(this.loadTable(query,Myapps_list.class));
	} -->
 	<xsl:template name="create-model"> 	  
 		<xsl:call-template name="import-packages-model"></xsl:call-template>
 		<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="concat('public class ',$class_name,' extends Model{')"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="declare-variables-model"></xsl:call-template>
	 		<xsl:call-template name="gen-get-set-model"></xsl:call-template>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="gen-subclass"></xsl:call-template>
			
			<xsl:value-of select="$newline"/>
			
			<xsl:for-each select="//rows/content/*[@xml-type='table' or @type='chart' or @type='formlist' or @type='separatorlist']">
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab"/>
				
				<xsl:variable name="tclassName">
					<xsl:call-template name="gen-className">
						<xsl:with-param name="className" select="name()"/>
					</xsl:call-template>
				</xsl:variable>
				
				<xsl:text>public void load</xsl:text>
				<xsl:value-of select="$tclassName"/><xsl:text>(BaseQueryInterface query) {</xsl:text>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:choose>
					<xsl:when test=" @type='formlist' or @type='separatorlist'">
						<xsl:value-of select="concat( 'this.set',$tclassName,'(this.loadFormList(query,',$tclassName,'.class));' )"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( 'this.set',$tclassName,'(this.loadTable(query,',$tclassName,'.class));' )"/>
					</xsl:otherwise>
				</xsl:choose>
				
				<!--<xsl:text>this.loadTable(query,</xsl:text>
				<xsl:value-of select="$tclassName"/>
				<xsl:text>.class);</xsl:text> -->
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab"/>
				<xsl:text>}</xsl:text>
				<xsl:value-of select="$newline"/>
				
			</xsl:for-each>
			
			<xsl:value-of select="$newline"/>
	 		
 		<xsl:value-of select="'}'"/>
 	</xsl:template>
 	
 	<!-- Gen attributes for subclass 
 	Example:
 	
 		public static class Myapps_list{
		private String icon;
		private String aplicacao;
		private String aplicacao_desc;
 	-->
 	<xsl:template name="gen-ttributes-subclass">
 		<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>
			<xsl:variable name="tableName">
    			<xsl:call-template name="gen-className">
    				<xsl:with-param name="className"><xsl:value-of select="name()"/> </xsl:with-param> 
    			</xsl:call-template> 
    		</xsl:variable>  
 		<xsl:value-of select="concat('public static class ',$tableName,' extends IGRPTable.Table{')"/>
 		<xsl:for-each select="fields/*">
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
			<xsl:variable name="type_field">
				<xsl:call-template name="get-variable-type-java">
		    		<xsl:with-param name="type" select="@type" />
		    		<xsl:with-param name="javaType" select="@java-type" />
		    		<xsl:with-param name="multiple" select="@multiple"/>
		    	</xsl:call-template>
			</xsl:variable>
			<xsl:if test="@type != 'link' and @type != 'img'">
			<xsl:value-of select="$newline"/>
 			<xsl:value-of select="$tab2"/>						
			<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,';')"/>				
			</xsl:if>
 			
			<xsl:if test="@type = 'checkbox' or @type='radio'">				
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_check;')"/>
			</xsl:if>	
			<xsl:if test="@type = 'img' ">	
				<xsl:value-of select="$newline"/>
 				<xsl:value-of select="$tab2"/>			
				<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'=',$double_quotes,@img,$double_quotes,';')"/>		
				<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_uuid;')"/>
			</xsl:if>			
			<xsl:if test="@type = 'link'">		
				<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private ','IGRPLink',' ',$tag_name,';')"/>		
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_desc= ',$double_quotes,./label,$double_quotes,';')"/>
			</xsl:if>
 		</xsl:for-each>
 		<xsl:for-each select="fields/*">
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
			<xsl:call-template name="gen-method-set-get">
	    		<xsl:with-param name="type_content" select="../../@type" />
	    		<xsl:with-param name="type" select="@type" />
	    		<xsl:with-param name="name" select="$tag_name" />
	    		<xsl:with-param name="tab_" select="$tab2" />
	    		<xsl:with-param name="tab2_" select="concat($tab,$tab2)" />
	    		<xsl:with-param name="javaType" select="@java-type"/>
	    		<xsl:with-param name="multiple" select="@multiple"/>
	    	</xsl:call-template>
			<xsl:value-of select="$newline"/>
		</xsl:for-each>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="'}'"/> 	
 	</xsl:template>
 	
 	<!-- Gen subclass chart -->
 	<xsl:template name="gen-chart-subclass">
 		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		
		<xsl:variable name="tableName">
   			<xsl:call-template name="gen-className">
   				<xsl:with-param name="className"><xsl:value-of select="name()"/> </xsl:with-param> 
   			</xsl:call-template> 
   		</xsl:variable>
   		
   		<xsl:variable name="chartType">
   			<xsl:choose>
   				<xsl:when test="chart_type='pie' or chart_type='semipie' or chart_type='funnel'">
   					<xsl:value-of select="'IGRPChart2D'"/>
   				</xsl:when>
   				<xsl:otherwise>
   					<xsl:value-of select="'IGRPChart3D'"/>
   				</xsl:otherwise>
   			</xsl:choose>
   		</xsl:variable> 
   		  
 		<xsl:value-of select="concat('public static class ',$tableName,' extends ',$chartType,'{')"/>
	 		<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
				<xsl:choose>
				<xsl:when test="chart_type = 'pie' or chart_type='semipie' or chart_type='funnel'">
					<xsl:value-of select="concat('public ',$tableName,'(String eixoX, Object eixoY) {')"/>
			 		<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab3"/>
					<xsl:value-of select="'super(eixoX, eixoY);'"/>					
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat('public ',$tableName,'(String eixoX, String eixoY, Object eixoZ) {')"/>
			 		<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab3"/>
					<xsl:value-of select="'super(eixoX, eixoY,eixoZ);'"/>
				</xsl:otherwise>
			</xsl:choose>
		  <xsl:value-of select="$newline"/>
		  <xsl:value-of select="$tab2"/>
		  <xsl:value-of select="'}'"/>
		  
		  <xsl:value-of select="$newline"/>
		  <xsl:value-of select="$tab2"/>
		  
			<xsl:value-of select="concat('public ',$tableName,'() {')"/>
 			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'}'"/>
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="'}'"/>
 	</xsl:template>
 	
 	<!-- Gen attributes for subclass for separatorList and formlist-->
 	<xsl:template name="gen-ttributes-subclass-separatorList">
 		<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>
			<xsl:variable name="tableName">
    			<xsl:call-template name="gen-className">
    				<xsl:with-param name="className"><xsl:value-of select="name()"/> </xsl:with-param> 
    			</xsl:call-template> 
    		</xsl:variable>  
 		<xsl:value-of select="concat('public static class ',$tableName,'{')"/>
 		
 		<xsl:value-of select="$newline"/>
 			<xsl:value-of select="$tab2"/>
		<xsl:value-of select="concat('private Pair ',name(), '_id',';')"/>
 		
 		
 		<xsl:for-each select="fields/*">
 			<xsl:call-template name="validation-field">
    			<xsl:with-param name="prefix" select="'Pair'"/>
    			<xsl:with-param name="tabValidation" select="$tab2"/>
    		</xsl:call-template>
 			<xsl:variable name="tag_name">
				<xsl:value-of select="name()"/>
		 	</xsl:variable> 			
 			<xsl:value-of select="concat('private Pair ',$tag_name,';')"/> 	
 			
			<xsl:if test="@type = 'checkbox' or @type='radio'">				
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private Pair ',$tag_name,'_check;')"/>
			</xsl:if>
 		</xsl:for-each> 
 		
 		<xsl:call-template name="gen-method-set-get">
	   		<xsl:with-param name="type_content" select="'Pair'" />
	   		<xsl:with-param name="type" select="'Pair'" />
	   		<xsl:with-param name="name" select="concat(name(), '_id')" />
	   		<xsl:with-param name="tab_" select="$tab2" />
	   		<xsl:with-param name="tab2_" select="concat($tab,$tab2)" />
	    </xsl:call-template>
 				
 		<xsl:for-each select="fields/*">
 			<xsl:variable name="tag_name">
				<xsl:value-of select="name()"/>
		 	</xsl:variable>
		 	<xsl:call-template name="gen-method-set-get">
	    		<xsl:with-param name="type_content" select="'Pair'" />
	    		<xsl:with-param name="type" select="'Pair'" />
	    		<xsl:with-param name="name" select="$tag_name" />
	    		<xsl:with-param name="tab_" select="$tab2" />
	    		<xsl:with-param name="tab2_" select="concat($tab,$tab2)" />
	    	</xsl:call-template>	
 			
			
			<xsl:if test="@type = 'checkbox' or @type='radio'">				
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
	 			<xsl:call-template name="gen-method-set-get">
		    		<xsl:with-param name="type_content" select="'Pair'" />
		    		<xsl:with-param name="type" select="'Pair'" />
		    		<xsl:with-param name="name" select="concat($tag_name,'_check')" />
		    		<xsl:with-param name="tab_" select="$tab2" />
		    		<xsl:with-param name="tab2_" select="concat($tab,$tab2)" />
		    	</xsl:call-template>
			</xsl:if>
			<xsl:value-of select="$newline"/>
		</xsl:for-each>
		
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="'}'"/> 	
 	</xsl:template>

 	
 	<!-- Gen subclass -->
 	<xsl:template name="gen-subclass">
 		<xsl:for-each select="/rows/content/*[@xml-type='table' or @type='carousel']">
 			<xsl:call-template name="gen-ttributes-subclass"></xsl:call-template>
 		</xsl:for-each> 
 		<xsl:for-each select="/rows/content/*[@type='chart']">
 			<xsl:call-template name="gen-chart-subclass"></xsl:call-template>
 		</xsl:for-each> 		
 		<xsl:for-each select="/rows/content/*[@type='separatorlist']">
 			<xsl:call-template name="gen-ttributes-subclass-separatorList"></xsl:call-template>
 		</xsl:for-each> 		
 		<xsl:for-each select="/rows/content/*[@type='formlist']">
 			<xsl:call-template name="gen-ttributes-subclass-separatorList"></xsl:call-template>
 		</xsl:for-each>		
 	</xsl:template>
</xsl:stylesheet>