<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_TESTE_TESTE_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE_TESTE EDMILSON_TESTE FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nome"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/nome" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/nome"><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_nome"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/nome/label/apelido"/></th><th><xsl:value-of select="rows/content/form/table/nome/label/morada"/></th><th><xsl:value-of select="rows/content/form/table/nome/label/dt_nasc"/></th><th><xsl:value-of select="rows/content/form/table/nome/label/numero"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/nome/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="apelido" /></td><td class="table_row{$pos}"><xsl:value-of select="morada" /></td><td class="table_row{$pos}"><xsl:value-of select="dt_nasc" /></td><td class="table_row{$pos}"><xsl:value-of select="numero" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201204168"/>



</xsl:stylesheet>