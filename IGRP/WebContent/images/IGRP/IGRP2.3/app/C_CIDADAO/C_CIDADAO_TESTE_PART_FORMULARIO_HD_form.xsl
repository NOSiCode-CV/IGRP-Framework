<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_TESTE_PART_FORMULARIO_HD_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE_PART GESTAO PARTICIPANTES FORMULARIO_HD FORMULARIO_HD -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="required" maxlength="100" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/codigo"/></span><input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="required" maxlength="30" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/descricao"/></span><input type="text" name="{rows/content/form/value/descricao/@name}" value="{rows/content/form/value/descricao}"  class="required" maxlength="30" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/data_insercao"/></span><input type="date" name="{rows/content/form/value/data_insercao/@name}" value="{rows/content/form/value/data_insercao}" class="IGRP_datepicker required date" /></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111128"/>



</xsl:stylesheet>