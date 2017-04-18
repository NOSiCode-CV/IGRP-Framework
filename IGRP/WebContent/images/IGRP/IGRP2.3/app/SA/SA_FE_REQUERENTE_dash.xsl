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
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/link_configuracao">
                          <div class="form-group col-md-3" item-name="link_configuracao" item-type="link">
                            <a href="{rows/content/form/value/link_configuracao}" class="link form-link" target="_blank">
                              <xsl:value-of select="rows/content/form/label/link_configuracao"/>
                            </a>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/link_seguinte">
                          <div class="form-group col-md-3" item-name="link_seguinte" item-type="link">
                            <a href="{rows/content/form/value/link_seguinte}" class="link form-link" target="_blank">
                              <xsl:value-of select="rows/content/form/label/link_seguinte"/>
                            </a>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/logotipo">
                          <div class="form-group col-md-3" item-name="logotipo" item-type="image">
                            <img style="height:auto;width:100%;position:relative;display:block;" src="{rows/content/form/value/logotipo}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/descricao">
                          <div class="form-group col-md-3" item-name="descricao" item-type="text">
                            <label for="{rows/content/form/label/descricao/@name}">
                              <xsl:value-of select="rows/content/form/label/descricao"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/descricao}" class="form-control" id="{rows/content/form/label/descricao/@name}" name="{rows/content/form/label/descricao/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/informacao_requerente">
                          <div class="box-head subtitle clearfix" item-name="informacao_requerente" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/informacao_requerente"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="LOOKUP">
                            <label for="{rows/content/form/label/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/nome}" class="form-control gen-lookup" id="{rows/content/form/label/nome/@name}" name="{rows/content/form/label/nome/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/label/nome/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nome"/>
                                <xsl:with-param name="input-id" select="rows/content/form/label/nome/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/numero_documento">
                          <div class="form-group col-md-3" item-name="numero_documento" item-type="text">
                            <label for="{rows/content/form/label/numero_documento/@name}">
                              <xsl:value-of select="rows/content/form/label/numero_documento"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/numero_documento}" class="form-control" id="{rows/content/form/label/numero_documento/@name}" name="{rows/content/form/label/numero_documento/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/telemovel">
                          <div class="form-group col-md-3" item-name="telemovel" item-type="text">
                            <label for="{rows/content/form/label/telemovel/@name}">
                              <xsl:value-of select="rows/content/form/label/telemovel"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/telemovel}" class="form-control" id="{rows/content/form/label/telemovel/@name}" name="{rows/content/form/label/telemovel/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/email">
                          <div class="form-group col-md-3" item-name="email" item-type="email">
                            <label for="{rows/content/form/label/email/@name}">
                              <xsl:value-of select="rows/content/form/label/email"/>
                            </label>
                            <input type="email" value="{rows/content/form/value/email}" class="form-control" id="{rows/content/form/label/email/@name}" name="{rows/content/form/label/email/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/link_confirmar">
                          <div class="form-group col-md-3" item-name="link_confirmar" item-type="link">
                            <a href="{rows/content/form/value/link_confirmar}" class="link form-link" target="_blank">
                              <xsl:value-of select="rows/content/form/label/link_confirmar"/>
                            </a>
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
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
