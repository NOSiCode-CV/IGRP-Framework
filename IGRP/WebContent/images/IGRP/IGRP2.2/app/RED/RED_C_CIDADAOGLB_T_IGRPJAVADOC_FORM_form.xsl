<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/RED_C_CIDADAOGLB_T_IGRPJAVADOC_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- C_CIDADAO.GLB_T_IGRPJAVADOC IGRP JAVA DOC - ITENS FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/object_name"><label><span>(*) <xsl:value-of select="rows/content/form/label/object_name"/></span><input type="text" name="{rows/content/form/value/object_name/@name}" value="{rows/content/form/value/object_name}"  class="required" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/group_name"><label><span><xsl:value-of select="rows/content/form/label/group_name"/></span><input type="text" name="{rows/content/form/value/group_name/@name}" value="{rows/content/form/value/group_name}"  class="" maxlength="30" /></label></xsl:if><xsl:if test="rows/content/form/label/remarks"><label><span><xsl:value-of select="rows/content/form/label/remarks"/></span><textarea name="{rows/content/form/value/remarks/@name}"  class="" maxlength="4000"><xsl:value-of select="rows/content/form/value/remarks"/></textarea></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201207033"/>



</xsl:stylesheet>