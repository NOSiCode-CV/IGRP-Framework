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
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                  <xsl:if test="rows/content/view">
                    <xsl:variable name="viewImg" select="rows/content/view/value/view_foto"/>
                    <xsl:variable name="hasImg">
                      <xsl:if test="$viewImg">true</xsl:if>
                    </xsl:variable>
                    <div class="box clearfix view-block gen-container-item" has-img="{$hasImg}" item-name="gen_view">
                      <div class="box-body">
                        <xsl:if test="$hasImg = 'true'">
                          <img src="{$viewImg}"/>
                        </xsl:if>
                        <div class="view-body clearfix " gen-id="drop-zone">
                          <xsl:if test="rows/content/view/label/foto">
                            <div class="view-item">
                              <span class="view-label">
                                <xsl:value-of select="rows/content/view/label/foto"/>
                              </span>
                              <span class="view-value">
                                <xsl:value-of select="rows/content/view/value/foto"/>
                              </span>
                            </div>
                          </xsl:if>
                        </div>
                      </div>
                    </div>
                  </xsl:if>
                  <div class="gen-menu-wrapper">
                    <xsl:if test="rows/content/menu/group/item">
                      <xsl:apply-templates select="rows/content/menu" mode="gen-buttons-group">
                        <xsl:with-param name="use-fa" select="'false'"/>
                        <xsl:with-param name="vertical" select="'true'"/>
                      </xsl:apply-templates>
                    </xsl:if>
                  </div>
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
                        <xsl:if test="rows/content/form/label/nomes_s">
                          <div class="form-group col-md-3" item-name="nomes_s" item-type="text" maxlength="200" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nomes_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nomes_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nomes_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nomes_s}" class="form-control " id="{rows/content/form/value/nomes_s/@name}" name="{rows/content/form/value/nomes_s/@name}" maxlength="200" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nomes_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/sexo_s">
                          <div class="col-md-3" item-name="sexo_s" item-type="radiolist">
                            <div class="form-group" maxlength="15" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/sexo_s"/>
                              </xsl:call-template>
                              <label for="{rows/content/form/value/sexo_s/@name}">
                                <xsl:value-of select="rows/content/form/label/sexo_s"/>
                              </label>
                              <xsl:for-each select="rows/content/form/list/sexo_s/option">
                                <div class="radio">
                                  <label>
                                    <input type="radio" name="{../@name}" value="{value}" class="checkboxlist " label="{text}" maxlength="15" readonly="readonly">
                                      <xsl:call-template name="igrp-fields-validation">
                                        <xsl:with-param name="field" select="rows/content/form/label/sexo_s"/>
                                      </xsl:call-template>
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
                        <xsl:if test="rows/content/form/label/nominho_s">
                          <div class="form-group col-md-3" item-name="nominho_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nominho_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nominho_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nominho_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nominho_s}" class="form-control " id="{rows/content/form/value/nominho_s/@name}" name="{rows/content/form/value/nominho_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nominho_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado_s">
                          <div class="form-group col-md-3" item-name="estado_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/estado_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/estado_s/@name}">
                              <xsl:value-of select="rows/content/form/label/estado_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/estado_s}" class="form-control " id="{rows/content/form/value/estado_s/@name}" name="{rows/content/form/value/estado_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/estado_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/estado_civil_s">
                          <div class="form-group col-md-3" item-name="estado_civil_s" item-type="text" maxlength="30" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/estado_civil_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/estado_civil_s/@name}">
                              <xsl:value-of select="rows/content/form/label/estado_civil_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/estado_civil_s}" class="form-control " id="{rows/content/form/value/estado_civil_s/@name}" name="{rows/content/form/value/estado_civil_s/@name}" maxlength="30" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/estado_civil_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_nascimento_s">
                          <div class="form-group col-md-3" item-name="data_nascimento_s" item-type="date">
                            <label for="{rows/content/form/value/data_nascimento_s/@name}">
                              <xsl:value-of select="rows/content/form/label/data_nascimento_s"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_nascimento_s}" class="form-control gen-date " id="{rows/content/form/value/data_nascimento_s/@name}" name="{rows/content/form/value/data_nascimento_s/@name}" format="IGRP_datePicker" maxlength="100" readonly="readonly">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_nascimento_s"/>
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
                        <xsl:if test="rows/content/form/label/nacionalidade_s">
                          <div class="form-group col-md-3" item-name="nacionalidade_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nacionalidade_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nacionalidade_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nacionalidade_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nacionalidade_s}" class="form-control " id="{rows/content/form/value/nacionalidade_s/@name}" name="{rows/content/form/value/nacionalidade_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nacionalidade_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nac">
                          <div class="form-group col-md-3" item-name="nac" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nac"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nac/@name}">
                              <xsl:value-of select="rows/content/form/label/nac"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nac}" class="form-control " id="{rows/content/form/value/nac/@name}" name="{rows/content/form/value/nac/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nac"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/local_nascimento_s">
                          <div class="form-group col-md-3" item-name="local_nascimento_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/local_nascimento_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/local_nascimento_s/@name}">
                              <xsl:value-of select="rows/content/form/label/local_nascimento_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/local_nascimento_s}" class="form-control " id="{rows/content/form/value/local_nascimento_s/@name}" name="{rows/content/form/value/local_nascimento_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/local_nascimento_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nm_mae_s">
                          <div class="form-group col-md-3" item-name="nm_mae_s" item-type="text" maxlength="170" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nm_mae_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nm_mae_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nm_mae_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nm_mae_s}" class="form-control " id="{rows/content/form/value/nm_mae_s/@name}" name="{rows/content/form/value/nm_mae_s/@name}" maxlength="170" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nm_mae_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nm_pai_s">
                          <div class="form-group col-md-3" item-name="nm_pai_s" item-type="text" maxlength="170" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nm_pai_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nm_pai_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nm_pai_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nm_pai_s}" class="form-control " id="{rows/content/form/value/nm_pai_s/@name}" name="{rows/content/form/value/nm_pai_s/@name}" maxlength="170" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nm_pai_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/geog_id_end_s">
                          <div class="form-group col-md-3" item-name="geog_id_end_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/geog_id_end_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/geog_id_end_s/@name}">
                              <xsl:value-of select="rows/content/form/label/geog_id_end_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/geog_id_end_s}" class="form-control " id="{rows/content/form/value/geog_id_end_s/@name}" name="{rows/content/form/value/geog_id_end_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/geog_id_end_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/ds_morada_s">
                          <div class="form-group col-md-3" item-name="ds_morada_s" item-type="text" maxlength="300" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/ds_morada_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/ds_morada_s/@name}">
                              <xsl:value-of select="rows/content/form/label/ds_morada_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/ds_morada_s}" class="form-control " id="{rows/content/form/value/ds_morada_s/@name}" name="{rows/content/form/value/ds_morada_s/@name}" maxlength="300" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/ds_morada_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/telefone_s">
                          <div class="form-group col-md-3" item-name="telefone_s" item-type="text" maxlength="10" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/telefone_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/telefone_s/@name}">
                              <xsl:value-of select="rows/content/form/label/telefone_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/telefone_s}" class="form-control " id="{rows/content/form/value/telefone_s/@name}" name="{rows/content/form/value/telefone_s/@name}" maxlength="10" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/telefone_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/telemovel_s">
                          <div class="form-group col-md-3" item-name="telemovel_s" item-type="text" maxlength="10" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/telemovel_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/telemovel_s/@name}">
                              <xsl:value-of select="rows/content/form/label/telemovel_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/telemovel_s}" class="form-control " id="{rows/content/form/value/telemovel_s/@name}" name="{rows/content/form/value/telemovel_s/@name}" maxlength="10" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/telemovel_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/cd_postal_s">
                          <div class="form-group col-md-3" item-name="cd_postal_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/cd_postal_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/cd_postal_s/@name}">
                              <xsl:value-of select="rows/content/form/label/cd_postal_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/cd_postal_s}" class="form-control " id="{rows/content/form/value/cd_postal_s/@name}" name="{rows/content/form/value/cd_postal_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/cd_postal_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/email_s">
                          <div class="form-group col-md-3" item-name="email_s" item-type="text" maxlength="170" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/email_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/email_s/@name}">
                              <xsl:value-of select="rows/content/form/label/email_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/email_s}" class="form-control " id="{rows/content/form/value/email_s/@name}" name="{rows/content/form/value/email_s/@name}" maxlength="170" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/email_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/numero_bi_pass_s">
                          <div class="form-group col-md-3" item-name="numero_bi_pass_s" item-type="text" maxlength="20" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/numero_bi_pass_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/numero_bi_pass_s/@name}">
                              <xsl:value-of select="rows/content/form/label/numero_bi_pass_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/numero_bi_pass_s}" class="form-control " id="{rows/content/form/value/numero_bi_pass_s/@name}" name="{rows/content/form/value/numero_bi_pass_s/@name}" maxlength="20" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/numero_bi_pass_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/local_emissao_s">
                          <div class="form-group col-md-3" item-name="local_emissao_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/local_emissao_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/local_emissao_s/@name}">
                              <xsl:value-of select="rows/content/form/label/local_emissao_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/local_emissao_s}" class="form-control " id="{rows/content/form/value/local_emissao_s/@name}" name="{rows/content/form/value/local_emissao_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/local_emissao_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_emissao_s">
                          <div class="form-group col-md-3" item-name="data_emissao_s" item-type="date">
                            <label for="{rows/content/form/value/data_emissao_s/@name}">
                              <xsl:value-of select="rows/content/form/label/data_emissao_s"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_emissao_s}" class="form-control gen-date " id="{rows/content/form/value/data_emissao_s/@name}" name="{rows/content/form/value/data_emissao_s/@name}" format="IGRP_datePicker" maxlength="20" readonly="readonly">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_emissao_s"/>
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
                        <xsl:if test="rows/content/form/label/validade_s">
                          <div class="form-group col-md-3" item-name="validade_s" item-type="date">
                            <label for="{rows/content/form/value/validade_s/@name}">
                              <xsl:value-of select="rows/content/form/label/validade_s"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/validade_s}" class="form-control gen-date " id="{rows/content/form/value/validade_s/@name}" name="{rows/content/form/value/validade_s/@name}" format="IGRP_datePicker" maxlength="20" readonly="readonly">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/validade_s"/>
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
                        <xsl:if test="rows/content/form/label/passaporte_s">
                          <div class="form-group col-md-3" item-name="passaporte_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/passaporte_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/passaporte_s/@name}">
                              <xsl:value-of select="rows/content/form/label/passaporte_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/passaporte_s}" class="form-control " id="{rows/content/form/value/passaporte_s/@name}" name="{rows/content/form/value/passaporte_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/passaporte_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/local_emissao_pass_s">
                          <div class="form-group col-md-3" item-name="local_emissao_pass_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/local_emissao_pass_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/local_emissao_pass_s/@name}">
                              <xsl:value-of select="rows/content/form/label/local_emissao_pass_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/local_emissao_pass_s}" class="form-control " id="{rows/content/form/value/local_emissao_pass_s/@name}" name="{rows/content/form/value/local_emissao_pass_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/local_emissao_pass_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/data_emissao_pass_s">
                          <div class="form-group col-md-3" item-name="data_emissao_pass_s" item-type="date">
                            <label for="{rows/content/form/value/data_emissao_pass_s/@name}">
                              <xsl:value-of select="rows/content/form/label/data_emissao_pass_s"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/data_emissao_pass_s}" class="form-control gen-date " id="{rows/content/form/value/data_emissao_pass_s/@name}" name="{rows/content/form/value/data_emissao_pass_s/@name}" format="IGRP_datePicker" maxlength="20" readonly="readonly">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/data_emissao_pass_s"/>
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
                        <xsl:if test="rows/content/form/label/validade_pass_s">
                          <div class="form-group col-md-3" item-name="validade_pass_s" item-type="date">
                            <label for="{rows/content/form/value/validade_pass_s/@name}">
                              <xsl:value-of select="rows/content/form/label/validade_pass_s"/>
                            </label>
                            <div class="input-group">
                              <input type="text" value="{rows/content/form/value/validade_pass_s}" class="form-control gen-date " id="{rows/content/form/value/validade_pass_s/@name}" name="{rows/content/form/value/validade_pass_s/@name}" format="IGRP_datePicker" maxlength="20" readonly="readonly">
                                <xsl:call-template name="igrp-fields-validation">
                                  <xsl:with-param name="field" select="rows/content/form/label/validade_pass_s"/>
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
                        <xsl:if test="rows/content/form/label/nib_s">
                          <div class="form-group col-md-3" item-name="nib_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nib_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nib_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nib_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nib_s}" class="form-control " id="{rows/content/form/value/nib_s/@name}" name="{rows/content/form/value/nib_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nib_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nim_s">
                          <div class="form-group col-md-3" item-name="nim_s" item-type="number" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nim_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nim_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nim_s"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/nim_s}" class="form-control " id="{rows/content/form/value/nim_s/@name}" name="{rows/content/form/value/nim_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nim_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/nif_s">
                          <div class="form-group col-md-3" item-name="nif_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/nif_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/nif_s/@name}">
                              <xsl:value-of select="rows/content/form/label/nif_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nif_s}" class="form-control " id="{rows/content/form/value/nif_s/@name}" name="{rows/content/form/value/nif_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/nif_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/inps_s">
                          <div class="form-group col-md-3" item-name="inps_s" item-type="text" maxlength="100" readonly="readonly">
                            <xsl:call-template name="igrp-fields-validation">
                              <xsl:with-param name="field" select="rows/content/form/label/inps_s"/>
                            </xsl:call-template>
                            <label for="{rows/content/form/value/inps_s/@name}">
                              <xsl:value-of select="rows/content/form/label/inps_s"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/inps_s}" class="form-control " id="{rows/content/form/value/inps_s/@name}" name="{rows/content/form/value/inps_s/@name}" maxlength="100" readonly="readonly">
                              <xsl:call-template name="igrp-fields-validation">
                                <xsl:with-param name="field" select="rows/content/form/label/inps_s"/>
                              </xsl:call-template>
                            </input>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                      </div>
                    </div>
                    <xsl:apply-templates select="rows/content/filter/tools-bar" mode="form-buttons">
                      <xsl:with-param name="use-fa" select="'false'"/>
                      <xsl:with-param name="fixed-target" select="'submit'"/>
                    </xsl:apply-templates>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
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
