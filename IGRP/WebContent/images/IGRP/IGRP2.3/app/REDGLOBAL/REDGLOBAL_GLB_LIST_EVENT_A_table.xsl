<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_LIST_EVENT_A_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- GLB_LIST_EVENT LISTA EVENTOS A LISTA EVENTOS -->

		  <!-- START YOUR CODE HERE -->

			<!--PAGE TITLE-->
	  <div class="box-content">

		  <xsl:call-template name="page-title">
			 <xsl:with-param name="title" select="rows/content/title" />
		  </xsl:call-template>

		  <!--NOTIFICATION MESSAGES-->
		  <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
			 <xsl:with-param name="class" select="'notification'"/>
		  </xsl:apply-templates>


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/cat_fk"><label><a id="idp_cat_fk" /><span><xsl:value-of select="rows/content/form/label/cat_fk"/></span><select name="{rows/content/form/list/cat_fk/@name}" class="IGRP_change"><xsl:for-each select="rows/content/form/list/cat_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/ano"><label><a id="idp_ano" /><span><xsl:value-of select="rows/content/form/label/ano"/></span><select name="{rows/content/form/list/ano/@name}" class="IGRP_change"><xsl:for-each select="rows/content/form/list/ano/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/mes"><label><a id="idp_mes" /><span><xsl:value-of select="rows/content/form/label/mes"/></span><select name="{rows/content/form/list/mes/@name}" class="IGRP_change"><xsl:for-each select="rows/content/form/list/mes/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/dia"><label><a id="idp_dia" /><span><xsl:value-of select="rows/content/form/label/dia"/></span><select name="{rows/content/form/list/dia/@name}" class="IGRP_change"><xsl:for-each select="rows/content/form/list/dia/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/subject"><th align="left"><xsl:value-of select="rows/content/table/label/subject"/></th></xsl:if><xsl:if test="rows/content/table/label/location"><th align="left"><xsl:value-of select="rows/content/table/label/location"/></th></xsl:if><xsl:if test="rows/content/table/label/start_time"><th align="center"><xsl:value-of select="rows/content/table/label/start_time"/></th></xsl:if><xsl:if test="rows/content/table/label/end_time"><th align="center"><xsl:value-of select="rows/content/table/label/end_time"/></th></xsl:if><xsl:if test="rows/content/table/label/view_page"><th align="center"><xsl:value-of select="rows/content/table/label/view_page"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="subject"><td class="table_row{$pos}" align="left"><xsl:value-of select="subject" /></td></xsl:if><xsl:if test="location"><td class="table_row{$pos}" align="left"><xsl:value-of select="location" /></td></xsl:if><xsl:if test="start_time"><td class="table_row{$pos}" align="center"><xsl:value-of select="start_time" /></td></xsl:if><xsl:if test="end_time"><td class="table_row{$pos}" align="center"><xsl:value-of select="end_time" /></td></xsl:if><xsl:if test="view_page"><td class="table_row{$pos} checkbox" align="center"><a href="{view_page}" class="_blank"><xsl:value-of select="view_page_desc" /></a></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201202297"/>



</xsl:stylesheet>