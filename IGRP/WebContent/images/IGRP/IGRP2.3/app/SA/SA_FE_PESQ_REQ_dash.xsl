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
                  <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/nome_req">
                          <div class="form-group col-md-3" item-name="nome_req" item-type="text">
                            <label for="{rows/content/filter/value/nome_req/@name}">
                              <xsl:value-of select="rows/content/filter/label/nome_req"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/nome_req}" class="form-control " id="{rows/content/filter/value/nome_req/@name}" name="{rows/content/filter/value/nome_req/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/filter/label/numero_documento">
                          <div class="form-group col-md-3" item-name="numero_documento" item-type="number">
                            <label for="{rows/content/filter/value/numero_documento/@name}">
                              <xsl:value-of select="rows/content/filter/label/numero_documento"/>
                            </label>
                            <input type="number" value="{rows/content/filter/value/numero_documento}" class="form-control " id="{rows/content/filter/value/numero_documento/@name}" name="{rows/content/filter/value/numero_documento/@name}"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                    <xsl:apply-templates select="rows/content/filter/tools-bar" mode="form-buttons">
                      <xsl:with-param name="use-fa" select="'false'"/>
                      <xsl:with-param name="fixed-target" select="'submit'"/>
                    </xsl:apply-templates>
                  </div>
                  <div class="box box-table-contents  gen-container-item" item-name="table">
                    <div class="box-body table-box">
                      <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                        <xsl:with-param name="rel" select="'table'"/>
                      </xsl:apply-templates>
                      <table id="table" class="table table-striped gen-data-table  ">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/table/label/nome">
                              <xsl:if test="not(rows/content/table/label/nome/@visible)">
                                <th item-name="nome" item-type="js_passa_valor">
                                  <xsl:value-of select="rows/content/table/label/nome"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/table/label/data_nascimento">
                              <xsl:if test="not(rows/content/table/label/data_nascimento/@visible)">
                                <th item-name="data_nascimento" item-type="date">
                                  <xsl:value-of select="rows/content/table/label/data_nascimento"/>
                                </th>
                              </xsl:if>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                            <tr>
                              <xsl:apply-templates mode="context-param" select="context-menu"/>
                              <xsl:if test="nome">
                                <xsl:if test="not(nome/@visible)">
                                  <td item-name="nome" item-type="js_passa_valor" data-row="{position()}" data-title="{../../label/nome}">
                                    <span class="lookup-parser">
                                      <xsl:value-of select="nome"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="nome/@visible = 'false'">
                                  <input type="hidden" name="p_nome_fk" value="nome"/>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="data_nascimento">
                                <xsl:if test="not(data_nascimento/@visible)">
                                  <td item-name="data_nascimento" item-type="date" data-row="{position()}" data-title="{../../label/data_nascimento}">
                                    <span>
                                      <xsl:value-of select="data_nascimento"/>
                                    </span>
                                  </td>
                                </xsl:if>
                                <xsl:if test="data_nascimento/@visible = 'false'">
                                  <input type="hidden" name="p_data_nascimento_fk" value="data_nascimento"/>
                                </xsl:if>
                              </xsl:if>
                              <input type="hidden" name="p_bi_fk" value="{bi}"/>
                              <input type="hidden" name="p_bi_fk_desc" value="{bi_desc}"/>
                              <input type="hidden" name="p_nif_fk" value="{nif}"/>
                              <input type="hidden" name="p_nif_fk_desc" value="{nif_desc}"/>
                              <input type="hidden" name="p_sexo_fk" value="{sexo}"/>
                              <input type="hidden" name="p_sexo_fk_desc" value="{sexo_desc}"/>
                              <input type="hidden" name="p_nome_pai_fk" value="{nome_pai}"/>
                              <input type="hidden" name="p_nome_pai_fk_desc" value="{nome_pai_desc}"/>
                              <input type="hidden" name="p_nome_mae_fk" value="{nome_mae}"/>
                              <input type="hidden" name="p_nome_mae_fk_desc" value="{nome_mae_desc}"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
