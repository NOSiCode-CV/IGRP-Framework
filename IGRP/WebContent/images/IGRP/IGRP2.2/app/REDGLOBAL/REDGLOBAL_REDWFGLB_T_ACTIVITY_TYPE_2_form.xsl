<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_ACTIVITY_TYPE_2_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- REDWF.GLB_T_ACTIVITY_TYPE GESTAO ETAPA 2 CONFIGURACAO EVENTO -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/processo"/></span><input type="text" name="{rows/content/form/value/processo/@name}" value="{rows/content/form/value/processo}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/codigo"/></span><input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/tipo_evento"/></span><select name="{rows/content/form/list/tipo_evento/@name}" class=""><xsl:for-each select="rows/content/form/list/tipo_evento/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/origem"/></span><input type="text" name="{rows/content/form/value/origem/@name}" value="{rows/content/form/value/origem}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/destino"/></span><input type="text" name="{rows/content/form/value/destino/@name}" value="{rows/content/form/value/destino}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/descricao"/></span><textarea name="{rows/content/form/value/descricao/@name}"  class=""><xsl:value-of select="rows/content/form/value/descricao"/></textarea></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/message" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/processo"/></span><select name="{rows/content/form/list/processo/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/form/list/processo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/eventoetapa"/></span><select name="{rows/content/form/list/eventoetapa/@name}" class=""><xsl:for-each select="rows/content/form/list/eventoetapa/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/timer" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/data"/></span><input type="date" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/unidade"/></span><select name="{rows/content/form/list/unidade/@name}" class=""><xsl:for-each select="rows/content/form/list/unidade/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/nr_tempo"/></span><input type="text" name="{rows/content/form/value/nr_tempo/@name}" value="{rows/content/form/value/nr_tempo}"  class="" maxlength="30" /></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>