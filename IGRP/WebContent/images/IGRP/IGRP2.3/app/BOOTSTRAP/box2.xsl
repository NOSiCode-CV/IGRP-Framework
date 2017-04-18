<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
        <!-- FORMLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/formlist/includes/igrp.formlist.css"/>
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
                        <xsl:if  test="rows/content/box_1">
                          <div  class="box igrp-box-holder gen-container-item ">
                            <div class="box-body" gen-preserve-content="true">
                              <div >
                                <div class="row">
                                  <div class="gen-column col-md-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/sectionheader_1">
                                        <section class="content-header gen-container-item ">
                                          <h1>
                                            <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                                          </h1>
                                        </section>
                                      </xsl:if>
                                      <xsl:if test="rows/content/tabcontent_1">
                                        <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                          <ul class="nav nav-tabs">
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='dash']">
                                              <li class="active gen-fields-holder" rel="tab-tabcontent_1-dash">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-dash">
                                                  <i class="fa fa-codepen"/>
                                                  <span gen-lbl-setter="true">
                                                    <xsl:value-of select="rows/content/tabcontent_1/item[@name='dash']/title"/>
                                                  </span>
                                                </a>
                                              </li>
                                            </xsl:if>
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='separator_list']">
                                              <li class=" gen-fields-holder" rel="tab-tabcontent_1-separator_list">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-separator_list">
                                                  <i class="fa fa-list-alt"/>
                                                  <span gen-lbl-setter="true">
                                                    <xsl:value-of select="rows/content/tabcontent_1/item[@name='separator_list']/title"/>
                                                  </span>
                                                </a>
                                              </li>
                                            </xsl:if>
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='formlist']">
                                              <li class=" gen-fields-holder" rel="tab-tabcontent_1-formlist">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-formlist">
                                                  <i class="fa fa-list-ul"/>
                                                  <span gen-lbl-setter="true">
                                                    <xsl:value-of select="rows/content/tabcontent_1/item[@name='formlist']/title"/>
                                                  </span>
                                                </a>
                                              </li>
                                            </xsl:if>
                                          </ul>
                                          <div class="tab-content">
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='dash']">
                                              <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-dash" rel="tab-tabcontent_1-dash">
                                                <div class="row">
                                                  <div class="gen-column col-md-12">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/paragraph_1">
                                                        <div class="gen-container-item ">
                                                          <div class="box-body">
                                                            <p>
                                                              <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                                                            </p>
                                                          </div>
                                                        </div>
                                                      </xsl:if>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                  <div class="gen-column col-md-6">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/form_1">
                                                        <div class="box igrp-forms gen-container-item ">
                                                          <div class="box-body">
                                                            <div role="form" gen-id="drop-zone">
                                                              <xsl:if test="rows/content/form_1/fields/text">
                                                                <div class="form-group col-md-4   gen-fields-holder" item-name="text" item-type="text">
                                                                  <label for="{rows/content/form_1/fields/text/@name}">
                                                                    <span gen-lbl-setter="">
                                                                      <xsl:value-of select="rows/content/form_1/fields/text/label"/>
                                                                    </span>
                                                                  </label>
                                                                  <input type="text" value="{rows/content/form_1/fields/text/value}" class="form-control" id="{rows/content/form_1/fields/text/@name}" name="{rows/content/form_1/fields/text/@name}" maxlength="30">
                                                                  </input>
                                                                </div>
                                                              </xsl:if>
                                                              <xsl:if test="rows/content/form_1/fields/number_1">
                                                                <div class="form-group col-md-4   gen-fields-holder" item-name="number_1" item-type="number">
                                                                  <label for="{rows/content/form_1/fields/number_1/@name}">
                                                                    <span gen-lbl-setter="">
                                                                      <xsl:value-of select="rows/content/form_1/fields/number_1/label"/>
                                                                    </span>
                                                                  </label>
                                                                  <input type="number" value="{rows/content/form_1/fields/number_1/value}" class="form-control" id="{rows/content/form_1/fields/number_1/@name}" name="{rows/content/form_1/fields/number_1/@name}" maxlength="30">
                                                                  </input>
                                                                </div>
                                                              </xsl:if>
                                                              <xsl:if test="rows/content/form_1/fields/email_1">
                                                                <div class="form-group col-md-4   gen-fields-holder" item-name="email_1" item-type="email">
                                                                  <label for="{rows/content/form_1/fields/email_1/@name}">
                                                                    <span gen-lbl-setter="">
                                                                      <xsl:value-of select="rows/content/form_1/fields/email_1/label"/>
                                                                    </span>
                                                                  </label>
                                                                  <input type="email" value="{rows/content/form_1/fields/email_1/value}" class="form-control" id="{rows/content/form_1/fields/email_1/@name}" name="{rows/content/form_1/fields/email_1/@name}" maxlength="30">
                                                                  </input>
                                                                </div>
                                                              </xsl:if>
                                                              <xsl:if test="rows/content/form_1/fields/radiolist_1">
                                                                <div class="col-md-4  gen-fields-holder" item-name="radiolist_1" item-type="radiolist">
                                                                  <div class="form-group">
                                                                    <label>
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/form_1/fields/radiolist_1/label"/>
                                                                      </span>
                                                                    </label>
                                                                    <xsl:for-each select="rows/content/form_1/fields/radiolist_1/list/option">
                                                                      <div class="radio">
                                                                        <label>
                                                                          <input type="radio" name="{../../@name}" value="{value}" class="radiolist" label="{text}">
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
                                                              <xsl:if test="rows/content/form_1/fields/textarea">
                                                                <div class="form-group col-md-8  gen-fields-holder" item-name="textarea" item-type="textarea">
                                                                  <label for="{rows/content/form_1/fields/textarea/@name}">
                                                                    <xsl:value-of select="rows/content/form_1/fields/textarea/label"/>
                                                                  </label>
                                                                  <textarea name="{rows/content/form_1/fields/textarea/@name}" class="textarea form-control" maxlength="30">
                                                                    <xsl:value-of select="rows/content/form_1/fields/textarea/value"/>
                                                                  </textarea>
                                                                </div>
                                                              </xsl:if>
                                                            </div>
                                                          </div>
                                                          <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                        </div>
                                                      </xsl:if>
                                                    </div>
                                                  </div>
                                                  <div class="gen-column col-md-6">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/tabcontent_2">
                                                        <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                                          <ul class="nav nav-tabs">
                                                            <xsl:if test="rows/content/tabcontent_2/item[@name='tab_item_2']">
                                                              <li class="active gen-fields-holder" rel="tab-tabcontent_2-tab_item_2">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-tab_item_2">
                                                                  <i class="fa fa-dot-circle-o"/>
                                                                  <span gen-lbl-setter="true">
                                                                    <xsl:value-of select="rows/content/tabcontent_2/item[@name='tab_item_2']/title"/>
                                                                  </span>
                                                                </a>
                                                              </li>
                                                            </xsl:if>
                                                            <xsl:if test="rows/content/tabcontent_2/item[@name='tab_item_1']">
                                                              <li class=" gen-fields-holder" rel="tab-tabcontent_2-tab_item_1">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-tab_item_1">
                                                                  <i class="fa fa-dot-circle-o"/>
                                                                  <span gen-lbl-setter="true">
                                                                    <xsl:value-of select="rows/content/tabcontent_2/item[@name='tab_item_1']/title"/>
                                                                  </span>
                                                                </a>
                                                              </li>
                                                            </xsl:if>
                                                          </ul>
                                                          <div class="tab-content">
                                                            <xsl:if test="rows/content/tabcontent_2/item[@name='tab_item_2']">
                                                              <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_2-tab_item_2" rel="tab-tabcontent_2-tab_item_2">
                                                                <div class="row">
                                                                  <div class="gen-column col-md-12">
                                                                    <div class="gen-inner">
                                                                      <xsl:if test="rows/content/chart_1">
                                                                        <div class="box gen-container-item " gen-structure="graphic">
                                                                          <div class="box-body">
                                                                            <xsl:call-template name="igrp-graph">
                                                                              <xsl:with-param name="table" select="rows/content/chart_1"/>
                                                                              <xsl:with-param name="chart_type" select="'line'"/>
                                                                              <xsl:with-param name="height" select="'250'"/>
                                                                              <xsl:with-param name="title" select="'Chart'"/>
                                                                              <xsl:with-param name="url" select="rows/content/chart_1/url"/>
                                                                            </xsl:call-template>
                                                                          </div>
                                                                        </div>
                                                                      </xsl:if>
                                                                    </div>
                                                                  </div>
                                                                </div>
                                                              </div>
                                                            </xsl:if>
                                                            <xsl:if test="rows/content/tabcontent_2/item[@name='tab_item_1']">
                                                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_2-tab_item_1" rel="tab-tabcontent_2-tab_item_1">
                                                                <div class="row">
                                                                  <div class="gen-column col-md-12">
                                                                    <div class="gen-inner">
                                                                      <xsl:if test="rows/content/table_1">
                                                                        <div class="box box-table-contents gen-container-item ">
                                                                          <div class="box-body table-box">
                                                                            <table id="table_1" class="table table-striped gen-data-table ">
                                                                              <thead>
                                                                                <tr gen-id="drop-zone" gen-field-template="th">
                                                                                  <xsl:if test="rows/content/table_1/fields/email_1">
                                                                                    <th align="left" class="gen-fields-holder">
                                                                                      <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/email_1/label"/>
                                                                                      </span>
                                                                                    </th>
                                                                                  </xsl:if>
                                                                                  <xsl:if test="rows/content/table_1/fields/text_1">
                                                                                    <th align="left" class="gen-fields-holder">
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
                                                                                    <xsl:apply-templates mode="context-param" select="context-menu"/> 
                                                                                    <xsl:if test="email_1">
                                                                                      <td align="left" data-row="{position()}" data-title="{../../fields/email_1/label}" class="email gen-fields-holder">
                                                                                        <span class="">
                                                                                          <xsl:value-of select="email_1"/>
                                                                                        </span>
                                                                                      </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="text_1">
                                                                                      <td align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text gen-fields-holder">
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
                                                          </div>
                                                        </div>
                                                      </xsl:if>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>
                                            </xsl:if>
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='separator_list']">
                                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-separator_list" rel="tab-tabcontent_1-separator_list">
                                                <div class="row">
                                                  <div class="gen-column col-md-12">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/separatorlist_1">
                                                        <div class="box gen-container-item ">
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
                                                                <xsl:if test="rows/content/separatorlist_1/fields/lookup_1">
                                                                  <div class="form-group col-md-3  gen-fields-holder" item-name="lookup_1" item-type="lookup">
                                                                    <label for="{rows/content/separatorlist_1/fields/lookup_1/@name}">
                                                                      <xsl:value-of select="rows/content/separatorlist_1/fields/lookup_1/label"/>
                                                                    </label>
                                                                    <div class="input-group">
                                                                      <input type="text" value="{rows/content/separatorlist_1/fields/lookup_1/value}" class="form-control gen-lookup" id="separatorlist_1_lookup_1" name="{rows/content/separatorlist_1/fields/lookup_1/@name}"/>
                                                                      <xsl:call-template name="lookup-tool">
                                                                        <xsl:with-param name="page" select="rows/page"/>
                                                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                        <xsl:with-param name="name" select="rows/content/separatorlist_1/fields/lookup_1/@name"/>
                                                                        <xsl:with-param name="js_lookup" select="rows/content/separatorlist_1/fields/lookup_1/lookup"/>
                                                                        <xsl:with-param name="input-id" select="'separatorlist_1_lookup_1'"/>
                                                                        <xsl:with-param name="btnClass" select="'default'"/>
                                                                      </xsl:call-template>
                                                                    </div>
                                                                  </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/separatorlist_1/fields/number_1">
                                                                  <div class="form-group col-md-3   gen-fields-holder" item-name="number_1" item-type="number">
                                                                    <label for="{rows/content/separatorlist_1/fields/number_1/@name}">
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label"/>
                                                                      </span>
                                                                    </label>
                                                                    <input type="number" value="{rows/content/separatorlist_1/fields/number_1/value}" class="form-control" id="{rows/content/separatorlist_1/fields/number_1/@name}" name="{rows/content/separatorlist_1/fields/number_1/@name}" maxlength="30">
                                                                    </input>
                                                                  </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/separatorlist_1/fields/color_1">
                                                                  <div class="form-group col-md-3  gen-fields-holder" item-name="color_1" item-type="color">
                                                                    <label for="{rows/content/separatorlist_1/fields/color_1/@name}">
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/color_1/label"/>
                                                                      </span>
                                                                    </label>
                                                                    <div class="input-group form-color-picker" id="separatorlist_1_color_1_colorp">
                                                                      <input type="text" value="{rows/content/separatorlist_1/fields/color_1/value}" format="hex" class="form-control" id="separatorlist_1_color_1" name="{rows/content/separatorlist_1/fields/color_1/@name}"/>
                                                                      <span class="input-group-addon">
                                                                        <i/>
                                                                      </span>
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
                                                                        <th align="" item-name="text_1" class="gen-fields-holder">
                                                                          <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/text_1/label"/>
                                                                          </span>
                                                                        </th>
                                                                      </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/lookup_1">
                                                                      <xsl:if test="//rows/content/separatorlist_1/fields/lookup_1/@table='true'">
                                                                        <th align="" item-name="lookup_1" class="gen-fields-holder">
                                                                          <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/lookup_1/label"/>
                                                                          </span>
                                                                        </th>
                                                                      </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/number_1">
                                                                      <xsl:if test="//rows/content/separatorlist_1/fields/number_1/@table='true'">
                                                                        <th align="" item-name="number_1" class="gen-fields-holder">
                                                                          <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/number_1/label"/>
                                                                          </span>
                                                                        </th>
                                                                      </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/color_1">
                                                                      <xsl:if test="//rows/content/separatorlist_1/fields/color_1/@table='true'">
                                                                        <th align="" item-name="color_1" class="gen-fields-holder">
                                                                          <span gen-lbl-setter="">
                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/color_1/label"/>
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
                                                                            <td data-row="{position()}" data-title="{../../../fields/text_1/label}" class="text gen-fields-holder">
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
                                                                      <xsl:if test="lookup_1">
                                                                        <xsl:choose>
                                                                          <xsl:when test="//rows/content/separatorlist_1/fields/lookup_1/@table='true'">
                                                                            <td data-row="{position()}" data-title="{../../../fields/lookup_1/label}" class="lookup gen-fields-holder">
                                                                              <span class="separator-list-td-val">
                                                                                <xsl:value-of select="lookup_1_desc" disable-output-escaping="yes"/>
                                                                              </span>
                                                                              <input type="hidden" name="p_lookup_1_fk" value="{lookup_1}"/>
                                                                              <input type="hidden" name="p_lookup_1_fk_desc" value="{lookup_1_desc}"/>
                                                                            </td>
                                                                          </xsl:when>
                                                                          <xsl:otherwise>
                                                                            <input type="hidden" name="p_lookup_1_fk" value="{lookup_1}"/>
                                                                            <input type="hidden" name="p_lookup_1_fk_desc" value="{lookup_1_desc}"/>
                                                                          </xsl:otherwise>
                                                                        </xsl:choose>
                                                                      </xsl:if>
                                                                      <xsl:if test="number_1">
                                                                        <xsl:choose>
                                                                          <xsl:when test="//rows/content/separatorlist_1/fields/number_1/@table='true'">
                                                                            <td data-row="{position()}" data-title="{../../../fields/number_1/label}" class="number gen-fields-holder">
                                                                              <span class="separator-list-td-val">
                                                                                <xsl:value-of select="number_1_desc" disable-output-escaping="yes"/>
                                                                              </span>
                                                                              <input type="hidden" name="p_number_1_fk" value="{number_1}"/>
                                                                              <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}"/>
                                                                            </td>
                                                                          </xsl:when>
                                                                          <xsl:otherwise>
                                                                            <input type="hidden" name="p_number_1_fk" value="{number_1}"/>
                                                                            <input type="hidden" name="p_number_1_fk_desc" value="{number_1_desc}"/>
                                                                          </xsl:otherwise>
                                                                        </xsl:choose>
                                                                      </xsl:if>
                                                                      <xsl:if test="color_1">
                                                                        <xsl:choose>
                                                                          <xsl:when test="//rows/content/separatorlist_1/fields/color_1/@table='true'">
                                                                            <td data-row="{position()}" data-title="{../../../fields/color_1/label}" class="color gen-fields-holder">
                                                                              <span class="separator-list-td-val color" style="background-color:{color_1_desc};height: 10px;display: block;"/>
                                                                              <input type="hidden" name="p_color_1_fk" value="{color_1}"/>
                                                                              <input type="hidden" name="p_color_1_fk_desc" value="{color_1_desc}"/>
                                                                            </td>
                                                                          </xsl:when>
                                                                          <xsl:otherwise>
                                                                            <input type="hidden" name="p_color_1_fk" value="{color_1}"/>
                                                                            <input type="hidden" name="p_color_1_fk_desc" value="{color_1_desc}"/>
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
                                            <xsl:if test="rows/content/tabcontent_1/item[@name='formlist']">
                                              <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-formlist" rel="tab-tabcontent_1-formlist">
                                                <div class="row">
                                                  <div class="gen-column col-md-12">
                                                    <div class="gen-inner">
                                                      <xsl:if test="rows/content/formlist_1">
                                                        <div class="box box-table-contents gen-container-item ">
                                                          <div class="box-body table-box">
                                                            <table id="formlist_1" class="table table-striped gen-data-table IGRP_formlist" rel="T_formlist_1" data-control="data-formlist_1">
                                                              <thead>
                                                                <tr gen-id="drop-zone" gen-field-template="table.th">
                                                                  <xsl:if test="rows/content/formlist_1/fields/link_1">
                                                                    <th align="" class="gen-fields-holder">
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/formlist_1/fields/link_1/label"/>
                                                                      </span>
                                                                    </th>
                                                                  </xsl:if>
                                                                  <xsl:if test="rows/content/formlist_1/fields/email_1">
                                                                    <th align="" class="gen-fields-holder">
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/formlist_1/fields/email_1/label"/>
                                                                      </span>
                                                                    </th>
                                                                  </xsl:if>
                                                                  <xsl:if test="rows/content/formlist_1/fields/text_1">
                                                                    <th align="" class="gen-fields-holder">
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/formlist_1/fields/text_1/label"/>
                                                                      </span>
                                                                    </th>
                                                                  </xsl:if>
                                                                  <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                                                    <th class="table-btn">
                                                                      <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                                                        <xsl:if test="not(@nodelete)">
                                                                          <span class="formlist-row-add" rel="formlist_1">
                                                                            <i class="fa fa-plus"/>
                                                                          </span>
                                                                        </xsl:if>
                                                                      </xsl:if>
                                                                    </th>
                                                                  </xsl:if>
                                                                </tr>
                                                              </thead>
                                                              <tbody>
                                                                <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                                                  <tr gen-id="drop-zone" row="{position()}">
                                                                    <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/>
                                                                    <xsl:if test="link_1">
                                                                      <xsl:if test="not(link_1/@visible)">
                                                                        <td align="" data-row="{position()}" data-title="{../../fields/link_1/label}" class="link gen-fields-holder">
                                                                          <input type="hidden" name="{../../../fields/link_1/@name}_fk_desc" value="{link_1_desc}"/>
                                                                          <input type="hidden" name="{../../../fields/link_1/@name}_fk" value="{link_1}" rel="F_formlist_1"/>
                                                                          <a href="{link_1}" name="p_link_1" class="link  form-link" target="_blank">
                                                                            <xsl:value-of select="link_1_desc" disable-output-escaping="yes"/>
                                                                          </a>
                                                                        </td>
                                                                      </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="email_1">
                                                                      <xsl:if test="not(email_1/@visible)">
                                                                        <td align="" data-row="{position()}" data-title="{../../fields/email_1/label}" class="email gen-fields-holder">
                                                                          <input type="hidden" name="{../../../fields/email_1/@name}_fk_desc" value="{email_1_desc}"/>
                                                                          <div class="form-group" item-name="email_1" item-type="email">
                                                                            <input type="email" name="{../../../fields/email_1/@name}_fk" value="{email_1}" class="email form-control" rel="F_formlist_1"/>
                                                                          </div>
                                                                        </td>
                                                                      </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="text_1">
                                                                      <xsl:if test="not(text_1/@visible)">
                                                                        <td align="" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text gen-fields-holder">
                                                                          <input type="hidden" name="{../../../fields/text_1/@name}_fk_desc" value="{text_1_desc}"/>
                                                                          <div class="form-group" item-name="text_1" item-type="text">
                                                                            <input type="text" name="{../../../fields/text_1/@name}_fk" value="{text_1}" class="text form-control" rel="F_formlist_1"/>
                                                                          </div>
                                                                        </td>
                                                                      </xsl:if>
                                                                    </xsl:if>
                                                                    <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                      <td class="table-btn" data-row="{position()}">
                                                                        <xsl:if test="not(@nodelete)">
                                                                          <span class="formlist-row-remove" rel="formlist_1">
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
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/highcharts/funnel.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.js">
        </script>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js">
        </script>
        <!-- FORMLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/formlist/includes/igrp.formlist.js">
        </script>
        <!-- LOOKUP JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1461535604734"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1461535604734"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1461535604734"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1461535604734"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1461535604735"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1461535604735"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1461535604735"/>
</xsl:stylesheet>
