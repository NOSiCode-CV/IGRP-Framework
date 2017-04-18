<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_TESTE_ADILSON_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE_ADILSON TESTE_VARELA FORM FORM -->

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


		  <!--START FORM--><!--TAB MENU --><xsl:apply-templates mode="tab-menu" select="rows/content/menu" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/nom_mae"><label><span><xsl:value-of select="rows/content/form/label/nom_mae"/></span><input type="text" name="{rows/content/form/value/nom_mae/@name}" value="{rows/content/form/value/nom_mae}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/nom_pai"><label><span><xsl:value-of select="rows/content/form/label/nom_pai"/></span><input type="text" name="{rows/content/form/value/nom_pai/@name}" value="{rows/content/form/value/nom_pai}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/data"><label><span><xsl:value-of select="rows/content/form/label/data"/></span><input type="date" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="IGRP_datepicker date" /></label></xsl:if><xsl:if test="rows/content/form/label/sexo"><label><span><xsl:value-of select="rows/content/form/label/sexo"/></span><input type="text" name="{rows/content/form/value/sexo/@name}" value="{rows/content/form/value/sexo}"  class="" maxlength="2" /></label></xsl:if><xsl:if test="rows/content/form/label/nome"><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="50" /></label></xsl:if><xsl:if test="rows/content/form/label/num"><label><span><xsl:value-of select="rows/content/form/label/num"/></span><input type="number" name="{rows/content/form/value/num/@name}" value="{rows/content/form/value/num}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/email"><label><span><xsl:value-of select="rows/content/form/label/email"/></span><input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"  class="email" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/morada"><label><span><xsl:value-of select="rows/content/form/label/morada"/></span><input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}"  class="" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/bi"><label><span><xsl:value-of select="rows/content/form/label/bi"/></span><input type="number" name="{rows/content/form/value/bi/@name}" value="{rows/content/form/value/bi}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/nif"><label><span><xsl:value-of select="rows/content/form/label/nif"/></span><input type="number" name="{rows/content/form/value/nif/@name}" value="{rows/content/form/value/nif}"  class="number" maxlength="22" /></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120419"/>



</xsl:stylesheet>