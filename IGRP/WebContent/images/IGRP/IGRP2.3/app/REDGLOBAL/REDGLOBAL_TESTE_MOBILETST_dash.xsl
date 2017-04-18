<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
      </head>
      <body class="{$bodyClass} sidebar-off old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
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
                    <div class="box-body">
                      <div role="form" gen-id="drop-zone" first-type-container="" last-type-container=""><div class="form_tab"><xsl:if test="rows/content/form/label/separador_lista">
                          <div class="box-head subtitle clearfix" item-name="separador_lista" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/separador_lista"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-3" item-name="nome" item-type="text">
                            <label for="{rows/content/form/label/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control" id="{rows/content/form/label/nome/@name}" name="{rows/content/form/label/nome/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/id"/>
                        <xsl:if test="rows/content/form/label/contacto">
                          <div class="form-group col-md-3" item-name="contacto" item-type="LOOKUP">
                            <label for="{rows/content/form/label/contacto/@name}">
                              <xsl:value-of select="rows/content/form/label/contacto"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/contacto}" class="form-control gen-lookup" id="{rows/content/form/label/contacto/@name}" name="{rows/content/form/label/contacto/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/label/contacto/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/contacto"/>
                                <xsl:with-param name="input-id" select="rows/content/form/label/contacto/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if></div></div>
                    </div>
                    <xsl:apply-templates select="rows/content/form/tools-bar" mode="form-buttons"/>
                  </div>
                  <div class="box box-table-contents  gen-container-item" item-name="table">
                    <div class="box-body table-box">
                      <table id="table" class="table table-striped gen-data-table  ">
                        <thead>
                          <tr/>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                            </tr>
                          </xsl:for-each>
                        </tbody>
                      </table>
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
