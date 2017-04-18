<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <section class="content-header gen-container-item">
                    <h1>
                      <xsl:value-of select="rows/content/title"/>
                    </h1>
                  </section>
                  <xsl:if test="rows/content/form/tools-bar/item">
                    <div class="toolsbar-holder gen-container-item clearfix">
                      <div class="btns-holder clearfix pull-right" role="group">
                        <xsl:apply-templates select="rows/content/form/tools-bar" mode="gen-buttons">
                          <xsl:with-param name="use-fa" select="'false'"/>
                          <xsl:with-param name="vertical" select="'true'"/>
                          <xsl:with-param name="type" select="'tools-bar'"/>
                        </xsl:apply-templates>
                      </div>
                    </div>
                  </xsl:if>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="text">
                            <label for="{rows/content/form/label/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control" id="{rows/content/form/label/nome/@name}" name="{rows/content/form/label/nome/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/morada">
                          <div class="form-group col-md-3" item-name="morada" item-type="text">
                            <label for="{rows/content/form/label/morada/@name}">
                              <xsl:value-of select="rows/content/form/label/morada"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/morada}" class="form-control" id="{rows/content/form/label/morada/@name}" name="{rows/content/form/label/morada/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/cargo">
                          <div class="form-group col-md-3" item-name="cargo" item-type="text">
                            <label for="{rows/content/form/label/cargo/@name}">
                              <xsl:value-of select="rows/content/form/label/cargo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/cargo}" class="form-control" id="{rows/content/form/label/cargo/@name}" name="{rows/content/form/label/cargo/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/datanasc">
                          <div class="form-group col-md-3" item-name="datanasc" item-type="date">
                            <label for="{rows/content/form/label/datanasc/@name}">
                              <xsl:value-of select="rows/content/form/label/datanasc"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/datanasc}" class="form-control gen-date" id="{rows/content/form/label/datanasc/@name}" name="{rows/content/form/label/datanasc/@name}" format="IGRP_datePicker"/>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nacionalidade">
                          <div class="form-group col-md-3" item-name="nacionalidade" item-type="text">
                            <label for="{rows/content/form/label/nacionalidade/@name}">
                              <xsl:value-of select="rows/content/form/label/nacionalidade"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nacionalidade}" class="form-control" id="{rows/content/form/label/nacionalidade/@name}" name="{rows/content/form/label/nacionalidade/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/sexo">
                          <div class="form-group col-md-3" item-name="sexo" item-type="text">
                            <label for="{rows/content/form/label/sexo/@name}">
                              <xsl:value-of select="rows/content/form/label/sexo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/sexo}" class="form-control" id="{rows/content/form/label/sexo/@name}" name="{rows/content/form/label/sexo/@name}"/>
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
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js"/>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
