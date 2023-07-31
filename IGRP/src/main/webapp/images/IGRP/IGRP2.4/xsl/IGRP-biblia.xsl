<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/>
        <!-- FORMLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css?v={$version}"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
        <!-- QUICKBUTTONBOX CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/quickbuttonbox/quickbuttonbox.css?v={$version}"/>
        <!-- TREEMENU CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/treemenu/treemenu.css?v={$version}"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/table-colors.css?v={$version}"/>
        <!-- STATBOX CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css?v={$version}"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css?v={$version}"/>
        <!-- MAPCHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/highmaps/highmap.css?v={$version}"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css?v={$version}"/>
        <!-- COLOR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css?v={$version}"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
        <!-- RANGE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/bs.range/css/bootstrap.slider.min.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/bs.range/css/igrp.slider.css?v={$version}"/>
        <style/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                      </div>
                    </div>
                  </div>
                  <div class="row" id="row-d20421a3">
                    <div class="gen-column col-sm-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/sectionheader_1">
                          <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                            <h2>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                            </h2>
                          </section>
                        </xsl:if>
                        <xsl:if test="rows/content/paragraph_1">
                          <div class="gen-container-item " gen-class="" item-name="paragraph_1">
                            <div class="box-body">
                              <p>
                                <xsl:value-of select="rows/content/paragraph_1/fields/paragraph_1_text/value"/>
                              </p>
                            </div>
                          </div>
                        </xsl:if>
                        <div class="gen-tab-holder nav-tabs-custom   auto-control gen-container-item " tab-template="clean" gen-class="" item-name="tabcontent_1">
                          <ul class="nav nav-tabs">
                            <xsl:if test="rows/content/tabcontent_1/fields/forms">
                              <li item-name="forms" class="active gen-fields-holder" rel="tab-tabcontent_1-forms">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/forms/value"/>
                                </xsl:call-template>
                                <a data-toggle="tab" active-text-color="primary" aria-expanded="true" href="#tab-tabcontent_1-forms">
                                  <i class="fa fa-wpforms"/>
                                  <span>
                                    <xsl:value-of select="rows/content/tabcontent_1/fields/forms/label"/>
                                  </span>
                                </a>
                              </li>
                            </xsl:if>
                            <xsl:if test="rows/content/tabcontent_1/fields/buttons">
                              <li item-name="buttons" class=" gen-fields-holder" rel="tab-tabcontent_1-buttons">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/buttons/value"/>
                                </xsl:call-template>
                                <a data-toggle="tab" active-text-color="primary" aria-expanded="true" href="#tab-tabcontent_1-buttons">
                                  <i class="fa fa-angle-right"/>
                                  <span>
                                    <xsl:value-of select="rows/content/tabcontent_1/fields/buttons/label"/>
                                  </span>
                                </a>
                              </li>
                            </xsl:if>
                            <xsl:if test="rows/content/tabcontent_1/fields/tables">
                              <li item-name="tables" class=" gen-fields-holder" rel="tab-tabcontent_1-tables">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/tables/value"/>
                                </xsl:call-template>
                                <a data-toggle="tab" active-text-color="primary" aria-expanded="true" href="#tab-tabcontent_1-tables">
                                  <i class="fa fa-list-alt"/>
                                  <span>
                                    <xsl:value-of select="rows/content/tabcontent_1/fields/tables/label"/>
                                  </span>
                                </a>
                              </li>
                            </xsl:if>
                            <xsl:if test="rows/content/tabcontent_1/fields/charts">
                              <li item-name="charts" class=" gen-fields-holder" rel="tab-tabcontent_1-charts">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/charts/value"/>
                                </xsl:call-template>
                                <a data-toggle="tab" active-text-color="primary" aria-expanded="true" href="#tab-tabcontent_1-charts">
                                  <i class="fa fa-bar-chart-o"/>
                                  <span>
                                    <xsl:value-of select="rows/content/tabcontent_1/fields/charts/label"/>
                                  </span>
                                </a>
                              </li>
                            </xsl:if>
                            <xsl:if test="rows/content/tabcontent_1/fields/others">
                              <li item-name="others" class=" gen-fields-holder" rel="tab-tabcontent_1-others">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/others/value"/>
                                </xsl:call-template>
                                <a data-toggle="tab" active-text-color="primary" aria-expanded="true" href="#tab-tabcontent_1-others">
                                  <i class="fa fa-cubes"/>
                                  <span>
                                    <xsl:value-of select="rows/content/tabcontent_1/fields/others/label"/>
                                  </span>
                                </a>
                              </li>
                            </xsl:if>
                          </ul>
                          <div class="tab-content">
                            <xsl:if test="rows/content/tabcontent_1/fields/forms">
                              <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-forms" rel="tab-tabcontent_1-forms">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/forms/value"/>
                                  <xsl:with-param name="class" select="'tab-pane'"/>
                                </xsl:call-template>
                                <div class="row" id="row-6b9614b2">
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/form_1">
                                        <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body">
                                            <div role="form">
                                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                              <xsl:if test="rows/content/form_1/fields/email_1">
                                                <div class="form-group col-sm-6   gen-fields-holder" item-name="email_1" item-type="email">
                                                  <label for="{rows/content/form_1/fields/email_1/@name}">
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_1/fields/email_1/label"/>
                                                    </span>
                                                  </label>
                                                  <input type="email" value="{rows/content/form_1/fields/email_1/value}" class="form-control " id="{rows/content/form_1/fields/email_1/@name}" name="{rows/content/form_1/fields/email_1/@name}" maxlength="30" placeholder="">
                                                    <xsl:call-template name="setAttributes">
                                                      <xsl:with-param name="field" select="rows/content/form_1/fields/email_1"/>
                                                    </xsl:call-template>
                                                  </input>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/text_1">
                                                <div class="form-group col-sm-6   gen-fields-holder" item-name="text_1" item-type="text">
                                                  <label for="{rows/content/form_1/fields/text_1/@name}">
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_1/fields/text_1/label"/>
                                                    </span>
                                                  </label>
                                                  <input type="text" value="{rows/content/form_1/fields/text_1/value}" class="form-control " id="{rows/content/form_1/fields/text_1/@name}" name="{rows/content/form_1/fields/text_1/@name}" maxlength="30" placeholder="">
                                                    <xsl:call-template name="setAttributes">
                                                      <xsl:with-param name="field" select="rows/content/form_1/fields/text_1"/>
                                                    </xsl:call-template>
                                                  </input>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/number_1">
                                                <div class="form-group col-sm-6   gen-fields-holder" item-name="number_1" item-type="number">
                                                  <label for="{rows/content/form_1/fields/number_1/@name}">
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_1/fields/number_1/label"/>
                                                    </span>
                                                  </label>
                                                  <input type="number" value="{rows/content/form_1/fields/number_1/value}" class="form-control " id="{rows/content/form_1/fields/number_1/@name}" name="{rows/content/form_1/fields/number_1/@name}" min="" max="" maxlength="30" placeholder="">
                                                    <xsl:call-template name="setAttributes">
                                                      <xsl:with-param name="field" select="rows/content/form_1/fields/number_1"/>
                                                    </xsl:call-template>
                                                  </input>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/checkbox_1">
                                                <div class="col-sm-6  gen-fields-holder" item-name="checkbox_1" item-type="checkbox">
                                                  <div class="form-group">
                                                    <div class="checkbox form-check-offset">
                                                      <label>
                                                        <input type="checkbox" name="{rows/content/form_1/fields/checkbox_1/@name}" value="1" class="checkbox " label="{rows/content/form_1/fields/checkbox_1/label}">
                                                          <xsl:call-template name="setAttributes">
                                                            <xsl:with-param name="field" select="rows/content/form_1/fields/checkbox_1"/>
                                                          </xsl:call-template>
                                                          <xsl:if test="rows/content/form_1/fields/checkbox_1/value = '1'">
                                                            <xsl:attribute name="checked">checked
                                                            </xsl:attribute>
                                                          </xsl:if>
                                                        </input>
                                                        <span>
                                                          <xsl:value-of select="rows/content/form_1/fields/checkbox_1/label"/>
                                                        </span>
                                                      </label>
                                                    </div>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/addons">
                                                <div class="box-head subtitle gen-fields-holder" text-color="1">
                                                  <span>
                                                    <xsl:value-of select="rows/content/form_1/fields/addons/label"/>
                                                  </span>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/date_1">
                                                <div class="form-group col-sm-6  gen-fields-holder" item-name="date_1" item-type="date">
                                                  <label for="{rows/content/form_1/fields/date_1/@name}">
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_1/fields/date_1/label"/>
                                                    </span>
                                                  </label>
                                                  <div class="input-group">
                                                    <input type="text" value="{rows/content/form_1/fields/date_1/value}" class="form-control gen-date " id="form_1-date_1" name="{rows/content/form_1/fields/date_1/@name}" format="IGRP_datePicker" maxlength="30">
                                                      <xsl:call-template name="setAttributes">
                                                        <xsl:with-param name="field" select="rows/content/form_1/fields/date_1"/>
                                                      </xsl:call-template>
                                                    </input>
                                                    <span class="input-group-btn gen-date-icon">
                                                      <span class="btn btn-primary">
                                                        <i class="fa fa-calendar"/>
                                                      </span>
                                                    </span>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/lookup_1">
                                                <div class="form-group col-sm-6  gen-fields-holder" item-name="lookup_1" item-type="lookup">
                                                  <label for="{rows/content/form_1/fields/lookup_1/@name}">
                                                    <xsl:value-of select="rows/content/form_1/fields/lookup_1/label"/>
                                                  </label>
                                                  <div class="input-group">
                                                    <input type="text" value="{rows/content/form_1/fields/lookup_1/value}" class="form-control gen-lookup " id="form_1_lookup_1" name="{rows/content/form_1/fields/lookup_1/@name}" maxlength="30">
                                                      <xsl:call-template name="setAttributes">
                                                        <xsl:with-param name="field" select="rows/content/form_1/fields/lookup_1"/>
                                                      </xsl:call-template>
                                                    </input>
                                                    <xsl:call-template name="lookup-tool">
                                                      <xsl:with-param name="page" select="rows/page"/>
                                                      <xsl:with-param name="ad_hoc" select="'1'"/>
                                                      <xsl:with-param name="action" select="'LOOKUP'"/>
                                                      <xsl:with-param name="name" select="rows/content/form_1/fields/lookup_1/@name"/>
                                                      <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/lookup_1/lookup"/>
                                                      <xsl:with-param name="input-id" select="'form_1_lookup_1'"/>
                                                      <xsl:with-param name="btnClass" select="'primary'"/>
                                                    </xsl:call-template>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/file_1">
                                                <div class="form-group col-sm-6  gen-fields-holder" item-name="file_1" item-type="file">
                                                  <label for="{rows/content/form_1/fields/file_1/@name}">
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_1/fields/file_1/label"/>
                                                    </span>
                                                  </label>
                                                  <div class="input-group">
                                                    <input type="text" class="form-control not-form" readonly=""/>
                                                    <span class="input-group-btn">
                                                      <span class="btn btn-primary file-btn-holder">
                                                        <i class="fa fa-upload"/>
                                                        <input id="{rows/content/form_1/fields/file_1/@name}" name="{rows/content/form_1/fields/file_1/@name}" value="{rows/content/form_1/fields/file_1/value}" target-rend="" class="transparent " type="file" accept="">
                                                          <xsl:call-template name="setAttributes">
                                                            <xsl:with-param name="field" select="rows/content/form_1/fields/file_1"/>
                                                          </xsl:call-template>
                                                        </input>
                                                      </span>
                                                    </span>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/color_1">
                                                <div class="form-group col-sm-6  gen-fields-holder" item-name="color_1" item-type="color">
                                                  <label for="{rows/content/form_1/fields/color_1/@name}">
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_1/fields/color_1/label"/>
                                                    </span>
                                                  </label>
                                                  <div class="input-group form-color-picker" id="form_1_color_1_colorp">
                                                    <input type="text" value="{rows/content/form_1/fields/color_1/value}" format="hex" class="form-control" id="form_1_color_1" name="{rows/content/form_1/fields/color_1/@name}">
                                                      <xsl:call-template name="setAttributes">
                                                        <xsl:with-param name="field" select="rows/content/form_1/fields/color_1"/>
                                                      </xsl:call-template>
                                                    </input>
                                                    <span class="input-group-addon">
                                                      <i/>
                                                    </span>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/select_1">
                                                <div class="col-sm-6 form-group  gen-fields-holder" item-name="select_1" item-type="select">
                                                  <label for="{rows/content/form_1/fields/select_1/@name}">
                                                    <xsl:value-of select="rows/content/form_1/fields/select_1/label"/>
                                                  </label>
                                                  <select class="form-control select2 " id="form_1_select_1" name="{rows/content/form_1/fields/select_1/@name}">
                                                    <xsl:call-template name="setAttributes">
                                                      <xsl:with-param name="field" select="rows/content/form_1/fields/select_1"/>
                                                    </xsl:call-template>
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
                                              <xsl:if test="rows/content/form_1/fields/range_1">
                                                <div class="form-group col-sm-6  gen-fields-holder" item-name="range_1" item-type="range">
                                                  <label for="{rows/content/form_1/fields/range_1/@name}">
                                                    <xsl:value-of select="rows/content/form_1/fields/range_1/label"/>
                                                  </label>
                                                  <input id="range-range_1" name="{rows/content/form_1/fields/range_1/@name}" class="igrp-range" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="{rows/content/form_1/fields/range_1/value}"/>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/checkboxlist_1">
                                                <div class="col-sm-6  gen-fields-holder" item-name="checkboxlist_1" item-type="checkboxlist">
                                                  <div class="form-group checkboxlist clear">
                                                    <label>
                                                      <xsl:value-of select="rows/content/form_1/fields/checkboxlist_1/label"/>
                                                    </label>
                                                    <xsl:for-each select="rows/content/form_1/fields/checkboxlist_1/list/option">
                                                      <div class="checkbox col-md-12">
                                                        <label>
                                                          <input type="checkbox" name="{../../@name}" value="{value}" class="checkboxlist " label="{text}">
                                                            <xsl:call-template name="setAttributes">
                                                              <xsl:with-param name="field" select="//rows/content/form_1/fields/checkboxlist_1"/>
                                                            </xsl:call-template>
                                                            <xsl:if test="@selected='true'">
                                                              <xsl:attribute name="checked">checked
                                                              </xsl:attribute>
                                                            </xsl:if>
                                                          </input>
                                                          <span>
                                                            <xsl:value-of select="text"/>
                                                          </span>
                                                        </label>
                                                      </div>
                                                    </xsl:for-each>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/form_1/fields/radiolist_1">
                                                <div class="col-sm-6  gen-fields-holder" item-name="radiolist_1" item-type="radiolist">
                                                  <div class="form-group radiolist clear">
                                                    <label>
                                                      <span>
                                                        <xsl:value-of select="rows/content/form_1/fields/radiolist_1/label"/>
                                                      </span>
                                                    </label>
                                                    <xsl:for-each select="rows/content/form_1/fields/radiolist_1/list/option">
                                                      <div class="radio col-md-12">
                                                        <label>
                                                          <input type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                            <xsl:call-template name="setAttributes">
                                                              <xsl:with-param name="field" select="//rows/content/form_1/fields/radiolist_1"/>
                                                            </xsl:call-template>
                                                            <xsl:if test="@selected='true'">
                                                              <xsl:attribute name="checked">checked
                                                              </xsl:attribute>
                                                            </xsl:if>
                                                          </input>
                                                          <span>
                                                            <xsl:value-of select="text"/>
                                                          </span>
                                                        </label>
                                                      </div>
                                                    </xsl:for-each>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                            </div>
                                          </div>
                                          <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/formlist_1">
                                        <div class="box box-table-contents gen-container-item " gen-class="" item-name="formlist_1">
                                          <div class="box-body table-box">
                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/>
                                            <table id="formlist_1" class="table table-striped gen-data-table IGRP_formlist  " rel="T_formlist_1" data-control="data-formlist_1">
                                              <thead>
                                                <tr>
                                                  <xsl:if test="rows/content/formlist_1/fields/address">
                                                    <th align="" class=" gen-fields-holder">
                                                      <span>
                                                        <xsl:value-of select="rows/content/formlist_1/fields/address/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/formlist_1/fields/photo">
                                                    <th align="" class=" gen-fields-holder">
                                                      <span>
                                                        <xsl:value-of select="rows/content/formlist_1/fields/photo/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                  <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                                    <th class="table-btn add">
                                                      <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                                        <a class="formlist-row-add" rel="formlist_1">
                                                          <i class="fa fa-plus"/>
                                                        </a>
                                                      </xsl:if>
                                                    </th>
                                                  </xsl:if>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                                  <tr row="{position()}">
                                                    <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/>
                                                    <xsl:if test="address">
                                                      <xsl:if test="not(address/@visible)">
                                                        <td align="" data-row="{position()}" data-title="{../../fields/address/label}" class="text" item-name="address">
                                                          <input type="hidden" name="{../../../fields/address/@name}_fk_desc" value="{address_desc}"/>
                                                          <div class="form-group" item-name="address" item-type="text">
                                                            <input type="text" name="{../../../fields/address/@name}_fk" value="{address}" class="text form-control" rel="F_formlist_1">
                                                              <xsl:call-template name="setAttributes">
                                                                <xsl:with-param name="field" select="rows/content/formlist_1/fields/address"/>
                                                              </xsl:call-template>
                                                            </input>
                                                          </div>
                                                        </td>
                                                      </xsl:if>
                                                    </xsl:if>
                                                    <xsl:if test="photo">
                                                      <xsl:if test="not(photo/@visible)">
                                                        <td align="" data-row="{position()}" data-title="{../../fields/photo/label}" class="file" item-name="photo">
                                                          <input type="hidden" name="{../../../fields/photo/@name}_fk_desc" value="{photo_desc}"/>
                                                          <div class="form-group" item-name="photo" item-type="file">
                                                            <div class="input-group">
                                                              <input type="text" class="form-control form-hidden" readonly=""/>
                                                              <span class="input-group-btn">
                                                                <span class="btn btn-grey file-btn-holder">
                                                                  <i class="fa fa-upload"/>
                                                                  <input id="{../../../fields/photo/@name}_fk" name="{../../../fields/photo/@name}_fk" value="{photo}" class="transparent" type="file" accept="" rel="F_formlist_1">
                                                                    <xsl:call-template name="setAttributes">
                                                                      <xsl:with-param name="field" select="rows/content/formlist_1/fields/photo"/>
                                                                    </xsl:call-template>
                                                                  </input>
                                                                </span>
                                                              </span>
                                                            </div>
                                                          </div>
                                                        </td>
                                                      </xsl:if>
                                                    </xsl:if>
                                                    <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                      <td class="table-btn delete" data-row="{position()}">
                                                        <xsl:if test="not(@nodelete)">
                                                          <span class="formlist-row-remove btn btn-danger" rel="formlist_1">
                                                            <i class="fa fa-times"/>
                                                          </span>
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
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/form_2">
                                        <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/form_2/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body">
                                            <div role="form">
                                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                              <xsl:if test="rows/content/form_2/fields/texteditor_1">
                                                <div class="form-group col-sm-12  gen-fields-holder" item-name="texteditor_1" item-type="texteditor">
                                                  <label>
                                                    <span>
                                                      <xsl:value-of select="rows/content/form_2/fields/texteditor_1/label"/>
                                                    </span>
                                                  </label>
                                                  <textarea id="form_2_texteditor_1" name="{rows/content/form_2/fields/texteditor_1/@name}" class="gen-texteditor">
                                                    <xsl:value-of select="rows/content/form_2/fields/texteditor_1/value" disable-output-escaping="yes"/>
                                                  </textarea>
                                                  <script type="text/javascript">
                                                  </script>
                                                </div>
                                              </xsl:if>
                                            </div>
                                          </div>
                                          <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1">
                                        <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/separatorlist_1/@title"/>
                                            <xsl:with-param name="collapsible" select="'true'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                            <div class="splist-form-holder">
                                              <div class="splist-form" role="form">
                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                <xsl:if test="rows/content/separatorlist_1/fields/name">
                                                  <div class="form-group col-sm-6   gen-fields-holder" item-name="name" item-type="text">
                                                    <label for="{rows/content/separatorlist_1/fields/name/@name}">
                                                      <span>
                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/name/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="text" value="{rows/content/separatorlist_1/fields/name/value}" class="form-control " id="{rows/content/separatorlist_1/fields/name/@name}" name="{rows/content/separatorlist_1/fields/name/@name}" maxlength="30" placeholder="">
                                                      <xsl:call-template name="setAttributes">
                                                        <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/name"/>
                                                      </xsl:call-template>
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/separatorlist_1/fields/phone">
                                                  <div class="form-group col-sm-6   gen-fields-holder" item-name="phone" item-type="number">
                                                    <label for="{rows/content/separatorlist_1/fields/phone/@name}">
                                                      <span>
                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/phone/label"/>
                                                      </span>
                                                    </label>
                                                    <input type="number" value="{rows/content/separatorlist_1/fields/phone/value}" class="form-control " id="{rows/content/separatorlist_1/fields/phone/@name}" name="{rows/content/separatorlist_1/fields/phone/@name}" min="" max="" maxlength="30" placeholder="">
                                                      <xsl:call-template name="setAttributes">
                                                        <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/phone"/>
                                                      </xsl:call-template>
                                                    </input>
                                                  </div>
                                                </xsl:if>
                                              </div>
                                            </div>
                                            <div class="table-box box-body box-table-contents splist-table">
                                              <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                <thead>
                                                  <tr>
                                                    <xsl:if test="rows/content/separatorlist_1/fields/name">
                                                      <xsl:if test="not(rows/content/separatorlist_1/fields/name/@visible)">
                                                        <th align="" item-name="name">
                                                          <span>
                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/name/label"/>
                                                          </span>
                                                        </th>
                                                      </xsl:if>
                                                    </xsl:if>
                                                    <xsl:if test="rows/content/separatorlist_1/fields/phone">
                                                      <xsl:if test="not(rows/content/separatorlist_1/fields/phone/@visible)">
                                                        <th align="" item-name="phone">
                                                          <span>
                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/phone/label"/>
                                                          </span>
                                                        </th>
                                                      </xsl:if>
                                                    </xsl:if>
                                                    <th class="table-btn">
                                                      <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                                                        <i class="fa fa-plus"/>
                                                      </a>
                                                    </th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                    <tr>
                                                      <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                      <xsl:if test="name">
                                                        <xsl:choose>
                                                          <xsl:when test="not(name/@visible)">
                                                            <td field="name" data-row="{position()}" data-title="{../../../fields/name/label}" class="text" item-name="name">
                                                              <span class="separator-list-td-val">
                                                                <xsl:value-of select="name_desc"/>
                                                              </span>
                                                              <input type="hidden" name="p_name_fk" value="{name}"/>
                                                              <input type="hidden" name="p_name_fk_desc" value="{name_desc}"/>
                                                            </td>
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                            <input type="hidden" name="p_name_fk" value="{name}"/>
                                                            <input type="hidden" name="p_name_fk_desc" value="{name_desc}"/>
                                                          </xsl:otherwise>
                                                        </xsl:choose>
                                                      </xsl:if>
                                                      <xsl:if test="phone">
                                                        <xsl:choose>
                                                          <xsl:when test="not(phone/@visible)">
                                                            <td field="phone" data-row="{position()}" data-title="{../../../fields/phone/label}" class="number" item-name="phone">
                                                              <span class="separator-list-td-val">
                                                                <xsl:value-of select="phone_desc"/>
                                                              </span>
                                                              <input type="hidden" name="p_phone_fk" value="{phone}"/>
                                                              <input type="hidden" name="p_phone_fk_desc" value="{phone_desc}"/>
                                                            </td>
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                            <input type="hidden" name="p_phone_fk" value="{phone}"/>
                                                            <input type="hidden" name="p_phone_fk_desc" value="{phone_desc}"/>
                                                          </xsl:otherwise>
                                                        </xsl:choose>
                                                      </xsl:if>
                                                      <td data-row="{position()}" class="table-btn">
                                                        <xsl:if test="not(@noupdate)">
                                                          <span class="table-row-edit btn btn-default " rel="separatorlist_1">
                                                            <i class="fa fa-pencil"/>
                                                          </span>
                                                        </xsl:if>
                                                        <xsl:if test="not(@nodelete)">
                                                          <span class="table-row-remove btn btn-danger" rel="separatorlist_1">
                                                            <i class="fa fa-times"/>
                                                          </span>
                                                        </xsl:if>
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
                            <xsl:if test="rows/content/tabcontent_1/fields/buttons">
                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-buttons" rel="tab-tabcontent_1-buttons">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/buttons/value"/>
                                  <xsl:with-param name="class" select="'tab-pane'"/>
                                </xsl:call-template>
                                <div class="row" id="row-459a5443">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_5">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_5" style="text-align:justify">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_5/fields/paragraph_5_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/toolsbar_3">
                                        <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_3">
                                          <div class="btns-holder  btn-group-justified" role="group">
                                            <xsl:apply-templates select="rows/content/toolsbar_3" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                              <xsl:with-param name="outline" select="'false'"/>
                                            </xsl:apply-templates>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-c1b8c9ce">
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_6">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_6">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_6/fields/paragraph_6_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/toolsbar_1">
                                        <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                          <div class="btns-holder  pull-left" role="group">
                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                              <xsl:with-param name="outline" select="'false'"/>
                                            </xsl:apply-templates>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_8">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_8" style="text-align:center">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_8/fields/paragraph_8_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/toolsbar_4">
                                        <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_4">
                                          <div class="btns-holder  centralized" role="group">
                                            <xsl:apply-templates select="rows/content/toolsbar_4" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                              <xsl:with-param name="outline" select="'false'"/>
                                            </xsl:apply-templates>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_7">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_7" style="text-align:right">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_7/fields/paragraph_7_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/toolsbar_2">
                                        <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_2">
                                          <div class="btns-holder  pull-right" role="group">
                                            <xsl:apply-templates select="rows/content/toolsbar_2" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                              <xsl:with-param name="outline" select="'false'"/>
                                            </xsl:apply-templates>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-88168672">
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_2">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_2" style="font-size:20px;font-weight:400">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_2/fields/paragraph_2_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/verticalmenu_1">
                                        <div class="igrp-vertical-menu gen-container-item " gen-fields=".list-group .btn" gen-class="" item-name="verticalmenu_1">
                                          <div class="list-group">
                                            <xsl:apply-templates select="rows/content/verticalmenu_1" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                            </xsl:apply-templates>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_4">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_4" style="font-size:20px;font-weight:400">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_4/fields/paragraph_4_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/quickbuttonbox_1">
                                        <div class="quick-button-box gen-container-item " gen-class="" item-name="quickbuttonbox_1">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/quickbuttonbox_1/fields"/>
                                          <a href="{rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_url/value}" target="modal" class="quick-button metro {rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_bg/value}">
                                            <i class="fa {rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_icn/value}" aria-hidden="true"/>
                                            <p>
                                              <xsl:value-of select="rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_tit/value"/>
                                            </p>
                                            <span class="badge">
                                              <xsl:value-of select="rows/content/quickbuttonbox_1/fields/quickbuttonbox_1_val/value"/>
                                            </span>
                                          </a>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/paragraph_3">
                                        <div class="gen-container-item " gen-class="" item-name="paragraph_3" style="font-size:20px;font-weight:400">
                                          <div class="box-body">
                                            <p>
                                              <xsl:value-of select="rows/content/paragraph_3/fields/paragraph_3_text/value"/>
                                            </p>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/treemenu_1">
                                        <div class="treemenu box gen-container-item " gen-structure="treemenu" gen-class="" item-name="treemenu_1">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/treemenu_1/fields"/>
                                          <xsl:apply-templates select="rows/content/treemenu_1" mode="treemenu">
                                            <xsl:with-param name="target" select="'_blank'"/>
                                            <xsl:with-param name="style" select="'default'"/>
                                          </xsl:apply-templates>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </xsl:if>
                            <xsl:if test="rows/content/tabcontent_1/fields/tables">
                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tables" rel="tab-tabcontent_1-tables">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/tables/value"/>
                                  <xsl:with-param name="class" select="'tab-pane'"/>
                                </xsl:call-template>
                                <div class="row" id="row-813f4faa">
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/table_1">
                                        <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                                            <xsl:with-param name="collapsible" select="'true'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body table-box">
                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                            <table id="table_1" class="table table-striped gen-data-table  " exports="null">
                                              <thead>
                                                <tr>
                                                  <xsl:if test="rows/content/table_1/fields/father_name">
                                                    <th align="left" class=" gen-fields-holder">
                                                      <span>
                                                        <xsl:value-of select="rows/content/table_1/fields/father_name/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/table_1/fields/email_1">
                                                    <th align="left" class=" gen-fields-holder">
                                                      <span>
                                                        <xsl:value-of select="rows/content/table_1/fields/email_1/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                  <tr>
                                                    <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                    <input type="hidden" name="p_row_id_fk" value="{row_id}"/>
                                                    <input type="hidden" name="p_row_id_fk_desc" value="{row_id_desc}"/>
                                                    <xsl:if test="father_name">
                                                      <td align="left" data-row="{position()}" data-title="{../../fields/father_name/label}" class="text" item-name="father_name">
                                                        <span class="">
                                                          <xsl:value-of select="father_name"/>
                                                        </span>
                                                      </td>
                                                    </xsl:if>
                                                    <xsl:if test="email_1">
                                                      <td align="left" data-row="{position()}" data-title="{../../fields/email_1/label}" class="email" item-name="email_1">
                                                        <span class="">
                                                          <xsl:value-of select="email_1"/>
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
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/table_2">
                                        <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_2">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/table_2/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body table-box">
                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_2/fields"/>
                                            <table id="table_2" class="table table-striped gen-data-table IGRP_contextmenu " exports="null">
                                              <thead>
                                                <tr>
                                                  <xsl:if test="rows/content/table_2/fields/whatever">
                                                    <th align="left" class=" gen-fields-holder">
                                                      <span>
                                                        <xsl:value-of select="rows/content/table_2/fields/whatever/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <xsl:for-each select="rows/content/table_2/table/value/row[not(@total='yes')]">
                                                  <tr>
                                                    <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                    <xsl:if test="whatever">
                                                      <td align="left" data-row="{position()}" data-title="{../../fields/whatever/label}" class="text" item-name="whatever">
                                                        <span class="">
                                                          <xsl:value-of select="whatever"/>
                                                        </span>
                                                      </td>
                                                    </xsl:if>
                                                  </tr>
                                                </xsl:for-each>
                                              </tbody>
                                            </table>
                                          </div>
                                          <xsl:apply-templates select="rows/content/table_2/table/context-menu" mode="table-context-menu"/>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-dd628261">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/table_3">
                                        <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_3">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/table_3/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body table-box">
                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_3/fields"/>
                                            <xsl:call-template name="table-export-options">
                                              <xsl:with-param name="excel" select="true()"/>
                                            </xsl:call-template>
                                            <xsl:apply-templates mode="table-legend" select="rows/content/table_3/table/legend_color"/>
                                            <table id="table_3" class="table table-striped gen-data-table IGRP_contextmenu align" exports="excel">
                                              <thead>
                                                <tr>
                                                  <xsl:if test="rows/content/table_3/fields/checkbox_1">
                                                    <th class="bs-checkbox gen-fields-holder" align="center">
                                                      <input type="checkbox" class="IGRP_checkall" check-rel="checkbox_1" title="Checkbox" data-toggle="tooltip"/>
                                                    </th>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/table_3/fields/color_1">
                                                    <th align="left" class="color-th gen-fields-holder">
                                                      <xsl:value-of select="rows/content/table_3/fields/color_1/label"/>
                                                    </th>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/table_3/fields/item_title">
                                                    <th align="left" class=" gen-fields-holder" style="width:80%">
                                                      <span>
                                                        <xsl:value-of select="rows/content/table_3/fields/item_title/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/table_3/fields/details">
                                                    <th align="center" class=" gen-fields-holder">
                                                      <span>
                                                        <xsl:value-of select="rows/content/table_3/fields/details/label"/>
                                                      </span>
                                                    </th>
                                                  </xsl:if>
                                                  <th class="igrp-table-ctx-th"/>
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <xsl:for-each select="rows/content/table_3/table/value/row[not(@total='yes')]">
                                                  <tr>
                                                    <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                    <xsl:if test="checkbox_1">
                                                      <td align="" data-row="{position()}" data-title="{../../label/checkbox_1}" class="bs-checkbox" item-name="checkbox_1">
                                                        <xsl:if test="checkbox_1 != '-0'">
                                                          <input type="checkbox" name="p_checkbox_1" value="{checkbox_1}" check-rel="checkbox_1">
                                                            <xsl:if test="checkbox_1_check=checkbox_1">
                                                              <xsl:attribute name="checked">checked
                                                              </xsl:attribute>
                                                            </xsl:if>
                                                          </input>
                                                        </xsl:if>
                                                      </td>
                                                    </xsl:if>
                                                    <xsl:if test="color_1">
                                                      <td align="" data-row="{position()}" data-title="{../../label/color_1}" class="color" item-name="color_1">
                                                        <xsl:call-template name="tdcolor">
                                                          <xsl:with-param name="color" select="color_1"/>
                                                        </xsl:call-template>
                                                      </td>
                                                    </xsl:if>
                                                    <xsl:if test="item_title">
                                                      <td align="left" data-row="{position()}" data-title="{../../fields/item_title/label}" class="text" item-name="item_title" style="width:80%">
                                                        <span class="">
                                                          <xsl:value-of select="item_title"/>
                                                        </span>
                                                      </td>
                                                    </xsl:if>
                                                    <xsl:if test="details">
                                                      <td align="center" data-row="{position()}" data-title="{../../label/details}" class="link" item-name="details">
                                                        <xsl:choose>
                                                          <xsl:when test="details != ''">
                                                            <a href="{details}" class="link bClick btn btn-link " target-fields="" target="_self" name="details">
                                                              <i class="fa fa-link"/>
                                                              <span>
                                                                <xsl:value-of select="details_desc"/>
                                                              </span>
                                                            </a>
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                            <span>
                                                              <xsl:value-of select="details_desc"/>
                                                            </span>
                                                          </xsl:otherwise>
                                                        </xsl:choose>
                                                      </td>
                                                    </xsl:if>
                                                    <td class="igrp-table-ctx-td">
                                                      <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                        <xsl:with-param name="row-params" select="context-menu"/>
                                                      </xsl:apply-templates>
                                                    </td>
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
                            <xsl:if test="rows/content/tabcontent_1/fields/charts">
                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-charts" rel="tab-tabcontent_1-charts">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/charts/value"/>
                                  <xsl:with-param name="class" select="'tab-pane'"/>
                                </xsl:call-template>
                                <div class="row" id="row-6b2f215a">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/sectionheader_2">
                                        <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_2">
                                          <h2>
                                            <xsl:value-of select="rows/content/sectionheader_2/fields/sectionheader_2_text/value"/>
                                          </h2>
                                        </section>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-1fe81fa5">
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/statbox_1">
                                        <div class="statbox_container gen-container-item " gen-class="" item-name="statbox_1">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/statbox_1/fields"/>
                                          <div class="statbox {rows/content/statbox_1/fields/statbox_1_bg/value}">
                                            <div class="boxchart">
                                              <canvas/>
                                            </div>
                                            <div class="number">
                                              <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_val/value"/>
                                              <i class="fa {rows/content/statbox_1/fields/statbox_1_icn/value}" aria-hidden="true"/>
                                            </div>
                                            <div class="title">
                                              <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_tit/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_1/fields/statbox_1_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/statbox_2">
                                        <div class="statbox_container gen-container-item " gen-class="" item-name="statbox_2">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/statbox_2/fields"/>
                                          <div class="statbox {rows/content/statbox_2/fields/statbox_2_bg/value}">
                                            <div class="boxchart">
                                              <canvas/>
                                            </div>
                                            <div class="number">
                                              <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_val/value"/>
                                              <i class="fa {rows/content/statbox_2/fields/statbox_2_icn/value}" aria-hidden="true"/>
                                            </div>
                                            <div class="title">
                                              <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_tit/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_2/fields/statbox_2_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/statbox_3">
                                        <div class="statbox_container gen-container-item " gen-class="" item-name="statbox_3">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/statbox_3/fields"/>
                                          <div class="statbox {rows/content/statbox_3/fields/statbox_3_bg/value}">
                                            <div class="boxchart">
                                              <canvas/>
                                            </div>
                                            <div class="number">
                                              <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_val/value"/>
                                              <i class="fa {rows/content/statbox_3/fields/statbox_3_icn/value}" aria-hidden="true"/>
                                            </div>
                                            <div class="title">
                                              <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_tit/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_3/fields/statbox_3_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-6af4fcbf">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/sectionheader_3">
                                        <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_3">
                                          <h2>
                                            <xsl:value-of select="rows/content/sectionheader_3/fields/sectionheader_3_text/value"/>
                                          </h2>
                                        </section>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-132699f6">
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/chart_1">
                                        <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_1">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body">
                                            <xsl:call-template name="igrp-graph">
                                              <xsl:with-param name="table" select="rows/content/chart_1"/>
                                              <xsl:with-param name="chart_type" select="rows/content/chart_1/chart_type"/>
                                              <xsl:with-param name="height" select="'250'"/>
                                              <xsl:with-param name="title" select="'Line'"/>
                                              <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                            </xsl:call-template>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/chart_2">
                                        <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_2">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body">
                                            <xsl:call-template name="igrp-graph">
                                              <xsl:with-param name="table" select="rows/content/chart_2"/>
                                              <xsl:with-param name="chart_type" select="rows/content/chart_2/chart_type"/>
                                              <xsl:with-param name="height" select="'250'"/>
                                              <xsl:with-param name="title" select="'Area'"/>
                                              <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                                            </xsl:call-template>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-4">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/chart_3">
                                        <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_3">
                                          <xsl:call-template name="box-header">
                                            <xsl:with-param name="title" select="rows/content/chart_3/@title"/>
                                            <xsl:with-param name="collapsible" select="'false'"/>
                                            <xsl:with-param name="collapsed" select="'false'"/>
                                          </xsl:call-template>
                                          <div class="box-body">
                                            <xsl:call-template name="igrp-graph">
                                              <xsl:with-param name="table" select="rows/content/chart_3"/>
                                              <xsl:with-param name="chart_type" select="rows/content/chart_3/chart_type"/>
                                              <xsl:with-param name="height" select="'250'"/>
                                              <xsl:with-param name="title" select="'Stacked Bar'"/>
                                              <xsl:with-param name="url" select="rows/content/chart_3/url"/>
                                            </xsl:call-template>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                                <div class="row" id="row-55ca0033">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/sectionheader_4">
                                        <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_4">
                                          <h2>
                                            <xsl:value-of select="rows/content/sectionheader_4/fields/sectionheader_4_text/value"/>
                                          </h2>
                                        </section>
                                      </xsl:if>
                                      <xsl:if test="rows/content/mapchart_1">
                                        <div class="box gen-container-item " gen-class="" item-name="mapchart_1">
                                          <div class="box-body">
                                            <div id="highmap-mapchart_1" class="igrp-highmaps" style="margin: 0 auto" map-height="420" basemap="{rows/content/mapchart_1/fields/mapchart_1_basemap/value}" data="{rows/content/mapchart_1/fields/mapchart_1_data/value}" config="{rows/content/mapchart_1/fields/mapchart_1_config/value}" tooltip="true" legend-position="bottom" legend-size="2">
                                              <tooltip-format>
                                                {point.name}: {point.value}
                                              </tooltip-format>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </xsl:if>
                            <xsl:if test="rows/content/tabcontent_1/fields/others">
                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-others" rel="tab-tabcontent_1-others">
                                <xsl:call-template name="get-active-tab">
                                  <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/others/value"/>
                                  <xsl:with-param name="class" select="'tab-pane'"/>
                                </xsl:call-template>
                                <div class="row" id="row-dd6b89e3">
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/video_1">
                                        <div class="gen-container-item " gen-class="" item-name="video_1">
                                          <div class="box-body">
                                            <iframe style="height:200px" src="{rows/content/video_1/fields/video_1_text/value}" frameborder="0" allowfullscreen=""/>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner"/>
                                  </div>
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
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <!-- TABCONTENT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js?v={$version}"/>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
        <!-- FORMLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js?v={$version}"/>
        <!-- TREEMENU JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/treemenu/treemenu.js?v={$version}"/>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/jspdf/js/html2pdf.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/jspdf/js/jspdf.debug.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/jspdf/js/bluebird.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/filesaver/filesaver.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/jspdf/js/jspdf.plugin.table.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.export2.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
        <!-- CHART JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/funnel.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/heatmap.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/treemap.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js?v={$version}"/>
        <!-- MAPCHART JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/map.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/data.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/drilldown.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highmaps/highmap.controller.js?v={$version}"/>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js?v={$version}"/>
        <!-- LOOKUP JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js?v={$version}"/>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js?v={$version}"/>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
        <!-- RANGE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/bs.range/bootstrap.slider.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/bs.range/igrp.range.js?v={$version}"/>
        <!-- TEXTEDITOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js?v={$version}"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="tmpl/IGRP-functions.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-utils.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-form-utils.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-table-utils.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-treemenu.tmpl.xsl?v=1506102103446"/>
  <xsl:include href="tmpl/IGRP-charts.tmpl.xsl?v=1506102103446"/>
</xsl:stylesheet>
