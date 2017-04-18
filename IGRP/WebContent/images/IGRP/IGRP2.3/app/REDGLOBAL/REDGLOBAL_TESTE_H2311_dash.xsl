<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_H2311_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE TESTE AD-HOC H2311 SEPARADOR LISTA EX -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/list_pesss" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'list_pesss'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  rel="F_list_pesss"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/idade"/></span><input type="number" name="{rows/content/form/value/idade/@name}" value="{rows/content/form/value/idade}"  rel="F_list_pesss"  class="number" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/morada"/></span><input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}"  rel="F_list_pesss"  class="" maxlength="30" /></label><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_list_pesss"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/list_pesss/label/nome"/></th><th><xsl:value-of select="rows/content/form/table/list_pesss/label/idade"/></th><th><xsl:value-of select="rows/content/form/table/list_pesss/label/morada"/></th><th align="center" width="10"></th><th align="center" width="10"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/list_pesss/value/row"><tr><td><xsl:value-of select="nome_desc" /><input type="hidden" name="p_list_pesss_id" value="{list_pesss_id}" /><input type="hidden" name="p_nome_fk" value="{nome}" /><input type="hidden" name="p_nome_fk_desc" value="{nome_desc}" /></td><td><xsl:value-of select="idade_desc" /><input type="hidden" name="p_idade_fk" value="{idade}" /><input type="hidden" name="p_idade_fk_desc" value="{idade_desc}" /></td><td><xsl:value-of select="morada_desc" /><input type="hidden" name="p_morada_fk" value="{morada}" /><input type="hidden" name="p_morada_fk_desc" value="{morada_desc}" /></td><td align="center" width="10"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="list_pesss"/></td><td align="center" width="10"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="list_pesss"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111123"/>



</xsl:stylesheet>