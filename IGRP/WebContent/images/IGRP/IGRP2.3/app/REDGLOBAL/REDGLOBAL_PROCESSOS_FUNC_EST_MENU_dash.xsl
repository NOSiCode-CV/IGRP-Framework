<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_FUNC_EST_MENU_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS PROCESSOS FUNC_EST_MENU ESTATISTICA FUNCIONARIO MENU -->

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


		  <!-- CENTER COLUMN --><div class="center-1"><!--START PAGE--><!--VIEW --><!--START FORM VIEW--><div class="box-content"><div class="box-entity"><div class="foto-box"><img class="foto" src="{rows/content/view/value/view_foto}" /></div><div class="info-box"><ul><li><span class="label"><xsl:value-of select="rows/content/view/label/n_tarefas_concluidas"/>:</span><xsl:value-of select="rows/content/view/value/n_tarefas_concluidas"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/n_tarefas_pendentes"/>:</span><xsl:value-of select="rows/content/view/value/n_tarefas_pendentes"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/n_atendimento_dia"/>:</span><xsl:value-of select="rows/content/view/value/n_atendimento_dia"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/media_tempo"/>:</span><xsl:value-of select="rows/content/view/value/media_tempo"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/posicao_ranking"/>:</span><xsl:value-of select="rows/content/view/value/posicao_ranking"/></li></ul></div></div></div><!--END FORM VIEW--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/estado_tarefa"/></span><select name="{rows/content/filter/list/estado_tarefa/@name}" class=""><xsl:for-each select="rows/content/filter/list/estado_tarefa/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/n_processo"><th><xsl:value-of select="rows/content/table/label/n_processo"/></th></xsl:if><xsl:if test="rows/content/table/label/categoria_processo"><th><xsl:value-of select="rows/content/table/label/categoria_processo"/></th></xsl:if><xsl:if test="rows/content/table/label/descricao_tarefa"><th><xsl:value-of select="rows/content/table/label/descricao_tarefa"/></th></xsl:if><xsl:if test="rows/content/table/label/dt_entrada"><th><xsl:value-of select="rows/content/table/label/dt_entrada"/></th></xsl:if><xsl:if test="rows/content/table/label/dt_conclusao"><th><xsl:value-of select="rows/content/table/label/dt_conclusao"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="n_processo"><td class="table_row{$pos}"><xsl:value-of select="n_processo" /></td></xsl:if><xsl:if test="categoria_processo"><td class="table_row{$pos}"><xsl:value-of select="categoria_processo" /></td></xsl:if><xsl:if test="descricao_tarefa"><td class="table_row{$pos}"><xsl:value-of select="descricao_tarefa" /></td></xsl:if><xsl:if test="dt_entrada"><td class="table_row{$pos}"><xsl:value-of select="dt_entrada" /></td></xsl:if><xsl:if test="dt_conclusao"><td class="table_row{$pos}"><xsl:value-of select="dt_conclusao" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE--></div><!-- RIGHT COLUMN --><div class="right-1"><!--GRAFICO--><div class="graph-box"><!-- PAGE SUBTITLE --><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/tarrefas/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/tarrefas" /><xsl:with-param name="chart_type" select="'PieChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div><!--GRAFICO--><div class="graph-box"><!-- PAGE SUBTITLE --><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/tarrefas_a/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/tarrefas_a" /><xsl:with-param name="chart_type" select="'PieChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div><!--GRAFICO--><div class="graph-box"><!-- PAGE SUBTITLE --><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/evolucao/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/evolucao" /><xsl:with-param name="chart_type" select="'ColumnChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></div>


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=9"/>



</xsl:stylesheet>