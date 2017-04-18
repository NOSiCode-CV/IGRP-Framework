<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
        <!-- CHART CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/chart/includes/igrp.charts.css"/>
        <!-- VIEW CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/view/includes/igrp.view.css"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
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
                          <section  class="content-header gen-container-item ">
                            <h1>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                            </h1>
                          </section>
                        </xsl:if>
                        <xsl:if  test="rows/content/paragraph_1">
                          <div  class="gen-container-item ">
                            <div class="box-body">
                              <p>
                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/text/value"/>
                              </p>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/tabcontent_1">
                          <div  class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                            <ul class="nav nav-tabs">
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab1']">
                                <li class="active gen-fields-holder" rel="tab-tabcontent_1-tab1">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab1">
                                    <i class="fa fa-dot-circle-o"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab1']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab2']">
                                <li class=" gen-fields-holder" rel="tab-tabcontent_1-tab2">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab2">
                                    <i class="fa fa-bar-chart"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='tab2']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                            </ul>
                            <div class="tab-content">
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab1']">
                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-tab1" rel="tab-tabcontent_1-tab1">
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/paragraph_2">
                                          <div class="gen-container-item ">
                                            <div class="box-body">
                                              <p>
                                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_2/fields/text/value"/>
                                              </p>
                                            </div>
                                          </div>
                                        </xsl:if>
                                        <xsl:if test="rows/content/tabcontent_2">
                                          <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                            <ul class="nav nav-tabs">
                                              <xsl:if test="rows/content/tabcontent_2/item[@name='tab11']">
                                                <li class="active gen-fields-holder" rel="tab-tabcontent_2-tab11">
                                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-tab11">
                                                    <i class="fa fa-at"/>
                                                    <span gen-lbl-setter="true">
                                                      <xsl:value-of select="rows/content/tabcontent_2/item[@name='tab11']/title"/>
                                                    </span>
                                                  </a>
                                                </li>
                                              </xsl:if>
                                              <xsl:if test="rows/content/tabcontent_2/item[@name='tab12']">
                                                <li class=" gen-fields-holder" rel="tab-tabcontent_2-tab12">
                                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-tab12">
                                                    <i class="fa fa-ban"/>
                                                    <span gen-lbl-setter="true">
                                                      <xsl:value-of select="rows/content/tabcontent_2/item[@name='tab12']/title"/>
                                                    </span>
                                                  </a>
                                                </li>
                                              </xsl:if>
                                            </ul>
                                            <div class="tab-content">
                                              <xsl:if test="rows/content/tabcontent_2/item[@name='tab11']">
                                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_2-tab11" rel="tab-tabcontent_2-tab11">
                                                  <div class="row">
                                                    <div class="gen-column col-md-12">
                                                      <div class="gen-inner">
                                                        <xsl:if test="rows/content/paragraph_3">
                                                          <div class="gen-container-item ">
                                                            <div class="box-body">
                                                              <p>
                                                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_3/fields/text/value"/>
                                                              </p>
                                                            </div>
                                                          </div>
                                                        </xsl:if>
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                              </xsl:if>
                                              <xsl:if test="rows/content/tabcontent_2/item[@name='tab12']">
                                                <div class="tab-pane gen-rows-holder " id="tab-tabcontent_2-tab12" rel="tab-tabcontent_2-tab12">
                                                  <div class="row">
                                                    <div class="gen-column col-md-12">
                                                      <div class="gen-inner">
                                                        <xsl:if test="rows/content/view_1">
                                                          <div class="box clearfix view-block gen-container-item " has-img="true">
                                                            <xsl:call-template name="box-header">
                                                              <xsl:with-param name="title" select="rows/content/view_1/@title"/>
                                                              <xsl:with-param name="collapsible" select="'true'"/>
                                                            </xsl:call-template>
                                                            <div class="box-body">
                                                              <xsl:if test="rows/content/view_1/fields/view_img">
                                                                <img src="{rows/content/view_1/fields/view_img}"/>
                                                              </xsl:if>
                                                              <div class="view-body clearfix " gen-id="drop-zone">
                                                                <xsl:if test="rows/content/view_1/fields/plaintext_1">
                                                                  <div class="view-item gen-fields-holder">
                                                                    <span class="view-label">
                                                                      <xsl:value-of select="rows/content/view_1/fields/plaintext_1/label"/>
                                                                    </span>
                                                                    <span class="view-value">
                                                                      <xsl:value-of select="rows/content/view_1/fields/plaintext_1/value"/>
                                                                    </span>
                                                                  </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/text_1">
                                                                  <div class="view-item gen-fields-holder">
                                                                    <span class="view-label">
                                                                      <xsl:value-of select="rows/content/view_1/fields/text_1/label"/>
                                                                    </span>
                                                                    <span class="view-value">
                                                                      <xsl:value-of select="rows/content/view_1/fields/text_1/value"/>
                                                                    </span>
                                                                  </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/view_1/fields/link_1">
                                                                  <div class="view-item gen-fields-holder">
                                                                    <a href="{rows/content/view_1/fields/link_1/value}" target="_blank">
                                                                      <span gen-lbl-setter="">
                                                                        <xsl:value-of select="rows/content/view_1/fields/link_1/label"/>
                                                                      </span>
                                                                    </a>
                                                                  </div>
                                                                </xsl:if>
                                                              </div>
                                                            </div>
                                                          </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_4">
                                                          <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                                            <ul class="nav nav-tabs">
                                                              <xsl:if test="rows/content/tabcontent_4/item[@name='tab_121']">
                                                                <li class="active gen-fields-holder" rel="tab-tabcontent_4-tab_121">
                                                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_4-tab_121">
                                                                    <i class="fa fa-dot-circle-o"/>
                                                                    <span gen-lbl-setter="true">
                                                                      <xsl:value-of select="rows/content/tabcontent_4/item[@name='tab_121']/title"/>
                                                                    </span>
                                                                  </a>
                                                                </li>
                                                              </xsl:if>
                                                              <xsl:if test="rows/content/tabcontent_4/item[@name='tab_122']">
                                                                <li class=" gen-fields-holder" rel="tab-tabcontent_4-tab_122">
                                                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_4-tab_122">
                                                                    <i class="fa fa-dot-circle-o"/>
                                                                    <span gen-lbl-setter="true">
                                                                      <xsl:value-of select="rows/content/tabcontent_4/item[@name='tab_122']/title"/>
                                                                    </span>
                                                                  </a>
                                                                </li>
                                                              </xsl:if>
                                                            </ul>
                                                            <div class="tab-content">
                                                              <xsl:if test="rows/content/tabcontent_4/item[@name='tab_121']">
                                                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_4-tab_121" rel="tab-tabcontent_4-tab_121">
                                                                  <div class="row">
                                                                    <div class="gen-column col-md-10">
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
                                                                                      <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                                                        <xsl:if test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                                                          <th align="" item-name="email_1" class="gen-fields-holder">
                                                                                            <span gen-lbl-setter="">
                                                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label"/>
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
                                                                                        <xsl:if test="email_1">
                                                                                          <xsl:choose>
                                                                                            <xsl:when test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                                                              <td data-row="{position()}" data-title="{../../../fields/email_1/label}" class="email gen-fields-holder">
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
                                                                    <div class="gen-column col-md-2">
                                                                      <div class="gen-inner">
                                                                        <xsl:if test="rows/content/verticalmenu_1">
                                                                          <div class="igrp-vertical-menu gen-container-item " gen-fields=".list-group a.list-group-item">
                                                                            <div class="list-group">
                                                                              <xsl:apply-templates select="rows/content/verticalmenu_1" mode="gen-buttons">
                                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                              </xsl:apply-templates>
                                                                            </div>
                                                                          </div>
                                                                        </xsl:if>
                                                                      </div>
                                                                    </div>
                                                                  </div>
                                                                </div>
                                                              </xsl:if>
                                                              <xsl:if test="rows/content/tabcontent_4/item[@name='tab_122']">
                                                                <div class="tab-pane gen-rows-holder " id="tab-tabcontent_4-tab_122" rel="tab-tabcontent_4-tab_122">
                                                                  <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                      <div class="gen-inner">
                                                                        <xsl:if test="rows/content/table_1">
                                                                          <div class="box box-table-contents gen-container-item ">
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
                                                                                      <th align="left" class="gen-fields-holder">
                                                                                        <span gen-lbl-setter="">
                                                                                          <xsl:value-of select="rows/content/table_1/fields/text_1/label"/>
                                                                                        </span>
                                                                                      </th>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/table_1/fields/number_1">
                                                                                      <th align="left" class="gen-fields-holder">
                                                                                        <span gen-lbl-setter="">
                                                                                          <xsl:value-of select="rows/content/table_1/fields/number_1/label"/>
                                                                                        </span>
                                                                                      </th>
                                                                                    </xsl:if>
                                                                                  </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                  <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                                    <tr gen-id="drop-zone">
                                                                                      <xsl:apply-templates mode="context-param" select="context-menu"/> 
                                                                                      <xsl:if test="color_1">
                                                                                        <td align="" data-row="{position()}" data-title="{../../label/color_1}" class="color gen-fields-holder">
                                                                                          <xsl:call-template name="tdcolor">
                                                                                            <xsl:with-param name="color" select="color_1"/>
                                                                                          </xsl:call-template>
                                                                                        </td>
                                                                                      </xsl:if>
                                                                                      <xsl:if test="text_1">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text gen-fields-holder">
                                                                                          <span class="">
                                                                                            <xsl:value-of select="text_1"/>
                                                                                          </span>
                                                                                        </td>
                                                                                      </xsl:if>
                                                                                      <xsl:if test="number_1">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../fields/number_1/label}" class="number gen-fields-holder">
                                                                                          <span class="">
                                                                                            <xsl:value-of select="number_1"/>
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
                                                                        <xsl:if test="rows/content/tabcontent_5">
                                                                          <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                                                            <ul class="nav nav-tabs">
                                                                              <xsl:if test="rows/content/tabcontent_5/item[@name='last']">
                                                                                <li class="active gen-fields-holder" rel="tab-tabcontent_5-last">
                                                                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_5-last">
                                                                                    <i class="fa fa-arrow-circle-down"/>
                                                                                    <span gen-lbl-setter="true">
                                                                                      <xsl:value-of select="rows/content/tabcontent_5/item[@name='last']/title"/>
                                                                                    </span>
                                                                                  </a>
                                                                                </li>
                                                                              </xsl:if>
                                                                            </ul>
                                                                            <div class="tab-content">
                                                                              <xsl:if test="rows/content/tabcontent_5/item[@name='last']">
                                                                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_5-last" rel="tab-tabcontent_5-last">
                                                                                  <div class="row">
                                                                                    <div class="gen-column col-md-12">
                                                                                      <div class="gen-inner">
                                                                                        <xsl:if test="rows/content/carousel_1">
                                                                                          <div id="carousel_1" class="carousel slide gen-container-item " data-ride="carousel" gen-fields=".carousel-inner .item">
                                                                                            <xsl:apply-templates select="rows/content/carousel_1" mode="igrp-carousel">
                                                                                              <xsl:with-param name="id" select="'carousel_1'"/>
                                                                                            </xsl:apply-templates>
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
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='tab2']">
                                <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab2" rel="tab-tabcontent_1-tab2">
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/tabcontent_3">
                                          <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default">
                                            <ul class="nav nav-tabs">
                                              <xsl:if test="rows/content/tabcontent_3/item[@name='tab2_charts']">
                                                <li class="active gen-fields-holder" rel="tab-tabcontent_3-tab2_charts">
                                                  <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_3-tab2_charts">
                                                    <i class="fa fa-dot-circle-o"/>
                                                    <span gen-lbl-setter="true">
                                                      <xsl:value-of select="rows/content/tabcontent_3/item[@name='tab2_charts']/title"/>
                                                    </span>
                                                  </a>
                                                </li>
                                              </xsl:if>
                                            </ul>
                                            <div class="tab-content">
                                              <xsl:if test="rows/content/tabcontent_3/item[@name='tab2_charts']">
                                                <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_3-tab2_charts" rel="tab-tabcontent_3-tab2_charts">
                                                  <div class="row">
                                                    <div class="gen-column col-md-4">
                                                      <div class="gen-inner">
                                                        <xsl:if test="rows/content/chart_2">
                                                          <div class="box gen-container-item " gen-structure="graphic">
                                                            <xsl:call-template name="box-header">
                                                              <xsl:with-param name="title" select="rows/content/chart_2/@title"/>
                                                              <xsl:with-param name="collapsible" select="'true'"/>
                                                            </xsl:call-template>
                                                            <div class="box-body">
                                                              <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_2"/>
                                                                <xsl:with-param name="chart_type" select="'area'"/>
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
                                                        <xsl:if test="rows/content/chart_1">
                                                          <div class="box gen-container-item " gen-structure="graphic">
                                                            <xsl:call-template name="box-header">
                                                              <xsl:with-param name="title" select="rows/content/chart_1/@title"/>
                                                              <xsl:with-param name="collapsible" select="'true'"/>
                                                            </xsl:call-template>
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
                                                    <div class="gen-column col-md-4">
                                                      <div class="gen-inner">
                                                        <xsl:if test="rows/content/chart_3">
                                                          <div class="box gen-container-item " gen-structure="graphic">
                                                            <xsl:call-template name="box-header">
                                                              <xsl:with-param name="title" select="rows/content/chart_3/@title"/>
                                                              <xsl:with-param name="collapsible" select="'true'"/>
                                                            </xsl:call-template>
                                                            <div class="box-body">
                                                              <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_3"/>
                                                                <xsl:with-param name="chart_type" select="'stackedcolumn'"/>
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
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- COLOR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1461157375812"/>
  <xsl:include href="../../xsl/tmpl/IGRP-carousel.tmpl.xsl?v=1461157375813"/>
</xsl:stylesheet>
