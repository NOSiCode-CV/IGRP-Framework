<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html>
      <xsl:call-template name="igrp-page-attributes"/>
      <head>
        <xsl:call-template name="igrp-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/libs/select2/select2.min.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
        <style/>
      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header"/>
          <xsl:call-template name="igrp-sidebar"/>
          <div class="main-content">
            <form method="POST" class="IGRP-form page-content" name="formular_default" enctype="multipart/form-data">
              <div class="container-fluid">
                <div class="igrp-page-header">
                  <div class="row undefined" id="row-7de3bf1b">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/page_header">
                          <div  class="igrp-page-header-basic-wrapper gen-container-item " gen-class="" item-name="page_header" gen-item-id="page_header_basic1699567258986">
                            <xsl:apply-templates mode="igrp-page-header-basic" select="rows/content/page_header"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="igrp-page-contents">
                  <div class="row " id="row-617f3360">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/form_1">
                          <div class="card igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <xsl:apply-templates mode="igrp-card-header" select="rows/content/form_1">
                              <xsl:with-param name="show-title" select="'undefined'"/>
                            </xsl:apply-templates>
                            <div class="card-body">
                              <div class="row g-4" role="form">
                                <xsl:if test="rows/content/form_1/fields/form_1_select_1">
                                  <div class="col-sm-3 form-group  gen-fields-holder" item-name="form_1_select_1" item-type="select">
                                    <xsl:apply-templates mode="igrp-form-select-field" select="rows/content/form_1/fields/form_1_select_1">
                                      <xsl:param name="parent-id" select="'form_1'"/>
                                      <xsl:param name="change" select="''"/>
                                      <xsl:param name="tags" select="'false'"/>
                                      <xsl:param name="maxlength" select="'250'"/>
                                      <xsl:with-param name="multiple" select="'false'"/>
                                    </xsl:apply-templates>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/form_1_select_choices_1">
                                  <div class="col-sm-3 form-group  gen-fields-holder" item-name="form_1_select_choices_1" item-type="select_choices">
                                    <xsl:apply-templates mode="igrp-form-select-field" select="rows/content/form_1/fields/form_1_select_choices_1">
                                      <xsl:param name="parent-id" select="'form_1'"/>
                                      <xsl:param name="change" select="''"/>
                                      <xsl:param name="tags" select="'false'"/>
                                      <xsl:param name="tags" select="'false'"/>
                                      <xsl:param name="maxlength" select="'250'"/>
                                      <xsl:with-param name="multiple" select="'false'"/>
                                      <xsl:with-param name="library" select="'choices'"/>
                                    </xsl:apply-templates>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/form_1_select2_1">
                                  <div class="col-sm-3 form-group  gen-fields-holder" item-name="form_1_select2_1" item-type="select2">
                                    <xsl:apply-templates mode="igrp-form-select-field" select="rows/content/form_1/fields/form_1_select2_1">
                                      <xsl:param name="parent-id" select="'form_1'"/>
                                      <xsl:param name="change" select="''"/>
                                      <xsl:param name="tags" select="'false'"/>
                                      <xsl:param name="maxlength" select="'250'"/>
                                      <xsl:with-param name="multiple" select="'false'"/>
                                      <xsl:with-param name="library" select="'select2'"/>
                                    </xsl:apply-templates>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons-2"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/hidden_form_igrp/fields"/>
            </form>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <xsl:call-template name="igrp-scripts"/>
        <!-- SELECT_CHOICES JS INCLUDES -->
        <script type="text/javascript" src="{$path}/libs/choices.js/public/assets/scripts/choices.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/components/select.choices/select.choices.js?v={$version}"/>
        <!-- SELECT2 JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/select2/select2.min.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/assets/sigtca/scripts.js"/>
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
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=21"/>
  <xsl:include href="../../../xsl/tmpl/component.form.fields.xsl?v=21"/>
</xsl:stylesheet>
