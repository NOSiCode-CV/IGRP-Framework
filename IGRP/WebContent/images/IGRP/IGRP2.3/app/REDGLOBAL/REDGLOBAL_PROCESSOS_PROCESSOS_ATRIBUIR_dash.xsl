<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_PROCESSOS_ATRIBUIR_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS PROCESSOS PROCESSOS_ATRIBUIR ATRIBUIR TAREFAS -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/novo_utilizador"/></span><select name="{rows/content/form/list/novo_utilizador/@name}" class="required"><xsl:for-each select="rows/content/form/list/novo_utilizador/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/num__processo"><th><xsl:value-of select="rows/content/table/label/num__processo"/></th></xsl:if><xsl:if test="rows/content/table/label/cod__proc"><th><xsl:value-of select="rows/content/table/label/cod__proc"/></th></xsl:if><xsl:if test="rows/content/table/label/tipo_processo"><th><xsl:value-of select="rows/content/table/label/tipo_processo"/></th></xsl:if><xsl:if test="rows/content/table/label/data_criacao"><th><xsl:value-of select="rows/content/table/label/data_criacao"/></th></xsl:if><xsl:if test="rows/content/table/label/data_inicio"><th><xsl:value-of select="rows/content/table/label/data_inicio"/></th></xsl:if><xsl:if test="rows/content/table/label/data_fim"><th><xsl:value-of select="rows/content/table/label/data_fim"/></th></xsl:if><xsl:if test="rows/content/table/label/criado_por"><th><xsl:value-of select="rows/content/table/label/criado_por"/></th></xsl:if><xsl:if test="rows/content/table/label/utilizador_actual"><th><xsl:value-of select="rows/content/table/label/utilizador_actual"/></th></xsl:if><xsl:if test="rows/content/table/label/marcar"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_marcar_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="num__processo"><td class="table_row{$pos}"><xsl:value-of select="num__processo" /></td></xsl:if><xsl:if test="cod__proc"><td class="table_row{$pos}"><xsl:value-of select="cod__proc" /></td></xsl:if><xsl:if test="tipo_processo"><td class="table_row{$pos}"><xsl:value-of select="tipo_processo" /></td></xsl:if><xsl:if test="data_criacao"><td class="table_row{$pos}"><xsl:value-of select="data_criacao" /></td></xsl:if><xsl:if test="data_inicio"><td class="table_row{$pos}"><xsl:value-of select="data_inicio" /></td></xsl:if><xsl:if test="data_fim"><td class="table_row{$pos}"><xsl:value-of select="data_fim" /></td></xsl:if><xsl:if test="criado_por"><td class="table_row{$pos}"><xsl:value-of select="criado_por" /></td></xsl:if><xsl:if test="utilizador_actual"><td class="table_row{$pos}"><xsl:value-of select="utilizador_actual" /></td></xsl:if><xsl:if test="marcar"><td class="table_row{$pos} checkbox" align="right"><input type="checkbox" name="p_marcar" value="{marcar}"><xsl:if test="marcar_check=marcar"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="marcar_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=17"/>



</xsl:stylesheet>