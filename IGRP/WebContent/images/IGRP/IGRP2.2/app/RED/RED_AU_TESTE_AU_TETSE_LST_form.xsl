<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/RED_AU_TESTE_AU_TETSE_LST_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- AU_TESTE AU_TESTE AU_TETSE_LST LISTAGEM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/schema"><label><a id="idp_schema" /><span>(*) <xsl:value-of select="rows/content/form/label/schema"/></span><input type="text" name="{rows/content/form/value/schema/@name}" value="{rows/content/form/value/schema}"  class="required IGRP_change" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/coluna"><label><a id="idp_coluna" /><span>(*) <xsl:value-of select="rows/content/form/label/coluna"/></span><input type="text" name="{rows/content/form/value/coluna/@name}" value="{rows/content/form/value/coluna}"  class="required IGRP_change" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/colunas"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/colunas" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/colunas"><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'colunas'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/colunas"><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_colunas"><!--CABECALHO DA TABELA--><thead><tr><th align="center" width="10"></th><th align="center" width="10"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/colunas/value/row"><tr><td align="center" width="10"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="colunas"/></td><td align="center" width="10"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="colunas"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120217"/>



</xsl:stylesheet>