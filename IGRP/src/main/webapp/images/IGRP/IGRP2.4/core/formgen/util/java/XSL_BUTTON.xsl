<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
	<xsl:template name="gen-button">
		<xsl:param name="type_"/>		
	 	<xsl:variable name="className">
	 		<xsl:call-template name="typeClass">
	 			<xsl:with-param name="type">                
	 				<xsl:value-of select="'button'"/>
	 			</xsl:with-param>
	 		</xsl:call-template>
	 	</xsl:variable>
		 <xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or (count(/rows/content//tools-bar) &gt; 0) or (count(/rows/content//context-menu/item) &gt; 0)">
           <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type='verticalmenu']/item">   <!-- Button in tools-bar -->

            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="gen-item">
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="class_name_"><xsl:value-of select="$className"/></xsl:with-param>
					<xsl:with-param name="type_"><xsl:value-of select="$type_"/></xsl:with-param>
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="./title"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
					<xsl:with-param name="img_"><xsl:value-of select="./img"/></xsl:with-param>
					<xsl:with-param name="params_"><xsl:value-of select="./params"/></xsl:with-param>
					<xsl:with-param name="parameter_"><xsl:value-of select="./parameter"/></xsl:with-param>
	            </xsl:call-template>
	        </xsl:if>
           </xsl:for-each>
           <xsl:for-each select="//tools-bar/item">   <!-- Button in form -->
            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="gen-item">
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="class_name_"><xsl:value-of select="$className"/></xsl:with-param>
					<xsl:with-param name="type_"><xsl:value-of select="$type_"/></xsl:with-param>
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="./title"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
					<xsl:with-param name="img_"><xsl:value-of select="./img"/></xsl:with-param>
					<xsl:with-param name="params_"><xsl:value-of select="./params"/></xsl:with-param>
					<xsl:with-param name="parameter_"><xsl:value-of select="./parameter"/></xsl:with-param>
	            </xsl:call-template>
	        </xsl:if>
           </xsl:for-each>           
           <xsl:for-each select="//context-menu/item">   <!-- Button in table -->
            <xsl:if test="not(@rel=preceding::node()/@rel)">
	          	<xsl:call-template name="gen-item">
					<xsl:with-param name="rel"><xsl:value-of select="@rel"/></xsl:with-param>
					<xsl:with-param name="code"><xsl:value-of select="@code"/></xsl:with-param>
					<xsl:with-param name="class_name_"><xsl:value-of select="$className"/></xsl:with-param>
					<xsl:with-param name="type_"><xsl:value-of select="$type_"/></xsl:with-param>
					<xsl:with-param name="page_"><xsl:value-of select="./page"/></xsl:with-param>
					<xsl:with-param name="app_"><xsl:value-of select="./app"/></xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="./title"/></xsl:with-param>
					<xsl:with-param name="target_"><xsl:value-of select="./target"/></xsl:with-param>
					<xsl:with-param name="img_"><xsl:value-of select="./img"/></xsl:with-param>
					<xsl:with-param name="params_"><xsl:value-of select="./params"/></xsl:with-param>
					<xsl:with-param name="parameter_"><xsl:value-of select="./parameter"/></xsl:with-param>
	            </xsl:call-template>
            </xsl:if>
           </xsl:for-each>
        </xsl:if>
	</xsl:template>
	
	<xsl:template name="gen-item">
		<xsl:param name="rel"/>
		<xsl:param name="code"/>
		<xsl:param name="class_name_"/>
		<xsl:param name="type_"/>
		<xsl:param name="title_"/>
		<xsl:param name="page_"/>
		<xsl:param name="app_"/>
		<xsl:param name="img_"/>
		<xsl:param name="target_"/>
		<xsl:param name="params_"/>
		<xsl:param name="parameter_"/>
		
		<xsl:variable name="button_name">
			<xsl:value-of select="'btn_'"/>
			<xsl:value-of select="$rel"/>
        	<xsl:if test="$rel =''">
				<xsl:value-of select="$code"/>
        	</xsl:if>
        </xsl:variable>
        <xsl:variable name="link">
			<xsl:value-of select="$rel"/>
        	<xsl:if test="$rel =''">
				<xsl:value-of select="$code"/>
        	</xsl:if>
        </xsl:variable>

		<xsl:choose>
			<xsl:when test="$type_='declare'">
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab"/>
				<xsl:value-of select="concat('public ',$class_name_,' ',$button_name,';')"/>
			</xsl:when>
			<xsl:when test="$type_='instance'">
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$newline"/>
				<xsl:value-of select="$tab2"/>
				<xsl:value-of select="concat($button_name,' = new ',$class_name_,'(',$double_quotes,$title_,$double_quotes,',',$double_quotes,$app,$double_quotes,',',$double_quotes,$class_name,$double_quotes,',',$double_quotes,$link,$double_quotes,',',$double_quotes,$target_,$double_quotes,',',$double_quotes,$img_,$double_quotes,',',$double_quotes,$double_quotes,',',$double_quotes,$double_quotes,');')"/>
					<xsl:value-of select="$newline"/>
					<xsl:value-of select="$tab2"/>
				 	<xsl:value-of select="concat($button_name,'.propertie')"/>
				 	<xsl:for-each select="@*">
				 		<xsl:call-template name="filterComponentsAttrs"/>
		 				<!--  <xsl:value-of select="concat('.add(',$double_quotes,name(),$double_quotes,',',$double_quotes,.,$double_quotes,')')"/> -->
				 	</xsl:for-each>
				 	<xsl:value-of select="';'"/>
				 	
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template name="gen-toolsbar">	
		<xsl:param name="type_"/>	 	
		<xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or  (count(/rows/content//tools-bar) &gt; 0)">
          <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type = 'verticalmenu']">
          	<xsl:if test="(generate-id() = generate-id(key('unique_instance', local-name())[1]))">
		         <xsl:variable name="className">
			 		<xsl:call-template name="typeClass">
			 			<xsl:with-param name="type">                
			 				<xsl:value-of select="@type"/>
			 			</xsl:with-param>
			 		</xsl:call-template>
			 	 </xsl:variable>
	          	<xsl:choose>
					<xsl:when test="$type_='declare'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab"/>
						<xsl:value-of select="concat('public ',$className,' ',local-name(),';')"/>
					</xsl:when>
					<xsl:when test="$type_='instance'">
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat(local-name(),' = new ',$className,'(',$double_quotes,local-name(),$double_quotes,');')"/>
					</xsl:when>
				</xsl:choose>
			</xsl:if>
          </xsl:for-each>
        </xsl:if>
    </xsl:template>
        
        
	<xsl:template name="add-button-to-container">	
	 	<xsl:variable name="className">
	 		<xsl:call-template name="typeClass">
	 			<xsl:with-param name="type">                
	 				<xsl:value-of select="'toolsbar'"/>
	 			</xsl:with-param>
	 		</xsl:call-template>
	 	</xsl:variable>
		 <xsl:if test="(count(/rows/content/*[@type = 'toolsbar']) &gt; 0) or (count(/rows/content/*[@type = 'verticalmenu']) &gt; 0) or (count(/rows/content//tools-bar) &gt; 0)  or (count(/rows/content//context-menu) &gt; 0)">
           <xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type = 'verticalmenu']/item"><!-- add button on toolsbar --> 
           	<xsl:if test="not(@rel=preceding::node()/@rel)">    		
			 	<xsl:variable name="toolsbar">
			 		<xsl:value-of select="local-name(parent::*)"/>
			 	</xsl:variable>
			 	<xsl:variable name="button_name">
					<xsl:value-of select="'btn_'"/>
					<xsl:value-of select="@rel"/>
		        	<xsl:if test="@rel =''">
						<xsl:value-of select="@code"/>
		        	</xsl:if>
		        </xsl:variable>
				<xsl:value-of select="$tab2"/>
           		<xsl:value-of select="concat($toolsbar,'.addButton(',$button_name,');')"/>
				<xsl:value-of select="$newline"/>
			</xsl:if>
           </xsl:for-each>
           <xsl:for-each select="/rows/content/*[@type = 'form' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]/tools-bar"><!-- add button on form -->           		
           		<xsl:variable name="form_">
			 		<xsl:value-of select="local-name(parent::*)"/>
			 	</xsl:variable>	
           		<xsl:for-each select="item"> 
	           		<xsl:if test="not(@rel=preceding::node()/@rel)">	           			          					 	
					 	<xsl:variable name="button_name">
							<xsl:value-of select="'btn_'"/>
							<xsl:value-of select="@rel"/>
				        	<xsl:if test="@rel =''">
								<xsl:value-of select="@code"/>
				        	</xsl:if>
				        </xsl:variable>
						<xsl:value-of select="$tab2"/>
		           		<xsl:value-of select="concat($form_,'.addButton(',$button_name,');')"/>
						<xsl:value-of select="$newline"/>
					</xsl:if>
				</xsl:for-each>
           </xsl:for-each>
           <xsl:for-each select="/rows/content/*[@type = 'table']/*"><!-- add button on table --> 
			 	<xsl:variable name="form_">
			 		<xsl:value-of select="local-name(parent::*)"/>
			 	</xsl:variable>
           		<xsl:for-each select="context-menu/item">         		
					 	<xsl:variable name="button_name">
							<xsl:value-of select="'btn_'"/>
							<xsl:value-of select="@rel"/>
				        	<xsl:if test="@rel =''">
								<xsl:value-of select="@code"/>
				        	</xsl:if>
				        </xsl:variable>
						<xsl:value-of select="$tab2"/>
		           		<xsl:value-of select="concat($form_,'.addButton(',$button_name,');')"/>
						<xsl:value-of select="$newline"/>
				</xsl:for-each>
           </xsl:for-each>
          </xsl:if>
        </xsl:template>
        
        <!-- import class based in button select action -->
        <xsl:template name="gen-import-class">
        	<xsl:for-each select="/rows/content/*[@type = 'toolsbar' or @type='verticalmenu' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]/item">
       			<xsl:variable name="app_">
       				<xsl:call-template name="lowerCase"><xsl:with-param name="text"><xsl:value-of select="./app"/> </xsl:with-param> </xsl:call-template>
       			</xsl:variable>
       			<xsl:variable name="page_">
       				<xsl:call-template name="lowerCase"><xsl:with-param name="text"><xsl:value-of select="./page"/> </xsl:with-param> </xsl:call-template>
       			</xsl:variable>
       			<xsl:value-of select="concat($base_import,$app_,'.',$page_,'.',./page,';')"></xsl:value-of>
				<xsl:value-of select="$newline"/>
        	</xsl:for-each>
        </xsl:template>
</xsl:stylesheet>