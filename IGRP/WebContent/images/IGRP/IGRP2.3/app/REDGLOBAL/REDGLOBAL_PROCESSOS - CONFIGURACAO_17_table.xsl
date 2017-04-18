<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS - CONFIGURACAO_17_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS - CONFIGURACAO CONFIGURACAO PROCESSOS 17 ASSOCIAR INPUT ETAPA -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><xsl:call-template name="filter-az"><xsl:with-param name="name" select="rows/content/form/value/name/@name" /><xsl:with-param name="value" select="rows/content/form/value/name" /></xsl:call-template><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/code"><th align="left"><xsl:value-of select="rows/content/table/label/code"/></th></xsl:if><xsl:if test="rows/content/table/label/name"><th align="left"><xsl:value-of select="rows/content/table/label/name"/></th></xsl:if><xsl:if test="rows/content/table/label/descricao"><th align="center"><xsl:value-of select="rows/content/table/label/descricao"/></th></xsl:if><xsl:if test="rows/content/table/label/checkby"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_checkby_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="code"><td class="table_row{$pos}" align="left"><xsl:value-of select="code" /></td></xsl:if><xsl:if test="name"><td class="table_row{$pos}" align="left"><xsl:value-of select="name" /></td></xsl:if><xsl:if test="descricao"><td class="table_row{$pos}" align="center"><xsl:value-of select="descricao" /></td></xsl:if><xsl:if test="checkby"><td class="table_row{$pos} checkbox" align="center"><input type="checkbox" name="p_checkby" value="{checkby}"><xsl:if test="checkby_check=checkby"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="checkby_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>