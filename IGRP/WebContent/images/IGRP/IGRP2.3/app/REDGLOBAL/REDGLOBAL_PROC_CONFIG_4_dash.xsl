<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROC_CONFIG_4_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROC_CONFIG CONFIGURACAO PROCESSOS 4 CONSULTA ETAPAS -->

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


		  <!--START PAGE--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/area"/></span><select name="{rows/content/filter/list/area/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/filter/list/area/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/subarea"/></span><select name="{rows/content/filter/list/subarea/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/filter/list/subarea/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/proc_tp_fk"/></span><select name="{rows/content/filter/list/proc_tp_fk/@name}" class=""><xsl:for-each select="rows/content/filter/list/proc_tp_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/class_fk"/></span><select name="{rows/content/filter/list/class_fk/@name}" class=""><xsl:for-each select="rows/content/filter/list/class_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/name"><th align="left"><xsl:value-of select="rows/content/table/label/name"/></th></xsl:if><xsl:if test="rows/content/table/label/description"><th align="left"><xsl:value-of select="rows/content/table/label/description"/></th></xsl:if><xsl:if test="rows/content/table/label/class_fk"><th align="left"><xsl:value-of select="rows/content/table/label/class_fk"/></th></xsl:if><xsl:if test="rows/content/table/label/componentes"><th align="left"><xsl:value-of select="rows/content/table/label/componentes"/></th></xsl:if><xsl:if test="rows/content/table/label/inputs"><th align="left"><xsl:value-of select="rows/content/table/label/inputs"/></th></xsl:if><xsl:if test="rows/content/table/label/outputs"><th align="left"><xsl:value-of select="rows/content/table/label/outputs"/></th></xsl:if><xsl:if test="rows/content/table/label/performers"><th align="left"><xsl:value-of select="rows/content/table/label/performers"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="name"><td class="table_row{$pos}" align="left"><xsl:value-of select="name" /></td></xsl:if><xsl:if test="description"><td class="table_row{$pos}" align="left"><xsl:value-of select="description" /></td></xsl:if><xsl:if test="class_fk"><td class="table_row{$pos}" align="left"><xsl:value-of select="class_fk" /></td></xsl:if><xsl:if test="componentes"><td class="table_row{$pos} checkbox" align="left"><a href="{componentes}" class="_blank">componentes</a></td></xsl:if><xsl:if test="inputs"><td class="table_row{$pos} checkbox" align="left"><a href="{inputs}" class="_blank">inputs</a></td></xsl:if><xsl:if test="outputs"><td class="table_row{$pos} checkbox" align="left"><a href="{outputs}" class="_blank">outputs</a></td></xsl:if><xsl:if test="performers"><td class="table_row{$pos} checkbox" align="left"><a href="{performers}" class="_blank">performers</a></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=11"/>



</xsl:stylesheet>