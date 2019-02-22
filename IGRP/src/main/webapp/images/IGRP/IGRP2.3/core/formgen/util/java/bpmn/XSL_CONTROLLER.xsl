<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    
    <xsl:template match="/">
    	<xsl:call-template name="package"/>
	    <xsl:call-template name="imports"/>
	    <xsl:call-template name="gen-class"/>
	</xsl:template>
    
    <xsl:template name="imports">
    	<xsl:text>import java.io.IOException;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import java.util.List;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import nosi.core.webapp.Response;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import javax.servlet.ServletException;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import nosi.core.webapp.Core;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import nosi.core.webapp.databse.helpers.ResultSet;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import nosi.core.webapp.databse.helpers.QueryInterface;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import nosi.webapps.igrp.dao.TipoDocumentoEtapa;</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:text>import nosi.core.webapp.bpmn.BPMNTaskController;</xsl:text>
		<xsl:choose>
			<xsl:when test="//form_key!=''">
    			<xsl:value-of select="$newline"/>
				<xsl:value-of select="concat('import nosi.webapps.',//app,'.pages.',//page,'.',//form_key,';')"/>
    			<xsl:value-of select="$newline"/>
				<xsl:value-of select="concat('import nosi.webapps.',//app,'.pages.',//page,'.',//form_key,'View;')"/>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>

		<xsl:call-template name="start-code-comment">
			<xsl:with-param name="name_" select="'packages_import'"/>
			<xsl:with-param name="tab_" select="''"/>
		</xsl:call-template>
		<xsl:value-of select="//reserve_import"/>
		<xsl:call-template name="end-code-comment">
			<xsl:with-param name="tab_" select="''"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="gen-class">
    	<xsl:value-of select="$newline"/>
    	<xsl:value-of select="$newline"/>
    	<xsl:call-template name="gen-author"/>
		<xsl:value-of select="concat('public class ',//task_key,'Controller extends BPMNTaskController {')"/>
    	<xsl:value-of select="$newline"/>
    	<xsl:value-of select="$newline"/>
    	<xsl:call-template name="gen-methods"/>
    	<xsl:value-of select="$newline"/>
    	<xsl:value-of select="$newline"/>
    	<xsl:value-of select="'}'"/>
    	<xsl:value-of select="$newline"/>
	</xsl:template>

	<xsl:template name="gen-methods">

		<!-- Action Index -->
		<xsl:value-of select="concat($tab,'public Response actionIndex() throws IOException, ServletException, IllegalArgumentException, IllegalAccessException {')"/>
				<xsl:choose>
					<xsl:when test="//form_key!=''">
		    			<xsl:value-of select="$newline"/>
						<xsl:value-of select="concat($tab2,//form_key,'View view = new ',//form_key,'View();')"/>
		    			<xsl:value-of select="$newline"/>
						<xsl:value-of select="concat($tab2,//form_key,' model = new ',//form_key,'();')"/>
		    			<xsl:value-of select="$newline"/>
		    			<xsl:value-of select="concat($tab2,'model.load();')"/>
		    			<xsl:value-of select="$newline"/>
		    			<xsl:call-template name="start-code-comment">
							<xsl:with-param name="name_" select="'index'"/>
							<xsl:with-param name="tab_" select="$tab2"/>
						</xsl:call-template>
						<xsl:value-of select="//reserve_index"/>
						<xsl:call-template name="end-code-comment">
							<xsl:with-param name="tab_" select="$tab2"/>
						</xsl:call-template>
		    			<xsl:value-of select="$newline"/>
						<xsl:value-of select="concat($tab2,'return super.index(',$double_quotes,//app,$double_quotes,',model,view,this);')"/>
		    			<xsl:value-of select="$newline"/>
					</xsl:when>
					<xsl:otherwise>
		    			<xsl:value-of select="$newline"/>
		    			<xsl:call-template name="start-code-comment">
							<xsl:with-param name="name_" select="'index'"/>
							<xsl:with-param name="tab_" select="$tab2"/>
						</xsl:call-template>
						<xsl:value-of select="//reserve_index"/>
						<xsl:call-template name="end-code-comment">
							<xsl:with-param name="tab_" select="$tab2"/>
						</xsl:call-template>
		    			<xsl:value-of select="$newline"/>
						<xsl:value-of select="concat($tab2,'return super.index();')"/>
		    			<xsl:value-of select="$newline"/>
					</xsl:otherwise>
				</xsl:choose>
		<xsl:value-of select="concat($tab,'}')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
			
		<!-- Action Save -->
		<xsl:value-of select="concat($tab,'public Response actionSave() throws IOException, ServletException, IllegalArgumentException, IllegalAccessException {')"/>
		<xsl:value-of select="$newline"/>
		<xsl:call-template name="start-code-comment">
			<xsl:with-param name="name_" select="'save'"/>
			<xsl:with-param name="tab_" select="$tab2"/>
		</xsl:call-template>
		<xsl:value-of select="//reserve_save"/>
		<xsl:call-template name="end-code-comment">
			<xsl:with-param name="tab_" select="$tab2"/>
		</xsl:call-template>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab2,'return super.save();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab,'}')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<!-- Action Update -->
		<xsl:value-of select="concat($tab,'public Response actionUpdate() throws IOException, ServletException, IllegalArgumentException, IllegalAccessException {')"/>
		<xsl:value-of select="$newline"/>
		<xsl:call-template name="start-code-comment">
			<xsl:with-param name="name_" select="'update'"/>
			<xsl:with-param name="tab_" select="$tab2"/>
		</xsl:call-template>
		<xsl:value-of select="//reserve_update"/>
		<xsl:call-template name="end-code-comment">
			<xsl:with-param name="tab_" select="$tab2"/>
		</xsl:call-template>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab2,'return super.update();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab,'}')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<!-- Action getInputDocumentType -->
		<xsl:value-of select="concat($tab,'public List&lt;TipoDocumentoEtapa&gt; getInputDocumentType() {')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab2,'return super.getInputDocumentType();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab,'}')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>


		<!-- Action getOutputDocumentType -->
		<xsl:value-of select="concat($tab,'public List&lt;TipoDocumentoEtapa&gt; getOutputDocumentType() {')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab2,'return super.getOutputDocumentType();')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat($tab,'}')"/>
		<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>

		<xsl:value-of select="$newline"/>
		<xsl:call-template name="start-code-comment">
			<xsl:with-param name="name_" select="'custom_actions'"/>
			<xsl:with-param name="tab_" select="$tab"/>
		</xsl:call-template>
		<xsl:value-of select="//reserve_customs"/>
		<xsl:call-template name="end-code-comment">
			<xsl:with-param name="tab_" select="$tab"/>
		</xsl:call-template>
		<xsl:value-of select="$newline"/>
	</xsl:template>

	<xsl:template name="package">
	 	<xsl:value-of select="concat('package nosi.webapps.',//app,'.process.',//process_key,';')"/>
    	<xsl:value-of select="$newline"/>
    	<xsl:value-of select="$newline"/>
	</xsl:template>

	<xsl:template name="gen-author">
    	<xsl:value-of select="$newline"/>
		<xsl:text>/**</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat(' *',//user_name)"/>
    	<xsl:value-of select="$newline"/>
		<xsl:value-of select="concat(' *',//data_created)"/>
    	<xsl:value-of select="$newline"/>
		<xsl:text>*/</xsl:text>
    	<xsl:value-of select="$newline"/>
		<xsl:value-of select="$newline"/>
	</xsl:template>

	<xsl:variable name="newline">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>

	<xsl:variable name="tab">
        <xsl:text>&#9;</xsl:text>
    </xsl:variable>

    <xsl:variable name="tab2">
        <xsl:text>&#9;&#9;</xsl:text>
    </xsl:variable>

	<xsl:variable name="double_quotes">"</xsl:variable>

 	<xsl:template name="end-code-comment">
 		<xsl:param name="tab_" select="$tab"/>

		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$tab_"/>
 		<xsl:text>/*----#end-code----*/</xsl:text>
		<xsl:value-of select="$newline"/>
 	</xsl:template>

 	<xsl:template name="start-code-comment">
 		<xsl:param name="name_" select="''"/>
 		<xsl:param name="tab_" select="$tab"/>

		<xsl:value-of select="$newline"/>
 		<xsl:value-of select="$tab_"/>
 		<xsl:value-of select="concat('/*----#start-code(',$name_,')----*/')"/>
		<xsl:value-of select="$newline"/>
 	</xsl:template>
</xsl:stylesheet>