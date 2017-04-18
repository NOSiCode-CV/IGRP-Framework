<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_PROC_NOTIFIC_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS PROCESSOS PROC_NOTIFIC PROCESSO NOTIFICACAO -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/nr_proc"/></span><input type="text" name="{rows/content/filter/value/nr_proc/@name}" value="{rows/content/filter/value/nr_proc}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/cod_proc"/></span><input type="text" name="{rows/content/filter/value/cod_proc/@name}" value="{rows/content/filter/value/cod_proc}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/tipo_proc"/></span><select name="{rows/content/filter/list/tipo_proc/@name}" class=""><xsl:for-each select="rows/content/filter/list/tipo_proc/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/data_inicio"/></span><input type="date" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/filter/label/data_fim"/></span><input type="date" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/filter/label/estado"/></span><select name="{rows/content/filter/list/estado/@name}" class=""><xsl:for-each select="rows/content/filter/list/estado/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/meio_envio"/></span><select name="{rows/content/filter/list/meio_envio/@name}" class=""><xsl:for-each select="rows/content/filter/list/meio_envio/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/nr_proc"><th><xsl:value-of select="rows/content/table/label/nr_proc"/></th></xsl:if><xsl:if test="rows/content/table/label/cod_proc"><th><xsl:value-of select="rows/content/table/label/cod_proc"/></th></xsl:if><xsl:if test="rows/content/table/label/tipo_proc"><th><xsl:value-of select="rows/content/table/label/tipo_proc"/></th></xsl:if><xsl:if test="rows/content/table/label/meio_envio"><th><xsl:value-of select="rows/content/table/label/meio_envio"/></th></xsl:if><xsl:if test="rows/content/table/label/nome_titular"><th><xsl:value-of select="rows/content/table/label/nome_titular"/></th></xsl:if><xsl:if test="rows/content/table/label/data_envio"><th><xsl:value-of select="rows/content/table/label/data_envio"/></th></xsl:if><xsl:if test="rows/content/table/label/marcar"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_marcar_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="nr_proc"><td class="table_row{$pos}"><xsl:value-of select="nr_proc" /></td></xsl:if><xsl:if test="cod_proc"><td class="table_row{$pos}"><xsl:value-of select="cod_proc" /></td></xsl:if><xsl:if test="tipo_proc"><td class="table_row{$pos}"><xsl:value-of select="tipo_proc" /></td></xsl:if><xsl:if test="meio_envio"><td class="table_row{$pos}"><xsl:value-of select="meio_envio" /></td></xsl:if><xsl:if test="nome_titular"><td class="table_row{$pos}"><xsl:value-of select="nome_titular" /></td></xsl:if><xsl:if test="data_envio"><td class="table_row{$pos}"><xsl:value-of select="data_envio" /></td></xsl:if><xsl:if test="marcar"><td class="table_row{$pos} checkbox"><input type="checkbox" name="p_marcar" value="{marcar}"><xsl:if test="marcar_check=marcar"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="marcar_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>