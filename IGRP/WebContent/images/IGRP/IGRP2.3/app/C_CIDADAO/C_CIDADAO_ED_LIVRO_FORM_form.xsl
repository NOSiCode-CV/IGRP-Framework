<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_ED_LIVRO_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- ED_LIVRO ED_LIVRO- GESTAO LIVRO FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/titulo"/></span><input type="text" name="{rows/content/form/value/titulo/@name}" value="{rows/content/form/value/titulo}"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/descricao"/></span><input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}"  class="" maxlength="500" /></label><label><span><xsl:value-of select="rows/content/form/label/editora"/></span><input type="text" name="{rows/content/form/value/editora/@name}" value="{rows/content/form/value/editora}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/categoria_id"/></span><select name="{rows/content/form/list/categoria_id/@name}" class=""><xsl:for-each select="rows/content/form/list/categoria_id/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/dt_publicacao"/></span><input type="date" name="{rows/content/form/value/dt_publicacao/@name}" value="{rows/content/form/value/dt_publicacao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/isbn"/></span><input type="text" name="{rows/content/form/value/isbn/@name}" value="{rows/content/form/value/isbn}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/dt_insercao"/></span><input type="date" name="{rows/content/form/value/dt_insercao/@name}" value="{rows/content/form/value/dt_insercao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/dt_actualizacao"/></span><input type="date" name="{rows/content/form/value/dt_actualizacao/@name}" value="{rows/content/form/value/dt_actualizacao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/uti_actualizacao"/></span><input type="text" name="{rows/content/form/value/uti_actualizacao/@name}" value="{rows/content/form/value/uti_actualizacao}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/status"/></span><input type="checkbox" name="{rows/content/form/value/status/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/status='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/autores" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'autores'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/autor_id"/></span><select name="{rows/content/form/list/autor_id/@name}" rel="F_autores"  class=""><xsl:for-each select="rows/content/form/list/autor_id/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_autores"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/autores/label/autor_id"/></th><th align="center" width="10"></th><th align="center" width="10"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/autores/value/row"><tr><td><xsl:value-of select="autor_id_desc" /><input type="hidden" name="p_autores_id" value="{autores_id}" /><input type="hidden" name="p_autor_id_fk" value="{autor_id}" /><input type="hidden" name="p_autor_id_fk_desc" value="{autor_id_desc}" /></td><td align="center" width="10"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="autores"/></td><td align="center" width="10"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="autores"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=24"/>



</xsl:stylesheet>