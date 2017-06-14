<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_PROCESSOS_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROCESSOS PROCESSOS PROCESSOS ALTERAR PRIORIDADE TAREFA -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/actitp_name"/></span><input type="text" name="{rows/content/form/value/actitp_name/@name}" value="{rows/content/form/value/actitp_name}"  disabled="disabled"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/date_created"/></span><input type="date" name="{rows/content/form/value/date_created/@name}" value="{rows/content/form/value/date_created}" class="IGRP_datepicker  date"  disabled="disabled" /></label><label><span><xsl:value-of select="rows/content/form/label/date_started"/></span><input type="date" name="{rows/content/form/value/date_started/@name}" value="{rows/content/form/value/date_started}" class="IGRP_datepicker date"  disabled="disabled" /></label><label><span><xsl:value-of select="rows/content/form/label/date_ended"/></span><input type="date" name="{rows/content/form/value/date_ended/@name}" value="{rows/content/form/value/date_ended}" class="IGRP_datepicker date"  disabled="disabled" /></label><label><span><xsl:value-of select="rows/content/form/label/priority"/></span><input type="text" name="{rows/content/form/value/priority/@name}" value="{rows/content/form/value/priority}"  disabled="disabled"  class="" maxlength="1" /></label><label><span><xsl:value-of select="rows/content/form/label/user_assign_name"/></span><input type="text" name="{rows/content/form/value/user_assign_name/@name}" value="{rows/content/form/value/user_assign_name}"  disabled="disabled"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/user_name"/></span><input type="text" name="{rows/content/form/value/user_name/@name}" value="{rows/content/form/value/user_name}"  disabled="disabled"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/proc_num"/></span><input type="number" name="{rows/content/form/value/proc_num/@name}" value="{rows/content/form/value/proc_num}"  disabled="disabled"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/proctp_name"/></span><input type="text" name="{rows/content/form/value/proctp_name/@name}" value="{rows/content/form/value/proctp_name}"  disabled="disabled"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/proc_date_created"/></span><input type="date" name="{rows/content/form/value/proc_date_created/@name}" value="{rows/content/form/value/proc_date_created}" class="IGRP_datepicker  date"  disabled="disabled" /></label><label><span><xsl:value-of select="rows/content/form/label/proc_date_started"/></span><input type="date" name="{rows/content/form/value/proc_date_started/@name}" value="{rows/content/form/value/proc_date_started}" class="IGRP_datepicker date"  disabled="disabled" /></label><label><span><xsl:value-of select="rows/content/form/label/proc_date_ended"/></span><input type="date" name="{rows/content/form/value/proc_date_ended/@name}" value="{rows/content/form/value/proc_date_ended}" class="IGRP_datepicker date"  disabled="disabled" /></label><label><span><xsl:value-of select="rows/content/form/label/new_priority"/></span><select name="{rows/content/form/list/new_priority/@name}" class=""><xsl:for-each select="rows/content/form/list/new_priority/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/remarks"/></span><textarea name="{rows/content/form/value/remarks/@name}"  disabled="disabled"  class=""><xsl:value-of select="rows/content/form/value/remarks"/></textarea></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>