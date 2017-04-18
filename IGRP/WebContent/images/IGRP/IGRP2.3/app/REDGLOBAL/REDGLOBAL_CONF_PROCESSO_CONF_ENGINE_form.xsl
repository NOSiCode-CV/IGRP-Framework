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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/proc_tp_fk">
                  <xsl:if test="rows/content/form/label/proc_tp_fk">
                    <div class="col-1-4 item" item-name="proc_tp_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_proc_tp_fk"/>
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/proc_tp_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/proc_tp_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/proc_tp_fk/option[position() = 1]}" class="selectchange required IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/proc_tp_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/proc_tp_fk/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/acti_tp_fk">
                  <xsl:if test="rows/content/form/label/acti_tp_fk">
                    <div class="col-1-4 item" item-name="acti_tp_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_acti_tp_fk"/>
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/acti_tp_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/acti_tp_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/acti_tp_fk/option[position() = 1]}" class="selectchange required IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/acti_tp_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/acti_tp_fk/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/class_fk">
                  <xsl:if test="rows/content/form/label/class_fk">
                    <div class="col-1-4 item" item-name="class_fk">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/class_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/class_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/class_fk/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/class_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/class_fk/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/start_mode">
                  <xsl:if test="rows/content/form/label/start_mode">
                    <div class="col-1-4 item" item-name="start_mode">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/start_mode" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/start_mode/@name}" chosen="select" data-placeholder="{rows/content/form/list/start_mode/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/start_mode"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/start_mode/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/acti_to_from_fk">
                  <xsl:if test="rows/content/form/label/acti_to_from_fk">
                    <div class="col-1-4 item" item-name="acti_to_from_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/acti_to_from_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/acti_to_from_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/acti_to_from_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/acti_to_from_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/acti_to_from_fk/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR opcoes--><xsl:if test="rows/content/form/label/opcoes">
                  <div class="box-content resetPadding" sep-name="opcoes">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/opcoes"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/condition">
                  <xsl:if test="rows/content/form/label/condition">
                    <div class="col-1-4 item" item-name="condition">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/condition" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/condition/@name}" chosen="select" data-placeholder="{rows/content/form/list/condition/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/condition"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/condition/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/event_occour">
                  <xsl:if test="rows/content/form/label/event_occour">
                    <div class="col-1-4 item" item-name="event_occour">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/event_occour" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/event_occour/@name}" chosen="select" data-placeholder="{rows/content/form/list/event_occour/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/event_occour"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/event_occour/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/recbido">
                  <xsl:if test="rows/content/form/label/recbido">
                    <div class="col-1-4 item" item-name="recbido">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/recbido" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/recbido/@name}" chosen="select" data-placeholder="{rows/content/form/list/recbido/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/recbido"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/recbido/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/msg_tipo_occour">
                  <xsl:if test="rows/content/form/label/msg_tipo_occour">
                    <div class="col-1-4 item" item-name="msg_tipo_occour">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/msg_tipo_occour" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/msg_tipo_occour/@name}" chosen="select" data-placeholder="{rows/content/form/list/msg_tipo_occour/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/msg_tipo_occour"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/msg_tipo_occour/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR destinos--><xsl:if test="rows/content/form/label/destinos">
                  <div class="box-content resetPadding" list-name="destinos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/destinos"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_destinos" data-control="data-destinos">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/destinos/label/acti_tp_to_fk">
                                <xsl:if test="not(rows/content/form/table/destinos/label/acti_tp_to_fk/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/destinos/label/acti_tp_to_fk" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/destinos/label/etapa">
                                <xsl:if test="not(rows/content/form/table/destinos/label/etapa/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/destinos/label/etapa" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/destinos/label/conditions">
                                <xsl:if test="not(rows/content/form/table/destinos/label/conditions/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/destinos/label/conditions" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/destinos/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="acti_tp_to_fk">
                                  <xsl:if test="not(acti_tp_to_fk/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/acti_tp_to_fk}" class="text">
                                      <xsl:value-of select="acti_tp_to_fk" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_acti_tp_to_fk_fk" value="{acti_tp_to_fk}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="acti_tp_to_fk/@visible = 'false'">
                                    <input type="hidden" name="p_acti_tp_to_fk_fk" value="{acti_tp_to_fk}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="etapa">
                                  <xsl:if test="not(etapa/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/etapa}" class="text">
                                      <xsl:value-of select="etapa" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_etapa_fk" value="{etapa}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="etapa/@visible = 'false'">
                                    <input type="hidden" name="p_etapa_fk" value="{etapa}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="conditions">
                                  <xsl:if test="not(conditions/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/conditions}" class="text">
                                      <xsl:value-of select="conditions" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_conditions_fk" value="{conditions}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="conditions/@visible = 'false'">
                                    <input type="hidden" name="p_conditions_fk" value="{conditions}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_destinos_id" value="{destinos_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR events--><xsl:if test="rows/content/form/label/events">
                  <div class="box-content resetPadding" list-name="events">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/events"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_events" data-control="data-events">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/events/label/event">
                                <xsl:if test="not(rows/content/form/table/events/label/event/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/events/label/event" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/events/label/acti_trans_to">
                                <xsl:if test="not(rows/content/form/table/events/label/acti_trans_to/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/events/label/acti_trans_to" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/events/label/acti_com_to">
                                <xsl:if test="not(rows/content/form/table/events/label/acti_com_to/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/events/label/acti_com_to" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/events/label/msg_tipo">
                                <xsl:if test="not(rows/content/form/table/events/label/msg_tipo/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/events/label/msg_tipo" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/events/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="event">
                                  <xsl:if test="not(event/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/event}" class="text">
                                      <xsl:value-of select="event" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_event_fk" value="{event}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="event/@visible = 'false'">
                                    <input type="hidden" name="p_event_fk" value="{event}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="acti_trans_to">
                                  <xsl:if test="not(acti_trans_to/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/acti_trans_to}" class="text">
                                      <xsl:value-of select="acti_trans_to" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_acti_trans_to_fk" value="{acti_trans_to}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="acti_trans_to/@visible = 'false'">
                                    <input type="hidden" name="p_acti_trans_to_fk" value="{acti_trans_to}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="acti_com_to">
                                  <xsl:if test="not(acti_com_to/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/acti_com_to}" class="text">
                                      <xsl:value-of select="acti_com_to" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_acti_com_to_fk" value="{acti_com_to}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="acti_com_to/@visible = 'false'">
                                    <input type="hidden" name="p_acti_com_to_fk" value="{acti_com_to}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="msg_tipo">
                                  <xsl:if test="not(msg_tipo/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/msg_tipo}" class="text">
                                      <xsl:value-of select="msg_tipo" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_msg_tipo_fk" value="{msg_tipo}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="msg_tipo/@visible = 'false'">
                                    <input type="hidden" name="p_msg_tipo_fk" value="{msg_tipo}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_events_id" value="{events_id}"/>
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
