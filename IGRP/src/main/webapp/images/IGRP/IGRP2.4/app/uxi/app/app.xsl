<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/components/formlist/style.css?v={$version}"/>
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
                  <div class="row " id="row-0dec5441">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/form_1">
                          <div class="card igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <div class="card-body">
                              <div class="row g-4" role="form">
                                <xsl:if test="rows/content/form_1/fields/form_1_text_1">
                                  <div class="col-md-9 gen-fields-holder" item-name="form_1_text_1" item-type="text">
                                    <label for="{rows/content/form_1/fields/form_1_text_1/@name}" class="form-label">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/form_1_text_1/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/form_1_text_1/value}" class="form-control  " inputmask="" id="{rows/content/form_1/fields/form_1_text_1/@name}" name="{rows/content/form_1/fields/form_1_text_1/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/form_1/fields/form_1_text_1/@placeholder}"/>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/form_1_date_1">
                                  <div class="form-group col-sm-3 gen-date-picker-wrapper gen-fields-holder" item-name="form_1_date_1" item-type="date">
                                    <xsl:apply-templates mode="igrp-form-date-field" select="rows/content/form_1/fields/form_1_date_1">
                                      <xsl:with-param name="format" select="'d-m-Y'"/>
                                      <xsl:with-param name="enableTime" select="'true'"/>
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
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/formlist_1">
                          <div class="box box-table-contents card igrp-formlist-wrapper gen-container-item " gen-class="" item-name="formlist_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/formlist_1/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <div class="box-body table-box card-body ">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/>
                              <div class="table-responsive table-card">
                                <table id="formlist_1" class="table  table-striped  gen-data-table  IGRP_formlist  nodelete  " rel="T_formlist_1" data-control="data-formlist_1">
                                  <thead class=" border-top">
                                    <tr>
                                      <xsl:if test="rows/content/formlist_1/fields/formlist_1_text_1">
                                        <th td-name="formlist_1_text_1" align="" show-label="" class="text  gen-fields-holder" group-in="">
                                          <span>
                                            <xsl:value-of select="rows/content/formlist_1/fields/formlist_1_text_1/label"/>
                                          </span>
                                        </th>
                                      </xsl:if>
                                      <xsl:if test="rows/content/formlist_1/fields/formlist_1_email_1">
                                        <th td-name="formlist_1_email_1" align="" show-label="" class="email  gen-fields-holder" group-in="">
                                          <span>
                                            <xsl:value-of select="rows/content/formlist_1/fields/formlist_1_email_1/label"/>
                                          </span>
                                        </th>
                                      </xsl:if>
                                      <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                        <th class="table-btn add" style="width:1px">
                                          <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                            <a class="formlist-row-add link-primary  d-flex align-items-center justify-content-center" rel="formlist_1" title="{$locale-strings/add-row}" data-toggle="tooltip" data-placement="left">
                                              <i class="bx bx-add-to-queue"/>
                                            </a>
                                          </xsl:if>
                                        </th>
                                      </xsl:if>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/formlist_1/table/value/row[not(@total='yes')]">
                                      <tr row="{position()}">
                                        <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/>
                                        <xsl:apply-templates mode="form-hidden-fields" select="."/>		
                                        <xsl:if test="formlist_1_text_1">
                                          <xsl:if test="not(formlist_1_text_1/@visible)">
                                            <td align="" data-row="{position()}" data-title="{../../../fields/formlist_1_text_1/label}" class="text" item-name="formlist_1_text_1">
                                              <input type="hidden" name="{../../../fields/formlist_1_text_1/@name}_fk_desc" value="{formlist_1_text_1_desc}"/>
                                              <div class="form-group" item-name="formlist_1_text_1" item-type="text">
                                                <input type="text" name="{../../../fields/formlist_1_text_1/@name}_fk" inputmask="" value="{formlist_1_text_1}" class="text form-control" rel="F_formlist_1" placeholder="">
                                                  <xsl:call-template name="setAttributes">
                                                    <xsl:with-param name="field" select="rows/content/formlist_1/fields/formlist_1_text_1"/>
                                                  </xsl:call-template>
                                                </input>
                                              </div>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="formlist_1_email_1">
                                          <xsl:if test="not(formlist_1_email_1/@visible)">
                                            <td align="" data-row="{position()}" data-title="{../../../fields/formlist_1_email_1/label}" class="email" item-name="formlist_1_email_1">
                                              <input type="hidden" name="{../../../fields/formlist_1_email_1/@name}_fk_desc" value="{formlist_1_email_1_desc}"/>
                                              <div class="form-group" item-name="formlist_1_email_1" item-type="email">
                                                <input type="email" name="{../../../fields/formlist_1_email_1/@name}_fk" inputmask="" value="{formlist_1_email_1}" class="email form-control" rel="F_formlist_1" placeholder="">
                                                  <xsl:call-template name="setAttributes">
                                                    <xsl:with-param name="field" select="rows/content/formlist_1/fields/formlist_1_email_1"/>
                                                  </xsl:call-template>
                                                </input>
                                              </div>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="not(@nodelete) or not(@noupdate)">
                                          <td class="table-btn delete" data-row="{position()}">
                                            <xsl:if test="not(@nodelete)">
                                              <span class="formlist-row-remove link-danger d-flex align-items-center justify-content-center" rel="formlist_1" title="{$locale-strings/remove-row}" data-toggle="tooltip" data-placement="bottom">
                                                <i class="bx bx-trash"/>
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
        <!-- FORMLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
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
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/component.form.fields.xsl?v=28"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=28"/>
</xsl:stylesheet>
