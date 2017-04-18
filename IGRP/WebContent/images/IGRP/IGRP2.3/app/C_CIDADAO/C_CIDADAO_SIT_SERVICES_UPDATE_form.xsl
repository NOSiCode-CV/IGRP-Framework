<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_SIT_SERVICES_UPDATE_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- SIT_SERVICES GESTAO SERVICOS UPDATE ACTUALIZAR -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/protocolo_ogc"/></span><select name="{rows/content/form/list/protocolo_ogc/@name}"><xsl:for-each select="rows/content/form/list/protocolo_ogc/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/descricao"/></span><textarea name="{rows/content/form/value/descricao/@name}" ><xsl:value-of select="rows/content/form/value/descricao"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/url"/></span><input type="text" name="{rows/content/form/value/url/@name}" value="{rows/content/form/value/url}" /></label><label><span><xsl:value-of select="rows/content/form/label/data"/></span><input type="date" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="IGRP_datepicker" /></label><label><span><xsl:value-of select="rows/content/form/label/cobertura_territorial"/></span><textarea name="{rows/content/form/value/cobertura_territorial/@name}" ><xsl:value-of select="rows/content/form/value/cobertura_territorial"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/info_tecnica"/></span><textarea name="{rows/content/form/value/info_tecnica/@name}" ><xsl:value-of select="rows/content/form/value/info_tecnica"/></textarea></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>