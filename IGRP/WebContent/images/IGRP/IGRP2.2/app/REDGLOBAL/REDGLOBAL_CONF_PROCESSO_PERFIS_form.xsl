<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_CONF_PROCESSO_PERFIS_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- CONF_PROCESSO CONFIGURACAO PROCESSO PERFIS PERFIS -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/processo"/></span><input type="text" name="{rows/content/form/value/processo/@name}" value="{rows/content/form/value/processo}"  disabled="disabled"  class="" maxlength="150" /></label><label><span><xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"  disabled="disabled"  class="" maxlength="30" /></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/perfil" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_perfil"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/perfil/label/cp_org_fk"/></th><th><xsl:value-of select="rows/content/form/table/perfil/label/cp_prof_tp_fk"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/perfil/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="cp_org_fk" /></td><td class="table_row{$pos}"><xsl:value-of select="cp_prof_tp_fk" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111125"/>



</xsl:stylesheet>