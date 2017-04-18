<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS - CONFIGURACAO_12_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS - CONFIGURACAO CONFIGURACAO PROCESSOS 12 COMPONENTES ETAPA -->

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


		  <!--START PAGE--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/are"/></span><input type="text" name="{rows/content/filter/value/are/@name}" value="{rows/content/filter/value/are}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/processos"/></span><input type="text" name="{rows/content/filter/value/processos/@name}" value="{rows/content/filter/value/processos}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/task"/></span><input type="text" name="{rows/content/filter/value/task/@name}" value="{rows/content/filter/value/task}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/passos"/></span><input type="text" name="{rows/content/filter/value/passos/@name}" value="{rows/content/filter/value/passos}"  class="" maxlength="30" /></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/codigo"><th><xsl:value-of select="rows/content/table/label/codigo"/></th></xsl:if><xsl:if test="rows/content/table/label/nome"><th><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/preview"><th><xsl:value-of select="rows/content/table/label/preview"/></th></xsl:if><xsl:if test="rows/content/table/label/order"><th><xsl:value-of select="rows/content/table/label/order"/></th></xsl:if><xsl:if test="rows/content/table/label/marcar"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_marcar_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="codigo"><td class="table_row{$pos}"><xsl:value-of select="codigo" /></td></xsl:if><xsl:if test="nome"><td class="table_row{$pos}"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="preview"><td class="table_row{$pos} checkbox"><a href="{preview}" class="_blank">preview</a></td></xsl:if><xsl:if test="order"><td class="table_row{$pos}"><xsl:value-of select="order" /></td></xsl:if><xsl:if test="marcar"><td class="table_row{$pos} checkbox"><input type="checkbox" name="p_marcar" value="{marcar}"><xsl:if test="marcar_check=marcar"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="marcar_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>