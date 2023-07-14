<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/components/separatorlist/igrp.separatorlist.css?v={$version}"/>
        <style/>
      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header"/>
          <xsl:call-template name="igrp-sidebar"/>
          <div class="main-content">
            <form method="POST" class="IGRP-form page-content" name="formular_default" enctype="multipart/form-data">
              <div class="container-fluid">
                <xsl:call-template name="igrp-page-title"/>
                <div class="igrp-page-contents">
                  <div class="row " id="row-5f09089a">
                    <div class="gen-column col-md-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/separatorlist_1">
                          <div class="box card gen-container-item " id="separatorlist1689248489774" gen-class="" item-name="separatorlist_1">
                            <div class="card-header d-flex align-items-center ">
                              <h3 class="card-title ">
                                <xsl:value-of select="rows/content/separatorlist_1/@title"/>
                              </h3>
                              <xsl:if test="(not(rows/content/separatorlist_1/@noadd) or rows/content/separatorlist_1/@noadd != 'true')">
                                <div class="ms-auto d-flex align-items-center">
                                  <a href="#" class=" fs-12 link-muted p-2 export-data d-flex align-items-center me-1">
                                    Exportar
                                  </a>
                   
                                  <a class="btn fs-12 btn-sm btn-success show-add-row text-capitalize">
                                    <xsl:value-of select="$locale-strings/add"/>
                                  </a>
                                </div>
                              </xsl:if>
                            </div>
                            <div class="box-body card-body IGRP-separatorlist pt-0" tag="separatorlist_1" dialog="false">
                              <xsl:if test="rows/content/separatorlist_1/@noedit and rows/content/separatorlist_1/@noedit = 'true'">
                                <xsl:attribute name="noedt">
                                  <xsl:value-of select="rows/content/separatorlist_1/@noedit"/>
                                </xsl:attribute>
                              </xsl:if>
                              <xsl:if test="rows/content/separatorlist_1/@noadd and rows/content/separatorlist_1/@noadd = 'true'">
                                <xsl:attribute name="noadd">
                                  <xsl:value-of select="rows/content/separatorlist_1/@noadd"/>
                                </xsl:attribute>
                              </xsl:if>
                              <xsl:if test="rows/content/separatorlist_1/@nodelete and rows/content/separatorlist_1/@nodelete = 'true'">
                                <xsl:attribute name="nodel">
                                  <xsl:value-of select="rows/content/separatorlist_1/@nodelete"/>
                                </xsl:attribute>
                              </xsl:if>
                              <div class="splist-form-holder pt-4 ">
                                <xsl:if test="(not(rows/content/separatorlist_1/@noadd) or rows/content/separatorlist_1/@noadd != 'true')">
                                  <div class="splist-form row g-4" role="form">
                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_1">
                                      <div class="col-md-6 gen-fields-holder" item-name="separatorlist_1_text_1" item-type="text">
                                        <xsl:apply-templates mode="igrp-form-field" select="rows/content/separatorlist_1/fields/separatorlist_1_text_1">
                                          <xsl:with-param name="change" select="''"/>
                                          <xsl:with-param name="declabel" select="''"/>
                                          <xsl:with-param name="inputmask" select="''"/>
                                          <xsl:with-param name="maxlength" select="'250'"/>
                                        </xsl:apply-templates>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_date_1">
                                      <div class="form-group col-sm-6 gen-date-picker-wrapper gen-fields-holder" item-name="separatorlist_1_date_1" item-type="date">
                                        <xsl:apply-templates mode="igrp-form-date-field" select="rows/content/separatorlist_1/fields/separatorlist_1_date_1">
                                          <xsl:with-param name="format" select="'d-m-Y'"/>
                                          <xsl:with-param name="enableTime" select="'false'"/>
                                          <xsl:with-param name="disableWeekends" select="'false'"/>
                                          <xsl:with-param name="disabledBeforetoday" select="'false'"/>
                                          <xsl:with-param name="range" select="'false'"/>
                                          <xsl:with-param name="change" select="''"/>
                                          <xsl:with-param name="maxlength" select="'250'"/>
                                          <xsl:with-param name="placeholder" select="''"/>
                                        </xsl:apply-templates>
                                      </div>
                                    </xsl:if>
                                  </div>
                                </xsl:if>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table  table-card mt-0">
                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table  table- gen-data-table">
                                  <thead class="table-light">
                                    <tr>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_1">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_1/@visible)">
                                          <th align="" item-name="separatorlist_1_text_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_date_1">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_date_1/@visible)">
                                          <th align="" item-name="separatorlist_1_date_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_date_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <xsl:if test="(not(rows/content/separatorlist_1/@noadd) or rows/content/separatorlist_1/@noadd != 'true')">
                                          <a class="table-row-add btn-xs btn btn-primary" title="Add" data-toggle="tooltip" data-placement="left">
                                            <i class="fa fa-plus"/>
                                          </a>
                                        </xsl:if>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                      <tr>
                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                        <xsl:apply-templates mode="form-hidden-fields" select="."/>		
                                        <xsl:if test="separatorlist_1_text_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_1/@visible)">
                                              <td field="separatorlist_1_text_1" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_1/label}" class="text" item-name="separatorlist_1_text_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_1_fk" value="{separatorlist_1_text_1}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_1_fk_desc" value="{separatorlist_1_text_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_1_fk" value="{separatorlist_1_text_1}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_1_fk_desc" value="{separatorlist_1_text_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_date_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_date_1/@visible)">
                                              <td field="separatorlist_1_date_1" data-row="{position()}" data-title="{../../../fields/separatorlist_1_date_1/label}" class="date" item-name="separatorlist_1_date_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_date_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_date_1_fk" value="{separatorlist_1_date_1}"/>
                                                <input type="hidden" name="p_separatorlist_1_date_1_fk_desc" value="{separatorlist_1_date_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_date_1_fk" value="{separatorlist_1_date_1}"/>
                                              <input type="hidden" name="p_separatorlist_1_date_1_fk_desc" value="{separatorlist_1_date_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn" style="vertical-align:middle">
                                          <div class="d-flex align-items-center">
                                            <xsl:if test="not(//rows/content/separatorlist_1/@noedit) or //rows/content/separatorlist_1/@noedit != 'true'">
                                              <span class="table-row-undo btn btn-ghost-dark d-none" rel="separatorlist_1">
                                                <i class="ri-arrow-go-back-line"/>
                                              </span>
                                              <span class="table-row-edit btn btn-ghost-success " rel="separatorlist_1">
                                                <i class="ri-edit-2-line"/>
                                              </span>
                                            </xsl:if>
                                            <xsl:if test="not(//rows/content/separatorlist_1/@nodelete) or //rows/content/separatorlist_1/@nodelete != 'true'">
                                              <span class="table-row-remove btn btn-ghost-danger" rel="separatorlist_1">
                                                <i class="ri-delete-bin-line"/>
                                              </span>
                                            </xsl:if>
                                          </div>
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
                    <div class="gen-column col-md-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/separatorlist_2">
                          <div class="box card gen-container-item " id="separatorlist1689248677079" gen-class="" item-name="separatorlist_2">
                            <div class="card-header d-flex align-items-center ">
                              <h3 class="card-title ">
                                <xsl:value-of select="rows/content/separatorlist_2/@title"/>
                              </h3>
                              <xsl:if test="(not(rows/content/separatorlist_2/@noadd) or rows/content/separatorlist_2/@noadd != 'true')">
                                <div class="ms-auto d-flex align-items-center ">
                                  <a class="btn fs-12 btn-sm link-dark export-data me-1">
                                    Exportar
                                  </a>
                                  <a class="btn fs-12 btn-sm btn-success show-add-row text-capitalize">
                                    <xsl:value-of select="$locale-strings/add"/>
                                  </a>
                                </div>
                              </xsl:if>
                            </div>
                            <div class="box-body card-body IGRP-separatorlist pt-0" tag="separatorlist_2" dialog="false">
                              <xsl:if test="rows/content/separatorlist_2/@noedit and rows/content/separatorlist_2/@noedit = 'true'">
                                <xsl:attribute name="noedt">
                                  <xsl:value-of select="rows/content/separatorlist_2/@noedit"/>
                                </xsl:attribute>
                              </xsl:if>
                              <xsl:if test="rows/content/separatorlist_2/@noadd and rows/content/separatorlist_2/@noadd = 'true'">
                                <xsl:attribute name="noadd">
                                  <xsl:value-of select="rows/content/separatorlist_2/@noadd"/>
                                </xsl:attribute>
                              </xsl:if>
                              <xsl:if test="rows/content/separatorlist_2/@nodelete and rows/content/separatorlist_2/@nodelete = 'true'">
                                <xsl:attribute name="nodel">
                                  <xsl:value-of select="rows/content/separatorlist_2/@nodelete"/>
                                </xsl:attribute>
                              </xsl:if>
                              <div class="splist-form-holder pt-4 ">
                                <xsl:if test="(not(rows/content/separatorlist_2/@noadd) or rows/content/separatorlist_2/@noadd != 'true')">
                                  <div class="splist-form row g-4" role="form">
                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_2/fields"/>
                                    <xsl:if test="rows/content/separatorlist_2/fields/separatorlist_2_text_1">
                                      <div class="col-md-6 gen-fields-holder" item-name="separatorlist_2_text_1" item-type="text">
                                        <xsl:apply-templates mode="igrp-form-field" select="rows/content/separatorlist_2/fields/separatorlist_2_text_1">
                                          <xsl:with-param name="change" select="''"/>
                                          <xsl:with-param name="declabel" select="''"/>
                                          <xsl:with-param name="inputmask" select="''"/>
                                          <xsl:with-param name="maxlength" select="'250'"/>
                                        </xsl:apply-templates>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_2/fields/separatorlist_2_email_1">
                                      <div class="col-md-6 gen-fields-holder" item-name="separatorlist_2_email_1" item-type="email">
                                        <xsl:apply-templates mode="igrp-form-field" select="rows/content/separatorlist_2/fields/separatorlist_2_email_1">
                                          <xsl:with-param name="change" select="''"/>
                                          <xsl:with-param name="declabel" select="''"/>
                                          <xsl:with-param name="inputmask" select="''"/>
                                          <xsl:with-param name="maxlength" select="'250'"/>
                                        </xsl:apply-templates>
                                      </div>
                                    </xsl:if>
                                  </div>
                                </xsl:if>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table  table-card mt-0">
                                <table rel="T_separatorlist_2" id="separatorlist_2" class="table  table- gen-data-table">
                                  <thead class="table-light">
                                    <tr>
                                      <xsl:if test="rows/content/separatorlist_2/fields/separatorlist_2_text_1">
                                        <xsl:if test="not(//rows/content/separatorlist_2/fields/separatorlist_2_text_1/@visible)">
                                          <th align="" item-name="separatorlist_2_text_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/separatorlist_2_text_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_2/fields/separatorlist_2_email_1">
                                        <xsl:if test="not(//rows/content/separatorlist_2/fields/separatorlist_2_email_1/@visible)">
                                          <th align="" item-name="separatorlist_2_email_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/separatorlist_2_email_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <xsl:if test="(not(rows/content/separatorlist_2/@noadd) or rows/content/separatorlist_2/@noadd != 'true')">
                                          <a class="table-row-add btn-xs btn btn-primary" title="Add" data-toggle="tooltip" data-placement="left">
                                            <i class="fa fa-plus"/>
                                          </a>
                                        </xsl:if>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/separatorlist_2/table/value/row">
                                      <tr>
                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_2_id" value="{separatorlist_2_id}"/>
                                        <xsl:apply-templates mode="form-hidden-fields" select="."/>		
                                        <xsl:if test="separatorlist_2_text_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_2/fields/separatorlist_2_text_1/@visible)">
                                              <td field="separatorlist_2_text_1" data-row="{position()}" data-title="{../../../fields/separatorlist_2_text_1/label}" class="text" item-name="separatorlist_2_text_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_2_text_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_2_text_1_fk" value="{separatorlist_2_text_1}"/>
                                                <input type="hidden" name="p_separatorlist_2_text_1_fk_desc" value="{separatorlist_2_text_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_2_text_1_fk" value="{separatorlist_2_text_1}"/>
                                              <input type="hidden" name="p_separatorlist_2_text_1_fk_desc" value="{separatorlist_2_text_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_2_email_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_2/fields/separatorlist_2_email_1/@visible)">
                                              <td field="separatorlist_2_email_1" data-row="{position()}" data-title="{../../../fields/separatorlist_2_email_1/label}" class="email" item-name="separatorlist_2_email_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_2_email_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_2_email_1_fk" value="{separatorlist_2_email_1}"/>
                                                <input type="hidden" name="p_separatorlist_2_email_1_fk_desc" value="{separatorlist_2_email_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_2_email_1_fk" value="{separatorlist_2_email_1}"/>
                                              <input type="hidden" name="p_separatorlist_2_email_1_fk_desc" value="{separatorlist_2_email_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn" style="vertical-align:middle">
                                          <div class="d-flex align-items-center">
                                            <xsl:if test="not(//rows/content/separatorlist_2/@noedit) or //rows/content/separatorlist_2/@noedit != 'true'">
                                              <span class="table-row-undo btn btn-ghost-warning d-none" rel="separatorlist_2">
                                                <i class="fa fa-undo"/>
                                              </span>
                                              <span class="table-row-edit btn btn-ghost-success " rel="separatorlist_2">
                                                <i class="ri-edit-2-line"/>
                                              </span>
                                            </xsl:if>
                                            <xsl:if test="not(//rows/content/separatorlist_2/@nodelete) or //rows/content/separatorlist_2/@nodelete != 'true'">
                                              <span class="table-row-remove btn btn-ghost-danger" rel="separatorlist_2">
                                                <i class="ri-delete-bin-line"/>
                                              </span>
                                            </xsl:if>
                                          </div>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                                <xsl:if test="not(rows/content/separatorlist_2/table/value/row[0])">
                                  <div class="p-3 no-data-message">
                                    <i class="small">
                                      <xsl:value-of select="$locale-strings/separator-list-no-data-found"/>
                                    </i>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <xsl:call-template name="igrp-scripts"/>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/components/list-association/igrp.list.association.1.1.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/components/separatorlist/igrp.separatorlist.js?v={$version}"/>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/moment/moment.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/libs/flatpickr/flatpickr.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/libs/flatpickr/l10n/pt.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/libs/flatpickr/l10n/en.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/libs/choices.js/public/assets/scripts/choices.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/components/datepicker/init.js?v={$version}"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=13"/>
  <xsl:include href="../../../xsl/tmpl/component.form.fields.xsl?v=13"/>
</xsl:stylesheet>
