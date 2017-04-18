<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
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
                                    <div class="gen-column col-md-9">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/sectionheader_1">
                                          <section class="content-header gen-container-item " item-name="sectionheader_1">
                                            <h1>
                                              <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                                            </h1>
                                          </section>
                                        </xsl:if>
                                      </div>
                                    </div>
                                    <div class="gen-column col-md-3">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/toolsbar_1">
                                          <div class="toolsbar-holder gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="toolsbar_1">
                                            <div class="btns-holder   pull-right" role="group">
                                              <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"/>
                                            </div>
                                          </div>
                                        </xsl:if>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/paragraph_1">
                                          <div class="gen-container-item " item-name="paragraph_1">
                                            <div class="box-body">
                                              <p>
                                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                                              </p>
                                            </div>
                                          </div>
                                        </xsl:if>
                                        <xsl:if test="rows/content/form_1">
                                          <div class="box igrp-forms gen-container-item " item-name="form_1">
                                            <div class="box-body">
                                              <div role="form" gen-id="drop-zone">
                                                <xsl:if test="rows/content/form_1/fields/select">
                                                  <div class="col-md-3 form-group  gen-fields-holder" item-name="select" item-type="select">
                                                    <label for="{rows/content/form_1/fields/select/@name}">
                                                      <xsl:value-of select="rows/content/form_1/fields/select/label"/>
                                                    </label>
                                                    <select class="form-control select2 " id="form_1_select" name="{rows/content/form_1/fields/select/@name}">
                                                      <xsl:for-each select="rows/content/form_1/fields/select/list/option">
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
                                                <xsl:if test="rows/content/form_1/fields/text_1">
                                                  <div class="form-group col-md-3   gen-fields-holder" item-name="text_1" item-type="text">
                                                    <label for="{rows/content/form_1/fields/text_1/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/text_1/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="text" value="{rows/content/form_1/fields/text_1/value}" class="form-control" id="{rows/content/form_1/fields/text_1/@name}" name="{rows/content/form_1/fields/text_1/@name}" maxlength="30">
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1/fields/email_1">
                                                  <div class="form-group col-md-3   gen-fields-holder" item-name="email_1" item-type="email">
                                                    <label for="{rows/content/form_1/fields/email_1/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/email_1/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="email" value="{rows/content/form_1/fields/email_1/value}" class="form-control" id="{rows/content/form_1/fields/email_1/@name}" name="{rows/content/form_1/fields/email_1/@name}" maxlength="30">
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1/fields/date_1">
                                                  <div class="form-group col-md-3  gen-fields-holder" item-name="date_1" item-type="date">
                                                    <label for="{rows/content/form_1/fields/date_1/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/date_1/label"/>
                                                      </span>
                                                    </label>
                                                    <div class="input-group">
                                                      <input type="text" value="{rows/content/form_1/fields/date_1/value}" class="form-control gen-date" id="form_1-date_1" name="{rows/content/form_1/fields/date_1/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                      <span class="input-group-btn gen-date-icon">
                                                        <span class="btn btn-default">
                                                          <i class="fa fa-calendar"/>
                                                        </span>
                                                      </span>
                                                    </div>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1/fields/color_1">
                                                  <div class="form-group col-md-3  gen-fields-holder" item-name="color_1" item-type="color">
                                                    <label for="{rows/content/form_1/fields/color_1/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/color_1/label"/>
                                                      </span>
                                                    </label>
                                                    <div class="input-group form-color-picker" id="form_1_color_1_colorp">
                                                      <input type="text" value="{rows/content/form_1/fields/color_1/value}" format="hex" class="form-control" id="form_1_color_1" name="{rows/content/form_1/fields/color_1/@name}"/>
                                                      <span class="input-group-addon">
                                                        <i/>
                                                      </span>
                                                    </div>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1/fields/lookup_1">
                                                  <div class="form-group col-md-3  gen-fields-holder" item-name="lookup_1" item-type="lookup">
                                                    <label for="{rows/content/form_1/fields/lookup_1/@name}">
                                                      <xsl:value-of select="rows/content/form_1/fields/lookup_1/label"/>
                                                    </label>
                                                    <div class="input-group">
                                                      <input type="text" value="{rows/content/form_1/fields/lookup_1/value}" class="form-control gen-lookup" id="form_1_lookup_1" name="{rows/content/form_1/fields/lookup_1/@name}"/>
                                                      <xsl:call-template name="lookup-tool">
                                                        <xsl:with-param name="page" select="rows/page"/>
                                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                                        <xsl:with-param name="name" select="rows/content/form_1/fields/lookup_1/@name"/>
                                                        <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/lookup_1/lookup"/>
                                                        <xsl:with-param name="input-id" select="'form_1_lookup_1'"/>
                                                        <xsl:with-param name="btnClass" select="'default'"/>
                                                      </xsl:call-template>
                                                    </div>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1/fields/text">
                                                  <div class="form-group col-md-6   gen-fields-holder" item-name="text" item-type="text">
                                                    <label for="{rows/content/form_1/fields/text/@name}">
                                                      <span gen-lbl-setter="">
                                                        <xsl:value-of select="rows/content/form_1/fields/text/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="text" value="{rows/content/form_1/fields/text/value}" class="form-control" id="{rows/content/form_1/fields/text/@name}" name="{rows/content/form_1/fields/text/@name}" maxlength="30">
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                              </div>
                                            </div>
                                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                          </div>
                                        </xsl:if>
                                        <xsl:if test="rows/content/separatorlist_1">
                                          <div class="box gen-container-item " item-name="separatorlist_1">
                                            <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                              <div class="splist-form-holder">
                                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                                  <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="text_1" item-type="text">
                                                      <label for="{rows/content/separatorlist_1/fields/text_1/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_1/fields/text_1/value}" class="form-control" id="{rows/content/separatorlist_1/fields/text_1/@name}" name="{rows/content/separatorlist_1/fields/text_1/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="email_1" item-type="email">
                                                      <label for="{rows/content/separatorlist_1/fields/email_1/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="email" value="{rows/content/separatorlist_1/fields/email_1/value}" class="form-control" id="{rows/content/separatorlist_1/fields/email_1/@name}" name="{rows/content/separatorlist_1/fields/email_1/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/checkbox_1">
                                                    <div class="col-md-3  gen-fields-holder" item-name="checkbox_1" item-type="checkbox">
                                                      <div class="form-group">
                                                        <div class="checkbox form-check-offset">
                                                          <label>
                                                            <input type="checkbox" name="{rows/content/separatorlist_1/fields/checkbox_1/@name}" value="1" class="checkbox" label="{rows/content/separatorlist_1/fields/checkbox_1/label}">
                                                              <xsl:if test="rows/content/separatorlist_1/fields/checkbox_1/value = '1'">
                                                                <xsl:attribute name="checked">checked
                                                                </xsl:attribute>
                                                              </xsl:if>
                                                            </input>
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/checkbox_1/label"/>
                                                            </span>
                                                          </label>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </xsl:if>
                                                </div>
                                              </div>
                                              <div class="table-box box-body box-table-contents splist-table">
                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                  <thead>
                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                      <xsl:if test="rows/content/separatorlist_1/fields/text_1">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                          <th align="" item-name="text_1">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                          <th align="" item-name="email_1">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/checkbox_1">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/checkbox_1/@table='true'">
                                                          <th align="" item-name="checkbox_1">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/checkbox_1/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <th class="table-btn">
                                                        <span class="table-row-add btn">
                                                          <i class="fa fa-plus"/>
                                                        </span>
                                                      </th>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                      <tr gen-id="drop-zone" gen-field-template="td">
                                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                        <xsl:if test="text_1">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/text_1/@table='true'">
                                                              <td field="text_1" data-row="{position()}" data-title="{../../../fields/text_1/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="text_1_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_text_1_fk" value="{text_1}"/>
                                                                <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_text_1_fk" value="{text_1}"/>
                                                              <input type="hidden" name="p_text_1_fk_desc" value="{text_1_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="email_1">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                              <td field="email_1" data-row="{position()}" data-title="{../../../fields/email_1/label}" class="email">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="email_1_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_email_1_fk" value="{email_1}"/>
                                                                <input type="hidden" name="p_email_1_fk_desc" value="{email_1_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_email_1_fk" value="{email_1}"/>
                                                              <input type="hidden" name="p_email_1_fk_desc" value="{email_1_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="checkbox_1">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/checkbox_1/@table='true'">
                                                              <td field="checkbox_1" data-row="{position()}" data-title="{../../../fields/checkbox_1/label}" class="checkbox">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="checkbox_1_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_checkbox_1_fk" value="{checkbox_1}"/>
                                                                <input type="hidden" name="p_checkbox_1_fk_desc" value="{checkbox_1_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_checkbox_1_fk" value="{checkbox_1}"/>
                                                              <input type="hidden" name="p_checkbox_1_fk_desc" value="{checkbox_1_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <td data-row="{position()}" class="table-btn">
                                                          <span class="table-row-edit btn" rel="separatorlist_1">
                                                            <i class="fa fa-pencil"/>
                                                          </span>
                                                          <span class="table-row-remove btn" rel="separatorlist_1">
                                                            <i class="fa fa-times"/>
                                                          </span>
                                                        </td>
                                                      </tr>
                                                    </xsl:for-each>
                                                  </tbody>
                                                </table>
                                              </div>
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
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner"/>
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
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js">
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
        <!-- LOOKUP JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js">
        </script>
        <!-- RULES -->
        <script src="{$path}/js/IGRP.rules.class.js">
        </script>
        <script>
          $.IGRP.rules.set({"p_select":[{"name":"r1","event":"change","condition":"equal","value":"1","value2":"","patern":"","patern_custom":"","action":"hide","targets":"tab_item_2","procedure":"","msg_type":"","msg":"","opposite":"1"}]});
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1462901413393"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1462901413393"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1462901413393"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1462901413393"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1462901413394"/>
</xsl:stylesheet>
