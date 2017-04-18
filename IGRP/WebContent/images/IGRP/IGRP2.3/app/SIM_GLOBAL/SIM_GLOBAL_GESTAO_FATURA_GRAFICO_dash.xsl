<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <section class="content-header gen-container-item">
                    <h1>
                      <xsl:value-of select="rows/content/title"/>
                    </h1>
                  </section>
                  <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                  <xsl:if test="rows/content/grafico_divida">
                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="grafico_divida">
                      <xsl:call-template name="box-header">
                        <xsl:with-param name="title" select="rows/content/grafico_divida/@title"/>
                        <xsl:with-param name="collapsible" select="'true'"/>
                      </xsl:call-template>
                      <div class="box-body">
                        <xsl:call-template name="igrp-graph">
                          <xsl:with-param name="table" select="rows/content/grafico_divida"/>
                          <xsl:with-param name="chart_type" select="rows/content/grafico_divida/chart_type"/>
                          <xsl:with-param name="height" select="150"/>
                          <xsl:with-param name="title" select="rows/content/grafico_divida/caption"/>
                          <xsl:with-param name="url" select="rows/content/grafico_divida/url"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </xsl:if>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1484053507318"/>
</xsl:stylesheet>
