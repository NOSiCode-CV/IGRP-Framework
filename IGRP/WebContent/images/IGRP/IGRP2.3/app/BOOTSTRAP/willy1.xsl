<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- COLOR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
        <style>
        </style>
      </head>
      <body class="{$bodyClass}">
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/sectionheader_1">
                          <section  class="content-header gen-container-item " item-name="sectionheader_1">
                            <h1>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                            </h1>
                          </section>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/paragraph_1">
                          <div  class="gen-container-item " item-name="paragraph_1">
                            <div class="box-body">
                              <p>
                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                              </p>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/tabcontent_1">
                          <div  class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" item-name="tabcontent_1">
                            <ul class="nav nav-tabs">
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_1']">
                                <li item-name="tab_item_1" class="active gen-fields-holder" rel="tab-tabcontent_1-tab_item_1">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_1">
                                    <i class="fa fa-dot-circle-o"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab_item_1']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_2']">
                                <li item-name="tab_item_2" class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_2">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_2">
                                    <i class="fa fa-dot-circle-o"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab_item_2']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                            </ul>
                            <div class="tab-content">
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_1']">
                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-tab_item_1" rel="tab-tabcontent_1-tab_item_1">
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/form_1">
                                          <div class="box igrp-forms gen-container-item " item-name="form_1">
                                            <div class="box-body">
                                              <div role="form" gen-id="drop-zone">
                                                <xsl:if test="rows/content/form_1/fields/text">
                                                  <div class="form-group col-md-3   gen-fields-holder" item-name="text" item-type="text">
                                                    <label for="{rows/content/form_1/fields/text/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/text/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="text" value="{rows/content/form_1/fields/text/value}" class="form-control" id="{rows/content/form_1/fields/text/@name}" name="{rows/content/form_1/fields/text/@name}" maxlength="30">
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1/fields/password_1">
                                                  <div class="form-group col-md-3   gen-fields-holder" item-name="password_1" item-type="password">
                                                    <label for="{rows/content/form_1/fields/password_1/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/password_1/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="password" value="{rows/content/form_1/fields/password_1/value}" class="form-control" id="{rows/content/form_1/fields/password_1/@name}" name="{rows/content/form_1/fields/password_1/@name}" maxlength="30">
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                              </div>
                                            </div>
                                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                          </div>
                                        </xsl:if>
                                        <xsl:if test="rows/content/table_1">
                                          <div class="box box-table-contents gen-container-item " item-name="table_1">
                                            <div class="box-body table-box">
                                              <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                                              <table id="table_1" class="table table-striped gen-data-table ">
                                                <thead>
                                                  <tr gen-id="drop-zone" gen-field-template="th">
                                                    <xsl:if test="rows/content/table_1/fields/color_1">
                                                      <th align="left" class="color-th gen-fields-holder">
                                                        <xsl:value-of select="rows/content/table_1/fields/color_1/label"/>
                                                      </th>
                                                    </xsl:if>
                                                    <xsl:if test="rows/content/table_1/fields/text_1">
                                                      <th align="left" class=" gen-fields-holder">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/table_1/fields/text_1/label"/>
                                                        </span>
                                                      </th>
                                                    </xsl:if>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                                    <tr gen-id="drop-zone">
                                                      <xsl:if test="color_1">
                                                        <td align="" data-row="{position()}" data-title="{../../label/color_1}" class="color">
                                                          <xsl:call-template name="tdcolor">
                                                            <xsl:with-param name="color" select="color_1"/>
                                                          </xsl:call-template>
                                                        </td>
                                                      </xsl:if>
                                                      <xsl:if test="text_1">
                                                        <td align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                                          <span class="">
                                                            <xsl:value-of select="text_1"/>
                                                          </span>
                                                        </td>
                                                      </xsl:if>
                                                    </tr>
                                                  </xsl:for-each>
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </xsl:if>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab_item_2']">
                                <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_2" rel="tab-tabcontent_1-tab_item_2">
                                  <div class="row">
                                    <div class="gen-column col-md-4">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/chart_1">
                                          <div class="box gen-container-item " gen-structure="graphic" item-name="chart_1">
                                            <xsl:call-template name="box-header">
                                              <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                              <xsl:with-param name="collapsible" select="'true'"/>
                                            </xsl:call-template>
                                            <div class="box-body">
                                              <xsl:call-template name="igrp-graph">
                                                <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                <xsl:with-param name="chart_type" select="'stackedpercentarea'"/>
                                                <xsl:with-param name="height" select="'250'"/>
                                                <xsl:with-param name="title" select="'Chart'"/>
                                                <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                              </xsl:call-template>
                                            </div>
                                          </div>
                                        </xsl:if>
                                      </div>
                                    </div>
                                    <div class="gen-column col-md-4">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/chart_2">
                                          <div class="box gen-container-item " gen-structure="graphic" item-name="chart_2">
                                            <xsl:call-template name="box-header">
                                              <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                                              <xsl:with-param name="collapsible" select="'true'"/>
                                            </xsl:call-template>
                                            <div class="box-body">
                                              <xsl:call-template name="igrp-graph">
                                                <xsl:with-param name="table" select="rows/content/chart_2"/>
                                                <xsl:with-param name="chart_type" select="'stackedcolumn'"/>
                                                <xsl:with-param name="height" select="'250'"/>
                                                <xsl:with-param name="title" select="'Chart'"/>
                                                <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                                              </xsl:call-template>
                                            </div>
                                          </div>
                                        </xsl:if>
                                      </div>
                                    </div>
                                    <div class="gen-column col-md-4">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/chart_3">
                                          <div class="box gen-container-item " gen-structure="graphic" item-name="chart_3">
                                            <xsl:call-template name="box-header">
                                              <xsl:with-param name="title" select="rows/content/chart_3/@title"/>
                                              <xsl:with-param name="collapsible" select="'true'"/>
                                            </xsl:call-template>
                                            <div class="box-body">
                                              <xsl:call-template name="igrp-graph">
                                                <xsl:with-param name="table" select="rows/content/chart_3"/>
                                                <xsl:with-param name="chart_type" select="'pie'"/>
                                                <xsl:with-param name="height" select="'250'"/>
                                                <xsl:with-param name="title" select="'Chart'"/>
                                                <xsl:with-param name="url" select="rows/content/chart_3/url"/>
                                              </xsl:call-template>
                                            </div>
                                          </div>
                                        </xsl:if>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </xsl:if>
                            </div>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <!-- TABCONTENT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- CHART JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js">
        </script>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js">
        </script>
        <!-- RULES -->
        <script src="{$path}/js/IGRP.rules.class.js">
        </script>
        <script>
          $.IGRP.rules.set({"p_text":[{"name":"Rule1","event":"keyup","condition":"contains","value":"Helio","value2":"","patern":"","patern_custom":"","action":"hide","targets":"chart_3","procedure":"","msg_type":"","msg":"","opposite":"1"}]});
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1469186808415"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1469186808415"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1469186808415"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1469186808415"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1469186808416"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1469186808416"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1469186808416"/>
</xsl:stylesheet>
