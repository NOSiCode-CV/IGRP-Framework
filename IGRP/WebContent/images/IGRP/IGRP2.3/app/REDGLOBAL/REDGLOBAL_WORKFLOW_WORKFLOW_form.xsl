<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_WORKFLOW_WORKFLOW_form.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    <!-- WORKFLOW WORKFLOW WORKFLOW WORKFLOW -->
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
      <!--START FORM-->
      <!--TOOL BAR-->
      <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
      
      <div class="box-content">
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
          <!--HIDDEN FIELDS-->
          <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
          
        </form>
      </div>
      <!--END FORM-->
    </div>
    <!-- END YOUR CODE HERE -->
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
</xsl:stylesheet>