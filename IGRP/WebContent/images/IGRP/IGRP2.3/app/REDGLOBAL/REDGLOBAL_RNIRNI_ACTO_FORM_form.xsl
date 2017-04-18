<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_RNIRNI_ACTO_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- RNI.RNI_ACTO TESTE RNI ACTO FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/rnits_id"/></span><input type="number" name="{rows/content/form/value/rnits_id/@name}" value="{rows/content/form/value/rnits_id}"  class="number" /></label><label><span><xsl:value-of select="rows/content/form/label/acto"/></span><input type="text" name="{rows/content/form/value/acto/@name}" value="{rows/content/form/value/acto}"  class="" /></label><label><span><xsl:value-of select="rows/content/form/label/tipo"/></span><input type="checkbox" name="{rows/content/form/value/tipo/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/tipo='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><label><span><xsl:value-of select="rows/content/form/label/codigo"/></span><input type="number" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="number" /></label><label><span><xsl:value-of select="rows/content/form/label/acto_id"/></span><input type="number" name="{rows/content/form/value/acto_id/@name}" value="{rows/content/form/value/acto_id}"  class="number" /></label><label><span><xsl:value-of select="rows/content/form/label/prazo_dias"/></span><input type="number" name="{rows/content/form/value/prazo_dias/@name}" value="{rows/content/form/value/prazo_dias}"  class="number" /></label><label><span><xsl:value-of select="rows/content/form/label/prazo_dias_pn"/></span><input type="number" name="{rows/content/form/value/prazo_dias_pn/@name}" value="{rows/content/form/value/prazo_dias_pn}"  class="number" /></label><label><span><xsl:value-of select="rows/content/form/label/prazo_dias_pd"/></span><input type="number" name="{rows/content/form/value/prazo_dias_pd/@name}" value="{rows/content/form/value/prazo_dias_pd}"  class="number" /></label><label><span><xsl:value-of select="rows/content/form/label/cancelar"/></span><input type="checkbox" name="{rows/content/form/value/cancelar/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/cancelar='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><label><span><xsl:value-of select="rows/content/form/label/fg_recibo"/></span><input type="checkbox" name="{rows/content/form/value/fg_recibo/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/fg_recibo='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><label><span><xsl:value-of select="rows/content/form/label/ex_geografia"/></span><input type="text" name="{rows/content/form/value/ex_geografia/@name}" value="{rows/content/form/value/ex_geografia}"  class="" /></label><label><span><xsl:value-of select="rows/content/form/label/rnio_id"/></span><input type="number" name="{rows/content/form/value/rnio_id/@name}" value="{rows/content/form/value/rnio_id}"  class="number" /></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>