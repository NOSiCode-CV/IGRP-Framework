<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>

     <xsl:variable name="tab">
        <xsl:text>&#x9;</xsl:text>
    </xsl:variable>    
    <xsl:variable name="tab2">
        <xsl:text>&#x9;&#x9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab3">
        <xsl:text>&#x9;&#x9;&#x9;</xsl:text>
    </xsl:variable>
    <xsl:variable name="tab4">
        <xsl:text>&#x9;&#x9;&#x9;&#x9;</xsl:text>
    </xsl:variable>    
    <xsl:variable name="newline">
        <xsl:text>&#x0A;</xsl:text>
    </xsl:variable>
    <xsl:variable name="double_quotes">"</xsl:variable>
    <xsl:variable name="import_config">import nosi.core.config.Config;</xsl:variable>
    <xsl:variable name="import_components">import nosi.core.gui.components.*;</xsl:variable>
    <xsl:variable name="import_fields">import nosi.core.gui.fields.*;</xsl:variable>
    <xsl:variable name="import_view">import nosi.core.webapp.View;</xsl:variable>
    <xsl:variable name="import_model">import nosi.core.webapp.Model;</xsl:variable>
    <xsl:variable name="import_array_list">import java.util.ArrayList;</xsl:variable>
    <xsl:variable name="import_list">import java.util.List;</xsl:variable>
    <xsl:variable name="import_separator_list">import nosi.core.gui.components.IGRPSeparatorList.Pair;</xsl:variable>
    <xsl:variable name="import_separator_list_annotation">import nosi.core.webapp.SeparatorList;</xsl:variable>
    <xsl:variable name="import_controller">import nosi.core.webapp.Controller;</xsl:variable>
    <xsl:variable name="import_exception">import java.io.IOException;</xsl:variable>
    <xsl:variable name="import_response">import nosi.core.webapp.Response;</xsl:variable>
    <xsl:variable name="import_annotations">import nosi.core.webapp.RParam;</xsl:variable>
    <xsl:variable name="base_import">import nosi.webapps.</xsl:variable>   
    <xsl:variable name="preserve_url" select="rows/plsql/preserve_url"/>
    <xsl:variable name="begin_reserve_code_controller_actions" select="'/*---- Insert your actions here... ----*/'"/>
    <xsl:variable name="begin_reserve_code_controller_import" select="'/*---- Import your packages here... ----*/'"/>
    <xsl:variable name="begin_reserve_code_controller_on_action" select="'/*---- Insert your code here... ----*/'"/>
    <xsl:variable name="end_reserve_code" select="'/*---- End ----*/'"/>
    <xsl:variable name="app_name"><xsl:value-of select="rows/app"/></xsl:variable>
    <xsl:variable name="page_name"><xsl:value-of select="rows/page"/></xsl:variable>
    
    <xsl:variable name="class_name">
		<xsl:value-of select="rows/plsql/package_html"></xsl:value-of>
    </xsl:variable>
    <xsl:variable name="page">
    	<xsl:call-template name="lowerCase">
    		<xsl:with-param name="text">
    			<xsl:value-of select="rows/plsql/package_html"></xsl:value-of>
    		</xsl:with-param>
    	</xsl:call-template>
    </xsl:variable>
    <xsl:variable name="app">
    	<xsl:call-template name="lowerCase">
    		<xsl:with-param name="text">
    			<xsl:value-of select="rows/app"></xsl:value-of>
    		</xsl:with-param>
    	</xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="package_name">
		<xsl:value-of select="concat(rows/plsql/package_db,'.',$page,';')"></xsl:value-of>
    </xsl:variable>
    
    <xsl:variable name="package_import_name">
		<xsl:value-of select="concat('import ',rows/plsql/package_db)"/>
	</xsl:variable>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" /> 
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" /> 
   
    <xsl:template name="CamelCaseWord">
      <xsl:param name="text"/>
      <xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      <xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
    </xsl:template>
 
    <xsl:template name="upperCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $smallcase, $uppercase)"/>
    </xsl:template>
    
    <xsl:template name="lowerCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $uppercase, $smallcase)"/>
    </xsl:template>  
    
    <!-- get class name instance -->
	<xsl:template name="typeClass">
    	<xsl:param name="type"/>    	
    	<xsl:choose>
    		<xsl:when test="$type='form'">
    			<xsl:value-of select="'IGRPForm'" />
    		</xsl:when>
    		<xsl:when test="$type='table'">
    			<xsl:value-of select="'IGRPTable'" />
    		</xsl:when>
    		<xsl:when test="$type='formlist'">
    			<xsl:value-of select="'IGRPFormList'" />
    		</xsl:when>
    		<xsl:when test="$type='box'">
    			<xsl:value-of select="'IGRPBox'" />
    		</xsl:when>
    		<xsl:when test="$type='chart'">
    			<xsl:value-of select="'IGRPChart'" />
    		</xsl:when>
    		<xsl:when test="$type='circlestatbox'">
    			<xsl:value-of select="'IGRPCircleStatBox'" />
    		</xsl:when>
    		<xsl:when test="$type='filter'">
    			<xsl:value-of select="'IGRPFilter'" />
    		</xsl:when>
    		<xsl:when test="$type='fingerprint'">
    			<xsl:value-of select="'IGRPFingerPrint'" />
    		</xsl:when>
    		<xsl:when test="$type='paragraph'">
    			<xsl:value-of select="'IGRPParagraph'" />
    		</xsl:when>
    		<xsl:when test="$type='quickbuttonbox'">
    			<xsl:value-of select="'IGRPQuickButtonBox'" />
    		</xsl:when>
    		<xsl:when test="$type='sectionheader'">
    			<xsl:value-of select="'IGRPSectionHeader'" />
    		</xsl:when>
    		<xsl:when test="$type='separatorlist'">
    			<xsl:value-of select="'IGRPSeparatorList'" />
    		</xsl:when>
    		<xsl:when test="$type='smallbox'">
    			<xsl:value-of select="'IGRPSmallBox'" />
    		</xsl:when>
    		<xsl:when test="$type='statbox'">
    			<xsl:value-of select="'IGRPStartBox'" />
    		</xsl:when>
    		<xsl:when test="$type='tabcontent'">
    			<xsl:value-of select="'IGRPTabContent'" />
    		</xsl:when>
    		<xsl:when test="$type='view'">
    			<xsl:value-of select="'IGRPView'" />
    		</xsl:when>    		
    		<xsl:when test="$type='mapchart'">
    			<xsl:value-of select="'IGRPMapChart'" />
    		</xsl:when>  		
    		<xsl:when test="$type='map'">
    			<xsl:value-of select="'IGRPMapEsri'" />
    		</xsl:when>  		
    		<xsl:when test="$type='iframe'">
    			<xsl:value-of select="'IGRPIframe'" />
    		</xsl:when>		
    		<xsl:when test="$type='video'">
    			<xsl:value-of select="'IGRPVideo'" />
    		</xsl:when>
    		<xsl:when test="$type='toolsbar'">
    			<xsl:value-of select="'IGRPToolsBar'" />
    		</xsl:when>
    		<xsl:when test="$type='verticalmenu'">
    			<xsl:value-of select="'IGRPVerticalMenu'" />
    		</xsl:when>
    		<xsl:when test="$type='button'">
    			<xsl:value-of select="'IGRPButton'" />
    		</xsl:when>
    		<xsl:when test="$type='calendar'">
    			<xsl:value-of select="'IGRPCalendar'" />
    		</xsl:when>
    		<xsl:when test="$type='carousel'">
    			<xsl:value-of select="'IGRPCarousel'" />
    		</xsl:when>
    		<xsl:when test="$type='panels'">
    			<xsl:value-of select="'IGRPPanel'" />
    		</xsl:when>
    		<xsl:when test="$type='treemenu'">
    			<xsl:value-of select="'IGRPTreeMenu'" />
    		</xsl:when>
    		<xsl:otherwise />   
    	</xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>