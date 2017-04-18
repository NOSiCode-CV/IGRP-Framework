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
                <xsl:if test="rows/content/form/label/limit_time"/>
                <xsl:if test="rows/content/form/label/proc_name"/>
                <xsl:if test="rows/content/form/label/warn_time"/>
                <xsl:if test="rows/content/form/label/event_time"/>
                <xsl:if test="rows/content/form/label/proc_tp_fk"/>
                <xsl:if test="rows/content/form/label/form_proc_name"/>
                <xsl:if test="rows/content/form/label/optimal_time"/>
                <xsl:if test="rows/content/form/label/time_unity"/>
                <xsl:if test="rows/content/form/label/priority"/>
                <xsl:if test="rows/content/form/label/flag_multi"/>
                <xsl:if test="rows/content/form/label/self_id"/>
                <xsl:if test="rows/content/form/label/multi_flow"/>
                <xsl:if test="rows/content/form/label/status"/>
                <xsl:if test="rows/content/form/label/env_fk"/>
                <xsl:if test="rows/content/form/label/acti_tp_fk"/>
                <xsl:if test="rows/content/form/label/area_super_fk"/>
                <xsl:if test="rows/content/form/label/description"/>
                <xsl:if test="rows/content/form/label/acti_join_fk"/>
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
                <xsl:if test="rows/content/form/label/class_desc_fk">
                  <xsl:if test="rows/content/form/label/class_desc_fk">
                    <div class="col-1-4 item" item-name="class_desc_fk">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/class_desc_fk" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/class_desc_fk/@name}" value="{rows/content/form/value/class_desc_fk}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/class_desc_fk"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/with_join">
                  <xsl:if test="rows/content/form/label/with_join">
                    <div class="col-1-4 item" item-name="with_join">
                      <div class="igrp_item radiolist">
                        <a id="idp_with_join"/>
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/with_join" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/with_join/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist required IGRP_change">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/with_join"/>
                              </xsl:call-template>
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="text" disable-output-escaping="yes"/>
                          </div>
                        </xsl:for-each>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/join_point">
                  <xsl:if test="rows/content/form/label/join_point">
                    <div class="col-1-4 item" item-name="join_point">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/join_point" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/join_point/@name}" value="{rows/content/form/value/join_point}" class="text" maxlength="150">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/join_point"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/destino">
                  <xsl:if test="rows/content/form/label/destino">
                    <div class="col-1-4 item" item-name="destino">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/destino" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/destino/@name}" chosen="select" data-placeholder="{rows/content/form/list/destino/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/destino"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/destino/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR origem--><xsl:if test="rows/content/form/label/origem">
                  <div class="box-content resetPadding" list-name="origem">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/origem"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_origem" data-control="data-origem">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/origem/label/nome_origem">
                                <xsl:if test="not(rows/content/form/table/origem/label/nome_origem/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/origem/label/nome_origem" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/origem/label/class_origem">
                                <xsl:if test="not(rows/content/form/table/origem/label/class_origem/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/origem/label/class_origem" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/origem/label/execucao_origem">
                                <xsl:if test="not(rows/content/form/table/origem/label/execucao_origem/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/origem/label/execucao_origem" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/origem/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="nome_origem">
                                  <xsl:if test="not(nome_origem/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/nome_origem}" class="text">
                                      <xsl:value-of select="nome_origem" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_nome_origem_fk" value="{nome_origem}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="nome_origem/@visible = 'false'">
                                    <input type="hidden" name="p_nome_origem_fk" value="{nome_origem}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="class_origem">
                                  <xsl:if test="not(class_origem/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/class_origem}" class="text">
                                      <xsl:value-of select="class_origem" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_class_origem_fk" value="{class_origem}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="class_origem/@visible = 'false'">
                                    <input type="hidden" name="p_class_origem_fk" value="{class_origem}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="execucao_origem">
                                  <xsl:if test="not(execucao_origem/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/execucao_origem}" class="text">
                                      <xsl:value-of select="execucao_origem" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_execucao_origem_fk" value="{execucao_origem}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="execucao_origem/@visible = 'false'">
                                    <input type="hidden" name="p_execucao_origem_fk" value="{execucao_origem}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_origem_id" value="{origem_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR destinos--><xsl:if test="rows/content/form/label/destinos">
                  <div class="box-content resetPadding" sep-name="destinos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/destinos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="destinos">
                        <xsl:if test="rows/content/form/label/class_destito">
                          <div class="col-1-4 item" item-name="class_destito">
                            <div class="igrp_item selectchange">
                              <a id="idp_class_destito"/>
                              <label>
                                <xsl:value-of select="rows/content/form/label/class_destito" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/class_destito/@name}" chosen="select" data-placeholder="{rows/content/form/list/class_destito/option[position() = 1]}" class="selectchange IGRP_change" rel="F_destinos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/class_destito"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/class_destito/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/etapa_destino">
                          <div class="col-1-4 item" item-name="etapa_destino">
                            <div class="igrp_item select">
                              <label>
                                <xsl:value-of select="rows/content/form/label/etapa_destino" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/etapa_destino/@name}" chosen="select" data-placeholder="{rows/content/form/list/etapa_destino/option[position() = 1]}" class="select" rel="F_destinos">
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
                        <xsl:if test="rows/content/form/label/dest_nome">
                          <div class="col-1-4 item" item-name="dest_nome">
                            <div class="igrp_item text">
                              <label>
                                <xsl:value-of select="rows/content/form/label/dest_nome" disable-output-escaping="yes"/>
                              </label>
                              <input type="text" name="{rows/content/form/value/dest_nome/@name}" value="{rows/content/form/value/dest_nome}" class="text" maxlength="100" rel="F_destinos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/dest_nome"/>
                                </xsl:call-template>
                              </input>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/condition">
                          <div class="col-1-4 item" item-name="condition">
                            <div class="igrp_item select">
                              <a id="idp_condition"/>
                              <label>
                                <xsl:value-of select="rows/content/form/label/condition" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/condition/@name}" chosen="select" data-placeholder="{rows/content/form/list/condition/option[position() = 1]}" class="select IGRP_change" rel="F_destinos">
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
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'destinos'"/>
                      </xsl:call-template>
                      <div class="col" list-name="destinos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-destinos">
                            <li rel="destinos" class="IGRP_editRow operationTable" name="edit_destinos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="destinos" class="IGRP_delRow operationTable" name="del_destinos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_destinos" data-control="data-destinos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/destinos/label/class_destito">
                                  <xsl:if test="not(rows/content/form/table/destinos/label/class_destito/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/destinos/label/class_destito" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/destinos/label/etapa_destino">
                                  <xsl:if test="not(rows/content/form/table/destinos/label/etapa_destino/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/destinos/label/etapa_destino" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/destinos/label/dest_nome">
                                  <xsl:if test="not(rows/content/form/table/destinos/label/dest_nome/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/destinos/label/dest_nome" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/destinos/label/condition">
                                  <xsl:if test="not(rows/content/form/table/destinos/label/condition/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/destinos/label/condition" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/destinos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="class_destito">
                                    <xsl:if test="not(class_destito/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/class_destito}" class="selectchange">
                                        <xsl:value-of select="class_destito_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_class_destito_fk" value="{class_destito}"/>
                                        <input type="hidden" name="p_class_destito_fk_desc" value="{class_destito_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="class_destito/@visible = 'false'">
                                      <input type="hidden" name="p_class_destito_fk" value="{class_destito}"/>
                                      <input type="hidden" name="p_class_destito_fk_desc" value="{class_destito_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="etapa_destino">
                                    <xsl:if test="not(etapa_destino/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/etapa_destino}" class="select">
                                        <xsl:value-of select="etapa_destino_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_etapa_destino_fk" value="{etapa_destino}"/>
                                        <input type="hidden" name="p_etapa_destino_fk_desc" value="{etapa_destino_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="etapa_destino/@visible = 'false'">
                                      <input type="hidden" name="p_etapa_destino_fk" value="{etapa_destino}"/>
                                      <input type="hidden" name="p_etapa_destino_fk_desc" value="{etapa_destino_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="dest_nome">
                                    <xsl:if test="not(dest_nome/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/dest_nome}" class="text">
                                        <xsl:value-of select="dest_nome_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_dest_nome_fk" value="{dest_nome}"/>
                                        <input type="hidden" name="p_dest_nome_fk_desc" value="{dest_nome_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="dest_nome/@visible = 'false'">
                                      <input type="hidden" name="p_dest_nome_fk" value="{dest_nome}"/>
                                      <input type="hidden" name="p_dest_nome_fk_desc" value="{dest_nome_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="condition">
                                    <xsl:if test="not(condition/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/condition}" class="select">
                                        <xsl:value-of select="condition_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_condition_fk" value="{condition}"/>
                                        <input type="hidden" name="p_condition_fk_desc" value="{condition_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="condition/@visible = 'false'">
                                      <input type="hidden" name="p_condition_fk" value="{condition}"/>
                                      <input type="hidden" name="p_condition_fk_desc" value="{condition_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_destinos" rel="destinos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_destinos" rel="destinos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_destinos_id" value="{destinos_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR destinos_list--><xsl:if test="rows/content/form/label/destinos_list">
                  <div class="box-content resetPadding" list-name="destinos_list">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/destinos_list"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_destinos_list" data-control="data-destinos_list">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/destinos_list/label/etapa_dest_col">
                                <xsl:if test="not(rows/content/form/table/destinos_list/label/etapa_dest_col/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/destinos_list/label/etapa_dest_col" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/destinos_list/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="etapa_dest_col">
                                  <xsl:if test="not(etapa_dest_col/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/etapa_dest_col}" class="text">
                                      <xsl:value-of select="etapa_dest_col" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_etapa_dest_col_fk" value="{etapa_dest_col}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="etapa_dest_col/@visible = 'false'">
                                    <input type="hidden" name="p_etapa_dest_col_fk" value="{etapa_dest_col}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_destinos_list_id" value="{destinos_list_id}"/>
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
