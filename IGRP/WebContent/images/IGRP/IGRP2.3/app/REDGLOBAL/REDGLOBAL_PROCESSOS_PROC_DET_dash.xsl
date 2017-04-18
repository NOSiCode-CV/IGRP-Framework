<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/num_proc">
                  <div class="col-1-4 item" item-name="num_proc">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/num_proc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/num_proc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/num_proc" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/num_proc/@name}" value="{rows/content/form/value/num_proc}" class="number" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/num_proc"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/cod_proc">
                  <div class="col-1-4 item" item-name="cod_proc">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/cod_proc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/cod_proc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/cod_proc" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/cod_proc/@name}" value="{rows/content/form/value/cod_proc}" class="text required" maxlength="20">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/cod_proc"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tipo_processo">
                  <div class="col-1-4 item" item-name="tipo_processo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tipo_processo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tipo_processo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/tipo_processo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/tipo_processo/@name}" value="{rows/content/form/value/tipo_processo}" class="text required" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tipo_processo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_criacao">
                  <div class="col-1-4 item" item-name="data_criacao">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_criacao) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_criacao" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/data_criacao" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_criacao/@name}" value="{rows/content/form/value/data_criacao}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_criacao"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_inicio">
                  <div class="col-1-4 item" item-name="data_inicio">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_inicio) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_inicio" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_inicio"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_fim">
                  <div class="col-1-4 item" item-name="data_fim">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_fim) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_fim" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_fim" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_fim/@name}" value="{rows/content/form/value/data_fim}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_fim"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_created_name">
                  <div class="col-1-4 item" item-name="user_created_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_created_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_created_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_created_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_created_name/@name}" value="{rows/content/form/value/user_created_name}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_created_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/user_assign_name">
                  <div class="col-1-4 item" item-name="user_assign_name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/user_assign_name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/user_assign_name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/user_assign_name" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/user_assign_name/@name}" value="{rows/content/form/value/user_assign_name}" class="text" maxlength="100">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/user_assign_name"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/ds_etapa">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/ds_etapa"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/atribuido_por">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/atribuido_por"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/atribuido_a">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/atribuido_a"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt__entrada">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/dt__entrada"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/espera">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/espera"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="ds_etapa">
                              <td align="left" data-row="{position()}" data-title="{../../label/ds_etapa}" class="text">
                                <xsl:value-of select="ds_etapa"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="atribuido_por">
                              <td align="left" data-row="{position()}" data-title="{../../label/atribuido_por}" class="text">
                                <xsl:value-of select="atribuido_por"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="atribuido_a">
                              <td align="left" data-row="{position()}" data-title="{../../label/atribuido_a}" class="text">
                                <xsl:value-of select="atribuido_a"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt__entrada">
                              <td align="left" data-row="{position()}" data-title="{../../label/dt__entrada}" class="date">
                                <xsl:value-of select="dt__entrada"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="espera">
                              <td align="left" data-row="{position()}" data-title="{../../label/espera}" class="text">
                                <xsl:value-of select="espera"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="left" data-row="{position()}" data-title="{../../label/estado}" class="text">
                                <xsl:value-of select="estado"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
