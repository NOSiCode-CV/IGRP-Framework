<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_GANT_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- TESTE TESTE AD-HOC GANT TESTE GANT -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"></form><xsl:if test="rows/content/teste_gante"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/teste_gante/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/teste_gante" /><xsl:with-param name="chart_type" select="rows/content/teste_gante/chart_type" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if><xsl:if test="rows/content/teste_2"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/teste_2/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/teste_2" /><xsl:with-param name="chart_type" select="rows/content/teste_2/chart_type" /><xsl:with-param name="width" select="254" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if><xsl:if test="rows/content/teste_3"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/teste_3/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/teste_3" /><xsl:with-param name="chart_type" select="rows/content/teste_3/chart_type" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2013090912"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2013090912"/>

</xsl:stylesheet>