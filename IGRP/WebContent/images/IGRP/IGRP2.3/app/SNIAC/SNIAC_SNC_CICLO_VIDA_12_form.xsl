<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default">
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
                  <xsl:if test="rows/content/form/tools-bar/item">
                    <div class="toolsbar-holder boxed gen-container-item clearfix">
                      <div class="btns-holder clearfix pull-right" role="group">
                        <xsl:apply-templates select="rows/content/form/tools-bar" mode="gen-buttons">
                          <xsl:with-param name="use-fa" select="'false'"/>
                          <xsl:with-param name="vertical" select="'true'"/>
                          <xsl:with-param name="type" select="'tools-bar'"/>
                        </xsl:apply-templates>
                      </div>
                    </div>
                  </xsl:if>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/dados_biometricos">
                          <div class="box-head subtitle clearfix" item-name="dados_biometricos" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/dados_biometricos"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ip_kiosk">
                          <div class="form-group col-md-3 " item-name="ip_kiosk" item-type="select">
                            <label for="{rows/content/form/value/ip_kiosk/@name}">
                              <xsl:value-of select="rows/content/form/label/ip_kiosk"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/value/ip_kiosk/@name}" name="{rows/content/form/value/ip_kiosk/@name}">
                              <xsl:for-each select="rows/content/form/list/ip_kiosk/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dados_biometricos">
                          <div class="form-group col-md-3" item-name="dados_biometricos" item-type="biometric">
                            <label for="{rows/content/form/value/dados_biometricos/@name}">
                              <xsl:value-of select="rows/content/form/label/dados_biometricos"/>
                            </label>
                            <input type="biometric" value="{rows/content/form/value/dados_biometricos}" class="form-control " id="{rows/content/form/value/dados_biometricos/@name}" name="{rows/content/form/value/dados_biometricos/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/casos_especias">
                          <div class="col-md-3" item-name="casos_especias" item-type="radiolist">
                            <div class="form-group">
                              <label for="{rows/content/form/value/casos_especias/@name}">
                                <xsl:value-of select="rows/content/form/label/casos_especias"/>
                              </label>
                              <xsl:for-each select="rows/content/form/list/casos_especias/option">
                                <div class="radio">
                                  <label>
                                    <input type="radio" name="{../@name}" value="{value}" class="checkboxlist " label="{text}">
                                      <xsl:if test="@selected='true'">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                      </xsl:if>
                                    </input>
                                    <span>
                                      <xsl:value-of select="text"/>
                                    </span>
                                  </label>
                                </div>
                              </xsl:for-each>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ausencia_imp_digital_esquerd">
                          <div class="form-group col-md-3 " item-name="ausencia_imp_digital_esquerd" item-type="select">
                            <label for="{rows/content/form/value/ausencia_imp_digital_esquerd/@name}">
                              <xsl:value-of select="rows/content/form/label/ausencia_imp_digital_esquerd"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/ausencia_imp_digital_esquerd/@name}" name="{rows/content/form/value/ausencia_imp_digital_esquerd/@name}">
                              <xsl:for-each select="rows/content/form/list/ausencia_imp_digital_esquerd/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ausencia_imp_digital_direito">
                          <div class="form-group col-md-3 " item-name="ausencia_imp_digital_direito" item-type="select">
                            <label for="{rows/content/form/value/ausencia_imp_digital_direito/@name}">
                              <xsl:value-of select="rows/content/form/label/ausencia_imp_digital_direito"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/ausencia_imp_digital_direito/@name}" name="{rows/content/form/value/ausencia_imp_digital_direito/@name}">
                              <xsl:for-each select="rows/content/form/list/ausencia_imp_digital_direito/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/observacao">
                          <div class="form-group col-md-3" item-name="observacao" item-type="text">
                            <label for="{rows/content/form/value/observacao/@name}">
                              <xsl:value-of select="rows/content/form/label/observacao"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/observacao}" class="form-control " id="{rows/content/form/value/observacao/@name}" name="{rows/content/form/value/observacao/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dados_pedido">
                          <div class="box-head subtitle clearfix" item-name="dados_pedido" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/dados_pedido"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nao_assinatura">
                          <div class="form-group col-md-3 " item-name="nao_assinatura" item-type="select">
                            <label for="{rows/content/form/value/nao_assinatura/@name}">
                              <xsl:value-of select="rows/content/form/label/nao_assinatura"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/nao_assinatura/@name}" name="{rows/content/form/value/nao_assinatura/@name}">
                              <xsl:for-each select="rows/content/form/list/nao_assinatura/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/num_processo">
                          <div class="form-group col-md-3" item-name="num_processo" item-type="number">
                            <label for="{rows/content/form/value/num_processo/@name}">
                              <xsl:value-of select="rows/content/form/label/num_processo"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/num_processo}" class="form-control " id="{rows/content/form/value/num_processo/@name}" name="{rows/content/form/value/num_processo/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tipo_pedido">
                          <div class="form-group col-md-3" item-name="tipo_pedido" item-type="text">
                            <label for="{rows/content/form/value/tipo_pedido/@name}">
                              <xsl:value-of select="rows/content/form/label/tipo_pedido"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/tipo_pedido}" class="form-control " id="{rows/content/form/value/tipo_pedido/@name}" name="{rows/content/form/value/tipo_pedido/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dt_pedido">
                          <div class="form-group col-md-3" item-name="dt_pedido" item-type="date">
                            <label for="{rows/content/form/value/dt_pedido/@name}">
                              <xsl:value-of select="rows/content/form/label/dt_pedido"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/dt_pedido}" class="form-control gen-date " id="{rows/content/form/value/dt_pedido/@name}" name="{rows/content/form/value/dt_pedido/@name}" format="IGRP_datePicker"/>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tp_doc">
                          <div class="form-group col-md-3 " item-name="tp_doc" item-type="select">
                            <label for="{rows/content/form/value/tp_doc/@name}">
                              <xsl:value-of select="rows/content/form/label/tp_doc"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/value/tp_doc/@name}" name="{rows/content/form/value/tp_doc/@name}">
                              <xsl:for-each select="rows/content/form/list/tp_doc/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tp_passprt">
                          <div class="form-group col-md-3 " item-name="tp_passprt" item-type="select">
                            <label for="{rows/content/form/value/tp_passprt/@name}">
                              <xsl:value-of select="rows/content/form/label/tp_passprt"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/value/tp_passprt/@name}" name="{rows/content/form/value/tp_passprt/@name}">
                              <xsl:for-each select="rows/content/form/list/tp_passprt/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tp_taxa">
                          <div class="form-group col-md-3 " item-name="tp_taxa" item-type="select">
                            <label for="{rows/content/form/value/tp_taxa/@name}">
                              <xsl:value-of select="rows/content/form/label/tp_taxa"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/value/tp_taxa/@name}" name="{rows/content/form/value/tp_taxa/@name}">
                              <xsl:for-each select="rows/content/form/list/tp_taxa/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/prioridade">
                          <div class="form-group col-md-3 " item-name="prioridade" item-type="select">
                            <label for="{rows/content/form/value/prioridade/@name}">
                              <xsl:value-of select="rows/content/form/label/prioridade"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/prioridade/@name}" name="{rows/content/form/value/prioridade/@name}">
                              <xsl:for-each select="rows/content/form/list/prioridade/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tp_titulo">
                          <div class="form-group col-md-3" item-name="tp_titulo" item-type="text">
                            <label for="{rows/content/form/value/tp_titulo/@name}">
                              <xsl:value-of select="rows/content/form/label/tp_titulo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/tp_titulo}" class="form-control " id="{rows/content/form/value/tp_titulo/@name}" name="{rows/content/form/value/tp_titulo/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/finlidd_perm">
                          <div class="form-group col-md-3" item-name="finlidd_perm" item-type="textarea">
                            <label for="{rows/content/form/value/finlidd_perm/@name}">
                              <xsl:value-of select="rows/content/form/label/finlidd_perm"/>
                            </label>
                            <textarea name="{rows/content/form/value/finlidd_perm/@name}" class="textarea form-control ">
                              <xsl:value-of select="rows/content/form/value/finlidd_perm"/>
                            </textarea>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/total_pagar">
                          <div class="form-group col-md-3" item-name="total_pagar" item-type="number">
                            <label for="{rows/content/form/value/total_pagar/@name}">
                              <xsl:value-of select="rows/content/form/label/total_pagar"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/total_pagar}" class="form-control " id="{rows/content/form/value/total_pagar/@name}" name="{rows/content/form/value/total_pagar/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/motivo_isencao">
                          <div class="form-group col-md-3" item-name="motivo_isencao" item-type="textarea">
                            <label for="{rows/content/form/value/motivo_isencao/@name}">
                              <xsl:value-of select="rows/content/form/label/motivo_isencao"/>
                            </label>
                            <textarea name="{rows/content/form/value/motivo_isencao/@name}" class="textarea form-control ">
                              <xsl:value-of select="rows/content/form/value/motivo_isencao"/>
                            </textarea>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/prestacoes">
                          <div class="form-group col-md-3 " item-name="prestacoes" item-type="select">
                            <label for="{rows/content/form/value/prestacoes/@name}">
                              <xsl:value-of select="rows/content/form/label/prestacoes"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/prestacoes/@name}" name="{rows/content/form/value/prestacoes/@name}">
                              <xsl:for-each select="rows/content/form/list/prestacoes/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/local_pedido">
                          <div class="form-group col-md-3" item-name="local_pedido" item-type="text">
                            <label for="{rows/content/form/value/local_pedido/@name}">
                              <xsl:value-of select="rows/content/form/label/local_pedido"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/local_pedido}" class="form-control " id="{rows/content/form/value/local_pedido/@name}" name="{rows/content/form/value/local_pedido/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/util_id">
                          <div class="form-group col-md-3" item-name="util_id" item-type="text">
                            <label for="{rows/content/form/value/util_id/@name}">
                              <xsl:value-of select="rows/content/form/label/util_id"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/util_id}" class="form-control " id="{rows/content/form/value/util_id/@name}" name="{rows/content/form/value/util_id/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado">
                          <div class="form-group col-md-3" item-name="estado" item-type="text">
                            <label for="{rows/content/form/value/estado/@name}">
                              <xsl:value-of select="rows/content/form/label/estado"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/estado}" class="form-control " id="{rows/content/form/value/estado/@name}" name="{rows/content/form/value/estado/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dados_biograficos">
                          <div class="box-head subtitle clearfix" item-name="dados_biograficos" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/dados_biograficos"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/num_idnt_civil">
                          <div class="form-group col-md-3" item-name="num_idnt_civil" item-type="text">
                            <label for="{rows/content/form/value/num_idnt_civil/@name}">
                              <xsl:value-of select="rows/content/form/label/num_idnt_civil"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/num_idnt_civil}" class="form-control " id="{rows/content/form/value/num_idnt_civil/@name}" name="{rows/content/form/value/num_idnt_civil/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/passaporte_anterior">
                          <div class="form-group col-md-3" item-name="passaporte_anterior" item-type="LOOKUP">
                            <label for="{rows/content/form/value/passaporte_anterior/@name}">
                              <xsl:value-of select="rows/content/form/label/passaporte_anterior"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/passaporte_anterior}" class="form-control gen-lookup " id="{rows/content/form/value/passaporte_anterior/@name}" name="{rows/content/form/value/passaporte_anterior/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/passaporte_anterior/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/passaporte_anterior"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/passaporte_anterior/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nif">
                          <div class="form-group col-md-3" item-name="nif" item-type="LOOKUP_NIF">
                            <label for="{rows/content/form/value/nif/@name}">
                              <xsl:value-of select="rows/content/form/label/nif"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/nif}" class="form-control gen-lookup " id="{rows/content/form/value/nif/@name}" name="{rows/content/form/value/nif/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_NIF'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/nif/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nif"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/nif/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_completo">
                          <div class="form-group col-md-3" item-name="nome_completo" item-type="LOOKUP_BI">
                            <label for="{rows/content/form/value/nome_completo/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_completo"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/nome_completo}" class="form-control gen-lookup " id="{rows/content/form/value/nome_completo/@name}" name="{rows/content/form/value/nome_completo/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/nome_completo/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nome_completo"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/nome_completo/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_proprio">
                          <div class="form-group col-md-3" item-name="nome_proprio" item-type="text">
                            <label for="{rows/content/form/value/nome_proprio/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_proprio"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome_proprio}" class="form-control " id="{rows/content/form/value/nome_proprio/@name}" name="{rows/content/form/value/nome_proprio/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/apelido">
                          <div class="form-group col-md-3" item-name="apelido" item-type="text">
                            <label for="{rows/content/form/value/apelido/@name}">
                              <xsl:value-of select="rows/content/form/label/apelido"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/apelido}" class="form-control " id="{rows/content/form/value/apelido/@name}" name="{rows/content/form/value/apelido/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_pai_completo">
                          <div class="form-group col-md-3" item-name="nome_pai_completo" item-type="text">
                            <label for="{rows/content/form/value/nome_pai_completo/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_pai_completo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome_pai_completo}" class="form-control " id="{rows/content/form/value/nome_pai_completo/@name}" name="{rows/content/form/value/nome_pai_completo/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_pai">
                          <div class="form-group col-md-3" item-name="nome_pai" item-type="text">
                            <label for="{rows/content/form/value/nome_pai/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_pai"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome_pai}" class="form-control " id="{rows/content/form/value/nome_pai/@name}" name="{rows/content/form/value/nome_pai/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/apelido_pai">
                          <div class="form-group col-md-3" item-name="apelido_pai" item-type="text">
                            <label for="{rows/content/form/value/apelido_pai/@name}">
                              <xsl:value-of select="rows/content/form/label/apelido_pai"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/apelido_pai}" class="form-control " id="{rows/content/form/value/apelido_pai/@name}" name="{rows/content/form/value/apelido_pai/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_mae_completo">
                          <div class="form-group col-md-3" item-name="nome_mae_completo" item-type="text">
                            <label for="{rows/content/form/value/nome_mae_completo/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_mae_completo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome_mae_completo}" class="form-control " id="{rows/content/form/value/nome_mae_completo/@name}" name="{rows/content/form/value/nome_mae_completo/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nome_mae">
                          <div class="form-group col-md-3" item-name="nome_mae" item-type="text">
                            <label for="{rows/content/form/value/nome_mae/@name}">
                              <xsl:value-of select="rows/content/form/label/nome_mae"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome_mae}" class="form-control " id="{rows/content/form/value/nome_mae/@name}" name="{rows/content/form/value/nome_mae/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/apelido_mae">
                          <div class="form-group col-md-3" item-name="apelido_mae" item-type="text">
                            <label for="{rows/content/form/value/apelido_mae/@name}">
                              <xsl:value-of select="rows/content/form/label/apelido_mae"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/apelido_mae}" class="form-control " id="{rows/content/form/value/apelido_mae/@name}" name="{rows/content/form/value/apelido_mae/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/naturalidade">
                          <div class="form-group col-md-3" item-name="naturalidade" item-type="LOOKUP">
                            <label for="{rows/content/form/value/naturalidade/@name}">
                              <xsl:value-of select="rows/content/form/label/naturalidade"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/naturalidade}" class="form-control gen-lookup " id="{rows/content/form/value/naturalidade/@name}" name="{rows/content/form/value/naturalidade/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/naturalidade/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/naturalidade"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/naturalidade/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nacionlidade">
                          <div class="form-group col-md-3" item-name="nacionlidade" item-type="LOOKUP_GEOG">
                            <label for="{rows/content/form/value/nacionlidade/@name}">
                              <xsl:value-of select="rows/content/form/label/nacionlidade"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/nacionlidade}" class="form-control gen-lookup " id="{rows/content/form/value/nacionlidade/@name}" name="{rows/content/form/value/nacionlidade/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/nacionlidade/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nacionlidade"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/nacionlidade/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_nascimento">
                          <div class="form-group col-md-3" item-name="data_nascimento" item-type="date">
                            <label for="{rows/content/form/value/data_nascimento/@name}">
                              <xsl:value-of select="rows/content/form/label/data_nascimento"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_nascimento}" class="form-control gen-date " id="{rows/content/form/value/data_nascimento/@name}" name="{rows/content/form/value/data_nascimento/@name}" format="IGRP_datePicker"/>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/local_nascimento">
                          <div class="form-group col-md-3" item-name="local_nascimento" item-type="LOOKUP_GEOG">
                            <label for="{rows/content/form/value/local_nascimento/@name}">
                              <xsl:value-of select="rows/content/form/label/local_nascimento"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/local_nascimento}" class="form-control gen-lookup " id="{rows/content/form/value/local_nascimento/@name}" name="{rows/content/form/value/local_nascimento/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/local_nascimento/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/local_nascimento"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/local_nascimento/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado_civil">
                          <div class="form-group col-md-3 " item-name="estado_civil" item-type="select">
                            <label for="{rows/content/form/value/estado_civil/@name}">
                              <xsl:value-of select="rows/content/form/label/estado_civil"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/estado_civil/@name}" name="{rows/content/form/value/estado_civil/@name}">
                              <xsl:for-each select="rows/content/form/list/estado_civil/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/sexo">
                          <div class="form-group col-md-3 " item-name="sexo" item-type="select">
                            <label for="{rows/content/form/value/sexo/@name}">
                              <xsl:value-of select="rows/content/form/label/sexo"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/sexo/@name}" name="{rows/content/form/value/sexo/@name}">
                              <xsl:for-each select="rows/content/form/list/sexo/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/altura">
                          <div class="form-group col-md-3" item-name="altura" item-type="text">
                            <label for="{rows/content/form/value/altura/@name}">
                              <xsl:value-of select="rows/content/form/label/altura"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/altura}" class="form-control " id="{rows/content/form/value/altura/@name}" name="{rows/content/form/value/altura/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/sinais_particulares">
                          <div class="form-group col-md-3" item-name="sinais_particulares" item-type="text">
                            <label for="{rows/content/form/value/sinais_particulares/@name}">
                              <xsl:value-of select="rows/content/form/label/sinais_particulares"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/sinais_particulares}" class="form-control " id="{rows/content/form/value/sinais_particulares/@name}" name="{rows/content/form/value/sinais_particulares/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ind_eventuais">
                          <div class="form-group col-md-3" item-name="ind_eventuais" item-type="text">
                            <label for="{rows/content/form/value/ind_eventuais/@name}">
                              <xsl:value-of select="rows/content/form/label/ind_eventuais"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/ind_eventuais}" class="form-control " id="{rows/content/form/value/ind_eventuais/@name}" name="{rows/content/form/value/ind_eventuais/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/grupo_profissional">
                          <div class="form-group col-md-3 " item-name="grupo_profissional" item-type="select">
                            <label for="{rows/content/form/value/grupo_profissional/@name}">
                              <xsl:value-of select="rows/content/form/label/grupo_profissional"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/grupo_profissional/@name}" name="{rows/content/form/value/grupo_profissional/@name}">
                              <xsl:for-each select="rows/content/form/list/grupo_profissional/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/profissao">
                          <div class="form-group col-md-3" item-name="profissao" item-type="text">
                            <label for="{rows/content/form/value/profissao/@name}">
                              <xsl:value-of select="rows/content/form/label/profissao"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/profissao}" class="form-control " id="{rows/content/form/value/profissao/@name}" name="{rows/content/form/value/profissao/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/cargo">
                          <div class="form-group col-md-3 " item-name="cargo" item-type="select">
                            <label for="{rows/content/form/value/cargo/@name}">
                              <xsl:value-of select="rows/content/form/label/cargo"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/cargo/@name}" name="{rows/content/form/value/cargo/@name}">
                              <xsl:for-each select="rows/content/form/list/cargo/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nivel_instrucao">
                          <div class="form-group col-md-3 " item-name="nivel_instrucao" item-type="select">
                            <label for="{rows/content/form/value/nivel_instrucao/@name}">
                              <xsl:value-of select="rows/content/form/label/nivel_instrucao"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/nivel_instrucao/@name}" name="{rows/content/form/value/nivel_instrucao/@name}">
                              <xsl:for-each select="rows/content/form/list/nivel_instrucao/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/separador_filho">
                          <div class="box gen-container-item gen-item-boxed" item-name="separador_filho">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/separador_filho"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="separador_filho" dialog="true">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'separador_filho'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/nome_filho">
                                    <div class="form-group col-md-3" item-name="nome_filho" item-type="text">
                                      <label for="{rows/content/form/value/nome_filho/@name}">
                                        <xsl:value-of select="rows/content/form/label/nome_filho"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/nome_filho}" class="form-control no-validation" id="{rows/content/form/value/nome_filho/@name}" name="{rows/content/form/value/nome_filho/@name}"/>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/dt_nasc_filho">
                                    <div class="form-group col-md-3" item-name="dt_nasc_filho" item-type="date">
                                      <label for="{rows/content/form/value/dt_nasc_filho/@name}">
                                        <xsl:value-of select="rows/content/form/label/dt_nasc_filho"/>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" value="{rows/content/form/value/dt_nasc_filho}" class="form-control gen-date no-validation" id="{rows/content/form/value/dt_nasc_filho/@name}" name="{rows/content/form/value/dt_nasc_filho/@name}" format="IGRP_datePicker"/>
                                        <span class="input-group-btn gen-date-icon">
                                          <span class="btn btn-default">
                                            <i class="fa fa-calendar"/>
                                          </span>
                                        </span>
                                      </div>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/nacionalidd_filho">
                                    <div class="form-group col-md-3" item-name="nacionalidd_filho" item-type="text">
                                      <label for="{rows/content/form/value/nacionalidd_filho/@name}">
                                        <xsl:value-of select="rows/content/form/label/nacionalidd_filho"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/nacionalidd_filho}" class="form-control no-validation" id="{rows/content/form/value/nacionalidd_filho/@name}" name="{rows/content/form/value/nacionalidd_filho/@name}"/>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/naturalidd_filho">
                                    <div class="form-group col-md-3" item-name="naturalidd_filho" item-type="text">
                                      <label for="{rows/content/form/value/naturalidd_filho/@name}">
                                        <xsl:value-of select="rows/content/form/label/naturalidd_filho"/>
                                      </label>
                                      <input type="text" value="{rows/content/form/value/naturalidd_filho}" class="form-control no-validation" id="{rows/content/form/value/naturalidd_filho/@name}" name="{rows/content/form/value/naturalidd_filho/@name}"/>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/sexo_filho">
                                    <div class="form-group col-md-3 " item-name="sexo_filho" item-type="select">
                                      <label for="{rows/content/form/value/sexo_filho/@name}">
                                        <xsl:value-of select="rows/content/form/label/sexo_filho"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/value/sexo_filho/@name}" name="{rows/content/form/value/sexo_filho/@name}">
                                        <xsl:for-each select="rows/content/form/list/sexo_filho/option">
                                          <option value="{value}">
                                            <xsl:if test="@selected='true'">
                                              <xsl:attribute name="selected">selected</xsl:attribute>
                                            </xsl:if>
                                            <span>
                                              <xsl:value-of select="text"/>
                                            </span>
                                          </option>
                                        </xsl:for-each>
                                      </select>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_separador_filho" id="separador_filho" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/separador_filho/label/nome_filho">
                                        <xsl:if test="not(rows/content/form/table/separador_filho/label/nome_filho/@visible)">
                                          <th align="" item-name="nome_filho">
                                            <xsl:value-of select="rows/content/form/table/separador_filho/label/nome_filho"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/separador_filho/label/dt_nasc_filho">
                                        <xsl:if test="not(rows/content/form/table/separador_filho/label/dt_nasc_filho/@visible)">
                                          <th align="" item-name="dt_nasc_filho">
                                            <xsl:value-of select="rows/content/form/table/separador_filho/label/dt_nasc_filho"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/separador_filho/label/nacionalidd_filho">
                                        <xsl:if test="not(rows/content/form/table/separador_filho/label/nacionalidd_filho/@visible)">
                                          <th align="" item-name="nacionalidd_filho">
                                            <xsl:value-of select="rows/content/form/table/separador_filho/label/nacionalidd_filho"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/separador_filho/label/naturalidd_filho">
                                        <xsl:if test="not(rows/content/form/table/separador_filho/label/naturalidd_filho/@visible)">
                                          <th align="" item-name="naturalidd_filho">
                                            <xsl:value-of select="rows/content/form/table/separador_filho/label/naturalidd_filho"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/separador_filho/label/sexo_filho">
                                        <xsl:if test="not(rows/content/form/table/separador_filho/label/sexo_filho/@visible)">
                                          <th align="" item-name="sexo_filho">
                                            <xsl:value-of select="rows/content/form/table/separador_filho/label/sexo_filho"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <a class="table-row-add btn">
                                          <i class="fa fa-plus"/>
                                        </a>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/form/table/separador_filho/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="nome_filho">
                                          <xsl:if test="not(nome_filho/@visible)">
                                            <td field="nome_filho" item-name="nome_filho" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="nome_filho_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_nome_filho_fk" value="{nome_filho}"/>
                                              <input type="hidden" name="p_nome_filho_fk_desc" value="{nome_filho_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="dt_nasc_filho">
                                          <xsl:if test="not(dt_nasc_filho/@visible)">
                                            <td field="dt_nasc_filho" item-name="dt_nasc_filho" data-row="{position()}" class="date">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="dt_nasc_filho_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_dt_nasc_filho_fk" value="{dt_nasc_filho}"/>
                                              <input type="hidden" name="p_dt_nasc_filho_fk_desc" value="{dt_nasc_filho_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="nacionalidd_filho">
                                          <xsl:if test="not(nacionalidd_filho/@visible)">
                                            <td field="nacionalidd_filho" item-name="nacionalidd_filho" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="nacionalidd_filho_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_nacionalidd_filho_fk" value="{nacionalidd_filho}"/>
                                              <input type="hidden" name="p_nacionalidd_filho_fk_desc" value="{nacionalidd_filho_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="naturalidd_filho">
                                          <xsl:if test="not(naturalidd_filho/@visible)">
                                            <td field="naturalidd_filho" item-name="naturalidd_filho" data-row="{position()}" class="text">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="naturalidd_filho_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_naturalidd_filho_fk" value="{naturalidd_filho}"/>
                                              <input type="hidden" name="p_naturalidd_filho_fk_desc" value="{naturalidd_filho_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="sexo_filho">
                                          <xsl:if test="not(sexo_filho/@visible)">
                                            <td field="sexo_filho" item-name="sexo_filho" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="sexo_filho_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_sexo_filho_fk" value="{sexo_filho}"/>
                                              <input type="hidden" name="p_sexo_filho_fk_desc" value="{sexo_filho_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="separador_filho">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="separador_filho">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_separador_filho_id" value="{separador_filho_id}"/>
                                        <input type="hidden" name="p_nacionalidd_filho_id_fk" value="{nacionalidd_filho_id}"/>
                                        <input type="hidden" name="p_nacionalidd_filho_id_fk_desc" value="{nacionalidd_filho_id_desc}"/>
                                        <input type="hidden" name="p_naturalidd_filho_id_fk" value="{naturalidd_filho_id}"/>
                                        <input type="hidden" name="p_naturalidd_filho_id_fk_desc" value="{naturalidd_filho_id_desc}"/>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/morada_contacto">
                          <div class="box-head subtitle clearfix" item-name="morada_contacto" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/morada_contacto"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tipo_morada">
                          <div class="form-group col-md-3 " item-name="tipo_morada" item-type="select">
                            <label for="{rows/content/form/value/tipo_morada/@name}">
                              <xsl:value-of select="rows/content/form/label/tipo_morada"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/tipo_morada/@name}" name="{rows/content/form/value/tipo_morada/@name}">
                              <xsl:for-each select="rows/content/form/list/tipo_morada/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/morada">
                          <div class="form-group col-md-3" item-name="morada" item-type="LOOKUP_GEOG">
                            <label for="{rows/content/form/value/morada/@name}">
                              <xsl:value-of select="rows/content/form/label/morada"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/morada}" class="form-control gen-lookup " id="{rows/content/form/value/morada/@name}" name="{rows/content/form/value/morada/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/morada/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/morada"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/morada/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/pais_residencia">
                          <div class="form-group col-md-3" item-name="pais_residencia" item-type="LOOKUP">
                            <label for="{rows/content/form/value/pais_residencia/@name}">
                              <xsl:value-of select="rows/content/form/label/pais_residencia"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/pais_residencia}" class="form-control gen-lookup " id="{rows/content/form/value/pais_residencia/@name}" name="{rows/content/form/value/pais_residencia/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/pais_residencia/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/pais_residencia"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/pais_residencia/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ilha">
                          <div class="form-group col-md-3 " item-name="ilha" item-type="select">
                            <label for="{rows/content/form/value/ilha/@name}">
                              <xsl:value-of select="rows/content/form/label/ilha"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/value/ilha/@name}" name="{rows/content/form/value/ilha/@name}">
                              <xsl:for-each select="rows/content/form/list/ilha/option">
                                <option value="{value}">
                                  <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <span>
                                    <xsl:value-of select="text"/>
                                  </span>
                                </option>
                              </xsl:for-each>
                            </select>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/localidade">
                          <div class="form-group col-md-3" item-name="localidade" item-type="LOOKUP_GEOG">
                            <label for="{rows/content/form/value/localidade/@name}">
                              <xsl:value-of select="rows/content/form/label/localidade"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/localidade}" class="form-control gen-lookup " id="{rows/content/form/value/localidade/@name}" name="{rows/content/form/value/localidade/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/localidade/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/localidade"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/localidade/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/concelho">
                          <div class="form-group col-md-3" item-name="concelho" item-type="LOOKUP_GEOG">
                            <label for="{rows/content/form/value/concelho/@name}">
                              <xsl:value-of select="rows/content/form/label/concelho"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/concelho}" class="form-control gen-lookup " id="{rows/content/form/value/concelho/@name}" name="{rows/content/form/value/concelho/@name}"/>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="'LOOKUP'"/>
                                <xsl:with-param name="action" select="'LOOKUP_GEOG'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/concelho/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/concelho"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/concelho/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/movel">
                          <div class="form-group col-md-3" item-name="movel" item-type="number">
                            <label for="{rows/content/form/value/movel/@name}">
                              <xsl:value-of select="rows/content/form/label/movel"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/movel}" class="form-control " id="{rows/content/form/value/movel/@name}" name="{rows/content/form/value/movel/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/telefone">
                          <div class="form-group col-md-3" item-name="telefone" item-type="number">
                            <label for="{rows/content/form/value/telefone/@name}">
                              <xsl:value-of select="rows/content/form/label/telefone"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/telefone}" class="form-control " id="{rows/content/form/value/telefone/@name}" name="{rows/content/form/value/telefone/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/email">
                          <div class="form-group col-md-3" item-name="email" item-type="email">
                            <label for="{rows/content/form/value/email/@name}">
                              <xsl:value-of select="rows/content/form/label/email"/>
                            </label>
                            <input type="email" value="{rows/content/form/value/email}" class="form-control " id="{rows/content/form/value/email/@name}" name="{rows/content/form/value/email/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/bairro">
                          <div class="form-group col-md-3" item-name="bairro" item-type="text">
                            <label for="{rows/content/form/value/bairro/@name}">
                              <xsl:value-of select="rows/content/form/label/bairro"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/bairro}" class="form-control " id="{rows/content/form/value/bairro/@name}" name="{rows/content/form/value/bairro/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/rua">
                          <div class="form-group col-md-3" item-name="rua" item-type="text">
                            <label for="{rows/content/form/value/rua/@name}">
                              <xsl:value-of select="rows/content/form/label/rua"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/rua}" class="form-control " id="{rows/content/form/value/rua/@name}" name="{rows/content/form/value/rua/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/n_porta">
                          <div class="form-group col-md-3" item-name="n_porta" item-type="text">
                            <label for="{rows/content/form/value/n_porta/@name}">
                              <xsl:value-of select="rows/content/form/label/n_porta"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/n_porta}" class="form-control " id="{rows/content/form/value/n_porta/@name}" name="{rows/content/form/value/n_porta/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/piso">
                          <div class="form-group col-md-3" item-name="piso" item-type="text">
                            <label for="{rows/content/form/value/piso/@name}">
                              <xsl:value-of select="rows/content/form/label/piso"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/piso}" class="form-control " id="{rows/content/form/value/piso/@name}" name="{rows/content/form/value/piso/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/cd_postal">
                          <div class="form-group col-md-3" item-name="cd_postal" item-type="text">
                            <label for="{rows/content/form/value/cd_postal/@name}">
                              <xsl:value-of select="rows/content/form/label/cd_postal"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/cd_postal}" class="form-control " id="{rows/content/form/value/cd_postal/@name}" name="{rows/content/form/value/cd_postal/@name}"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_inicio">
                          <div class="form-group col-md-3" item-name="data_inicio" item-type="date">
                            <label for="{rows/content/form/value/data_inicio/@name}">
                              <xsl:value-of select="rows/content/form/label/data_inicio"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_inicio}" class="form-control gen-date " id="{rows/content/form/value/data_inicio/@name}" name="{rows/content/form/value/data_inicio/@name}" format="IGRP_datePicker"/>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_fim">
                          <div class="form-group col-md-3" item-name="data_fim" item-type="text">
                            <label for="{rows/content/form/value/data_fim/@name}">
                              <xsl:value-of select="rows/content/form/label/data_fim"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/data_fim}" class="form-control " id="{rows/content/form/value/data_fim/@name}" name="{rows/content/form/value/data_fim/@name}"/>
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
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
        <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
