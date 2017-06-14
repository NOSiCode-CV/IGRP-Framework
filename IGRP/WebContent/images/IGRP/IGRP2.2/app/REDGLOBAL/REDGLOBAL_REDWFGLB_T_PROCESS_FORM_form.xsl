<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_PROCESS_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- REDWF.GLB_T_PROCESS NOME A DRECREVER FUNCIONALIDADE FORM FORM -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/proc_tp_fk"><label><span>(*) <xsl:value-of select="rows/content/form/label/proc_tp_fk"/></span><select name="{rows/content/form/list/proc_tp_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/proc_tp_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/acti_call_fk"><label><span><xsl:value-of select="rows/content/form/label/acti_call_fk"/></span><input type="number" name="{rows/content/form/value/acti_call_fk/@name}" value="{rows/content/form/value/acti_call_fk}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/user_fk"><label><span><xsl:value-of select="rows/content/form/label/user_fk"/></span><input type="number" name="{rows/content/form/value/user_fk/@name}" value="{rows/content/form/value/user_fk}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/date_created"><label><span>(*) <xsl:value-of select="rows/content/form/label/date_created"/></span><input type="date" name="{rows/content/form/value/date_created/@name}" value="{rows/content/form/value/date_created}" class="IGRP_datepicker required date" /></label></xsl:if><xsl:if test="rows/content/form/label/date_started"><label><span><xsl:value-of select="rows/content/form/label/date_started"/></span><input type="date" name="{rows/content/form/value/date_started/@name}" value="{rows/content/form/value/date_started}" class="IGRP_datepicker date" /></label></xsl:if><xsl:if test="rows/content/form/label/date_ended"><label><span><xsl:value-of select="rows/content/form/label/date_ended"/></span><input type="date" name="{rows/content/form/value/date_ended/@name}" value="{rows/content/form/value/date_ended}" class="IGRP_datepicker date" /></label></xsl:if><xsl:if test="rows/content/form/label/status"><label><span>(*) <xsl:value-of select="rows/content/form/label/status"/></span><input type="checkbox" name="{rows/content/form/value/status/@name}" value="1"  class="required"><xsl:if test="rows/content/form/value/status='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label></xsl:if><xsl:if test="rows/content/form/label/remarks"><label><span><xsl:value-of select="rows/content/form/label/remarks"/></span><textarea name="{rows/content/form/value/remarks/@name}"  class=""><xsl:value-of select="rows/content/form/value/remarks"/></textarea></label></xsl:if><xsl:if test="rows/content/form/label/num"><label><span><xsl:value-of select="rows/content/form/label/num"/></span><input type="number" name="{rows/content/form/value/num/@name}" value="{rows/content/form/value/num}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/search"><label><span><xsl:value-of select="rows/content/form/label/search"/></span><textarea name="{rows/content/form/value/search/@name}"  class=""><xsl:value-of select="rows/content/form/value/search"/></textarea></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120216"/>



</xsl:stylesheet>