<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_TESTE_NARSUH_PAGINA_TESTE_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE_NARSUH TESTE_NARSUH PAGINA_TESTE PAGINA_TESTE -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/formulario" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/id"/></span><input type="number" name="{rows/content/form/value/id/@name}" value="{rows/content/form/value/id}"  class="number" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/codigo"/></span><input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/descrisao"/></span><input type="text" name="{rows/content/form/value/descrisao/@name}" value="{rows/content/form/value/descrisao}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/dt_insercao"/></span><input type="date" name="{rows/content/form/value/dt_insercao/@name}" value="{rows/content/form/value/dt_insercao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/uti_insercao"/></span><input type="number" name="{rows/content/form/value/uti_insercao/@name}" value="{rows/content/form/value/uti_insercao}"  class="number" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/dt_actualizacao"/></span><input type="date" name="{rows/content/form/value/dt_actualizacao/@name}" value="{rows/content/form/value/dt_actualizacao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/uti_actualizacao"/></span><input type="number" name="{rows/content/form/value/uti_actualizacao/@name}" value="{rows/content/form/value/uti_actualizacao}"  class="number" maxlength="30" /></label></div><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/id"/></span><input type="number" name="{rows/content/filter/value/id/@name}" value="{rows/content/filter/value/id}"  class="number" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/codigo"/></span><input type="text" name="{rows/content/filter/value/codigo/@name}" value="{rows/content/filter/value/codigo}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/filter/label/dt_insercao"/></span><input type="date" name="{rows/content/filter/value/dt_insercao/@name}" value="{rows/content/filter/value/dt_insercao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/filter/label/dt_actualizacao"/></span><input type="date" name="{rows/content/filter/value/dt_actualizacao/@name}" value="{rows/content/filter/value/dt_actualizacao}" class="IGRP_datepicker date" /></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/id"><th><xsl:value-of select="rows/content/table/label/id"/></th></xsl:if><xsl:if test="rows/content/table/label/nome"><th><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/codigo"><th><xsl:value-of select="rows/content/table/label/codigo"/></th></xsl:if><xsl:if test="rows/content/table/label/descrisao"><th><xsl:value-of select="rows/content/table/label/descrisao"/></th></xsl:if><xsl:if test="rows/content/table/label/dt_insercao"><th><xsl:value-of select="rows/content/table/label/dt_insercao"/></th></xsl:if><xsl:if test="rows/content/table/label/uti_insercao"><th><xsl:value-of select="rows/content/table/label/uti_insercao"/></th></xsl:if><xsl:if test="rows/content/table/label/dt_actualizacao"><th><xsl:value-of select="rows/content/table/label/dt_actualizacao"/></th></xsl:if><xsl:if test="rows/content/table/label/uti_actualizacao"><th><xsl:value-of select="rows/content/table/label/uti_actualizacao"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="id"><td class="table_row{$pos}"><xsl:value-of select="id" /></td></xsl:if><xsl:if test="nome"><td class="table_row{$pos}"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="codigo"><td class="table_row{$pos}"><xsl:value-of select="codigo" /></td></xsl:if><xsl:if test="descrisao"><td class="table_row{$pos}"><xsl:value-of select="descrisao" /></td></xsl:if><xsl:if test="dt_insercao"><td class="table_row{$pos}"><xsl:value-of select="dt_insercao" /></td></xsl:if><xsl:if test="uti_insercao"><td class="table_row{$pos}"><xsl:value-of select="uti_insercao" /></td></xsl:if><xsl:if test="dt_actualizacao"><td class="table_row{$pos}"><xsl:value-of select="dt_actualizacao" /></td></xsl:if><xsl:if test="uti_actualizacao"><td class="table_row{$pos}"><xsl:value-of select="uti_actualizacao" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111128"/>



</xsl:stylesheet>