<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
        <!-- COLOR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
      </head>
      <body class="{$bodyClass}" has-menu="{$hasMenu}">
        <xsl:call-template name="IGRP-topmenu"/>
        <div class="container-fluid">
          <div class="row">
            <xsl:call-template name="IGRP-sidebar"/>
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
              <div class="content">
                <form>
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/form_1">
                          <div  class="box gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body">
                              <div role="form" gen-id="drop-zone">
                                <xsl:if  test="rows/content/form_1/fields/nome">
                                  <div  class="form-group col-md-6   gen-fields-holder" item-name="nome" item-type="text">
                                    <label for="{rows/content/form_1/fields/nome/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control" id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/e_mail">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="e_mail" item-type="email">
                                    <label for="{rows/content/form_1/fields/e_mail/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/e_mail/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/e_mail/value}" class="form-control" id="{rows/content/form_1/fields/e_mail/@name}" name="{rows/content/form_1/fields/e_mail/@name}">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/data_de_nascimento">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="data_de_nascimento" item-type="date">
                                    <label for="{rows/content/form_1/fields/data_de_nascimento/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/data_de_nascimento/label"/>
                                      </span>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/form_1/fields/data_de_nascimento/value}" class="form-control gen-date" id="form_1-data_de_nascimento" name="{rows/content/form_1/fields/data_de_nascimento/@name}" format="IGRP_datePicker"/>
                                      <span class="input-group-btn gen-date-icon">
                                        <span class="btn btn-default">
                                          <i class="fa fa-calendar"/>
                                        </span>
                                      </span>
                                    </div>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/table_1">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                              <xsl:with-param name="collapsible" select="'false'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                              <table id="table_1" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/table_1/fields/nome">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/e_mail">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/e_mail/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/estado">
                                      <th  align="left" class="color-th gen-fields-holder">
                                        <xsl:value-of select="rows/content/table_1/fields/estado/label"/>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:apply-templates mode="context-param" select="context-menu" /> 
                                      <xsl:if  test="nome">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                          <span class="lookup-parser"><xsl:value-of select="nome"/></span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="e_mail">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/e_mail/label}" class="email">
                                          <xsl:value-of select="e_mail"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="estado">
                                        <td  align="" data-row="{position()}" data-title="{../../label/estado}" class="color">
                                          <xsl:call-template name="tdcolor">
                                            <xsl:with-param name="color" select="estado"/>
                                          </xsl:call-template>
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
                </form>
              </div>
            </div>
          </div>
        </div>
        <xsl:call-template name="IGRP-bottom"/>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1459862789337"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1459862789337"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1459862789337"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1459862789337"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1459862789337"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1459862789337"/>
</xsl:stylesheet>
