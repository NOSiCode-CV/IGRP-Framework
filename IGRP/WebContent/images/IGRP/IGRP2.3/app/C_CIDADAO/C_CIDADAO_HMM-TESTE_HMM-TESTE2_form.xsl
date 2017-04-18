<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_HMM-TESTE_HMM-TESTE2_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
      <html>

        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>

         <body>

          <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>

        <!--CENTER PANE-->
        <div class="general">
        <div id="content">


         <!--HOME SIDE
        <xsl:call-template name="home-side"/> -->

        <div class="ui-layout-center">

        <xsl:call-template name="dialog-modal"/>
        <!-- END HOME TOP --><!-- HMM-TESTE HMM_NOTA ALUNO HMM-TESTE2 HMM_NOTA ALUNO -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/numero"><label><span>(*) <xsl:value-of select="rows/content/form/label/numero"/></span><input type="text" name="{rows/content/form/value/numero/@name}" value="{rows/content/form/value/numero}"   maxlength="10"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/numero" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/nota"><label><span>(*) <xsl:value-of select="rows/content/form/label/nota"/></span><input type="text" name="{rows/content/form/value/nota/@name}" value="{rows/content/form/value/nota}"   maxlength="30"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/nota" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/id_aluno"><label><span>(*) <xsl:value-of select="rows/content/form/label/id_aluno"/></span><input type="number" name="{rows/content/form/value/id_aluno/@name}" value="{rows/content/form/value/id_aluno}"   maxlength="30"  class="required number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/id_aluno" /></xsl:call-template></input></label></xsl:if></div><!--devo fachar div aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201305036"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201305036"/>

</xsl:stylesheet>