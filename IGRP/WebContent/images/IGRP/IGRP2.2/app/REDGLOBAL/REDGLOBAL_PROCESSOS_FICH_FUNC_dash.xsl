<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_FICH_FUNC_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS PROCESSOS FICH_FUNC FICHA -->

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


		  <!--START PAGE--><!--VIEW --><!--START FORM VIEW--><div class="box-content"><div class="box-entity"><div class="foto-box"><img class="foto" src="{rows/content/view/value/view_foto}" /></div><div class="info-box"><ul><li><span class="label"><xsl:value-of select="rows/content/view/label/nome"/>:</span><xsl:value-of select="rows/content/view/value/nome"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/nome_utilizador"/>:</span><xsl:value-of select="rows/content/view/value/nome_utilizador"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/email"/>:</span><xsl:value-of select="rows/content/view/value/email"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/data_validade"/>:</span><xsl:value-of select="rows/content/view/value/data_validade"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/estado"/>:</span><xsl:value-of select="rows/content/view/value/estado"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/organica"/>:</span><xsl:value-of select="rows/content/view/value/organica"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/perfil"/>:</span><xsl:value-of select="rows/content/view/value/perfil"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/observacoes"/>:</span><xsl:value-of select="rows/content/view/value/observacoes"/></li></ul></div></div></div><!--END FORM VIEW--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>