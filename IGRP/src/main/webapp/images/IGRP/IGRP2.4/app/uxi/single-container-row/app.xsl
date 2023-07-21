<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/components/single-container-row/style.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css?v={$version}"/>
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
                  <div class="row " id="row-c4a86bec">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/single_container_row_1">
                          <div class="igrp-inner-section single-container-row gen-container-item " gen-class="" item-name="single_container_row_1">
                            <div class="inner-body " gen-preserve-content="true">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/single_container_row_1/fields"/>
                              <div>
                                <div class="row " id="row-35835017">
                                  <div class="gen-column col-md-12">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/statbox_2">
                                        <div class="statbox_container gen-container-item " active="{rows/content/statbox_2/@active}" gen-class="" item-name="statbox_2">
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
                                              <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_title/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_2/fields/statbox_2_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/statbox_1">
                                        <div class="statbox_container gen-container-item " active="{rows/content/statbox_1/@active}" gen-class="" item-name="statbox_1">
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
                                              <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_title/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_1/fields/statbox_1_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/statbox_3">
                                        <div class="statbox_container gen-container-item " active="{rows/content/statbox_3/@active}" gen-class="" item-name="statbox_3">
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
                                              <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_title/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_3/fields/statbox_3_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/statbox_4">
                                        <div class="statbox_container gen-container-item " active="{rows/content/statbox_4/@active}" gen-class="" item-name="statbox_4">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/statbox_4/fields"/>
                                          <div class="statbox {rows/content/statbox_4/fields/statbox_4_bg/value}">
                                            <div class="boxchart">
                                              <canvas/>
                                            </div>
                                            <div class="number">
                                              <xsl:value-of select="rows/content/statbox_4/fields/statbox_4_val/value"/>
                                              <i class="fa {rows/content/statbox_4/fields/statbox_4_icn/value}" aria-hidden="true"/>
                                            </div>
                                            <div class="title">
                                              <xsl:value-of select="rows/content/statbox_4/fields/statbox_4_title/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_4/fields/statbox_4_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_4/fields/statbox_4_txt/value"/>
                                              </a>
                                            </div>
                                          </div>
                                        </div>
                                      </xsl:if>
                                      <xsl:if test="rows/content/statbox_5">
                                        <div class="statbox_container gen-container-item " active="{rows/content/statbox_5/@active}" gen-class="" item-name="statbox_5">
                                          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/statbox_5/fields"/>
                                          <div class="statbox {rows/content/statbox_5/fields/statbox_5_bg/value}">
                                            <div class="boxchart">
                                              <canvas/>
                                            </div>
                                            <div class="number">
                                              <xsl:value-of select="rows/content/statbox_5/fields/statbox_5_val/value"/>
                                              <i class="fa {rows/content/statbox_5/fields/statbox_5_icn/value}" aria-hidden="true"/>
                                            </div>
                                            <div class="title">
                                              <xsl:value-of select="rows/content/statbox_5/fields/statbox_5_title/value"/>
                                            </div>
                                            <div class="footer">
                                              <a href="{rows/content/statbox_5/fields/statbox_5_url/value}" target="modal">
                                                <xsl:value-of select="rows/content/statbox_5/fields/statbox_5_txt/value"/>
                                              </a>
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
            </form>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <xsl:call-template name="igrp-scripts"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=19"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=19"/>
</xsl:stylesheet>
