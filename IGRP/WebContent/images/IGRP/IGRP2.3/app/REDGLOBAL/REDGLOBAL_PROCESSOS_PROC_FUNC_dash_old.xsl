<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_PROC_FUNC_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS PROCESSOS PROC_FUNC GESTAO FUNCIONARIOS -->

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


		  <!-- CENTER COLUMN --><div class="center-1"><!--START PAGE--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/descr"/></span><select name="{rows/content/filter/list/descr/@name}" class=""><xsl:for-each select="rows/content/filter/list/descr/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/tipo_processo"/></span><select name="{rows/content/filter/list/tipo_processo/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/filter/list/tipo_processo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/tipo_tarefa"/></span><select name="{rows/content/filter/list/tipo_tarefa/@name}" class=""><xsl:for-each select="rows/content/filter/list/tipo_tarefa/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><xsl:call-template name="filter-az"><xsl:with-param name="name" select="rows/content/filter/value/name/@name" /><xsl:with-param name="value" select="rows/content/filter/value/name" /></xsl:call-template><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/nome"><th><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/contacto"><th><xsl:value-of select="rows/content/table/label/contacto"/></th></xsl:if><xsl:if test="rows/content/table/label/n_tarefas"><th><xsl:value-of select="rows/content/table/label/n_tarefas"/></th></xsl:if><xsl:if test="rows/content/table/label/n_atendimento"><th><xsl:value-of select="rows/content/table/label/n_atendimento"/></th></xsl:if><xsl:if test="rows/content/table/label/media_tempo"><th><xsl:value-of select="rows/content/table/label/media_tempo"/></th></xsl:if><xsl:if test="rows/content/table/label/ranking"><th><xsl:value-of select="rows/content/table/label/ranking"/></th></xsl:if><xsl:if test="rows/content/table/label/percent"><th><xsl:value-of select="rows/content/table/label/percent"/></th></xsl:if><xsl:if test="rows/content/table/label/img"><th><xsl:value-of select="rows/content/table/label/img"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="nome"><td class="table_row{$pos}"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="contacto"><td class="table_row{$pos}"><xsl:value-of select="contacto" /></td></xsl:if><xsl:if test="n_tarefas"><td class="table_row{$pos}"><xsl:value-of select="n_tarefas" /></td></xsl:if><xsl:if test="n_atendimento"><td class="table_row{$pos}"><xsl:value-of select="n_atendimento" /></td></xsl:if><xsl:if test="media_tempo"><td class="table_row{$pos}"><xsl:value-of select="media_tempo" /></td></xsl:if><xsl:if test="ranking"><td class="table_row{$pos}"><xsl:value-of select="ranking" /></td></xsl:if><xsl:if test="percent"><td class="table_row{$pos}"><xsl:value-of select="percent" /></td></xsl:if><xsl:if test="img"><td class="table_row{$pos}"><xsl:value-of select="img" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE--></div><!-- RIGHT COLUMN --><div class="right-1"><!--GRAFICO--><div class="graph-box"><!-- PAGE SUBTITLE --><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/primeiros_ranking/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/primeiros_ranking" /><xsl:with-param name="chart_type" select="'PieChart'" /><xsl:with-param name="width" select="256" /><xsl:with-param name="height" select="150" /></xsl:call-template></div><!--GRAFICO--><div class="graph-box"><!-- PAGE SUBTITLE --><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/tarefas/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/tarefas" /><xsl:with-param name="chart_type" select="'ColumnChart'" /><xsl:with-param name="width" select="256" /><xsl:with-param name="height" select="150" /></xsl:call-template></div><!--GRAFICO--><div class="graph-box"><!-- PAGE SUBTITLE --><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/evolucao_desempenho/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/evolucao_desempenho" /><xsl:with-param name="chart_type" select="'ColumnChart'" /><xsl:with-param name="width" select="256" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></div>


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>