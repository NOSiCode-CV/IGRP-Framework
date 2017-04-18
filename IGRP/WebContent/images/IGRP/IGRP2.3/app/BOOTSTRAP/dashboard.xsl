<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- FORMLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/formlist/includes/undefined"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <!-- COLOR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        <xsl:call-template name="IGRP-topmenu"/>
        <div class="container-fluid">
          <div class="row">
            <xsl:call-template name="IGRP-sidebar"/>
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
              <div class="content">
                <div class="row">
                  <div class="gen-column col-md-12">
                    <div class="gen-inner">
                      <xsl:if  test="rows/content/toolsbar_1">
                        <div  class="toolsbar-holder gen-container-item" gen-structure="toolsbar" gen-fields=".btns-holder a.btn">
                          <div class="btns-holder   pull-right" role="group">
                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"/>
                          </div>
                        </div>
                      </xsl:if>
                      <xsl:if  test="rows/content/sectionheader_1">
                        <section  class="content-header gen-container-item">
                          <h1>
                            <xsl:value-of select="rows/content/sectionheader_1"/>
                          </h1>
                        </section>
                      </xsl:if>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="gen-column col-md-4">
                    <div class="gen-inner">
                      <xsl:if  test="rows/content/chart_1">
                        <div  class="box gen-container-item" gen-structure="graphic">
                          <xsl:call-template name="box-header">
                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                            <xsl:with-param name="collapsible" select="'true'"/>
                          </xsl:call-template>
                          <div class="box-body">
                            <xsl:call-template name="igrp-graph">
                              <xsl:with-param name="table" select="rows/content/chart_1"/>
                              <xsl:with-param name="chart_type" select="'bar'"/>
                              <xsl:with-param name="height" select="'250'"/>
                              <xsl:with-param name="title" select="'Gráfico'"/>
                              <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                            </xsl:call-template>
                          </div>
                        </div>
                      </xsl:if>
                      <xsl:if  test="rows/content/chart_2">
                        <div  class="box gen-container-item" gen-structure="graphic">
                          <xsl:call-template name="box-header">
                            <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                            <xsl:with-param name="collapsible" select="'true'"/>
                          </xsl:call-template>
                          <div class="box-body">
                            <xsl:call-template name="igrp-graph">
                              <xsl:with-param name="table" select="rows/content/chart_2"/>
                              <xsl:with-param name="chart_type" select="'line'"/>
                              <xsl:with-param name="height" select="'200'"/>
                              <xsl:with-param name="title" select="'Gráfico 2'"/>
                              <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                            </xsl:call-template>
                          </div>
                        </div>
                      </xsl:if>
                    </div>
                  </div>
                  <div class="gen-column col-md-8">
                    <div class="gen-inner">
                      <xsl:if  test="rows/content/table_1">
                        <div  class="box box-table-contents gen-container-item">
                          <xsl:call-template name="box-header">
                            <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                            <xsl:with-param name="collapsible" select="'true'"/>
                          </xsl:call-template>
                          <div class="box-body table-box">
                            <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                            <table id="table_1" class="table table-striped gen-data-table ">
                              <thead>
                                <tr gen-id="drop-zone" gen-field-template="th">
                                  <xsl:if  test="rows/content/table_1/fields/color_1">
                                    <th  align="left" class="color-th gen-fields-holder">
                                      <xsl:value-of select="rows/content/table_1/fields/color_1/label"/>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/table_1/fields/link_1">
                                    <th  align="left" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/table_1/fields/link_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/table_1/fields/text_1">
                                    <th  align="left" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/table_1/fields/text_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/table_1/fields/password_1">
                                    <th  align="left" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/table_1/fields/password_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/table_1/table/value/row">
                                  <tr gen-id="drop-zone">
                                    <xsl:if  test="color_1">
                                      <td  align="" data-row="{position()}" data-title="{../../label/color_1}" class="color">
                                        <xsl:call-template name="tdcolor">
                                          <xsl:with-param name="color" select="color_1"/>
                                        </xsl:call-template>
                                      </td>
                                    </xsl:if>
                                    <xsl:if  test="link_1">
                                      <td  align="left" data-row="{position()}" data-title="{../../label/link_1}" class="link">
                                        <xsl:choose>
                                          <xsl:when test="link_1 != ''">
                                            <a href="{link_1}" class="link bClick" target="_blank" name="link_1">
                                              <xsl:value-of select="link_1_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <span>
                                              <xsl:value-of select="link_1_desc" disable-output-escaping="yes"/>
                                            </span>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                      </td>
                                    </xsl:if>
                                    <xsl:if  test="text_1">
                                      <td  align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                        <xsl:value-of select="text_1"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if  test="password_1">
                                      <td  align="left" data-row="{position()}" data-title="{../../fields/password_1/label}" class="password">
                                        <xsl:value-of select="password_1"/>
                                      </td>
                                    </xsl:if>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </xsl:if>
                      <xsl:if  test="rows/content/formlist_1">
                        <div  class="box box-table-contents gen-container-item">
                          <xsl:call-template name="box-header">
                            <xsl:with-param name="title" select="rows/content/formlist_1/@title"/>
                            <xsl:with-param name="collapsible" select="'true'"/>
                          </xsl:call-template>
                          <div class="box-body table-box">
                            <table id="formlist_1" class="table table-striped gen-data-table IGRP_formlist">
                              <thead>
                                <tr gen-id="drop-zone" gen-field-template="table.th">
                                  <xsl:if  test="rows/content/formlist_1/fields/email_1">
                                    <th  align="#[align]#" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/formlist_1/fields/email_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/formlist_1/fields/plaintext_1">
                                    <th  align="#[align]#" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/formlist_1/fields/plaintext_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/formlist_1/fields/password_1">
                                    <th  align="#[align]#" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/formlist_1/fields/password_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/formlist_1/fields/number_1">
                                    <th  align="#[align]#" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/formlist_1/fields/number_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/formlist_1/fields/text_1">
                                    <th  align="#[align]#" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/formlist_1/fields/text_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                  <tr gen-id="drop-zone">
                                    <xsl:if  test="email_1">
                                      <xsl:if  test="not(email_1/@visible)">
                                        <td align="#[align]#" data-row="{position()}" data-title="{../../fields/email_1/label}" class="email">
                                          <div class="form-group" item-name="email_1" item-type="email">
                                            <input type="hidden" name="p_email_1_fk_desc" value="{email_1_desc}"/>
                                            <input type="email" name="{../../fields/email_1/@name}_fk" value="{email_1}" class="email form-control" rel="F_formlist_1"/>
                                          </div>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if  test="plaintext_1">
                                      <xsl:if  test="not(plaintext_1/@visible)">
                                        <td align="#[align]#" data-row="{position()}" data-title="{../../fields/plaintext_1/label}" class="plaintext">
                                          <div class="form-group" item-name="plaintext_1" item-type="plaintext">
                                            <input type="hidden" name="p_plaintext_1_fk_desc" value="{plaintext_1_desc}"/>
                                            <input type="plaintext" name="{../../fields/plaintext_1/@name}_fk" value="{plaintext_1}" class="plaintext form-control" rel="F_formlist_1"/>
                                          </div>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if  test="password_1">
                                      <xsl:if  test="not(password_1/@visible)">
                                        <td align="#[align]#" data-row="{position()}" data-title="{../../fields/password_1/label}" class="password">
                                          <div class="form-group" item-name="password_1" item-type="password">
                                            <input type="hidden" name="p_password_1_fk_desc" value="{password_1_desc}"/>
                                            <input type="password" name="{../../fields/password_1/@name}_fk" value="{password_1}" class="password form-control" rel="F_formlist_1"/>
                                          </div>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if  test="number_1">
                                      <xsl:if  test="not(number_1/@visible)">
                                        <td align="#[align]#" data-row="{position()}" data-title="{../../fields/number_1/label}" class="number">
                                          <div class="form-group" item-name="number_1" item-type="number">
                                            <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}"/>
                                            <input type="number" name="{../../fields/number_1/@name}_fk" value="{number_1}" class="number form-control" rel="F_formlist_1"/>
                                          </div>
                                        </td>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if  test="text_1">
                                      <xsl:if  test="not(text_1/@visible)">
                                        <td align="#[align]#" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                          <div class="form-group" item-name="text_1" item-type="text">
                                            <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                            <input type="text" name="{../../fields/text_1/@name}_fk" value="{text_1}" class="text form-control" rel="F_formlist_1"/>
                                          </div>
                                        </td>
                                      </xsl:if>
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
            </div>
          </div>
        </div>
        <xsl:call-template name="IGRP-bottom"/>
        <!-- FORMLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/formlist/includes/undefined">
        </script>
        <!-- CHART JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/highcharts-more.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/exporting.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/funnel.js">
        </script>
        <!-- TOOLSBAR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.min.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1459686712258"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1459686712258"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1459686712258"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1459686712258"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1459686712258"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1459686712259"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1459686712259"/>
</xsl:stylesheet>
