<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_3_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- TESTE TESTE AD-HOC 3 TESTE ZEGUI -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"  class="required" maxlength="100" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/email"/></span><input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"  class="required email" maxlength="80" /></label><label><span><xsl:value-of select="rows/content/form/label/pass_hash"/></span><input type="text" name="{rows/content/form/value/pass_hash/@name}" value="{rows/content/form/value/pass_hash}"  class="" maxlength="64" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/userprofile"/></span><input type="text" name="{rows/content/form/value/userprofile/@name}" value="{rows/content/form/value/userprofile}"  class="required" maxlength="20" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/valid_until"/></span><input type="date" name="{rows/content/form/value/valid_until/@name}" value="{rows/content/form/value/valid_until}" class="IGRP_datepicker required date" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/status"/></span><input type="text" name="{rows/content/form/value/status/@name}" value="{rows/content/form/value/status}"  class="required" maxlength="10" /></label><label><span><xsl:value-of select="rows/content/form/label/remarks"/></span><textarea name="{rows/content/form/value/remarks/@name}"  class=""><xsl:value-of select="rows/content/form/value/remarks"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/activation_key"/></span><input type="number" name="{rows/content/form/value/activation_key/@name}" value="{rows/content/form/value/activation_key}"  class="number" maxlength="22" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/user_name"/></span><input type="text" name="{rows/content/form/value/user_name/@name}" value="{rows/content/form/value/user_name}"  class="required" maxlength="50" /></label><label><span><xsl:value-of select="rows/content/form/label/photo_id"/></span><input type="number" name="{rows/content/form/value/photo_id/@name}" value="{rows/content/form/value/photo_id}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/signature_id"/></span><input type="number" name="{rows/content/form/value/signature_id/@name}" value="{rows/content/form/value/signature_id}"  class="number" maxlength="22" /></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=3"/>



</xsl:stylesheet>