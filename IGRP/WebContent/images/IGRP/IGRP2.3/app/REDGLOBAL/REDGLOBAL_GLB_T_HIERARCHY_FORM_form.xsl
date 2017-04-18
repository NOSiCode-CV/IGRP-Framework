<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_HIERARCHY_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

        <!-- GLB_T_HIERARCHY PESQUISA HIERARQUICA FORM FORM -->

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


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/code"><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"  class="required" maxlength="30"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/code" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/title"><label><span>(*) <xsl:value-of select="rows/content/form/label/title"/></span><input type="text" name="{rows/content/form/value/title/@name}" value="{rows/content/form/value/title}"  class="required" maxlength="100"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/title" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/view_name"><label><span>(*) <xsl:value-of select="rows/content/form/label/view_name"/></span><input type="text" name="{rows/content/form/value/view_name/@name}" value="{rows/content/form/value/view_name}"  class="required" maxlength="50"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/view_name" /></xsl:call-template></input></label></xsl:if></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120706"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20120706"/>

</xsl:stylesheet>