<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_NS_LIVRO_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- NS_LIVRO  BULK LISTA -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/id"/></span><input type="number" name="{rows/content/filter/value/id/@name}" value="{rows/content/filter/value/id}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/filter/label/codigo"/></span><input type="text" name="{rows/content/filter/value/codigo/@name}" value="{rows/content/filter/value/codigo}"  class="" maxlength="10" /></label><label><span><xsl:value-of select="rows/content/filter/label/dt_insercao"/></span><input type="date" name="{rows/content/filter/value/dt_insercao/@name}" value="{rows/content/filter/value/dt_insercao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/filter/label/dt_actualizacao"/></span><input type="date" name="{rows/content/filter/value/dt_actualizacao/@name}" value="{rows/content/filter/value/dt_actualizacao}" class="IGRP_datepicker date" /></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/id"><th align="center"><xsl:value-of select="rows/content/table/label/id"/></th></xsl:if><xsl:if test="rows/content/table/label/nome"><th align="left"><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/codigo"><th align="left"><xsl:value-of select="rows/content/table/label/codigo"/></th></xsl:if><xsl:if test="rows/content/table/label/descrisao"><th align="left"><xsl:value-of select="rows/content/table/label/descrisao"/></th></xsl:if><xsl:if test="rows/content/table/label/dt_insercao"><th align="center"><xsl:value-of select="rows/content/table/label/dt_insercao"/></th></xsl:if><xsl:if test="rows/content/table/label/uti_insersao"><th align="center"><xsl:value-of select="rows/content/table/label/uti_insersao"/></th></xsl:if><xsl:if test="rows/content/table/label/dt_actualizacao"><th align="center"><xsl:value-of select="rows/content/table/label/dt_actualizacao"/></th></xsl:if><xsl:if test="rows/content/table/label/uti_actualizacao"><th align="center"><xsl:value-of select="rows/content/table/label/uti_actualizacao"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="id"><td class="table_row{$pos}" align="center"><xsl:value-of select="id" /></td></xsl:if><xsl:if test="nome"><td class="table_row{$pos}" align="left"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="codigo"><td class="table_row{$pos}" align="left"><xsl:value-of select="codigo" /></td></xsl:if><xsl:if test="descrisao"><td class="table_row{$pos}" align="left"><xsl:value-of select="descrisao" /></td></xsl:if><xsl:if test="dt_insercao"><td class="table_row{$pos}" align="center"><xsl:value-of select="dt_insercao" /></td></xsl:if><xsl:if test="uti_insersao"><td class="table_row{$pos}" align="center"><xsl:value-of select="uti_insersao" /></td></xsl:if><xsl:if test="dt_actualizacao"><td class="table_row{$pos}" align="center"><xsl:value-of select="dt_actualizacao" /></td></xsl:if><xsl:if test="uti_actualizacao"><td class="table_row{$pos}" align="center"><xsl:value-of select="uti_actualizacao" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111125"/>



</xsl:stylesheet>