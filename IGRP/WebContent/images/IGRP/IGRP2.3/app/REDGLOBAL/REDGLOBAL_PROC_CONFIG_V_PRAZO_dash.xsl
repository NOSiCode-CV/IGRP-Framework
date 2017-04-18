<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROC_CONFIG_V_PRAZO_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROC_CONFIG CONFIGURACAO PROCESSOS V_PRAZO ACTULIZAR PRAZOS ETAPA -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/proc_tp_name"/></span><input type="text" name="{rows/content/form/value/proc_tp_name/@name}" value="{rows/content/form/value/proc_tp_name}"  disabled="disabled"  class="required" maxlength="250" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/acti_tp_name"/></span><input type="text" name="{rows/content/form/value/acti_tp_name/@name}" value="{rows/content/form/value/acti_tp_name}"  disabled="disabled"  class="required" maxlength="250" /></label><label><span><xsl:value-of select="rows/content/form/label/time_units_1"/></span><select name="{rows/content/form/list/time_units_1/@name}" class=""><xsl:for-each select="rows/content/form/list/time_units_1/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/optimal_time"/></span><input type="number" name="{rows/content/form/value/optimal_time/@name}" value="{rows/content/form/value/optimal_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/warn_time"/></span><input type="number" name="{rows/content/form/value/warn_time/@name}" value="{rows/content/form/value/warn_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/prioridade"/></span><select name="{rows/content/form/list/prioridade/@name}" class=""><xsl:for-each select="rows/content/form/list/prioridade/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/lista_origem" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_lista_origem"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/lista_origem/label/nome_origem"/></th><th><xsl:value-of select="rows/content/form/table/lista_origem/label/tipo_origem"/></th><th><xsl:value-of select="rows/content/form/table/lista_origem/label/execucao_origem"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/lista_origem/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="nome_origem" /></td><td class="table_row{$pos}"><xsl:value-of select="tipo_origem" /></td><td class="table_row{$pos}"><xsl:value-of select="execucao_origem" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/lista_destinos" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_lista_destinos"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/lista_destinos/label/nome_destino"/></th><th><xsl:value-of select="rows/content/form/table/lista_destinos/label/tipo_destino"/></th><th><xsl:value-of select="rows/content/form/table/lista_destinos/label/execucao_destino"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/lista_destinos/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="nome_destino" /></td><td class="table_row{$pos}"><xsl:value-of select="tipo_destino" /></td><td class="table_row{$pos}"><xsl:value-of select="execucao_destino" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2"/>



</xsl:stylesheet>