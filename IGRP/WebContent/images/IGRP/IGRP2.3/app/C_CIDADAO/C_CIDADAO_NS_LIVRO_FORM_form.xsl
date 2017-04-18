<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_NS_LIVRO_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- NS_LIVRO  FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/id"/></span><input type="number" name="{rows/content/form/value/id/@name}" value="{rows/content/form/value/id}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/codigo"/></span><input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="" maxlength="10" /></label><label><span><xsl:value-of select="rows/content/form/label/descrisao"/></span><input type="text" name="{rows/content/form/value/descrisao/@name}" value="{rows/content/form/value/descrisao}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/dt_insercao"/></span><input type="date" name="{rows/content/form/value/dt_insercao/@name}" value="{rows/content/form/value/dt_insercao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/uti_insersao"/></span><input type="number" name="{rows/content/form/value/uti_insersao/@name}" value="{rows/content/form/value/uti_insersao}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/dt_actualizacao"/></span><input type="date" name="{rows/content/form/value/dt_actualizacao/@name}" value="{rows/content/form/value/dt_actualizacao}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/uti_actualizacao"/></span><input type="number" name="{rows/content/form/value/uti_actualizacao/@name}" value="{rows/content/form/value/uti_actualizacao}"  class="number" maxlength="22" /></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111125"/>



</xsl:stylesheet>