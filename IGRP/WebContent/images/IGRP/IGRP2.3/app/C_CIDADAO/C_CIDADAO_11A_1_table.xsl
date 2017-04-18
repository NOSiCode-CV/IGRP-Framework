<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/cod_imdb">
                    <div class="col-1-4 item" item-name="cod_imdb">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/cod_imdb" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/cod_imdb/@name}" value="{rows/content/form/value/cod_imdb}" class="text required" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cod_imdb"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/titulo">
                    <div class="col-1-4 item" item-name="titulo">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/titulo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/titulo/@name}" value="{rows/content/form/value/titulo}" class="text required" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/titulo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/ano_lancamento">
                    <div class="col-1-4 item" item-name="ano_lancamento">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/ano_lancamento" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/ano_lancamento/@name}" value="{rows/content/form/value/ano_lancamento}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/ano_lancamento"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/cod_barras">
                    <div class="col-1-4 item" item-name="cod_barras">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/cod_barras" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/cod_barras/@name}" value="{rows/content/form/value/cod_barras}" class="text required" maxlength="10">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/cod_barras"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/capa_id">
                    <div class="col-1-4 item" item-name="capa_id">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/capa_id" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/capa_id/@name}" value="{rows/content/form/value/capa_id}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/capa_id"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/tipo_filme">
                    <div class="col-1-4 item" item-name="tipo_filme">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/tipo_filme" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/tipo_filme/@name}" value="{rows/content/form/value/tipo_filme}" class="text" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/tipo_filme"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/estado">
                    <div class="col-1-4 item" item-name="estado">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/estado" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/estado/@name}" value="{rows/content/form/value/estado}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/estado"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/utilizador_ins">
                    <div class="col-1-4 item" item-name="utilizador_ins">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/utilizador_ins" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/utilizador_ins/@name}" value="{rows/content/form/value/utilizador_ins}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/utilizador_ins"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/utilizador_alt">
                    <div class="col-1-4 item" item-name="utilizador_alt">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/utilizador_alt" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/utilizador_alt/@name}" value="{rows/content/form/value/utilizador_alt}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/utilizador_alt"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="table"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/id">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cod_imdb">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/cod_imdb"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/titulo">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/titulo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/ano_lancamento">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/ano_lancamento"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/cod_barras">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/cod_barras"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/capa_id">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/capa_id"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_filme">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/tipo_filme"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/utilizador_ins">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/utilizador_ins"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/utilizador_alt">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/utilizador_alt"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="id">
                              <td align="center" data-row="{position()}" data-title="{../../label/id}">
                                <xsl:value-of select="id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cod_imdb">
                              <td align="left" data-row="{position()}" data-title="{../../label/cod_imdb}">
                                <xsl:value-of select="cod_imdb"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="titulo">
                              <td align="left" data-row="{position()}" data-title="{../../label/titulo}">
                                <xsl:value-of select="titulo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="ano_lancamento">
                              <td align="center" data-row="{position()}" data-title="{../../label/ano_lancamento}">
                                <xsl:value-of select="ano_lancamento"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="cod_barras">
                              <td align="left" data-row="{position()}" data-title="{../../label/cod_barras}">
                                <xsl:value-of select="cod_barras"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="capa_id">
                              <td align="center" data-row="{position()}" data-title="{../../label/capa_id}">
                                <xsl:value-of select="capa_id"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_filme">
                              <td align="left" data-row="{position()}" data-title="{../../label/tipo_filme}">
                                <xsl:value-of select="tipo_filme"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="center" data-row="{position()}" data-title="{../../label/estado}">
                                <xsl:value-of select="estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="utilizador_ins">
                              <td align="center" data-row="{position()}" data-title="{../../label/utilizador_ins}">
                                <xsl:value-of select="utilizador_ins"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="utilizador_alt">
                              <td align="center" data-row="{position()}" data-title="{../../label/utilizador_alt}">
                                <xsl:value-of select="utilizador_alt"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
