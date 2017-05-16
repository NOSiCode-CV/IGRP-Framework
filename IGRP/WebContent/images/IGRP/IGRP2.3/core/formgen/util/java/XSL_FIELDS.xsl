<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="no" />
     <xsl:preserve-space elements="*"/>

	
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
        <xsl:for-each select="//fields/*">
            <xsl:if test="not(@name=preceding::node()/@name)">
				<xsl:choose>
					<xsl:when test="$type='declare'">
						<xsl:value-of select="$tab"/>
						<xsl:choose>
							<xsl:when test="@type='hidden'">
								<xsl:value-of select="concat('public Field ',@name,';')"/>
							</xsl:when>
							<xsl:when test="@type='checkbox' or @type='radio'">
								<xsl:value-of select="concat('public Field ',name(),';')"/>
								<xsl:value-of select="$newline"/>
								<xsl:value-of select="$tab"/>
								<xsl:value-of select="concat('public Field ',name(),'_check',';')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('public Field ',name(),';')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$type='instance'">
						<xsl:value-of select="$tab2"/>
						<xsl:variable name="tag_name">
							<xsl:choose>
								<xsl:when test="@type='hidden'">
									<xsl:value-of select="@name"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name()"/>
								</xsl:otherwise>
							</xsl:choose>
					 	</xsl:variable>
						
						<xsl:value-of select="concat($tag_name,' = new ')"/>
						<xsl:call-template name="typeFieldClass">
				    		<xsl:with-param name="type" select="@type" />
				    	</xsl:call-template>
						<xsl:value-of select="concat('(','model',',',$double_quotes,$tag_name,$double_quotes,');')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($tag_name,'.setLabel(',$double_quotes,./label,$double_quotes,');')"/>
						<xsl:variable name="container_type">
					 		<xsl:value-of select="../../@type"/>
					 	</xsl:variable>
					 	<xsl:if test="$container_type='sectionheader' or $container_type='paragraph'  or $container_type='video'  or $container_type='iframe'">
							<xsl:value-of select="$newline"/>
							<xsl:value-of select="$tab2"/>
							<xsl:value-of select="concat($tag_name,'.setValue(',$double_quotes,normalize-space(./value),$double_quotes,');')"/>
						</xsl:if>
						<xsl:variable name="_tag">
							<xsl:value-of select="$tag_name"/>
						</xsl:variable>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>

						<!-- 
							add recursive properies
							date_1.propertie().add("name","p_date_1").add("type","date");
						-->
						<xsl:value-of select="concat($tag_name,'.propertie()')"/>
						<xsl:for-each select="@*">
							<xsl:value-of select="concat('.add(',$double_quotes,name(),$double_quotes,',',$double_quotes,.,$double_quotes,')')"/>
		    			</xsl:for-each>
						<xsl:value-of select="';'"/>
						
						
				 		<xsl:if test="$container_type='table' and (@type='checkbox' or @type='radio')">
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
								<xsl:value-of select="concat('.add(',$double_quotes,name(),$double_quotes,',',$double_quotes,.,$double_quotes,')')"/>
			    			</xsl:for-each>
							<xsl:value-of select="';'"/>
					 	</xsl:if>
					 	
					</xsl:when>
				</xsl:choose>				
				<xsl:value-of select="$newline"/>
			</xsl:if>
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
	    		<xsl:when test="$type='lookup'">
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

    <!-- get type field -->
	<xsl:template name="typeField">
    	<xsl:param name="type"/>    	
	    	<xsl:choose>
	    		<xsl:when test="$type='number'">
	    			<xsl:value-of select="'float'" />
	    		</xsl:when>
	    		<xsl:when test="$type='checkbox' or $type='radio'">
	    			<xsl:value-of select="'int'" />
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:value-of select="'String'" />
	    		</xsl:otherwise>	
	    	</xsl:choose>    	
    </xsl:template> 

    <!-- gen get and set field -->
	<xsl:template name="getSetField">
    	<xsl:param name="type"/> 
    	<xsl:param name="type_content" select="''"/>     
    	<xsl:param name="name"/>   
    	<xsl:param name="tab_" select="$tab"/>   
    	<xsl:param name="tab2_" select="$tab2"/>   
    		<xsl:variable name="name_">
    			<xsl:call-template name="CamelCaseWord">
			        <xsl:with-param name="text">
			        	<xsl:value-of select="$name"/>
			        </xsl:with-param>
		        </xsl:call-template>
    		</xsl:variable> 	
	    	<xsl:choose>
	    		<xsl:when test="$type='number'">
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public void set',$name_,'(float ',$name,'){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('this.',$name,' = ',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>

	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public float get',$name_,'(){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('return this.',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>
	    		</xsl:when>
	    		<xsl:when test="$type='checkbox' or $type='radio'">
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public void set',$name_,'(int ',$name,'){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('this.',$name,' = ',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>

	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public int get',$name_,'(){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('return this.',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>
	    			
	    			<xsl:if test="$type_content='table'">
	    				<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="$tab_"/>
		    			<xsl:value-of select="concat('public void set',$name_,'_check(int ',$name,'_check){')" />
		    			<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="$tab2_"/>
		    			<xsl:value-of select="concat('this.',$name,'_check = ',$name,'_check;')"/>
		    			<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="$tab_"/>
		    			<xsl:value-of select="'}'"/>
	
		    			<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="$tab_"/>
		    			<xsl:value-of select="concat('public int get',$name_,'_check(){')" />
		    			<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="$tab2_"/>
		    			<xsl:value-of select="concat('return this.',$name,'_check;')"/>
		    			<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="$tab_"/>
		    			<xsl:value-of select="'}'"/>
	    			</xsl:if>
	    		</xsl:when>
	    		
	    		<xsl:when test="$type='arraylist'">
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public void set',$name_,'(ArrayList&lt;',$name_,'&gt; ',$name,'){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('this.',$name,' = ',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>

	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public ArrayList&lt;',$name_,'&gt; get',$name,'(){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('return this.',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public void set',$name_,'(String ',$name,'){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('this.',$name,' = ',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>

	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="concat('public String get',$name_,'(){')" />
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab2_"/>
	    			<xsl:value-of select="concat('return this.',$name,';')"/>
	    			<xsl:value-of select="$newline"/>
	    			<xsl:value-of select="$tab_"/>
	    			<xsl:value-of select="'}'"/>
	    		</xsl:otherwise>	
	    		
	    	</xsl:choose>    	
    </xsl:template>      
</xsl:stylesheet>