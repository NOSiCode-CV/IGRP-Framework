<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/RED_TESTER_TESTER_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTER TESTER TESTER LISTAGEM COLUNAS -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/schema"><label><span><xsl:value-of select="rows/content/form/label/schema"/></span><input type="text" name="{rows/content/form/value/schema/@name}" value="{rows/content/form/value/schema}"  class="" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/tabela"><label><span><xsl:value-of select="rows/content/form/label/tabela"/></span><input type="text" name="{rows/content/form/value/tabela/@name}" value="{rows/content/form/value/tabela}"  class="" maxlength="30" /></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/coluna"><th><xsl:value-of select="rows/content/table/label/coluna"/></th></xsl:if><xsl:if test="rows/content/table/label/tipo"><th><xsl:value-of select="rows/content/table/label/tipo"/></th></xsl:if><xsl:if test="rows/content/table/label/fonte"><th><xsl:value-of select="rows/content/table/label/fonte"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="coluna"><td class="table_row{$pos}"><xsl:value-of select="coluna" /></td></xsl:if><xsl:if test="tipo"><td class="table_row{$pos}"><xsl:value-of select="tipo" /></td></xsl:if><xsl:if test="fonte"><td class="table_row{$pos}"><xsl:value-of select="fonte" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201202281"/>



</xsl:stylesheet>