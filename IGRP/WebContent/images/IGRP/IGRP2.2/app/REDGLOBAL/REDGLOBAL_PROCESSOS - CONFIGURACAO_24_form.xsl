<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS - CONFIGURACAO_24_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS - CONFIGURACAO CONFIGURACAO PROCESSOS 24 DOC PROCESSO -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/objectivo"/></span><input type="text" name="{rows/content/form/value/objectivo/@name}" value="{rows/content/form/value/objectivo}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/descricao"/></span><input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/dono_processo"/></span><input type="text" name="{rows/content/form/value/dono_processo/@name}" value="{rows/content/form/value/dono_processo}"  class="" maxlength="30" /></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/organicas_intervenientes" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'organicas_intervenientes'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/organica"/></span><select name="{rows/content/form/list/organica/@name}" rel="F_organicas_intervenientes"  class=""><xsl:for-each select="rows/content/form/list/organica/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_organicas_intervenientes"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/organicas_intervenientes/label/organica"/></th><th align="center" width="15"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/organicas_intervenientes/value/row"><tr><td><xsl:value-of select="organica_desc" /><input type="hidden" name="p_organica_fk" value="{organica}" /><input type="hidden" name="p_organica_fk_desc" value="{organica_desc}" /></td><td align="center" width="15"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="organicas_intervenientes"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>