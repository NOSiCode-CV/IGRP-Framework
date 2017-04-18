<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_TESTE_JP_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE_JP MODULO EXEMPLO 1 JP FORM FORM -->

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


		  <!--START FORM--><!--TAB MENU --><xsl:apply-templates mode="tab-menu" select="rows/content/menu" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nome"><label><span>(*) <xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="required" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/nome_pai"><label><span><xsl:value-of select="rows/content/form/label/nome_pai"/></span><input type="text" name="{rows/content/form/value/nome_pai/@name}" value="{rows/content/form/value/nome_pai}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/nome_mae"><label><span><xsl:value-of select="rows/content/form/label/nome_mae"/></span><input type="text" name="{rows/content/form/value/nome_mae/@name}" value="{rows/content/form/value/nome_mae}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/sexo"><label><span>(*) <xsl:value-of select="rows/content/form/label/sexo"/></span><select name="{rows/content/form/list/sexo/@name}" class="required"><xsl:for-each select="rows/content/form/list/sexo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/nr_bi"><label><span>(*) <xsl:value-of select="rows/content/form/label/nr_bi"/></span><input type="text" name="{rows/content/form/value/nr_bi/@name}" value="{rows/content/form/value/nr_bi}"  class="required" maxlength="8" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_BI'" /><xsl:with-param name="name" select="rows/content/form/value/nr_bi/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/nr_bi" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/nr_nif"><label><span><xsl:value-of select="rows/content/form/label/nr_nif"/></span><input type="text" name="{rows/content/form/value/nr_nif/@name}" value="{rows/content/form/value/nr_nif}"  class="" maxlength="9" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_NIF'" /><xsl:with-param name="name" select="rows/content/form/value/nr_nif/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/nr_nif" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/data_nasc"><label><span>(*) <xsl:value-of select="rows/content/form/label/data_nasc"/></span><input type="date" name="{rows/content/form/value/data_nasc/@name}" value="{rows/content/form/value/data_nasc}" class="IGRP_datepicker required date" /></label></xsl:if><xsl:if test="rows/content/form/label/email"><label><span><xsl:value-of select="rows/content/form/label/email"/></span><input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"  class="email" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/morada"><label><span><xsl:value-of select="rows/content/form/label/morada"/></span><input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}"  class="" maxlength="50" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_GEOG'" /><xsl:with-param name="name" select="rows/content/form/value/morada/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/morada" /></xsl:call-template></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120419"/>



</xsl:stylesheet>