<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_M_N_G_S_M_N_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- M_N FORMACAO(MATEUS) G_S_M_N GESTAO SOCIO (MATEUS) -->

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


		  <!-- CENTER COLUMN --><div class="center-1"><!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/nome"><label><span><xsl:value-of select="rows/content/filter/label/nome"/></span><input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/filter/label/morada"><label><span><xsl:value-of select="rows/content/filter/label/morada"/></span><input type="text" name="{rows/content/filter/value/morada/@name}" value="{rows/content/filter/value/morada}"  class="" maxlength="250" /></label></xsl:if><xsl:if test="rows/content/filter/label/nu_socio"><label><span><xsl:value-of select="rows/content/filter/label/nu_socio"/></span><input type="number" name="{rows/content/filter/value/nu_socio/@name}" value="{rows/content/filter/value/nu_socio}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/filter/label/estado"><label><span><xsl:value-of select="rows/content/filter/label/estado"/></span><input type="number" name="{rows/content/filter/value/estado/@name}" value="{rows/content/filter/value/estado}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/filter/label/nu_bi"><label><span><xsl:value-of select="rows/content/filter/label/nu_bi"/></span><input type="text" name="{rows/content/filter/value/nu_bi/@name}" value="{rows/content/filter/value/nu_bi}"  class="" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/filter/label/telemovel"><label><span><xsl:value-of select="rows/content/filter/label/telemovel"/></span><input type="text" name="{rows/content/filter/value/telemovel/@name}" value="{rows/content/filter/value/telemovel}"  class="" maxlength="50" /></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/nome"><th align="left"><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/apelido"><th align="left"><xsl:value-of select="rows/content/table/label/apelido"/></th></xsl:if><xsl:if test="rows/content/table/label/morada"><th align="left"><xsl:value-of select="rows/content/table/label/morada"/></th></xsl:if><xsl:if test="rows/content/table/label/foto_id"><th align="center"><xsl:value-of select="rows/content/table/label/foto_id"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="nome"><td class="table_row{$pos}" align="left"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="apelido"><td class="table_row{$pos}" align="left"><xsl:value-of select="apelido" /></td></xsl:if><xsl:if test="morada"><td class="table_row{$pos}" align="left"><xsl:value-of select="morada" /></td></xsl:if><xsl:if test="foto_id"><td class="table_row{$pos}" align="center"><xsl:value-of select="foto_id" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE--></div><!-- RIGHT COLUMN --><div class="right-1"><xsl:if test="rows/content/grafmoradas"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/grafmoradas/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/grafmoradas" /><xsl:with-param name="chart_type" select="'BarChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if><xsl:if test="rows/content/grafsocios"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/grafsocios/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/grafsocios" /><xsl:with-param name="chart_type" select="'ColumnChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if></div>


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201204301"/>



</xsl:stylesheet>