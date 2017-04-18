<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
        <!-- COLOR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        <xsl:call-template name="IGRP-topmenu"/>
        <div class="container-fluid">
          <div class="row">
            <xsl:call-template name="IGRP-sidebar"/>
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
              <section class="content-header">
                <h1>
                  <xsl:value-of select="rows/content/title"/>
                </h1>
              </section>
              <div class="content">
                <div class="row">
                  <div class="gen-column col-md-12">
                    <div class="gen-inner">
                      <xsl:if  test="rows/content/toolsbar_1">
                        <div  class="toolsbar-holder gen-container-item" gen-structure="toolsbar" gen-fields=".btn-group a.btn">
                          <div class="btn-group pull-right" role="group">
                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"/>
                          </div>
                        </div>
                      </xsl:if>
                      <xsl:if  test="rows/content/table_2">
                        <div  class="box box-table-contents gen-container-item">
                          <div class="box-body table-box">
                            <xsl:apply-templates mode="table-legend" select="rows/content/table_2/table/legend_color"/>
                            <table id="table_2" class="table table-striped gen-data-table ">
                              <thead>
                                <tr gen-id="drop-zone" gen-field-template="th">
                                  <xsl:if  test="rows/content/table_2/fields/color_1">
                                    <th  align="left" class="color-th gen-fields-holder">
                                      <xsl:value-of select="rows/content/table_2/fields/color_1/label"/>
                                    </th>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/table_2/fields/text_1">
                                    <th  align="left" class=" gen-fields-holder">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/table_2/fields/text_1/label"/>
                                      </span>
                                    </th>
                                  </xsl:if>
                                </tr>
                              </thead>
                              <tbody>
                                <xsl:for-each select="rows/content/table_2/table/value/row">
                                  <tr gen-id="drop-zone">
                                    <xsl:if  test="color_1">
                                      <td  align="" data-row="{position()}" data-title="{../../label/color_1}" class="color">
                                        <xsl:call-template name="tdcolor">
                                          <xsl:with-param name="color" select="color_1"/>
                                        </xsl:call-template>
                                      </td>
                                    </xsl:if>
                                    <xsl:if  test="text_1">
                                      <td  align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                        <xsl:value-of select="text_1"/>
                                      </td>
                                    </xsl:if>
                                  </tr>
                                </xsl:for-each>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </xsl:if>
                      <xsl:if  test="rows/content/table_1">
                        <div  class="box box-table-contents gen-container-item">
                          <div class="box-body table-box">
                            <table id="table_1" class="table table-striped gen-data-table ">
                              <thead>
                                <tr gen-id="drop-zone" gen-field-template="th">
                                  <xsl:if  test="rows/content/table_1/fields/text_1">
                                    <th  align="left" class=" gen-fields-holder">
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
                                    <xsl:if  test="text_1">
                                      <td  align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                        <xsl:value-of select="text_1"/>
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
            </div>
          </div>
        </div>
        <xsl:call-template name="IGRP-bottom"/>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- TOOLSBAR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.min.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1459331781810"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1459331781810"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1459331781810"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1459331781810"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1459331781810"/>
</xsl:stylesheet>
