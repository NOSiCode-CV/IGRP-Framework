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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR lst_historico--><xsl:if test="rows/content/form/label/lst_historico">
                  <div class="box-content resetPadding" list-name="lst_historico">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lst_historico"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lst_historico" data-control="data-lst_historico">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lst_historico/label/id_tp_fase">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/id_tp_fase/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/id_tp_fase" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/sended">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/sended/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/sended" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/dt_send">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/dt_send/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/dt_send" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/confirmed">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/confirmed/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/confirmed" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/dt_confirm">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/dt_confirm/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/dt_confirm" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/dt_reg">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/dt_reg/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/dt_reg" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/notif_content">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/notif_content/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lst_historico/label/notif_content" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lst_historico/label/id_request">
                                <xsl:if test="not(rows/content/form/table/lst_historico/label/id_request/@visible)">
                                  <th class="checkbox">
                                    <input type="checkbox" name="p_id_request_all" class="IGRP_checkall"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lst_historico/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="id_tp_fase">
                                  <xsl:if test="not(id_tp_fase/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/id_tp_fase}" class="text">
                                      <xsl:value-of select="id_tp_fase" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_id_tp_fase_fk" value="{id_tp_fase}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="id_tp_fase/@visible = 'false'">
                                    <input type="hidden" name="p_id_tp_fase_fk" value="{id_tp_fase}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="sended">
                                  <xsl:if test="not(sended/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/sended}" class="text">
                                      <xsl:value-of select="sended" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_sended_fk" value="{sended}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="sended/@visible = 'false'">
                                    <input type="hidden" name="p_sended_fk" value="{sended}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="dt_send">
                                  <xsl:if test="not(dt_send/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/dt_send}" class="date">
                                      <xsl:value-of select="dt_send" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_dt_send_fk" value="{dt_send}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="dt_send/@visible = 'false'">
                                    <input type="hidden" name="p_dt_send_fk" value="{dt_send}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="confirmed">
                                  <xsl:if test="not(confirmed/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/confirmed}" class="text">
                                      <xsl:value-of select="confirmed" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_confirmed_fk" value="{confirmed}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="confirmed/@visible = 'false'">
                                    <input type="hidden" name="p_confirmed_fk" value="{confirmed}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="dt_confirm">
                                  <xsl:if test="not(dt_confirm/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/dt_confirm}" class="date">
                                      <xsl:value-of select="dt_confirm" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_dt_confirm_fk" value="{dt_confirm}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="dt_confirm/@visible = 'false'">
                                    <input type="hidden" name="p_dt_confirm_fk" value="{dt_confirm}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="dt_reg">
                                  <xsl:if test="not(dt_reg/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/dt_reg}" class="date">
                                      <xsl:value-of select="dt_reg" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_dt_reg_fk" value="{dt_reg}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="dt_reg/@visible = 'false'">
                                    <input type="hidden" name="p_dt_reg_fk" value="{dt_reg}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="notif_content">
                                  <xsl:if test="not(notif_content/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/notif_content}" class="link">
                                      <xsl:choose>
                                        <xsl:when test="notif_content != ''">
                                          <a href="{notif_content}" class="link bClick" target="_blank" name="notif_content">
                                            <xsl:value-of select="notif_content_desc" disable-output-escaping="yes"/>
                                          </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:value-of select="notif_content_desc" disable-output-escaping="yes"/>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <input type="hidden" name="p_notif_content_fk" value="{notif_content}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="notif_content/@visible = 'false'">
                                    <input type="hidden" name="p_notif_content_fk" value="{notif_content}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="id_request">
                                  <xsl:if test="not(id_request/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/id_request}" class="checkbox">
                                      <xsl:if test="id_request != '-0'">
                                        <input type="checkbox" name="p_id_request_fk" value="{id_request}">
                                          <xsl:if test="id_request_check=id_request">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                        </input>
                                      </xsl:if>
                                      <xsl:value-of select="id_request_desc"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="id_request/@visible = 'false'">
                                    <input type="hidden" name="p_id_request_fk" value="{id_request}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lst_historico_id" value="{lst_historico_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150309"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150309"/>
</xsl:stylesheet>
