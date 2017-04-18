<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_TESTE_IRENEU_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE_IRENEU MODULO EXEMPLO 1 IRENEU FORM FORM -->

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


		  <!--START FORM--><!--TAB MENU --><xsl:apply-templates mode="tab-menu" select="rows/content/menu" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nome"><label><span>(*) <xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="required" maxlength="100" /></label></xsl:if><xsl:if test="rows/content/form/label/nome_mae"><label><span><xsl:value-of select="rows/content/form/label/nome_mae"/></span><input type="text" name="{rows/content/form/value/nome_mae/@name}" value="{rows/content/form/value/nome_mae}"  class="" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/nome_pai"><label><span><xsl:value-of select="rows/content/form/label/nome_pai"/></span><input type="text" name="{rows/content/form/value/nome_pai/@name}" value="{rows/content/form/value/nome_pai}"  class="" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/sexo"><label><span>(*) <xsl:value-of select="rows/content/form/label/sexo"/></span><input type="checkbox" name="{rows/content/form/value/sexo/@name}" value="1"  class="required"><xsl:if test="rows/content/form/value/sexo='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label></xsl:if><xsl:if test="rows/content/form/label/num_bi"><label><span>(*) <xsl:value-of select="rows/content/form/label/num_bi"/></span><input type="text" name="{rows/content/form/value/num_bi/@name}" value="{rows/content/form/value/num_bi}"  class="required" maxlength="22" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_BI'" /><xsl:with-param name="name" select="rows/content/form/value/num_bi/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/num_bi" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/num_nif"><label><span><xsl:value-of select="rows/content/form/label/num_nif"/></span><input type="text" name="{rows/content/form/value/num_nif/@name}" value="{rows/content/form/value/num_nif}"  class="" maxlength="22" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_NIF'" /><xsl:with-param name="name" select="rows/content/form/value/num_nif/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/num_nif" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/data_nas"><label><span>(*) <xsl:value-of select="rows/content/form/label/data_nas"/></span><input type="date" name="{rows/content/form/value/data_nas/@name}" value="{rows/content/form/value/data_nas}" class="IGRP_datepicker required date" /></label></xsl:if><xsl:if test="rows/content/form/label/email"><label><span><xsl:value-of select="rows/content/form/label/email"/></span><input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"  class="email" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/morada"><label><span>(*) <xsl:value-of select="rows/content/form/label/morada"/></span><input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}"  class="required" maxlength="20" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_GEOG'" /><xsl:with-param name="name" select="rows/content/form/value/morada/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/morada" /></xsl:call-template></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120419"/>



</xsl:stylesheet>