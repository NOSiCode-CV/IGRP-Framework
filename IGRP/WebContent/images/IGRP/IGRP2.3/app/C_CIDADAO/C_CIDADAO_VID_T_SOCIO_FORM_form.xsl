<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_VID_T_SOCIO_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- VID_T_SOCIO TESTE RIZE  FORM FORM -->

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


		  <!--START FORM--><!--TAB MENU --><xsl:apply-templates mode="tab-menu" select="rows/content/menu" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nome"><label><span>(*) <xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="required" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/apelido"><label><span><xsl:value-of select="rows/content/form/label/apelido"/></span><input type="text" name="{rows/content/form/value/apelido/@name}" value="{rows/content/form/value/apelido}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/id_morada"><label><span>(*) <xsl:value-of select="rows/content/form/label/id_morada"/></span><input type="number" name="{rows/content/form/value/id_morada/@name}" value="{rows/content/form/value/id_morada}"  class="required number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/morada"><label><span>(*) <xsl:value-of select="rows/content/form/label/morada"/></span><input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}"  class="required" maxlength="250" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_GEOG'" /><xsl:with-param name="name" select="rows/content/form/value/morada/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/morada" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/foto_id"><label><span><xsl:value-of select="rows/content/form/label/foto_id"/></span><input type="number" name="{rows/content/form/value/foto_id/@name}" value="{rows/content/form/value/foto_id}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/nu_socio"><label><span><xsl:value-of select="rows/content/form/label/nu_socio"/></span><input type="number" name="{rows/content/form/value/nu_socio/@name}" value="{rows/content/form/value/nu_socio}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/estado"><label><span><xsl:value-of select="rows/content/form/label/estado"/></span><input type="number" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/nu_bi"><label><span><xsl:value-of select="rows/content/form/label/nu_bi"/></span><input type="text" name="{rows/content/form/value/nu_bi/@name}" value="{rows/content/form/value/nu_bi}"  class="" maxlength="20" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_BI'" /><xsl:with-param name="name" select="rows/content/form/value/nu_bi/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/nu_bi" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/nif"><label><span><xsl:value-of select="rows/content/form/label/nif"/></span><input type="text" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}"  class="" maxlength="22" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_NIF'" /><xsl:with-param name="name" select="rows/content/form/value/nif/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/nif" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/telefone"><label><span><xsl:value-of select="rows/content/form/label/telefone"/></span><input type="text" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/telemovel"><label><span><xsl:value-of select="rows/content/form/label/telemovel"/></span><input type="text" name="{rows/content/form/value/telemovel/@name}" value="{rows/content/form/value/telemovel}"  class="" maxlength="50" /></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120419"/>



</xsl:stylesheet>