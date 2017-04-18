<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_EDER_LINO_GF_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- EDER_LINO FORMACAO (EDERLINO) GF GESTAO FILMES -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/cod_imdb"><label><span><xsl:value-of select="rows/content/filter/label/cod_imdb"/></span><input type="text" name="{rows/content/filter/value/cod_imdb/@name}" value="{rows/content/filter/value/cod_imdb}"  class="" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/filter/label/titulo"><label><span><xsl:value-of select="rows/content/filter/label/titulo"/></span><input type="text" name="{rows/content/filter/value/titulo/@name}" value="{rows/content/filter/value/titulo}"  class="" maxlength="250" /></label></xsl:if><xsl:if test="rows/content/filter/label/ano_lancamento"><label><span><xsl:value-of select="rows/content/filter/label/ano_lancamento"/></span><input type="date" name="{rows/content/filter/value/ano_lancamento/@name}" value="{rows/content/filter/value/ano_lancamento}" class="IGRP_datepicker date" /></label></xsl:if><xsl:if test="rows/content/filter/label/tipo_filme"><label><span><xsl:value-of select="rows/content/filter/label/tipo_filme"/></span><select name="{rows/content/filter/list/tipo_filme/@name}" class=""><xsl:for-each select="rows/content/filter/list/tipo_filme/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/filter/label/estado"><label><span><xsl:value-of select="rows/content/filter/label/estado"/></span><select name="{rows/content/filter/list/estado/@name}" class=""><xsl:for-each select="rows/content/filter/list/estado/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/cod_imdb"><th align="left"><xsl:value-of select="rows/content/table/label/cod_imdb"/></th></xsl:if><xsl:if test="rows/content/table/label/titulo"><th align="left"><xsl:value-of select="rows/content/table/label/titulo"/></th></xsl:if><xsl:if test="rows/content/table/label/ano_lancamento"><th align="center"><xsl:value-of select="rows/content/table/label/ano_lancamento"/></th></xsl:if><xsl:if test="rows/content/table/label/estado"><th align="center"><xsl:value-of select="rows/content/table/label/estado"/></th></xsl:if><xsl:if test="rows/content/table/label/eliminar"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_eliminar_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="cod_imdb"><td class="table_row{$pos}" align="left"><xsl:value-of select="cod_imdb" /></td></xsl:if><xsl:if test="titulo"><td class="table_row{$pos}" align="left"><xsl:value-of select="titulo" /></td></xsl:if><xsl:if test="ano_lancamento"><td class="table_row{$pos}" align="center"><xsl:value-of select="ano_lancamento" /></td></xsl:if><xsl:if test="estado"><td class="table_row{$pos}" align="center"><xsl:value-of select="estado" /></td></xsl:if><xsl:if test="eliminar"><td class="table_row{$pos} checkbox" align="left"><input type="checkbox" name="p_eliminar" value="{eliminar}"><xsl:if test="eliminar_check=eliminar"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="eliminar_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2012043010"/>



</xsl:stylesheet>