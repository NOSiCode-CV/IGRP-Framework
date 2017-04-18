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
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
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
                        <xsl:if  test="rows/content/paragraph_1">
                          <div  class="gen-container-item " item-name="paragraph_1">
                            <div class="box-body">
                              <p>
                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                              </p>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/form_1">
                          <div  class="box igrp-forms gen-container-item " item-name="form_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body">
                              <div role="form" gen-id="drop-zone">
                                <xsl:if  test="rows/content/form_1/fields/text">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="text" item-type="text">
                                    <label for="{rows/content/form_1/fields/text/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/text/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/text/value}" class="form-control" id="{rows/content/form_1/fields/text/@name}" name="{rows/content/form_1/fields/text/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/select_1">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="select_1" item-type="select">
                                    <label for="{rows/content/form_1/fields/select_1/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/select_1/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_select_1" name="{rows/content/form_1/fields/select_1/@name}">
                                      <xsl:for-each select="rows/content/form_1/fields/select_1/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/date">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="date" item-type="date">
                                    <label for="{rows/content/form_1/fields/date/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/date/label"/>
                                      </span>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/form_1/fields/date/value}" class="form-control gen-date" id="form_1-date" name="{rows/content/form_1/fields/date/@name}" format="IGRP_datePicker" maxlength="30"/>
                                      <span class="input-group-btn gen-date-icon">
                                        <span class="btn btn-default">
                                          <i class="fa fa-calendar"/>
                                        </span>
                                      </span>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/form_1/fields/email_1">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="email_1" item-type="email">
                                    <label for="{rows/content/form_1/fields/email_1/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/form_1/fields/email_1/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/email_1/value}" class="form-control" id="{rows/content/form_1/fields/email_1/@name}" name="{rows/content/form_1/fields/email_1/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/table_1">
                          <div  class="box box-table-contents gen-container-item " item-name="table_1">
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                              <table id="table_1" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/table_1/fields/color_1">
                                      <th  align="left" class="color-th gen-fields-holder" item-name="color_1">
                                        <xsl:value-of select="rows/content/table_1/fields/color_1/label"/>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/text_1">
                                      <th  align="left" class=" gen-fields-holder" item-name="text_1">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/text_1/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/textarea_1">
                                      <th  align="left" class=" gen-fields-holder" item-name="textarea_1">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/textarea_1/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/link_1">
                                      <th  align="left" class=" gen-fields-holder" item-name="link_1">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/link_1/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/number_1">
                                      <th  align="left" class=" gen-fields-holder" item-name="number_1">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/number_1/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/table_1/fields/radio_1">
                                      <th  class="bs-checkbox gen-fields-holder" align="center" item-name="radio_1">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/table_1/fields/radio_1/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:apply-templates mode="context-param" select="context-menu"/> 
                                      <xsl:if  test="color_1">
                                        <td  align="" data-row="{position()}" data-title="{../../label/color_1}" class="color" item-name="color_1">
                                          <xsl:call-template name="tdcolor">
                                            <xsl:with-param name="color" select="color_1"/>
                                          </xsl:call-template>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="text_1">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text" item-name="text_1">
                                          <span class="">
                                            <xsl:value-of select="text_1"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="textarea_1">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/textarea_1/label}" class="textarea" item-name="textarea_1">
                                          <span class="">
                                            <xsl:value-of select="textarea_1"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="link_1">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/link_1}" class="link" item-name="link_1">
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
                                      <xsl:if  test="number_1">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/number_1/label}" class="number" item-name="number_1">
                                          <span class="">
                                            <xsl:value-of select="number_1"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="radio_1">
                                        <td  align="" data-row="{position()}" data-title="{../../label/radio_1}" class="bs-checkbox" item-name="radio_1">
                                          <xsl:if test="radio_1 != '-0'">
                                            <input type="radio" name="p_radio_1" value="{radio_1}">
                                              <xsl:if test="radio_1_check=radio_1">
                                                <xsl:attribute name="checked">checked
                                                </xsl:attribute>
                                              </xsl:if>
                                            </input>
                                          </xsl:if>
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
        </form>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js">
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
        <!-- RULES -->
        <script src="{$path}/js/IGRP.rules.class.js">
        </script>
        <script>
          $.IGRP.rules.set({"p_text":[{"name":"r","event":"change","condition":"endwith","value":"HID","value2":"","patern":"","patern_custom":"","action":"hide","targets":"select_1,date,email_1","procedure":"","msg_type":"","msg":"","opposite":"1"}],"p_date":[{"name":"r1","event":"change","condition":"between","value":"01/05/2016","value2":"05/05/2016","patern":"","patern_custom":"","action":"hide","targets":"email_1","procedure":"","msg_type":"","msg":"","opposite":"1"}]});
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1462141470840"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1462141470840"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1462141470840"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1462141470840"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1462141470841"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1462141470841"/>
</xsl:stylesheet>
