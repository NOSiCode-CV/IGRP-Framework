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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/codigo">
                  <div class="col-1-4 item" item-name="codigo">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/codigo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/codigo" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}" class="text" maxlength="150">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/codigo"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <div class="col-1-4 item" item-name="nome">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/nome) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                      </label>
                      <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text required" maxlength="150">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/id_modulo">
                  <div class="col-1-4 item" item-name="id_modulo">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/id_modulo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/id_modulo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/id_modulo" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/id_modulo/@name}" value="{rows/content/form/value/id_modulo}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/id_modulo"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/id_modulo/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/id_modulo"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/uti_atribuido_id">
                  <div class="col-1-4 item" item-name="uti_atribuido_id">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/uti_atribuido_id) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/uti_atribuido_id" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/uti_atribuido_id" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/uti_atribuido_id/@name}" chosen="select" id="{rows/content/form/list/uti_atribuido_id/@name}" data-placeholder="{rows/content/form/list/uti_atribuido_id/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/uti_atribuido_id"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/uti_atribuido_id/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/id_tp_tarefa">
                  <div class="col-1-4 item" item-name="id_tp_tarefa">
                    <div class="igrp_item selectchange">
                      <a id="idp_id_tp_tarefa"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/id_tp_tarefa) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/id_tp_tarefa" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/id_tp_tarefa" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/id_tp_tarefa/@name}" chosen="select" id="{rows/content/form/list/id_tp_tarefa/@name}" data-placeholder="{rows/content/form/list/id_tp_tarefa/option[position() = 1]}" class="selectchange required IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/id_tp_tarefa"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/id_tp_tarefa/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/fase">
                  <div class="col-1-4 item" item-name="fase">
                    <div class="igrp_item selectchange">
                      <a id="idp_fase"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/fase) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/fase" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/fase" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/fase/@name}" chosen="select" id="{rows/content/form/list/fase/@name}" data-placeholder="{rows/content/form/list/fase/option[position() = 1]}" class="selectchange required IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/fase"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/fase/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/estado_fase">
                  <div class="col-1-4 item" item-name="estado_fase">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/estado_fase) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/estado_fase" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/estado_fase" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/estado_fase/@name}" chosen="select" id="{rows/content/form/list/estado_fase/@name}" data-placeholder="{rows/content/form/list/estado_fase/option[position() = 1]}" class="select required">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/estado_fase"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/estado_fase/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/prioridade">
                  <div class="col-1-4 item" item-name="prioridade">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/prioridade) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/prioridade" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/prioridade" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/prioridade/@name}" chosen="select" id="{rows/content/form/list/prioridade/@name}" data-placeholder="{rows/content/form/list/prioridade/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/prioridade"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/prioridade/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/tp_erro">
                  <div class="col-1-4 item" item-name="tp_erro">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/tp_erro) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/tp_erro" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/tp_erro" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/tp_erro/@name}" chosen="select" id="{rows/content/form/list/tp_erro/@name}" data-placeholder="{rows/content/form/list/tp_erro/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/tp_erro"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/tp_erro/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/severidade">
                  <div class="col-1-4 item" item-name="severidade">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/severidade) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/severidade" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/severidade" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/severidade/@name}" chosen="select" id="{rows/content/form/list/severidade/@name}" data-placeholder="{rows/content/form/list/severidade/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/severidade"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/severidade/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/data_inicio_prev">
                  <div class="col-1-4 item" item-name="data_inicio_prev">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_inicio_prev) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_inicio_prev" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/data_inicio_prev" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_inicio_prev/@name}" value="{rows/content/form/value/data_inicio_prev}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_inicio_prev"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_fim_prev">
                  <div class="col-1-4 item" item-name="data_fim_prev">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_fim_prev) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_fim_prev" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/data_fim_prev" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_fim_prev/@name}" value="{rows/content/form/value/data_fim_prev}" class="date required" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_fim_prev"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_inicio_real">
                  <div class="col-1-4 item" item-name="data_inicio_real">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_inicio_real) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_inicio_real" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_inicio_real" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_inicio_real/@name}" value="{rows/content/form/value/data_inicio_real}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_inicio_real"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/data_fim_real">
                  <div class="col-1-4 item" item-name="data_fim_real">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/data_fim_real) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/data_fim_real" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/data_fim_real" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/form/value/data_fim_real/@name}" value="{rows/content/form/value/data_fim_real}" class="date" trel="IGRP_datePicker">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/data_fim_real"/>
                          </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/hora_prev">
                  <div class="col-1-4 item" item-name="hora_prev">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/hora_prev) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/hora_prev" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/hora_prev" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/hora_prev/@name}" value="{rows/content/form/value/hora_prev}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/hora_prev"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/hora_real">
                  <div class="col-1-4 item" item-name="hora_real">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/hora_real) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/hora_real" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/hora_real" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/hora_real/@name}" value="{rows/content/form/value/hora_real}" class="number" maxlength="30">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/hora_real"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/percentagem">
                  <div class="col-1-4 item" item-name="percentagem">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/percentagem) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/percentagem" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/percentagem" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/percentagem/@name}" value="{rows/content/form/value/percentagem}" class="number" maxlength="3">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/percentagem"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/red_desc">
                  <div class="col-1-4 item" item-name="red_desc">
                    <div class="igrp_item LOOKUP">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/red_desc) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/red_desc" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/red_desc" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input type="LOOKUP" name="{rows/content/form/value/red_desc/@name}" value="{rows/content/form/value/red_desc}" class="LOOKUP">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/red_desc"/>
                          </xsl:call-template>
                        </input>
                        <xsl:call-template name="lookup-tool">
                          <xsl:with-param name="page" select="rows/page"/>
                          <xsl:with-param name="ad_hoc" select="'1'"/>
                          <xsl:with-param name="action" select="'LOOKUP'"/>
                          <xsl:with-param name="name" select="rows/content/form/value/red_desc/@name"/>
                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/red_desc"/>
                        </xsl:call-template>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR descricao_tit--><xsl:if test="rows/content/form/label/descricao_tit">
                  <div class="box-content resetPadding" sep-name="descricao_tit">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/descricao_tit"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/descricao">
                  <div class="box-content addPadding10 resetBorder" sep-name="descricao">
                    <xsl:call-template name="text-editor">
                      <xsl:with-param name="name" select="rows/content/form/value/descricao/@name"/>
                      <xsl:with-param name="value" select="rows/content/form/value/descricao"/>
                      <xsl:with-param name="maxlength" select="rows/content/form/label/descricao/@maxlength"/>
                    </xsl:call-template>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR documentos--><xsl:if test="rows/content/form/label/documentos">
                  <div class="box-content resetPadding" sep-name="documentos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/documentos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/documento">
                  <div class="col-1-4 item" item-name="documento">
                    <div class="igrp_item file">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/documento) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/documento" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/documento" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/documento/@name}"/>
                        <span class="upload"/>
                        <input type="file" name="{rows/content/form/value/documento/@name}" value="{rows/content/form/value/documento}" id="id_{rows/content/form/value/documento/@name}" class="file uploadFile">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/documento"/>
                          </xsl:call-template>
                        </input>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/ver_documento">
                  <div class="col-1-4 item" item-name="ver_documento">
                    <div class="igrp_item link">
                      <a href="{rows/content/form/value/ver_documento}" class="link bClick" name="p_ver_documento" target="_blank">
                        <xsl:value-of select="rows/content/form/label/ver_documento" disable-output-escaping="yes"/>
                      </a>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/ver_screenshot">
                  <div class="col-1-4 item" item-name="ver_screenshot">
                    <div class="igrp_item link">
                      <a href="{rows/content/form/value/ver_screenshot}" class="link bClick" name="p_ver_screenshot" target="_blank">
                        <xsl:value-of select="rows/content/form/label/ver_screenshot" disable-output-escaping="yes"/>
                      </a>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR fases--><xsl:if test="rows/content/form/label/fases">
                  <div class="box-content resetPadding" sep-name="fases">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/fases"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_fases" data-control="data-fases">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/fases/label/f_fase">
                                <xsl:if test="not(rows/content/form/table/fases/label/f_fase/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/fases/label/f_fase" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/fases/label/f_dt_inicio">
                                <xsl:if test="not(rows/content/form/table/fases/label/f_dt_inicio/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/fases/label/f_dt_inicio" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/fases/label/f_dt_fim">
                                <xsl:if test="not(rows/content/form/table/fases/label/f_dt_fim/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/fases/label/f_dt_fim" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/fases/label/f_duracao">
                                <xsl:if test="not(rows/content/form/table/fases/label/f_duracao/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/fases/label/f_duracao" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/fases/label/f_atribuido_a">
                                <xsl:if test="not(rows/content/form/table/fases/label/f_atribuido_a/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/fases/label/f_atribuido_a" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/fases/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="f_fase">
                                  <xsl:if test="not(f_fase/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/f_fase}" class="text">
                                      <xsl:value-of select="f_fase" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_f_fase_fk" value="{f_fase}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="f_fase/@visible = 'false'">
                                    <input type="hidden" name="p_f_fase_fk" value="{f_fase}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="f_dt_inicio">
                                  <xsl:if test="not(f_dt_inicio/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/f_dt_inicio}" class="text">
                                      <xsl:value-of select="f_dt_inicio" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_f_dt_inicio_fk" value="{f_dt_inicio}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="f_dt_inicio/@visible = 'false'">
                                    <input type="hidden" name="p_f_dt_inicio_fk" value="{f_dt_inicio}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="f_dt_fim">
                                  <xsl:if test="not(f_dt_fim/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/f_dt_fim}" class="text">
                                      <xsl:value-of select="f_dt_fim" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_f_dt_fim_fk" value="{f_dt_fim}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="f_dt_fim/@visible = 'false'">
                                    <input type="hidden" name="p_f_dt_fim_fk" value="{f_dt_fim}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="f_duracao">
                                  <xsl:if test="not(f_duracao/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/f_duracao}" class="text">
                                      <xsl:value-of select="f_duracao" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_f_duracao_fk" value="{f_duracao}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="f_duracao/@visible = 'false'">
                                    <input type="hidden" name="p_f_duracao_fk" value="{f_duracao}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="f_atribuido_a">
                                  <xsl:if test="not(f_atribuido_a/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/f_atribuido_a}" class="text">
                                      <xsl:value-of select="f_atribuido_a" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_f_atribuido_a_fk" value="{f_atribuido_a}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="f_atribuido_a/@visible = 'false'">
                                    <input type="hidden" name="p_f_atribuido_a_fk" value="{f_atribuido_a}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_fases_id" value="{fases_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR subtarefas--><xsl:if test="rows/content/form/label/subtarefas">
                  <div class="box-content resetPadding" sep-name="subtarefas">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/subtarefas"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_subtarefas" data-control="data-subtarefas">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/subtarefas/label/t_nome">
                                <xsl:if test="not(rows/content/form/table/subtarefas/label/t_nome/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/subtarefas/label/t_nome" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/subtarefas/label/t_atribuido_a">
                                <xsl:if test="not(rows/content/form/table/subtarefas/label/t_atribuido_a/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/subtarefas/label/t_atribuido_a" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/subtarefas/label/t_fase">
                                <xsl:if test="not(rows/content/form/table/subtarefas/label/t_fase/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/subtarefas/label/t_fase" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/subtarefas/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="t_nome">
                                  <xsl:if test="not(t_nome/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/t_nome}" class="link">
                                      <xsl:choose>
                                        <xsl:when test="t_nome != ''">
                                          <a href="{t_nome}" class="link bClick" target="_blank" name="t_nome">
                                            <xsl:value-of select="t_nome_desc" disable-output-escaping="yes"/>
                                          </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:value-of select="t_nome_desc" disable-output-escaping="yes"/>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <input type="hidden" name="p_t_nome_fk" value="{t_nome}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="t_nome/@visible = 'false'">
                                    <input type="hidden" name="p_t_nome_fk" value="{t_nome}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="t_atribuido_a">
                                  <xsl:if test="not(t_atribuido_a/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/t_atribuido_a}" class="text">
                                      <xsl:value-of select="t_atribuido_a" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_t_atribuido_a_fk" value="{t_atribuido_a}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="t_atribuido_a/@visible = 'false'">
                                    <input type="hidden" name="p_t_atribuido_a_fk" value="{t_atribuido_a}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="t_fase">
                                  <xsl:if test="not(t_fase/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/t_fase}" class="text">
                                      <xsl:value-of select="t_fase" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_t_fase_fk" value="{t_fase}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="t_fase/@visible = 'false'">
                                    <input type="hidden" name="p_t_fase_fk" value="{t_fase}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_subtarefas_id" value="{subtarefas_id}"/>
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
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150825"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20150825"/>
</xsl:stylesheet>
