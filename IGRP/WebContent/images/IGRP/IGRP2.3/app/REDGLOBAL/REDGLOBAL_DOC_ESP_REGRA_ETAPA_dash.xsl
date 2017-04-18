<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_DOC_ESP_REGRA_ETAPA_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- DOC_ESP DOCUMENTACAO ESPECIFICACAO REGRA_ETAPA REGRAS INTERFACE ETAPA -->

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


		  <!-- LEFT COLUMN --><div class="left-1"><xsl:apply-templates mode="lateral-menu" select="rows/content/menu" /></div><!-- CENTER COLUMN --><div class="center-1"><!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/editor"/></span><xsl:call-template name="text-editor"><xsl:with-param name="name" select="rows/content/form/value/editor/@name" /><xsl:with-param name="value" select="rows/content/form/value/editor"/></xsl:call-template></label></div><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/componente"/></span><select name="{rows/content/filter/list/componente/@name}" class=""><xsl:for-each select="rows/content/filter/list/componente/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/componente"><th><xsl:value-of select="rows/content/table/label/componente"/></th></xsl:if><xsl:if test="rows/content/table/label/tipo"><th><xsl:value-of select="rows/content/table/label/tipo"/></th></xsl:if><xsl:if test="rows/content/table/label/regras"><th><xsl:value-of select="rows/content/table/label/regras"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="componente"><td class="table_row{$pos}"><xsl:value-of select="componente" /></td></xsl:if><xsl:if test="tipo"><td class="table_row{$pos}"><xsl:value-of select="tipo" /></td></xsl:if><xsl:if test="regras"><td class="table_row{$pos}"><xsl:value-of select="regras" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE--></div>


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111213"/>

<xsl:include href="../../xsl/tmpl/IGRP-lateral-menu.tmpl.xsl?v=20111213"/><xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20111213"/>

</xsl:stylesheet>