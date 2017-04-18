<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_SA_SA_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- SA FORMACAO (SAMIRA) SA EDITAR / NOVO FILME (SAMIRA) -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/cod_imdb"><label><span>(*) <xsl:value-of select="rows/content/form/label/cod_imdb"/></span><input type="text" name="{rows/content/form/value/cod_imdb/@name}" value="{rows/content/form/value/cod_imdb}"  class="required" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/titulo"><label><span>(*) <xsl:value-of select="rows/content/form/label/titulo"/></span><textarea name="{rows/content/form/value/titulo/@name}"  class="required" maxlength="250"><xsl:value-of select="rows/content/form/value/titulo"/></textarea></label></xsl:if><xsl:if test="rows/content/form/label/ano_lancamento"><label><span>(*) <xsl:value-of select="rows/content/form/label/ano_lancamento"/></span><input type="date" name="{rows/content/form/value/ano_lancamento/@name}" value="{rows/content/form/value/ano_lancamento}" class="IGRP_datepicker required date" /></label></xsl:if><xsl:if test="rows/content/form/label/cod_barras"><label><span>(*) <xsl:value-of select="rows/content/form/label/cod_barras"/></span><input type="text" name="{rows/content/form/value/cod_barras/@name}" value="{rows/content/form/value/cod_barras}"  class="required" maxlength="10" /></label></xsl:if><xsl:if test="rows/content/form/label/capa"><label><span><xsl:value-of select="rows/content/form/label/capa"/></span><input type="file" name="{rows/content/form/value/capa/@name}" value="{rows/content/form/value/capa}"  class="" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/estado"><label><span><xsl:value-of select="rows/content/form/label/estado"/></span><select name="{rows/content/form/list/estado/@name}" class=""><xsl:for-each select="rows/content/form/list/estado/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/tipo_filme"><label><span><xsl:value-of select="rows/content/form/label/tipo_filme"/></span><select name="{rows/content/form/list/tipo_filme/@name}" class=""><xsl:for-each select="rows/content/form/list/tipo_filme/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201204276"/>



</xsl:stylesheet>