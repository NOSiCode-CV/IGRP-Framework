<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_EDERLINO_EDER_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- EDERLINO MODULO AD_HOC EDER PAGINA AD_HOC -->

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


		  <!-- CENTER COLUMN --><div class="center-1"><!--START PAGE--><!--TAB MENU --><xsl:apply-templates mode="tab-menu" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nome"><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="150" /></label></xsl:if><xsl:if test="rows/content/form/label/idade"><label><span><xsl:value-of select="rows/content/form/label/idade"/></span><input type="number" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}"  class="number" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/lista_ah_hoc"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/lista_ah_hoc" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/lista_ah_hoc"><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_lista_ah_hoc"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/lista_ah_hoc/label/bi_lista"/></th><th><xsl:value-of select="rows/content/form/table/lista_ah_hoc/label/nome_lista"/></th><th><xsl:value-of select="rows/content/form/table/lista_ah_hoc/label/idade_lista"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/lista_ah_hoc/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="bi_lista" /></td><td class="table_row{$pos}"><xsl:value-of select="nome_lista" /></td><td class="table_row{$pos}"><xsl:value-of select="idade_lista" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if><xsl:if test="rows/content/form/label/fim_lista"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/fim_lista" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/data:hoje"><label><span><xsl:value-of select="rows/content/form/label/data:hoje"/></span><input type="date" name="{rows/content/form/value/data:hoje/@name}" value="{rows/content/form/value/data:hoje}" class="IGRP_datepicker date" /></label></xsl:if></div><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/bi"><label><span><xsl:value-of select="rows/content/filter/label/bi"/></span><input type="text" name="{rows/content/filter/value/bi/@name}" value="{rows/content/filter/value/bi}"  class="" maxlength="30" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_BI'" /><xsl:with-param name="name" select="rows/content/filter/value/bi/@name" /><xsl:with-param name="js_lookup" select="rows/content/filter/lookup/bi" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/filter/label/nome"><label><span><xsl:value-of select="rows/content/filter/label/nome"/></span><input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}"  class="" maxlength="30" /></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/bi"><th><xsl:value-of select="rows/content/table/label/bi"/></th></xsl:if><xsl:if test="rows/content/table/label/nome"><th><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/daat"><th><xsl:value-of select="rows/content/table/label/daat"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="bi"><td class="table_row{$pos}"><xsl:value-of select="bi" /></td></xsl:if><xsl:if test="nome"><td class="table_row{$pos}"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="daat"><td class="table_row{$pos}"><xsl:value-of select="daat" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE--></div><!-- RIGHT COLUMN --><div class="right-1"><xsl:if test="rows/content/teste"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/teste/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/teste" /><xsl:with-param name="chart_type" select="'BarChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if></div>


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120420"/>



</xsl:stylesheet>