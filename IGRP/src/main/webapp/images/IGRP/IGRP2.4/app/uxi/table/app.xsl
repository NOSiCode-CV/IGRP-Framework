<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.design.system.table.css?v={$version}"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/daterangepicker.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/igrp.ds.toolsbar.css"/>
       
        
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
                  <div class="row " id="row-880f8ad1">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/toolsbar_1">
                          <div class="toolsbar-holder clearfix gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1">
                            <div class="btns-holder  justify-content-end d-flex align-items-center clearfix" role="group">
                              <xsl:apply-templates select="rows/content/toolsbar_1" mode="igrp-button-item">
                                <xsl:with-param name="rounded" select="'false'"/>
                              </xsl:apply-templates>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/table_1">
                          <div class="card igrp-table gen-container-item " gen-class="" item-name="table_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                              <xsl:with-param name="collapsible" select="'undefined'"/>
                              <xsl:with-param name="collapsed" select="''"/>
                            </xsl:call-template>
                            <div class="card-body">
                              <div>
                                <div class="table-responsive table-card">
                                  <table class="table align-middle table-hover  table-bordered" id="table-table_1">
                                    <thead class="table-light">
                                      <tr>
                                        <xsl:if test="rows/content/table_1/fields/table_1_text_1">
                                          <th td-name="table_1_text_1" align="left" show-label="true" class="text  gen-fields-holder" group-in="">
                                            <span>
                                              <xsl:value-of select="rows/content/table_1/fields/table_1_text_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                        <xsl:if test="rows/content/table_1/fields/table_1_date_1">
                                          <th td-name="table_1_date_1" align="left" show-label="true" class="date  gen-fields-holder" group-in="">
                                            <span>
                                              <xsl:value-of select="rows/content/table_1/fields/table_1_date_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                        <xsl:if test="rows/content/table_1/table/context-menu/item">
                                          <th class="igrp-table-ctx-th"/>
                                        </xsl:if>
                                      </tr>
                                    </thead>
                                    <tbody class="list form-check-all">
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
                                          <xsl:if test="table_1_date_1">
                                            <td align="left" data-order="{table_1_date_1}" data-row="{position()}" data-title="{../../../fields/table_1_date_1/label}" class="date" item-name="table_1_date_1">
                                              <span class="">
                                                <xsl:value-of select="table_1_date_1"/>
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
                                  <div class="noresult" style="display: none">
                                    <div class="text-center">
                                      <lord-icon src="https://cdn.lordicon.com/msoeawqm.json" trigger="loop" colors="primary:#121331,secondary:#08a88a" style="width:75px;height:75px"/>
                                      <h5 class="mt-2">Sorry! No Result Found
                                      </h5>
                                      <p class="text-muted mb-0">We've searched more than 150+ leads We did not find any leads for you search.
                                      </p>
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
        <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/moment/moment.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/datepicker2/daterangepicker.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/datepicker2/IGRP.daterangepicker.config.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/datepicker2/locale/dp.locale.pt.js?v={$version}"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=21"/>
</xsl:stylesheet>
