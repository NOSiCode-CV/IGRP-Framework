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
                <xsl:if test="rows/content/form/label/id"/>
                <xsl:if test="rows/content/form/label/start_mode"/>
                <xsl:if test="rows/content/form/label/status"/>
                <xsl:if test="rows/content/form/label/event_time"/>
                <xsl:if test="rows/content/form/label/proc_name"/>
                <xsl:if test="rows/content/form/label/proc_tp_fk"/>
                <xsl:if test="rows/content/form/label/form_proc_name"/>
                <xsl:if test="rows/content/form/label/acti_tp_fk"/>
                <xsl:if test="rows/content/form/label/self_id"/>
                <xsl:if test="rows/content/form/label/env_fk"/>
                <xsl:if test="rows/content/form/label/area_super_fk"/>
                <xsl:if test="rows/content/form/label/optimal_time"/>
                <xsl:if test="rows/content/form/label/warn_time"/>
                <xsl:if test="rows/content/form/label/flag_payment"/>
                <xsl:if test="rows/content/form/label/priority"/>
                <xsl:if test="rows/content/form/label/flag_multi"/>
                <xsl:if test="rows/content/form/label/multi_flow"/>
                <xsl:if test="rows/content/form/label/processo">
                  <xsl:if test="rows/content/form/label/processo">
                    <div class="col-1-4 item" item-name="processo">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/processo/@name}" value="{rows/content/form/value/processo}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/processo"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR sep_etapa--><xsl:if test="rows/content/form/label/sep_etapa">
                  <div class="box-content resetPadding" sep-name="sep_etapa">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/sep_etapa"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/name">
                  <xsl:if test="rows/content/form/label/name">
                    <div class="col-1-4 item" item-name="name">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}" class="text required" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/name"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/code">
                  <xsl:if test="rows/content/form/label/code">
                    <div class="col-1-4 item" item-name="code">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}" class="text required" maxlength="20">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/code"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/description">
                  <xsl:if test="rows/content/form/label/description">
                    <div class="col-1-4 item" item-name="description">
                      <div class="igrp_item textarea">
                        <label>
                          <xsl:value-of select="rows/content/form/label/description" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/description/@name}" class="textarea" maxlength="4000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/description"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/description" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR sep_outras--><xsl:if test="rows/content/form/label/sep_outras">
                  <div class="box-content resetPadding" sep-name="sep_outras">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/sep_outras"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/class_fk">
                  <xsl:if test="rows/content/form/label/class_fk">
                    <div class="col-1-4 item" item-name="class_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_class_fk"/>
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/class_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/class_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/class_fk/option[position() = 1]}" class="selectchange required IGRP_change">
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
                <xsl:if test="rows/content/form/label/class_desc">
                  <xsl:if test="rows/content/form/label/class_desc">
                    <div class="col-1-4 item" item-name="class_desc">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/class_desc" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/class_desc/@name}" value="{rows/content/form/value/class_desc}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/class_desc"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/acti_tp_from_fk">
                  <xsl:if test="rows/content/form/label/acti_tp_from_fk">
                    <div class="col-1-4 item" item-name="acti_tp_from_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/acti_tp_from_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/acti_tp_from_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/acti_tp_from_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/acti_tp_from_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/acti_tp_from_fk/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/acti_tp_from_desc">
                  <xsl:if test="rows/content/form/label/acti_tp_from_desc">
                    <div class="col-1-4 item" item-name="acti_tp_from_desc">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/acti_tp_from_desc" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/acti_tp_from_desc/@name}" value="{rows/content/form/value/acti_tp_from_desc}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/acti_tp_from_desc"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/acti_tp_to_fk">
                  <xsl:if test="rows/content/form/label/acti_tp_to_fk">
                    <div class="col-1-4 item" item-name="acti_tp_to_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/acti_tp_to_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/acti_tp_to_fk/@name}" chosen="select" data-placeholder="{rows/content/form/list/acti_tp_to_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/acti_tp_to_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/acti_tp_to_fk/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/acti_tp_to_desc">
                  <xsl:if test="rows/content/form/label/acti_tp_to_desc">
                    <div class="col-1-4 item" item-name="acti_tp_to_desc">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/acti_tp_to_desc" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/acti_tp_to_desc/@name}" value="{rows/content/form/value/acti_tp_to_desc}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/acti_tp_to_desc"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR tempos--><xsl:if test="rows/content/form/label/tempos">
                  <div class="box-content resetPadding" sep-name="tempos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/tempos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/time_unity">
                  <xsl:if test="rows/content/form/label/time_unity">
                    <div class="col-1-4 item" item-name="time_unity">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/time_unity" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/time_unity/@name}" chosen="select" data-placeholder="{rows/content/form/list/time_unity/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/time_unity"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/time_unity/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/limit_time">
                  <xsl:if test="rows/content/form/label/limit_time">
                    <div class="col-1-4 item" item-name="limit_time">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/limit_time" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/limit_time/@name}" value="{rows/content/form/value/limit_time}" class="number" maxlength="22">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/limit_time"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if><!-- INICIO SEPARADOR destino_msg--><xsl:if test="rows/content/form/label/destino_msg">
                  <div class="box-content resetPadding" sep-name="destino_msg">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/destino_msg"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/proc_destino">
                  <xsl:if test="rows/content/form/label/proc_destino">
                    <div class="col-1-4 item" item-name="proc_destino">
                      <div class="igrp_item selectchange">
                        <a id="idp_proc_destino"/>
                        <label>
                          <xsl:value-of select="rows/content/form/label/proc_destino" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/proc_destino/@name}" chosen="select" data-placeholder="{rows/content/form/list/proc_destino/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/proc_destino"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/proc_destino/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/etapa_destino">
                  <xsl:if test="rows/content/form/label/etapa_destino">
                    <div class="col-1-4 item" item-name="etapa_destino">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/etapa_destino" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/etapa_destino/@name}" chosen="select" data-placeholder="{rows/content/form/list/etapa_destino/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/etapa_destino"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/etapa_destino/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR tp_msg--><xsl:if test="rows/content/form/label/tp_msg">
                  <div class="box-content resetPadding" sep-name="tp_msg">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/tp_msg"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="tp_msg">
                        <xsl:if test="rows/content/form/label/msg_tipo">
                          <div class="col-1-4 item" item-name="msg_tipo">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/msg_tipo" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/msg_tipo/@name}" value="{rows/content/form/value/msg_tipo}" class="text" maxlength="25" rel="F_tp_msg">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/msg_tipo"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'tp_msg'"/>
                      </xsl:call-template>
                      <div class="col" list-name="tp_msg"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-tp_msg">
                            <li rel="tp_msg" class="IGRP_editRow operationTable" name="edit_tp_msg">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="tp_msg" class="IGRP_delRow operationTable" name="del_tp_msg">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_tp_msg" data-control="data-tp_msg">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/tp_msg/label/msg_tipo">
                                  <xsl:if test="not(rows/content/form/table/tp_msg/label/msg_tipo/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/tp_msg/label/msg_tipo" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/tp_msg/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="msg_tipo">
                                    <xsl:if test="not(msg_tipo/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/msg_tipo}" class="text">
                                        <xsl:value-of select="msg_tipo_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_msg_tipo_fk" value="{msg_tipo}"/>
                                        <input type="hidden" name="p_msg_tipo_fk_desc" value="{msg_tipo_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="msg_tipo/@visible = 'false'">
                                      <input type="hidden" name="p_msg_tipo_fk" value="{msg_tipo}"/>
                                      <input type="hidden" name="p_msg_tipo_fk_desc" value="{msg_tipo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_tp_msg" rel="tp_msg" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_tp_msg" rel="tp_msg" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_tp_msg_id" value="{tp_msg_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR origems--><xsl:if test="rows/content/form/label/origems">
                  <div class="box-content resetPadding" list-name="origems">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/origems"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_origems" data-control="data-origems">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/origems/label/etapa_orig">
                                <xsl:if test="not(rows/content/form/table/origems/label/etapa_orig/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/origems/label/etapa_orig" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/origems/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="etapa_orig">
                                  <xsl:if test="not(etapa_orig/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/etapa_orig}" class="text">
                                      <xsl:value-of select="etapa_orig" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_etapa_orig_fk" value="{etapa_orig}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="etapa_orig/@visible = 'false'">
                                    <input type="hidden" name="p_etapa_orig_fk" value="{etapa_orig}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_origems_id" value="{origems_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR destinos--><xsl:if test="rows/content/form/label/destinos">
                  <div class="box-content resetPadding" list-name="destinos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/destinos"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_destinos" data-control="data-destinos">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/destinos/label/etapas_dest">
                                <xsl:if test="not(rows/content/form/table/destinos/label/etapas_dest/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/destinos/label/etapas_dest" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/destinos/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="etapas_dest">
                                  <xsl:if test="not(etapas_dest/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/etapas_dest}" class="text">
                                      <xsl:value-of select="etapas_dest" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_etapas_dest_fk" value="{etapas_dest}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="etapas_dest/@visible = 'false'">
                                    <input type="hidden" name="p_etapas_dest_fk" value="{etapas_dest}"/>
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
