<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_EVENT_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- GLB_T_EVENT GESTAO EVENTOS FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/cat_fk"/></span><input type="number" name="{rows/content/form/value/cat_fk/@name}" value="{rows/content/form/value/cat_fk}"  class="required number" maxlength="22" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/start_time"/></span><input type="date" name="{rows/content/form/value/start_time/@name}" value="{rows/content/form/value/start_time}" class="IGRP_datepicker required date" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/end_time"/></span><input type="date" name="{rows/content/form/value/end_time/@name}" value="{rows/content/form/value/end_time}" class="IGRP_datepicker required date" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/dm_imp_level"/></span><textarea name="{rows/content/form/value/dm_imp_level/@name}"  class="required"><xsl:value-of select="rows/content/form/value/dm_imp_level"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/subject"/></span><textarea name="{rows/content/form/value/subject/@name}"  class=""><xsl:value-of select="rows/content/form/value/subject"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/location"/></span><textarea name="{rows/content/form/value/location/@name}"  class=""><xsl:value-of select="rows/content/form/value/location"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/dm_unid_time"/></span><textarea name="{rows/content/form/value/dm_unid_time/@name}"  class=""><xsl:value-of select="rows/content/form/value/dm_unid_time"/></textarea></label><label><span><xsl:value-of select="rows/content/form/label/reminder_time"/></span><input type="text" name="{rows/content/form/value/reminder_time/@name}" value="{rows/content/form/value/reminder_time}"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/dm_status"/></span><textarea name="{rows/content/form/value/dm_status/@name}"  class=""><xsl:value-of select="rows/content/form/value/dm_status"/></textarea></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>