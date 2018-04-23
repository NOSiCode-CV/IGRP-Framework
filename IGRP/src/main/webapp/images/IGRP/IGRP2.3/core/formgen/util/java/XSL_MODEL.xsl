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
    	<xsl:for-each select="/rows/content/*[@type != 'treemenu'  and @type != 'table' and @type != 'formlist']">
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
					<xsl:call-template name="gen-method-set-get">
			    		<xsl:with-param name="type" select="@type" />
			    		<xsl:with-param name="name" select="$tag_name" />
			    		<xsl:with-param name="javaType" select="@java-type"/>
			    	</xsl:call-template>
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
    	<xsl:for-each select="/rows/content/*[@type != 'treemenu' and @type != 'table' and @type != 'formlist']">
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
					<xsl:variable name="type_field">
						<xsl:call-template name="get-variable-type-java">
				    		<xsl:with-param name="type" select="@type" />
				    		<xsl:with-param name="javaType" select="@java-type" />
				    	</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="concat('@RParam(rParamName = ',$double_quotes,@name,$double_quotes,')')"/>			
					<xsl:value-of select="$newline"/>			
					<xsl:value-of select="$tab"/>
					<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,';')"/>				
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
				</xsl:if>
			</xsl:for-each>
    	</xsl:for-each> 

    	<xsl:for-each select="/rows/content/*[@type = 'treemenu' or @type = 'table' or @type = 'formlist' or @type = 'separatorlist']">
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
			</xsl:if>
			<xsl:value-of select="concat('private List&lt;',$tableName,'&gt; ',name(),' = new ArrayList&lt;&gt;();')"/>
			<xsl:call-template name="gen-method-set-get">
	    		<xsl:with-param name="type_content" select="../../@type" />
	    		<xsl:with-param name="type" select="'arraylist'" />
	    		<xsl:with-param name="name" select="name()" />
	    	</xsl:call-template>
			<xsl:value-of select="$newline"/>	
			
    	</xsl:for-each>  
    	
    	
	</xsl:template>

 	<!-- import all class to using in model -->
 	<xsl:template name="import-packages-model">
 		<xsl:value-of select="concat('package ',$package_name)"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_config"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_model"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_annotations"/>
 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_query_helper"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_separator_list"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_separator_list_annotation"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_date"/>
 		
		<xsl:value-of select="$newline"/>
		<xsl:if test="count(/rows/content/*[@type = 'treemenu' or @type = 'table' or @type = 'formlist' or @type = 'separatorlist']) > 0">
	 		<xsl:value-of select="$import_array_list"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$import_list"/>
			<xsl:value-of select="$newline"/>
		</xsl:if>
 	</xsl:template>


 	<!-- Join all template to create a class model -->
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
			
			<xsl:for-each select="//rows/content/*[@xml-type='table' or @type='formlist' or @type='separatorlist']">
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
 	
 	<!-- Gen attributes for subclass -->
 	<xsl:template name="gen-ttributes-subclass">
 		<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab"/>
			<xsl:variable name="tableName">
    			<xsl:call-template name="gen-className">
    				<xsl:with-param name="className"><xsl:value-of select="name()"/> </xsl:with-param> 
    			</xsl:call-template> 
    		</xsl:variable>  
 		<xsl:value-of select="concat('public static class ',$tableName,'{')"/>
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
		    	</xsl:call-template>
			</xsl:variable>
 			<xsl:value-of select="$newline"/>
 			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,';')"/>
			<xsl:if test="@type = 'checkbox' or @type='radio'">				
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_check;')"/>
			</xsl:if>			
			<xsl:if test="@type = 'link'">				
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private ',$type_field,' ',$tag_name,'_desc;')"/>
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
	    	</xsl:call-template>
			<xsl:value-of select="$newline"/>
		</xsl:for-each>
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
 		<xsl:for-each select="fields/*">
 			<xsl:variable name="tag_name">
				<xsl:value-of select="name()"/>
		 	</xsl:variable>
 			<xsl:value-of select="$newline"/>
 			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="concat('private Pair ',$tag_name,';')"/>
			<xsl:if test="@type = 'checkbox' or @type='radio'">				
	 			<xsl:value-of select="$newline"/>
	 			<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat('private Pair ',$tag_name,'_check;')"/>
			</xsl:if>
 		</xsl:for-each> 		
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
 		<xsl:for-each select="/rows/content/*[@type='table']">
 			<xsl:call-template name="gen-ttributes-subclass"></xsl:call-template>
 		</xsl:for-each> 
 		<xsl:for-each select="/rows/content/*[@type='treemenu']">
 			<xsl:call-template name="gen-ttributes-subclass"></xsl:call-template>
 		</xsl:for-each> 		
 		<xsl:for-each select="/rows/content/*[@type='separatorlist']">
 			<xsl:call-template name="gen-ttributes-subclass-separatorList"></xsl:call-template>
 		</xsl:for-each> 		
 		<xsl:for-each select="/rows/content/*[@type='formlist']">
 			<xsl:call-template name="gen-ttributes-subclass-separatorList"></xsl:call-template>
 		</xsl:for-each>		
 	</xsl:template>
</xsl:stylesheet>