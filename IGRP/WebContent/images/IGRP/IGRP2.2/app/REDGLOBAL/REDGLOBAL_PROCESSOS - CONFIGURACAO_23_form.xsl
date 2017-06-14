<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS - CONFIGURACAO_23_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS - CONFIGURACAO CONFIGURACAO PROCESSOS 23 ASSOCIAR OUTPUT ETAPA -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/configuracao_output" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/processo"/></span><input type="text" name="{rows/content/form/value/processo/@name}" value="{rows/content/form/value/processo}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/etapa"/></span><input type="text" name="{rows/content/form/value/etapa/@name}" value="{rows/content/form/value/etapa}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/tipo"/></span><select name="{rows/content/form/list/tipo/@name}" class=""><xsl:for-each select="rows/content/form/list/tipo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/codigo"/></span><input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/enviar"/></span><xsl:for-each select="rows/content/form/list/enviar/option"><input type="radio" name="{../@name}" value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="text"/></xsl:for-each></label><label><span><xsl:value-of select="rows/content/form/label/meio_envio"/></span><select name="{rows/content/form/list/meio_envio/@name}" class=""><xsl:for-each select="rows/content/form/list/meio_envio/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/corpo"/></span><textarea name="{rows/content/form/value/corpo/@name}"  class=""><xsl:value-of select="rows/content/form/value/corpo"/></textarea></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/ass_assinaturas_output" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'ass_assinaturas_output'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/utilizador"/></span><input type="text" name="{rows/content/form/value/utilizador/@name}" value="{rows/content/form/value/utilizador}"  rel="F_ass_assinaturas_output"  class="" maxlength="30" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="rows/page" /><xsl:with-param name="action" select="'LOOKUP'" /><xsl:with-param name="name" select="rows/content/form/value/utilizador/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/utilizador" /></xsl:call-template></label><label><span><xsl:value-of select="rows/content/form/label/assinatura"/></span><input type="file" name="{rows/content/form/value/assinatura/@name}" value="{rows/content/form/value/assinatura}"  rel="F_ass_assinaturas_output"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/estado"/></span><select name="{rows/content/form/list/estado/@name}" rel="F_ass_assinaturas_output"  class=""><xsl:for-each select="rows/content/form/list/estado/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_ass_assinaturas_output"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/ass_assinaturas_output/label/utilizador"/></th><th><xsl:value-of select="rows/content/form/table/ass_assinaturas_output/label/assinatura"/></th><th><xsl:value-of select="rows/content/form/table/ass_assinaturas_output/label/estado"/></th><th align="center" width="15"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/ass_assinaturas_output/value/row"><tr><td><xsl:value-of select="utilizador_desc" /><input type="hidden" name="p_utilizador_fk" value="{utilizador}" /><input type="hidden" name="p_utilizador_fk_desc" value="{utilizador_desc}" /></td><td><xsl:value-of select="assinatura_desc" /><input type="hidden" name="p_assinatura_fk" value="{assinatura}" /><input type="hidden" name="p_assinatura_fk_desc" value="{assinatura_desc}" /></td><td><xsl:value-of select="estado_desc" /><input type="hidden" name="p_estado_fk" value="{estado}" /><input type="hidden" name="p_estado_fk_desc" value="{estado_desc}" /></td><td align="center" width="15"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="ass_assinaturas_output"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>