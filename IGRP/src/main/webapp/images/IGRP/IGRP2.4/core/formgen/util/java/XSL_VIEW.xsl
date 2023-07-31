<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>

    <!-- Join all templates to create view -->
    <xsl:template name="create-view">
     	<xsl:call-template name="import-packages-view"></xsl:call-template>
     	<xsl:value-of select="$newline"/>
 		<xsl:value-of select="concat('public class ',$class_name,'View extends View {')"/> 			
	 		<xsl:value-of select="$newline"/>
 	     	<xsl:value-of select="$newline"/> 
	     	<xsl:call-template name="declare-variables-view"/>
	     	<xsl:value-of select="$newline"/>
	 		<xsl:call-template name="create-construct"/>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:call-template name="render"/>
	 		<xsl:value-of select="$newline"/>
	 		<xsl:value-of select="$tab2"/>
	 		<xsl:call-template name="set-model"/>
	 		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="'}'"/> 	
 		
    </xsl:template>


	<!-- Set Model -->
	<xsl:template name="set-model">
		
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>@Override</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="'public void setModel(Model model) {'"/>
 		
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$tab2"/>
			<xsl:call-template name="set-model-fields"/>
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$newline"/>	
		<xsl:value-of select="$newline"/>			
		<xsl:value-of select="$tab2"/>	
		<xsl:for-each select="//rows/content/*[@xml-type='chart' or @xml-type='table' or @xml-type='formlist' or @xml-type='separatorlist' or @xml-type='timeline' or @xml-type='carousel']">			
			<xsl:variable name="upperTag">
				<xsl:call-template name="gen-className">
						<xsl:with-param name="className" select="name()"/>
					</xsl:call-template>
			</xsl:variable>	
					
			<xsl:value-of select="concat(name(),'.loadModel(((',$class_name,') model).get',$upperTag,'());')"/>			
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>				
		</xsl:for-each>
		
		
		
 		<xsl:text>}</xsl:text>
 		
	</xsl:template>
    
    <xsl:template name="set-model-fields">    	
    	<xsl:call-template name="gen-field-view">
			<xsl:with-param name="type"><xsl:value-of select="'set-model'" /></xsl:with-param>
		</xsl:call-template>
    </xsl:template>
    
    
    <!-- import all class to using in view -->
 	<xsl:template name="import-packages-view">
 		<xsl:value-of select="concat('package ',$package_name)"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$import_model"/> 	
 		<xsl:value-of select="$import_view"/>
 		<xsl:value-of select="$import_components"/>	
 		<xsl:value-of select="$import_fields"/>		
 		<xsl:value-of select="$import_date"/>	
		<xsl:value-of select="$import_config_view"/>	
		<xsl:value-of select="$import_Map"/>		
		<xsl:value-of select="$import_HashMap"/>		
		
 	</xsl:template>
 	
 	
	<!--  create construct view class 
	
		this.setPageTitle("Gestao de Acesso");
	ex:	sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		org_table = new IGRPTable("org_table","Organizações");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Acesso"));	
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
	-->
	<xsl:template name="create-construct">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="concat('public ', $class_name,'View(){')"></xsl:value-of>	
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$newline"/>	
	     	<xsl:value-of select="$tab2"/>
	     	<xsl:value-of select="concat('this.setPageTitle(',$double_quotes,/rows/content/title,$double_quotes,');')"/>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>	     	
			<xsl:call-template name="instance-components-view"></xsl:call-template>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$tab2"></xsl:value-of>
		

		<xsl:call-template name="config-chart"></xsl:call-template>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$tab"></xsl:value-of>
		<!-- 
		<xsl:call-template name="config-calendar"></xsl:call-template>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$tab"></xsl:value-of>
		-->
		<xsl:value-of select="'}'"></xsl:value-of>
	</xsl:template>
	
 	<!-- create render method 
	@Override
	public void render(){
		TesteModel model = new TesteModel();
	}
 	-->
 	<xsl:template name="render">
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>@Override</xsl:text>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$tab"/>
 		<xsl:text>public void render(){</xsl:text>
		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$tab2"/>
			<xsl:call-template name="add-fields"></xsl:call-template>
			<xsl:call-template name="add-to-page"></xsl:call-template>
		<xsl:value-of select="$tab"/>
 		<xsl:text>}</xsl:text>
 	</xsl:template>

 	<!-- add fields in container: form_1.addField(text_1); -->
 	<xsl:template name="add-fields">
 		<xsl:for-each select="//content/*">
		 	<xsl:variable name="instance_name">
		 		<xsl:value-of select="local-name()"/>
		 	</xsl:variable>		
		 	<xsl:variable name="type_content">
		 		<xsl:value-of select="@type"/>
		 	</xsl:variable>	 
		 	<xsl:for-each select="fields/*">
				<xsl:value-of select="$tab2"/>
				<xsl:choose>
					<xsl:when test="@type='hidden'">
						<xsl:value-of select="concat($instance_name,'.addField(',@tag,');')"/>
					</xsl:when>
					<xsl:when test="(@type='checkbox' or @type='radio') and ($type_content='table' or $type_content='workflow' or $type_content='formlist' or $type_content='separatorlist')">
						<xsl:value-of select="concat($instance_name,'.addField(',name(),');')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($instance_name,'.addField(',name(),'_check);')"/>
					</xsl:when>
					<xsl:when test="@type='link' and @desc='true'">
						<xsl:value-of select="concat($instance_name,'.addField(',name(),');')"/>
						<xsl:value-of select="$newline"/>
						<xsl:value-of select="$tab2"/>
						<xsl:value-of select="concat($instance_name,'.addField(',name(),'_desc);')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($instance_name,'.addField(',name(),');')"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="$newline"/>
		 	</xsl:for-each>
		 		
		 	<xsl:if test="table/legend_color/item">
		 		<xsl:value-of select="$tab2"/>
		 		<xsl:value-of select="concat('/* start ',name(),' legend colors*/')"/>
		 		<xsl:value-of select="$newline"/>
		 		
		 		<xsl:value-of select="$tab2"/>
		 		<xsl:variable name="tbColorsName" select="concat(name(),'_colors')"/>
		 		<xsl:variable name="tbName" select="name()"/>
		 		<xsl:variable name="mapDeclaration">
		 			<xsl:text>Map</xsl:text><xsl:value-of select="$lt"/>
		 			<xsl:text>Object, Map</xsl:text><xsl:value-of select="$lt"/>
		 			<xsl:text>String, String</xsl:text><xsl:value-of select="$gt"/><xsl:value-of select="$gt"/>
		 			<xsl:value-of select="concat(' ',$tbColorsName)"/>
		 			<xsl:text>= new LinkedHashMap</xsl:text><xsl:value-of select="$lt"/><xsl:value-of select="$gt"/><xsl:text>();</xsl:text>
		 		</xsl:variable>
		 		
		 		<xsl:value-of select="$mapDeclaration"/>
		 		
		 		<xsl:for-each select="table/legend_color/item">
		 			<xsl:variable name="color_name" select="concat('color_',substring-after(color,'#'),'_',$tbName)"></xsl:variable>
		 			<xsl:variable name="color_desc">
			 			<xsl:text>Map</xsl:text><xsl:value-of select="$lt"/>
			 			<xsl:text>String, String</xsl:text>
			 			<xsl:value-of select="$gt"/>
			 			<xsl:value-of select="concat(' ',$color_name)"/>
			 			<xsl:text> = new LinkedHashMap</xsl:text><xsl:value-of select="$lt"/><xsl:value-of select="$gt"/><xsl:text>();</xsl:text>
			 		</xsl:variable>
			 		
			 		<xsl:value-of select="$newline"/>
		 			<xsl:value-of select="$tab2"/>
			 		
			 		<xsl:value-of select="$color_desc"/>
			 		
			 		<xsl:value-of select="$newline"/>
		 			<xsl:value-of select="$tab2"/>
		 			
		 			<xsl:value-of select="concat($color_name,'.put(',$double_quotes,color,$double_quotes,',',$double_quotes,label,$double_quotes,');')"/>
		 			<xsl:value-of select="$newline"/>
		 			<xsl:value-of select="$tab2"/>
		 			
		 			<xsl:value-of select="concat($tbColorsName,'.put(',$double_quotes,value,$double_quotes,',',$color_name,');')"/>
		 			
<!-- 		 			Map<String, String> cor = new HashMap(); -->
				
<!-- 					cor.add("#fff","Text"); -->
				
<!-- 					colors.add("1",cor) -->
		 		</xsl:for-each>
		 		<!-- Map<Object, Map<String, String>> colors = new HashMap<>();

				
				
				view.table.setLegendColor( colors ); -->
		 		
		 		<xsl:value-of select="$newline"/>
		 		<xsl:value-of select="$tab2"/>
		 		
		 		<xsl:value-of select="concat('this.',name(),'.setLegendColors(',name(),'_colors);')"/>
		 		
		 		<xsl:value-of select="$newline"/>
		 		<xsl:value-of select="$tab2"/>
		 		
		 		<xsl:value-of select="concat('/* end ',name(),' legend colors*/')"/>
		 		
		 	</xsl:if>
		 	
			<xsl:value-of select="$newline"/>
 		</xsl:for-each>
 	</xsl:template>

 	<!-- 
 		Add containers to page
		this.addToPage(form_1);
		this.addToPage(form_2);
		this.addToPage(table_1);
		...
	-->
 	<xsl:template name="add-to-page">
 		<xsl:call-template name="add-button-to-container"></xsl:call-template>
 		<xsl:for-each select="//content/*[@type!='toolsbar' and @type!='verticalmenu' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]">
 		
		 	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
 			<xsl:call-template name="gen-instance-components">
				<xsl:with-param name="type_content"><xsl:value-of select="@xml-type" /></xsl:with-param>
				<xsl:with-param name="type"><xsl:value-of select="'add-to-page'" /></xsl:with-param>
				<xsl:with-param name="instance_name"><xsl:value-of select="$instance_name"/> </xsl:with-param>				
			</xsl:call-template>
 		</xsl:for-each>
 		<xsl:for-each select="//content/*[@type='toolsbar' or @type='verticalmenu']"> 	
 			<xsl:if test="local-name() != 'tools-bar' and local-name() != 'verticalmenu'  and (generate-id() = generate-id(key('unique_instance', local-name())[1]))">
			 	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
	 			<xsl:call-template name="gen-instance-components">
					<xsl:with-param name="type_content"><xsl:value-of select="@xml-type" /></xsl:with-param>
					<xsl:with-param name="type"><xsl:value-of select="'add-to-page'" /></xsl:with-param>
					<xsl:with-param name="instance_name"><xsl:value-of select="$instance_name"/> </xsl:with-param>				
				</xsl:call-template>
			</xsl:if>	
 		</xsl:for-each>
 	</xsl:template>

 	  <!--
		Declare and create instances components,
			
	 	....
	-->
	<xsl:template name="gen-instance-components">
		<xsl:param name="type_content" /> 
		<xsl:param name="type" /> 
		<xsl:param name="instance_name" /> 
		<xsl:param name="title_" select="''" /> 
		
 		<xsl:value-of select="$tab"/> 
	 	<xsl:variable name="className">
	 		<xsl:call-template name="typeClass">
	 			<xsl:with-param name="type">                
	 				<xsl:value-of select="$type_content"/>
	 			</xsl:with-param>
	 		</xsl:call-template>
	 	</xsl:variable>
	 	<xsl:choose>
	 		<xsl:when test="$type='instance'">
				<xsl:value-of select="$tab"/>
	 			<xsl:value-of select="concat($instance_name,' = new ',$className,'(',$double_quotes,$instance_name,$double_quotes,',',$double_quotes,$title_,$double_quotes,');')"/>
	 		</xsl:when>
	 		<xsl:when test="$type='declare'">
	 			<xsl:value-of select="concat('public ',$className,' ',$instance_name,';')"/>
	 		</xsl:when>
	 		<xsl:when test="$type='add-to-page'">
	 			<xsl:value-of select="$tab"/>
	 			<xsl:value-of select="concat('this.addToPage(',$instance_name,');')"/>
	 		</xsl:when>
	 	</xsl:choose>
	 	<xsl:value-of select="$newline"/>	 
		
	</xsl:template>

	<!-- declare variables in the class view 
	Ex: 
		public Field sectionheader_1_text;
		public Field nome;
		public IGRPButton btn_editar;
		public IGRPButton btn_menu;
	-->
 	<xsl:template name="declare-variables-view">
<!-- 		<xsl:value-of select="$tab"/> -->
	
 		<xsl:call-template name="gen-field-view">
			<xsl:with-param name="type"><xsl:value-of select="'declare'" /></xsl:with-param>
		</xsl:call-template>
		<xsl:for-each select="//content/*[@type!='toolsbar' and @type!='verticalmenu' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]">
		 	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
		 	
		 	
		 	<xsl:choose>			
			  <xsl:when test="@type='circlestatbox' or @type='smallbox' or @type='statbox'
			   or @type='quickbuttonbox' or @type='infopanel'  or @type='timeline' or @type='treemenu'
			    or @type='sectionheader' or @type='box' or @type='tabcontent' or @type='panels'  or @type='paragraph'">			  
			  	<xsl:call-template name="gen-instance-components">
					<xsl:with-param name="type_content"><xsl:value-of select="@type" /></xsl:with-param>
					<xsl:with-param name="type"><xsl:value-of select="'declare'" /></xsl:with-param>
					<xsl:with-param name="instance_name"><xsl:value-of select="$instance_name"/> </xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="@title"/> </xsl:with-param>
				</xsl:call-template>			  	
			  </xsl:when>
			  <xsl:otherwise>			  
			  	<xsl:call-template name="gen-instance-components">
					<xsl:with-param name="type_content"><xsl:value-of select="@xml-type" /></xsl:with-param>
					<xsl:with-param name="type"><xsl:value-of select="'declare'" /></xsl:with-param>
					<xsl:with-param name="instance_name"><xsl:value-of select="$instance_name"/> </xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="@title"/> </xsl:with-param>
				</xsl:call-template>		  	
			  </xsl:otherwise>			  
			</xsl:choose>	
			  
			
 		</xsl:for-each>
 		
 		<xsl:call-template name="gen-toolsbar">
			<xsl:with-param name="type_"><xsl:value-of select="'declare'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
 		<xsl:call-template name="gen-button">
			<xsl:with-param name="type_"><xsl:value-of select="'declare'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
		<xsl:value-of select="$newline"/>	 	
 	</xsl:template>

 	<!-- instances components in the class view -->
 	<!-- declare variables in the class view -->
 	<xsl:template name="instance-components-view">
		<xsl:value-of select="$tab"/>
		<xsl:value-of select="$newline"/>		
		<xsl:for-each select="//content/*[@type!='toolsbar' and @type!='verticalmenu' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]">
		 	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>			
			<xsl:choose>			
			  <xsl:when test="@type='circlestatbox' or @type='smallbox' 
			  or @type='statbox' or @type='quickbuttonbox' or @type='infopanel' 
			  or @type='timeline' or @type='treemenu' 
			  or @type='sectionheader' or @type='box' or @type='tabcontent' or @type='panels' or @type='paragraph'">			  
			  	<xsl:call-template name="gen-instance-components">
					<xsl:with-param name="type_content"><xsl:value-of select="@type" /></xsl:with-param>
					<xsl:with-param name="type"><xsl:value-of select="'instance'" /></xsl:with-param>
					<xsl:with-param name="instance_name"><xsl:value-of select="$instance_name"/> </xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="@title"/> </xsl:with-param>
				</xsl:call-template>			  	
			  </xsl:when>
			  <xsl:otherwise>			  
			  	<xsl:call-template name="gen-instance-components">
					<xsl:with-param name="type_content"><xsl:value-of select="@xml-type" /></xsl:with-param>
					<xsl:with-param name="type"><xsl:value-of select="'instance'" /></xsl:with-param>
					<xsl:with-param name="instance_name"><xsl:value-of select="$instance_name"/> </xsl:with-param>
					<xsl:with-param name="title_"><xsl:value-of select="@title"/> </xsl:with-param>
				</xsl:call-template>		  	
			  </xsl:otherwise>			  
			 </xsl:choose>			
			
			<xsl:value-of select="$newline"/>		
 		</xsl:for-each>

		<xsl:call-template name="gen-field-view">
			<xsl:with-param name="type">
				<xsl:value-of select="'instance'" />
			</xsl:with-param>
		</xsl:call-template>
		
 		<xsl:call-template name="gen-toolsbar">
			<xsl:with-param name="type_"><xsl:value-of select="'instance'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
 		<xsl:call-template name="gen-button">
			<xsl:with-param name="type_"><xsl:value-of select="'instance'"></xsl:value-of> </xsl:with-param>	
		</xsl:call-template>
		<xsl:value-of select="$newline"/>
	</xsl:template>
	
	
	<!-- Example of config-chart generated code
	
		chart_1.setCaption("");
		chart_1.setChart_type("pie");
		chart_1.setXaxys("Eixo de X");
		chart_1.setYaxys("Eixo de Y");
		chart_1.setUrl("#");
		//ex: chart_1.addColor("#1fab32").addColor("#6cd4f4").addColor("#4aace7").addColor("#348277");	
	 -->
	
	<xsl:template name="config-chart">
		<xsl:for-each select="//content/*[@type='chart' and (generate-id() = generate-id(key('unique_instance', local-name())[1]))]">
		 	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
		 	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setCaption(',$double_quotes,./caption,$double_quotes,');')"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setChart_type(',$double_quotes,./chart_type,$double_quotes,');')"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setXaxys(',$double_quotes,./xaxys,$double_quotes,');')"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setYaxys(',$double_quotes,./yaxys,$double_quotes,');')"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setUrl(',$double_quotes,./url,$double_quotes,');')"></xsl:value-of>
		
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
			<xsl:value-of select="'//ex: '"/>
			<xsl:value-of select="$instance_name"/>
			<xsl:for-each select="colors/*">
	 			<xsl:value-of select="concat('.addColor(',$double_quotes,.,$double_quotes,')')"></xsl:value-of>
			</xsl:for-each>	
			<xsl:value-of select="';'"/>	
			<xsl:value-of select="$newline"/>
 		</xsl:for-each>
	</xsl:template>
	<!-- 
	<xsl:template name="config-calendar">
		<xsl:for-each select="//content/*[@type='calendar']">
		 	<xsl:variable name="instance_name"><xsl:value-of select="local-name()"/></xsl:variable>
		 	<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setLang(',$double_quotes,./lang,$double_quotes,');')"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 			<xsl:value-of select="concat($instance_name,'.setDataUrl(',$double_quotes,./dataUrl,$double_quotes,');')"></xsl:value-of>
			<xsl:value-of select="$newline"/>
			<xsl:value-of select="$tab2"/>
 		</xsl:for-each>
	</xsl:template>
	-->
</xsl:stylesheet>