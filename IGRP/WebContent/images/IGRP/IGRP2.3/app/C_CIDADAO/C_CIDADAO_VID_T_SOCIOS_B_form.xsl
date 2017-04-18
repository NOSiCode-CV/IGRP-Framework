<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_VID_T_SOCIOS_B_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- VID_T_SOCIOS GESTAO SOCIOS B ADICIONAR/EDITAR SOCIO -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nome"><label><span>(*) <xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="required" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/morada"><label><span>(*) <xsl:value-of select="rows/content/form/label/morada"/></span><input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}"  class="required" maxlength="250" /><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="'LOOKUP'" /><xsl:with-param name="action" select="'LOOKUP_GEOG'" /><xsl:with-param name="name" select="rows/content/form/value/morada/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/morada" /></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/foto"><label><span><xsl:value-of select="rows/content/form/label/foto"/></span><input type="file" name="{rows/content/form/value/foto/@name}" value="{rows/content/form/value/foto}"  class="" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/bi"><label><span><xsl:value-of select="rows/content/form/label/bi"/></span><input type="number" name="{rows/content/form/value/bi/@name}" value="{rows/content/form/value/bi}"  readonly="readonly"  class="number" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/nr_socio"><label><span>(*) <xsl:value-of select="rows/content/form/label/nr_socio"/></span><input type="number" name="{rows/content/form/value/nr_socio/@name}" value="{rows/content/form/value/nr_socio}"  class="required number" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/nif"><label><span><xsl:value-of select="rows/content/form/label/nif"/></span><input type="number" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}"  class="number" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/estado"><label><span>(*) <xsl:value-of select="rows/content/form/label/estado"/></span><xsl:for-each select="rows/content/form/list/estado/option"><input type="radio" name="{../@name}" value="{value}" class="required"><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="text"/></xsl:for-each></label></xsl:if><xsl:if test="rows/content/form/label/telefone"><label><span><xsl:value-of select="rows/content/form/label/telefone"/></span><input type="number" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}"  class="number" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/telemovel"><label><span><xsl:value-of select="rows/content/form/label/telemovel"/></span><input type="number" name="{rows/content/form/value/telemovel/@name}" value="{rows/content/form/value/telemovel}"  class="number" maxlength="30" /></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201204174"/>



</xsl:stylesheet>