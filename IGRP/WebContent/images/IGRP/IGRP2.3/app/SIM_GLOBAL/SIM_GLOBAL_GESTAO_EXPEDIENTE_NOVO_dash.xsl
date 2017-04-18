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
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
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
                    <div class="box-body" first-type-container="" last-type-container="true">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/camara">
                          <div class="form-group col-md-3 " item-name="camara" item-type="select" required="required">
                            <label for="{rows/content/form/list/camara/@name}">
                              <xsl:value-of select="rows/content/form/label/camara"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/camara/@name}" name="{rows/content/form/list/camara/@name}" required="required" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/camara"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/camara/option">
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
                        <xsl:if test="rows/content/form/label/tipo_expediente">
                          <div class="form-group col-md-3 " item-name="tipo_expediente" item-type="select" required="required">
                            <label for="{rows/content/form/list/tipo_expediente/@name}">
                              <xsl:value-of select="rows/content/form/label/tipo_expediente"/>
                            </label>
                            <select class="form-control select2 IGRP_change " id="{rows/content/form/list/tipo_expediente/@name}" name="{rows/content/form/list/tipo_expediente/@name}" required="required" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/tipo_expediente"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/tipo_expediente/option">
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
                        <xsl:if test="rows/content/form/label/identificacoes">
                          <div class="box gen-container-item gen-item-boxed" item-name="identificacoes">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/identificacoes"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="identificacoes" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'identificacoes'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/nome">
                                    <div class="form-group col-md-3" item-name="nome" item-type="LOOKUP" maxlength="200" readonly="readonly">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/nome/@name}">
                                        <xsl:value-of select="rows/content/form/label/nome"/>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" value="{rows/content/form/value/nome}" class="form-control gen-lookup no-validation" id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}" maxlength="200" readonly="readonly">
                                          <xsl:call-template name="igrp-fields-validation">
                                            <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                                          </xsl:call-template>
                                        </input>
                                        <xsl:call-template name="lookup-tool">
                                          <xsl:with-param name="page" select="rows/page"/>
                                          <xsl:with-param name="ad_hoc" select="'1'"/>
                                          <xsl:with-param name="action" select="'LOOKUP'"/>
                                          <xsl:with-param name="name" select="rows/content/form/value/nome/@name"/>
                                          <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nome"/>
                                          <xsl:with-param name="input-id" select="rows/content/form/value/nome/@name"/>
                                          <xsl:with-param name="btnClass" select="'primary'"/>
                                        </xsl:call-template>
                                      </div>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/form/label/qualidade">
                                    <div class="form-group col-md-3 " item-name="qualidade" item-type="select">
                                      <label for="{rows/content/form/list/qualidade/@name}">
                                        <xsl:value-of select="rows/content/form/label/qualidade"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/list/qualidade/@name}" name="{rows/content/form/list/qualidade/@name}" maxlength="100">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/qualidade"/>
                                        </xsl:call-template>
                                        <xsl:for-each select="rows/content/form/list/qualidade/option">
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
                                <table rel="T_identificacoes" id="identificacoes" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/identificacoes/label/nome">
                                        <xsl:if test="not(rows/content/form/table/identificacoes/label/nome/@visible)">
                                          <th align="" item-name="nome">
                                            <xsl:value-of select="rows/content/form/table/identificacoes/label/nome"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/identificacoes/label/qualidade">
                                        <xsl:if test="not(rows/content/form/table/identificacoes/label/qualidade/@visible)">
                                          <th align="" item-name="qualidade">
                                            <xsl:value-of select="rows/content/form/table/identificacoes/label/qualidade"/>
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
                                    <xsl:for-each select="rows/content/form/table/identificacoes/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="nome">
                                          <xsl:if test="not(nome/@visible)">
                                            <td field="nome" item-name="nome" data-row="{position()}" class="LOOKUP">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                              <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="qualidade">
                                          <xsl:if test="not(qualidade/@visible)">
                                            <td field="qualidade" item-name="qualidade" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="qualidade_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_qualidade_fk" value="{qualidade}"/>
                                              <input type="hidden" name="p_qualidade_fk_desc" value="{qualidade_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="identificacoes">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="identificacoes">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_identificacoes_id" value="{identificacoes_id}"/>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/outros_dados">
                          <div class="box-head subtitle clearfix" item-name="outros_dados" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/outros_dados"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/quem_solicita">
                          <div class="form-group col-md-3 " item-name="quem_solicita" item-type="select">
                            <label for="{rows/content/form/list/quem_solicita/@name}">
                              <xsl:value-of select="rows/content/form/label/quem_solicita"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/quem_solicita/@name}" name="{rows/content/form/list/quem_solicita/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/quem_solicita"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/quem_solicita/option">
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
                        <xsl:if test="rows/content/form/label/matriz">
                          <div class="form-group col-md-3" item-name="matriz" item-type="LOOKUP" maxlength="50" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/matriz"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/matriz/@name}">
                              <xsl:value-of select="rows/content/form/label/matriz"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/matriz}" class="form-control gen-lookup " id="{rows/content/form/value/matriz/@name}" name="{rows/content/form/value/matriz/@name}" maxlength="50" readonly="readonly">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/matriz"/>
                                </xsl:call-template>
                              </input>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/matriz/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/matriz"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/matriz/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/referencia_cadastral">
                          <div class="form-group col-md-3" item-name="referencia_cadastral" item-type="LOOKUP" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/referencia_cadastral"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/referencia_cadastral/@name}">
                              <xsl:value-of select="rows/content/form/label/referencia_cadastral"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/referencia_cadastral}" class="form-control gen-lookup " id="{rows/content/form/value/referencia_cadastral/@name}" name="{rows/content/form/value/referencia_cadastral/@name}" maxlength="30">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/referencia_cadastral"/>
                                </xsl:call-template>
                              </input>
                              <xsl:call-template name="lookup-tool">
                                <xsl:with-param name="page" select="rows/page"/>
                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                <xsl:with-param name="name" select="rows/content/form/value/referencia_cadastral/@name"/>
                                <xsl:with-param name="js_lookup" select="rows/content/form/lookup/referencia_cadastral"/>
                                <xsl:with-param name="input-id" select="rows/content/form/value/referencia_cadastral/@name"/>
                                <xsl:with-param name="btnClass" select="'primary'"/>
                              </xsl:call-template>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/prazo_licenca">
                          <div class="form-group col-md-3" item-name="prazo_licenca" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/prazo_licenca"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/prazo_licenca/@name}">
                              <xsl:value-of select="rows/content/form/label/prazo_licenca"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/prazo_licenca}" class="form-control " id="{rows/content/form/value/prazo_licenca/@name}" name="{rows/content/form/value/prazo_licenca/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/prazo_licenca"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/natureza">
                          <div class="form-group col-md-3 " item-name="natureza" item-type="select">
                            <label for="{rows/content/form/list/natureza/@name}">
                              <xsl:value-of select="rows/content/form/label/natureza"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/natureza/@name}" name="{rows/content/form/list/natureza/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/natureza"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/natureza/option">
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
                        <xsl:if test="rows/content/form/label/destino_obra">
                          <div class="form-group col-md-3" item-name="destino_obra" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/destino_obra"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/destino_obra/@name}">
                              <xsl:value-of select="rows/content/form/label/destino_obra"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/destino_obra}" class="form-control " id="{rows/content/form/value/destino_obra/@name}" name="{rows/content/form/value/destino_obra/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/destino_obra"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/valor_obra">
                          <div class="form-group col-md-3" item-name="valor_obra" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/valor_obra"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/valor_obra/@name}">
                              <xsl:value-of select="rows/content/form/label/valor_obra"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/valor_obra}" class="form-control " id="{rows/content/form/value/valor_obra/@name}" name="{rows/content/form/value/valor_obra/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/valor_obra"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/tipo_execucao">
                          <div class="form-group col-md-3 " item-name="tipo_execucao" item-type="select">
                            <label for="{rows/content/form/list/tipo_execucao/@name}">
                              <xsl:value-of select="rows/content/form/label/tipo_execucao"/>
                            </label>
                            <select class="form-control select2  " id="{rows/content/form/list/tipo_execucao/@name}" name="{rows/content/form/list/tipo_execucao/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/tipo_execucao"/>
                              </xsl:call-template>
                              <xsl:for-each select="rows/content/form/list/tipo_execucao/option">
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
                        <xsl:if test="rows/content/form/label/trabalhos_a_executar">
                          <div class="form-group col-md-3" item-name="trabalhos_a_executar" item-type="textarea">
                            <label for="{rows/content/form/value/trabalhos_a_executar/@name}">
                              <xsl:value-of select="rows/content/form/label/trabalhos_a_executar"/>
                            </label>
                            <textarea name="{rows/content/form/value/trabalhos_a_executar/@name}" class="textarea form-control " maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/trabalhos_a_executar"/>
                              </xsl:call-template>
                              <xsl:value-of select="rows/content/form/value/trabalhos_a_executar"/>
                            </textarea>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/dt_aprovacao">
                          <div class="form-group col-md-3" item-name="dt_aprovacao" item-type="date">
                            <label for="{rows/content/form/value/dt_aprovacao/@name}">
                              <xsl:value-of select="rows/content/form/label/dt_aprovacao"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/dt_aprovacao}" class="form-control gen-date " id="{rows/content/form/value/dt_aprovacao/@name}" name="{rows/content/form/value/dt_aprovacao/@name}" format="IGRP_datePicker" maxlength="10">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/dt_aprovacao"/>
                                </xsl:call-template>
                              </input>
                              <span class="input-group-btn gen-date-icon">
                                <span class="btn btn-default">
                                  <i class="fa fa-calendar"/>
                                </span>
                              </span>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/responsavel_obra">
                          <div class="form-group col-md-3" item-name="responsavel_obra" item-type="text" maxlength="100">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/responsavel_obra"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/responsavel_obra/@name}">
                              <xsl:value-of select="rows/content/form/label/responsavel_obra"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/responsavel_obra}" class="form-control " id="{rows/content/form/value/responsavel_obra/@name}" name="{rows/content/form/value/responsavel_obra/@name}" maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/responsavel_obra"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/alvara">
                          <div class="form-group col-md-3" item-name="alvara" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/alvara"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/alvara/@name}">
                              <xsl:value-of select="rows/content/form/label/alvara"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/alvara}" class="form-control " id="{rows/content/form/value/alvara/@name}" name="{rows/content/form/value/alvara/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/alvara"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/empresa_emissora_alvara">
                          <div class="form-group col-md-3" item-name="empresa_emissora_alvara" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/empresa_emissora_alvara"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/empresa_emissora_alvara/@name}">
                              <xsl:value-of select="rows/content/form/label/empresa_emissora_alvara"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/empresa_emissora_alvara}" class="form-control " id="{rows/content/form/value/empresa_emissora_alvara/@name}" name="{rows/content/form/value/empresa_emissora_alvara/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/empresa_emissora_alvara"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ocupacao_via_publica">
                          <div class="box-head subtitle clearfix" item-name="ocupacao_via_publica" item-type="separator">
                            <span>
                              <xsl:value-of select="rows/content/form/label/ocupacao_via_publica"/>
                            </span>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/prazo">
                          <div class="form-group col-md-3" item-name="prazo" item-type="text" maxlength="50">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/prazo"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/prazo/@name}">
                              <xsl:value-of select="rows/content/form/label/prazo"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/prazo}" class="form-control " id="{rows/content/form/value/prazo/@name}" name="{rows/content/form/value/prazo/@name}" maxlength="50">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/prazo"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/area">
                          <div class="form-group col-md-3" item-name="area" item-type="text" maxlength="30">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/area"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/area/@name}">
                              <xsl:value-of select="rows/content/form/label/area"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/area}" class="form-control " id="{rows/content/form/value/area/@name}" name="{rows/content/form/value/area/@name}" maxlength="30">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/area"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/material">
                          <div class="form-group col-md-3" item-name="material" item-type="textarea">
                            <label for="{rows/content/form/value/material/@name}">
                              <xsl:value-of select="rows/content/form/label/material"/>
                            </label>
                            <textarea name="{rows/content/form/value/material/@name}" class="textarea form-control " maxlength="100">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/material"/>
                              </xsl:call-template>
                              <xsl:value-of select="rows/content/form/value/material"/>
                            </textarea>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/documentos_entregues">
                          <div class="box gen-container-item gen-item-boxed" item-name="documentos_entregues">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/documentos_entregues"/>
                              </h3>
                            </div>
                            <div class="box-body IGRP-separatorlist" tag="documentos_entregues" dialog="">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                    <xsl:with-param name="rel" select="'documentos_entregues'"/>
                                  </xsl:apply-templates>
                                  <xsl:if test="rows/content/form/label/tipo_documento">
                                    <div class="form-group col-md-3 " item-name="tipo_documento" item-type="select">
                                      <label for="{rows/content/form/list/tipo_documento/@name}">
                                        <xsl:value-of select="rows/content/form/label/tipo_documento"/>
                                      </label>
                                      <select class="form-control select2  no-validation" id="{rows/content/form/list/tipo_documento/@name}" name="{rows/content/form/list/tipo_documento/@name}" maxlength="100">
                                        <xsl:call-template name="igrp-fields-validation">
                                          <xsl:with-param name="field" select="rows/content/form/label/tipo_documento"/>
                                        </xsl:call-template>
                                        <xsl:for-each select="rows/content/form/list/tipo_documento/option">
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
                                  <xsl:if test="rows/content/form/label/documento">
                                    <div class="form-group col-md-3" item-name="documento" item-type="file" maxlength="30">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/documento"/>
                                      </xsl:call-template>
                                      <label for="{rows/content/form/value/documento/@name}">
                                        <xsl:value-of select="rows/content/form/label/documento"/>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" class="form-control not-form no-validation" readonly=""/>
                                        <span class="input-group-btn">
                                          <span class="btn btn-default file-btn-holder">
                                            <i class="fa fa-upload"/>
                                            <input id="{rows/content/form/value/documento/@name}" name="{rows/content/form/value/documento/@name}" value="{rows/content/form/value/documento}" class="transparent no-validation" type="file" multiple="" maxlength="30">
                                              <xsl:call-template name="igrp-fields-validation">
                                                <xsl:with-param name="field" select="rows/content/form/label/documento"/>
                                              </xsl:call-template>
                                            </input>
                                          </span>
                                        </span>
                                      </div>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_documentos_entregues" id="documentos_entregues" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/form/table/documentos_entregues/label/tipo_documento">
                                        <xsl:if test="not(rows/content/form/table/documentos_entregues/label/tipo_documento/@visible)">
                                          <th align="" item-name="tipo_documento">
                                            <xsl:value-of select="rows/content/form/table/documentos_entregues/label/tipo_documento"/>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/form/table/documentos_entregues/label/documento">
                                        <xsl:if test="not(rows/content/form/table/documentos_entregues/label/documento/@visible)">
                                          <th align="" item-name="documento">
                                            <xsl:value-of select="rows/content/form/table/documentos_entregues/label/documento"/>
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
                                    <xsl:for-each select="rows/content/form/table/documentos_entregues/value/row[not(@total='yes')]">
                                      <tr>
                                        <xsl:if test="tipo_documento">
                                          <xsl:if test="not(tipo_documento/@visible)">
                                            <td field="tipo_documento" item-name="tipo_documento" data-row="{position()}" class="select">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="tipo_documento_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_tipo_documento_fk" value="{tipo_documento}"/>
                                              <input type="hidden" name="p_tipo_documento_fk_desc" value="{tipo_documento_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="documento">
                                          <xsl:if test="not(documento/@visible)">
                                            <td field="documento" item-name="documento" data-row="{position()}" class="file">
                                              <span class="separator-list-td-val">
                                                <xsl:value-of select="documento_desc" disable-output-escaping="yes"/>
                                              </span>
                                              <input type="hidden" name="p_documento_fk" value="{documento}"/>
                                              <input type="hidden" name="p_documento_fk_desc" value="{documento_desc}"/>
                                            </td>
                                          </xsl:if>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-edit btn btn-default" rel="documentos_entregues">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-remove btn btn-danger" rel="documentos_entregues">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                        <input type="hidden" class="sl-row-id" name="p_documentos_entregues_id" value="{documentos_entregues_id}"/>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
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
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
