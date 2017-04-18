<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_SIT_SERVICES_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- SIT_SERVICES GESTAO SERVICOS BULK LISTA -->

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


		  <!--START PAGE--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/table/label/protocolo_ogc"/></th><th><xsl:value-of select="rows/content/table/label/descricao"/></th><th><xsl:value-of select="rows/content/table/label/url"/></th><th><xsl:value-of select="rows/content/table/label/data"/></th><th><xsl:value-of select="rows/content/table/label/cobertura_territorial"/></th><th><xsl:value-of select="rows/content/table/label/info_tecnica"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><td class="table_row{$pos}"><xsl:value-of select="protocolo_ogc" /></td><td class="table_row{$pos}"><xsl:value-of select="descricao" /></td><td class="table_row{$pos}"><xsl:value-of select="url" /></td><td class="table_row{$pos}"><xsl:value-of select="data" /></td><td class="table_row{$pos}"><xsl:value-of select="cobertura_territorial" /></td><td class="table_row{$pos}"><xsl:value-of select="info_tecnica" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>