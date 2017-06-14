<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_COMPONENT_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><xsl:call-template name="home-top-inc"/>

        <!-- REDWF.GLB_T_COMPONENT COMPONENTES FORM FORM -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/code"><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"   maxlength="20"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/code" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/name"><label><span>(*) <xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"   maxlength="100"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/name" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/proc_name"><label><span>(*) <xsl:value-of select="rows/content/form/label/proc_name"/></span><input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}"   maxlength="200"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/proc_name" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/proc_name_db"><label><span>(*) <xsl:value-of select="rows/content/form/label/proc_name_db"/></span><input type="text" name="{rows/content/form/value/proc_name_db/@name}" value="{rows/content/form/value/proc_name_db}"   maxlength="200"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/proc_name_db" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/env_fk"><label><span>(*) <xsl:value-of select="rows/content/form/label/env_fk"/></span><select name="{rows/content/form/list/env_fk/@name}" class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/form/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2012071912"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2012071912"/>

</xsl:stylesheet>