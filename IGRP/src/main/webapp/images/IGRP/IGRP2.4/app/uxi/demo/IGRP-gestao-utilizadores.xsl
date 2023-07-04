<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <style/>
      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header"/>
          <xsl:call-template name="igrp-sidebar"/>
          <div class="main-content">
            <div class="page-content">
              <div class="container-fluid">
                <xsl:call-template name="igrp-page-title"/>
                <div class="igrp-page-contents">
                  <div class="row align-items-center" id="row-2cfec9fa">
                    <div class="gen-column col-sm-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/paragraph_1">
                          <div class="disable-output-escaping text-muted igrp-paragraph gen-container-item " gen-class="" item-name="paragraph_1">
                            <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/paragraph_1_text/value"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                    <div class="gen-column col-sm-6">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/toolsbar_1">
                          <div class="toolsbar-holder soft gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1">
                            <div class="btns-holder  justify-content-end d-flex align-items-center" role="group">
                              <xsl:apply-templates select="rows/content/toolsbar_1" mode="igrp-button-item">
                                <xsl:with-param name="style" select="'btn'"/>
                                <xsl:with-param name="rounded" select="'true'"/>
                              </xsl:apply-templates>
                            </div>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="row " id="row-231d9fc3">
                    <div class="gen-column col-sm-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/form_1">
                          <div class="card igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <div class="card-body">
                              <div class="row" role="form">
                                <xsl:if test="rows/content/form_1/fields/form_1_email_1">
                                  <div class="col-sm-3 gen-fields-holder" item-name="form_1_email_1" item-type="email">
                                    <label for="{rows/content/form_1/fields/form_1_email_1/@name}" class="form-label">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/form_1_email_1/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/form_1_email_1/value}" class="form-control  " inputmask="" id="{rows/content/form_1/fields/form_1_email_1/@name}" name="{rows/content/form_1/fields/form_1_email_1/@name}" maxlength="250" placeholder="{rows/content/form_1/fields/form_1_email_1/@placeholder}"/>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/form_1_email_2">
                                  <div class="col-sm-3 gen-fields-holder" item-name="form_1_email_2" item-type="email">
                                    <label for="{rows/content/form_1/fields/form_1_email_2/@name}" class="form-label">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/form_1_email_2/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/form_1_email_2/value}" class="form-control  " inputmask="" id="{rows/content/form_1/fields/form_1_email_2/@name}" name="{rows/content/form_1/fields/form_1_email_2/@name}" maxlength="250" placeholder="{rows/content/form_1/fields/form_1_email_2/@placeholder}"/>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/form_1_email_3">
                                  <div class="col-sm-3 gen-fields-holder" item-name="form_1_email_3" item-type="email">
                                    <label for="{rows/content/form_1/fields/form_1_email_3/@name}" class="form-label">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/form_1_email_3/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/form_1_email_3/value}" class="form-control  " inputmask="" id="{rows/content/form_1/fields/form_1_email_3/@name}" name="{rows/content/form_1/fields/form_1_email_3/@name}" maxlength="250" placeholder="{rows/content/form_1/fields/form_1_email_3/@placeholder}"/>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/form_1_email_4">
                                  <div class="col-sm-3 gen-fields-holder" item-name="form_1_email_4" item-type="email">
                                    <label for="{rows/content/form_1/fields/form_1_email_4/@name}" class="form-label">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/form_1_email_4/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/form_1_email_4/value}" class="form-control  " inputmask="" id="{rows/content/form_1/fields/form_1_email_4/@name}" name="{rows/content/form_1/fields/form_1_email_4/@name}" maxlength="250" placeholder="{rows/content/form_1/fields/form_1_email_4/@placeholder}"/>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/box_1">
                          <div class="card igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                            <div class="card-body" gen-preserve-content="true">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_1/fields"/>
                              <div>
                                <div class="row " id="row-41c9cff0">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/table_1">
                                        <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                          <div class="box-body ">
                                            <div class="table-contents-head">
                                              <div class="table-contents-inner">
                                              </div>
                                            </div>
                                            <div class="table-box">
                                              <div class="table-box-inner">
                                                <table id="table_1" class="table table-striped    " exports="">
                                                  <thead>
                                                    <tr>
                                                      <xsl:if test="rows/content/table_1/fields/table_1_text_1">
                                                        <th td-name="table_1_text_1" align="left" show-label="true" class="text  gen-fields-holder" group-in="">
                                                          <span>
                                                            <xsl:value-of select="rows/content/table_1/fields/table_1_text_1/label"/>
                                                          </span>
                                                        </th>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/table_1/fields/table_1_text_1_1">
                                                        <th td-name="table_1_text_1_1" align="left" show-label="true" class="text  gen-fields-holder" group-in="">
                                                          <span>
                                                            <xsl:value-of select="rows/content/table_1/fields/table_1_text_1_1/label"/>
                                                          </span>
                                                        </th>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/table_1/table/context-menu/item">
                                                        <th class="igrp-table-ctx-th"/>
                                                      </xsl:if>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                      <tr>
                                                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                        <xsl:if test="table_1_text_1">
                                                          <td align="left" data-order="{table_1_text_1}" data-row="{position()}" data-title="{../../../fields/table_1_text_1/label}" class="text" item-name="table_1_text_1">
                                                            <span class="">
                                                              <xsl:value-of select="table_1_text_1"/>
                                                            </span>
                                                          </td>
                                                        </xsl:if>
                                                        <xsl:if test="table_1_text_1_1">
                                                          <td align="left" data-order="{table_1_text_1_1}" data-row="{position()}" data-title="{../../../fields/table_1_text_1_1/label}" class="text" item-name="table_1_text_1_1">
                                                            <span class="">
                                                              <xsl:value-of select="table_1_text_1_1"/>
                                                            </span>
                                                          </td>
                                                        </xsl:if>
                                                        <xsl:if test="//rows/content/table_1/table/context-menu/item">
                                                          <td class="igrp-table-ctx-td">
                                                            <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                              <xsl:with-param name="row-params" select="context-menu"/>
                                                              <xsl:with-param name="type" select="'inl'"/>
                                                            </xsl:apply-templates>
                                                          </td>
                                                        </xsl:if>
                                                      </tr>
                                                    </xsl:for-each>
                                                  </tbody>
                                                </table>
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
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <xsl:call-template name="igrp-scripts"/>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=22"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=22"/>
</xsl:stylesheet>
