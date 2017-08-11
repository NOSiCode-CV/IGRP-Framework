<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                  <div class="row" id="row-8ed3a89c">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                        <xsl:if test="rows/content/box_1">
                          <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                            <div class="box-body" gen-preserve-content="true">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_1/fields"/>
                              <div>
                                <div class="row" id="row-aa51f506">
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/page_title">
                                        <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                          <h2>
                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                          </h2>
                                        </section>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/toolsbar_1">
                                        <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                          <div class="btns-holder   pull-right" role="group">
                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                              <xsl:with-param name="outline" select="'false'"/>
                                            </xsl:apply-templates>
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
                        <xsl:if test="rows/content/form_1">
                          <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <div class="box-body">
                              <div role="form">
                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                <xsl:if test="rows/content/form_1/fields/entidade">
                                  <div class="col-sm-3 form-group  gen-fields-holder" item-name="entidade" item-type="select" required="required">
                                    <label for="{rows/content/form_1/fields/entidade/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/entidade/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_entidade" name="{rows/content/form_1/fields/entidade/@name}" required="required">
                                      <xsl:for-each select="rows/content/form_1/fields/entidade/list/option">
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
                                <xsl:if test="rows/content/form_1/fields/nome_do_servico">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="nome_do_servico" item-type="text" required="required">
                                    <label for="{rows/content/form_1/fields/nome_do_servico/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/nome_do_servico/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/nome_do_servico/value}" class="form-control " id="{rows/content/form_1/fields/nome_do_servico/@name}" name="{rows/content/form_1/fields/nome_do_servico/@name}" required="required" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/codigo_do_servico">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="codigo_do_servico" item-type="text" required="required">
                                    <label for="{rows/content/form_1/fields/codigo_do_servico/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/codigo_do_servico/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/codigo_do_servico/value}" class="form-control " id="{rows/content/form_1/fields/codigo_do_servico/@name}" name="{rows/content/form_1/fields/codigo_do_servico/@name}" required="required" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/estado">
                                  <div class="col-sm-3 form-group  gen-fields-holder" item-name="estado" item-type="select" required="required">
                                    <label for="{rows/content/form_1/fields/estado/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/estado/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_estado" name="{rows/content/form_1/fields/estado/@name}" required="required">
                                      <xsl:for-each select="rows/content/form_1/fields/estado/list/option">
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
                                <xsl:if test="rows/content/form_1/fields/assunto">
                                  <div class="form-group col-sm-3  gen-fields-holder" item-name="assunto" item-type="textarea">
                                    <label for="{rows/content/form_1/fields/assunto/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/assunto/label"/>
                                    </label>
                                    <textarea name="{rows/content/form_1/fields/assunto/@name}" class="textarea form-control " maxlength="30">
                                      <xsl:value-of select="rows/content/form_1/fields/assunto/value"/>
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
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1502387224241"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1502387224241"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1502387224241"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1502387224241"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1502387224243"/>
</xsl:stylesheet>