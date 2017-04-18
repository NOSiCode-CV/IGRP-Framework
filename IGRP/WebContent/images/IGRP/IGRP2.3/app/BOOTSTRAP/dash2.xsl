<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.css"/>
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
      </head>
      <body class="{$bodyClass}">
        <xsl:call-template name="IGRP-topmenu"/>
        <div class="container-fluid">
          <div class="row">
            <xsl:call-template name="IGRP-sidebar"/>
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
              <div class="content">
                <form class="IGRP-form">
                  <div class="row">
                    <div class="gen-column col-1-1">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/gen_form_toolsbar">
                          <div  class="toolsbar-holder gen-container-item" gen-structure="toolsbar" gen-fields=".btn-group a.btn">
                            <div class="btn-group   pull-right" role="group">
                              <xsl:apply-templates select="rows/content/gen_form_toolsbar" mode="gen-buttons"/>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/gen_form_1">
                          <div  class="box igrp-forms gen-container-item">
                            <div class="box-body">
                              <div role="form" gen-id="drop-zone">
                                <xsl:if  test="rows/content/gen_form_1/fields/separatormap_cons_plan5">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separatormap_cons_plan5/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/dados_projecto">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/dados_projecto/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/tipo_aprovacao">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="tipo_aprovacao" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/tipo_aprovacao/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/tipo_aprovacao/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_tipo_aprovacao" name="{rows/content/gen_form_1/fields/tipo_aprovacao/@name}">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/tipo_aprovacao/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/nif_resp_p">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="nif_resp_p" item-type="lookup">
                                    <label for="{rows/content/gen_form_1/fields/nif_resp_p/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/nif_resp_p/label"/>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/gen_form_1/fields/nif_resp_p/value}" class="form-control gen-lookup" id="gen_form_1_nif_resp_p" name="{rows/content/gen_form_1/fields/nif_resp_p/@name}" required="required"/>
                                      <xsl:call-template name="lookup-tool">
                                        <xsl:with-param name="page" select="rows/page"/>
                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                        <xsl:with-param name="name" select="rows/content/gen_form_1/fields/nif_resp_p/@name"/>
                                        <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/nif_resp_p/lookup"/>
                                        <xsl:with-param name="input-id" select="'gen_form_1_nif_resp_p'"/>
                                        <xsl:with-param name="btnClass" select="'default'"/>
                                      </xsl:call-template>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_ordem">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="n_ordem" item-type="lookup">
                                    <label for="{rows/content/gen_form_1/fields/n_ordem/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/n_ordem/label"/>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/gen_form_1/fields/n_ordem/value}" class="form-control gen-lookup" id="gen_form_1_n_ordem" name="{rows/content/gen_form_1/fields/n_ordem/@name}" required="required"/>
                                      <xsl:call-template name="lookup-tool">
                                        <xsl:with-param name="page" select="rows/page"/>
                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                        <xsl:with-param name="name" select="rows/content/gen_form_1/fields/n_ordem/@name"/>
                                        <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/n_ordem/lookup"/>
                                        <xsl:with-param name="input-id" select="'gen_form_1_n_ordem'"/>
                                        <xsl:with-param name="btnClass" select="'default'"/>
                                      </xsl:call-template>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/nome_resp_p">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="nome_resp_p" item-type="text">
                                    <label for="{rows/content/gen_form_1/fields/nome_resp_p/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/nome_resp_p/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/gen_form_1/fields/nome_resp_p/value}" class="form-control" id="{rows/content/gen_form_1/fields/nome_resp_p/@name}" name="{rows/content/gen_form_1/fields/nome_resp_p/@name}" required="required" maxlength="200">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/contacto_resp_p">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="contacto_resp_p" item-type="text">
                                    <label for="{rows/content/gen_form_1/fields/contacto_resp_p/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/contacto_resp_p/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/gen_form_1/fields/contacto_resp_p/value}" class="form-control" id="{rows/content/gen_form_1/fields/contacto_resp_p/@name}" name="{rows/content/gen_form_1/fields/contacto_resp_p/@name}" required="required" maxlength="200">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/destino_obra">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="destino_obra" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/destino_obra/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/destino_obra/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_destino_obra" name="{rows/content/gen_form_1/fields/destino_obra/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/destino_obra/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_pavimento">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_pavimento" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_pavimento/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_pavimento/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_pavimento/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_pavimento/@name}" name="{rows/content/gen_form_1/fields/n_pavimento/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_fogos">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_fogos" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_fogos/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_fogos/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_fogos/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_fogos/@name}" name="{rows/content/gen_form_1/fields/n_fogos/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_estabelecimento">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_estabelecimento" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_estabelecimento/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_estabelecimento/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_estabelecimento/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_estabelecimento/@name}" name="{rows/content/gen_form_1/fields/n_estabelecimento/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/area_total_construcao">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="area_total_construcao" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/area_total_construcao/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/area_total_construcao/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/area_total_construcao/value}" class="form-control" id="{rows/content/gen_form_1/fields/area_total_construcao/@name}" name="{rows/content/gen_form_1/fields/area_total_construcao/@name}" required="required" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/area__coberta">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="area__coberta" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/area__coberta/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/area__coberta/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/area__coberta/value}" class="form-control" id="{rows/content/gen_form_1/fields/area__coberta/@name}" name="{rows/content/gen_form_1/fields/area__coberta/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_pisos">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_pisos" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_pisos/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_pisos/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_pisos/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_pisos/@name}" name="{rows/content/gen_form_1/fields/n_pisos/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/obs">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="obs" item-type="textarea">
                                    <label for="{rows/content/gen_form_1/fields/obs/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/obs/label"/>
                                    </label>
                                    <textarea name="{rows/content/gen_form_1/fields/obs/@name}" class="textarea form-control" maxlength="300">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/obs/value"/>
                                    </textarea>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/separatordados_proj_eng8">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separatordados_proj_eng8/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/dados_projecto_engenharia">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="dados_projecto_engenharia" item-type="text">
                                    <label for="{rows/content/gen_form_1/fields/dados_projecto_engenharia/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/dados_projecto_engenharia/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/gen_form_1/fields/dados_projecto_engenharia/value}" class="form-control" id="{rows/content/gen_form_1/fields/dados_projecto_engenharia/@name}" name="{rows/content/gen_form_1/fields/dados_projecto_engenharia/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/alteracao_renovacao">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="alteracao_renovacao" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/alteracao_renovacao/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/alteracao_renovacao/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_alteracao_renovacao" name="{rows/content/gen_form_1/fields/alteracao_renovacao/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/alteracao_renovacao/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/nif_resp__estabilidade">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="nif_resp__estabilidade" item-type="lookup">
                                    <label for="{rows/content/gen_form_1/fields/nif_resp__estabilidade/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/nif_resp__estabilidade/label"/>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/gen_form_1/fields/nif_resp__estabilidade/value}" class="form-control gen-lookup" id="gen_form_1_nif_resp__estabilidade" name="{rows/content/gen_form_1/fields/nif_resp__estabilidade/@name}"/>
                                      <xsl:call-template name="lookup-tool">
                                        <xsl:with-param name="page" select="rows/page"/>
                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                        <xsl:with-param name="name" select="rows/content/gen_form_1/fields/nif_resp__estabilidade/@name"/>
                                        <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/nif_resp__estabilidade/lookup"/>
                                        <xsl:with-param name="input-id" select="'gen_form_1_nif_resp__estabilidade'"/>
                                        <xsl:with-param name="btnClass" select="'default'"/>
                                      </xsl:call-template>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/responsavel_estabilidade">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="responsavel_estabilidade" item-type="text">
                                    <label for="{rows/content/gen_form_1/fields/responsavel_estabilidade/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/responsavel_estabilidade/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/gen_form_1/fields/responsavel_estabilidade/value}" class="form-control" id="{rows/content/gen_form_1/fields/responsavel_estabilidade/@name}" name="{rows/content/gen_form_1/fields/responsavel_estabilidade/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_ordem_resp_estabiliadade">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_ordem_resp_estabiliadade" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_ordem_resp_estabiliadade/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_ordem_resp_estabiliadade/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_ordem_resp_estabiliadade/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_ordem_resp_estabiliadade/@name}" name="{rows/content/gen_form_1/fields/n_ordem_resp_estabiliadade/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/nif_resp__saneamento">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="nif_resp__saneamento" item-type="lookup">
                                    <label for="{rows/content/gen_form_1/fields/nif_resp__saneamento/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/nif_resp__saneamento/label"/>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/gen_form_1/fields/nif_resp__saneamento/value}" class="form-control gen-lookup" id="gen_form_1_nif_resp__saneamento" name="{rows/content/gen_form_1/fields/nif_resp__saneamento/@name}"/>
                                      <xsl:call-template name="lookup-tool">
                                        <xsl:with-param name="page" select="rows/page"/>
                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                        <xsl:with-param name="name" select="rows/content/gen_form_1/fields/nif_resp__saneamento/@name"/>
                                        <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/nif_resp__saneamento/lookup"/>
                                        <xsl:with-param name="input-id" select="'gen_form_1_nif_resp__saneamento'"/>
                                        <xsl:with-param name="btnClass" select="'default'"/>
                                      </xsl:call-template>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_ordem_resp__saneamento">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_ordem_resp__saneamento" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_ordem_resp__saneamento/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_ordem_resp__saneamento/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_ordem_resp__saneamento/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_ordem_resp__saneamento/@name}" name="{rows/content/gen_form_1/fields/n_ordem_resp__saneamento/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/nif_resp__electricidade">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="nif_resp__electricidade" item-type="lookup">
                                    <label for="{rows/content/gen_form_1/fields/nif_resp__electricidade/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/nif_resp__electricidade/label"/>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/gen_form_1/fields/nif_resp__electricidade/value}" class="form-control gen-lookup" id="gen_form_1_nif_resp__electricidade" name="{rows/content/gen_form_1/fields/nif_resp__electricidade/@name}"/>
                                      <xsl:call-template name="lookup-tool">
                                        <xsl:with-param name="page" select="rows/page"/>
                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                        <xsl:with-param name="name" select="rows/content/gen_form_1/fields/nif_resp__electricidade/@name"/>
                                        <xsl:with-param name="js_lookup" select="rows/content/gen_form_1/fields/nif_resp__electricidade/lookup"/>
                                        <xsl:with-param name="input-id" select="'gen_form_1_nif_resp__electricidade'"/>
                                        <xsl:with-param name="btnClass" select="'default'"/>
                                      </xsl:call-template>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/responsavel_electricidade">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="responsavel_electricidade" item-type="text">
                                    <label for="{rows/content/gen_form_1/fields/responsavel_electricidade/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/responsavel_electricidade/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/gen_form_1/fields/responsavel_electricidade/value}" class="form-control" id="{rows/content/gen_form_1/fields/responsavel_electricidade/@name}" name="{rows/content/gen_form_1/fields/responsavel_electricidade/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/n_ordem_resp_electricidade">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="n_ordem_resp_electricidade" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/n_ordem_resp_electricidade/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/n_ordem_resp_electricidade/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/n_ordem_resp_electricidade/value}" class="form-control" id="{rows/content/gen_form_1/fields/n_ordem_resp_electricidade/@name}" name="{rows/content/gen_form_1/fields/n_ordem_resp_electricidade/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/obs_eng">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="obs_eng" item-type="number">
                                    <label for="{rows/content/gen_form_1/fields/obs_eng/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/obs_eng/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/gen_form_1/fields/obs_eng/value}" class="form-control" id="{rows/content/gen_form_1/fields/obs_eng/@name}" name="{rows/content/gen_form_1/fields/obs_eng/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/separatorn_vistoria9">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separatorn_vistoria9/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/necessita_vistoria">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="necessita_vistoria" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/necessita_vistoria/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/necessita_vistoria/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_necessita_vistoria" name="{rows/content/gen_form_1/fields/necessita_vistoria/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/necessita_vistoria/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/marcacao_deslocacao">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/marcacao_deslocacao/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/data_inicio">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                    <label for="{rows/content/gen_form_1/fields/data_inicio/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/data_inicio/label"/>
                                      </span>
                                    </label>
                                    <div class="input-group">
                                      <input type="text" value="{rows/content/gen_form_1/fields/data_inicio/value}" class="form-control gen-date" id="gen_form_1-data_inicio" name="{rows/content/gen_form_1/fields/data_inicio/@name}" required="required" format="IGRP_datePicker" maxlength="15"/>
                                      <span class="input-group-btn gen-date-icon">
                                        <span class="btn btn-default">
                                          <i class="fa fa-calendar"/>
                                        </span>
                                      </span>
                                    </div>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/hora_inicio">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="hora_inicio" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/hora_inicio/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/hora_inicio/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_hora_inicio" name="{rows/content/gen_form_1/fields/hora_inicio/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/hora_inicio/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/hora_fim">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="hora_fim" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/hora_fim/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/hora_fim/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_hora_fim" name="{rows/content/gen_form_1/fields/hora_fim/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/hora_fim/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/estado">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/estado/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/estado/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_estado" name="{rows/content/gen_form_1/fields/estado/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/estado/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/separator3711">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separator3711/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/notificar">
                                  <div  class="form-group col-md-3  gen-fields-holder" item-name="notificar" item-type="link">
                                    <a href="{rows/content/gen_form_1/fields/notificar/value}" class="link  form-link" target="_blank">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/notificar/label"/>
                                      </span>
                                    </a>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/separatorcons_ext12">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separatorcons_ext12/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/necessita_consulta">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="necessita_consulta" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/necessita_consulta/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/necessita_consulta/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_necessita_consulta" name="{rows/content/gen_form_1/fields/necessita_consulta/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/necessita_consulta/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/separatordados13">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separatordados13/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/otra_info">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/otra_info/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/area_pd">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="area_pd" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/area_pd/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/area_pd/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_area_pd" name="{rows/content/gen_form_1/fields/area_pd/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/area_pd/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/edificio_historico">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="edificio_historico" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/edificio_historico/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/edificio_historico/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_edificio_historico" name="{rows/content/gen_form_1/fields/edificio_historico/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/edificio_historico/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/zona_imoveis">
                                  <div  class="col-md-3 form-group  gen-fields-holder" item-name="zona_imoveis" item-type="select">
                                    <label for="{rows/content/gen_form_1/fields/zona_imoveis/@name}">
                                      <xsl:value-of select="rows/content/gen_form_1/fields/zona_imoveis/label"/>
                                    </label>
                                    <select class="form-control select2 " id="gen_form_1_zona_imoveis" name="{rows/content/gen_form_1/fields/zona_imoveis/@name}" required="required">
                                      <xsl:for-each select="rows/content/gen_form_1/fields/zona_imoveis/list/option">
                                        <option value="{value}" label="{text}">
                                          <xsl:if test="@selected='true'">
                                            <xsl:attribute name="selected">selected
                                            </xsl:attribute>
                                          </xsl:if>
                                          <span>
                                            <xsl:value-of select="text"/>
                                          </span>
                                        </option>
                                      </xsl:for-each>
                                    </select>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/separatorcomp_output1">
                                  <div  class="box-head subtitle gen-fields-holder">
                                    <xsl:value-of select="rows/content/gen_form_1/fields/separatorcomp_output1/label"/>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/wfo_email">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="wfo_email" item-type="email">
                                    <label for="{rows/content/gen_form_1/fields/wfo_email/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/wfo_email/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/gen_form_1/fields/wfo_email/value}" class="form-control" id="{rows/content/gen_form_1/fields/wfo_email/@name}" name="{rows/content/gen_form_1/fields/wfo_email/@name}" maxlength="150">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/gen_form_1/fields/wfo_sms">
                                  <div  class="form-group col-md-3   gen-fields-holder" item-name="wfo_sms" item-type="text">
                                    <label for="{rows/content/gen_form_1/fields/wfo_sms/@name}">
                                      <span gen-lbl-setter="">
                                        <xsl:value-of select="rows/content/gen_form_1/fields/wfo_sms/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/gen_form_1/fields/wfo_sms/value}" class="form-control" id="{rows/content/gen_form_1/fields/wfo_sms/@name}" name="{rows/content/gen_form_1/fields/wfo_sms/@name}" maxlength="30">
                                    </input>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/gen_form_1/tools-bar" mode="form-buttons"/>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/legislacao">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/legislacao/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="legislacao" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/legislacao/fields/tipo_lei">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/legislacao/fields/tipo_lei/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/legislacao/fields/nome">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/legislacao/fields/nome/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/legislacao/fields/data">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/legislacao/fields/data/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/legislacao/fields/descricao">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/legislacao/fields/descricao/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/legislacao/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="tipo_lei">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/tipo_lei/label}" class="text">
                                          <xsl:value-of select="tipo_lei"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="nome">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/nome}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="nome != ''">
                                              <a href="{nome}" class="link bClick" target="_blank" name="nome">
                                                <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="data">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/data/label}" class="text">
                                          <xsl:value-of select="data"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="descricao">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/descricao/label}" class="text">
                                          <xsl:value-of select="descricao"/>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/detalhe_matriz">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/detalhe_matriz/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="detalhe_matriz" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/numero_matriz">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/numero_matriz/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/proprietario">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/proprietario/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/freguesia">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/freguesia/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/natureza">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/natureza/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/uso">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/uso/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/area">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/area/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/valor_patrimonial">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/valor_patrimonial/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/detalhe_matriz/fields/detalhes">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/detalhe_matriz/fields/detalhes/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/detalhe_matriz/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="numero_matriz">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/numero_matriz}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="numero_matriz != ''">
                                              <a href="{numero_matriz}" class="link bClick" target="_blank" name="numero_matriz">
                                                <xsl:value-of select="numero_matriz_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="numero_matriz_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="proprietario">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/proprietario/label}" class="text">
                                          <xsl:value-of select="proprietario"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="freguesia">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/freguesia/label}" class="text">
                                          <xsl:value-of select="freguesia"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="natureza">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/natureza/label}" class="text">
                                          <xsl:value-of select="natureza"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="uso">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/uso/label}" class="text">
                                          <xsl:value-of select="uso"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="area">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/area/label}" class="number">
                                          <xsl:value-of select="area"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="valor_patrimonial">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/valor_patrimonial/label}" class="number">
                                          <xsl:value-of select="valor_patrimonial"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="detalhes">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/detalhes}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="detalhes != ''">
                                              <a href="{detalhes}" class="link bClick" target="_blank" name="detalhes">
                                                <xsl:value-of select="detalhes_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="detalhes_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/sep_detalhe">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/sep_detalhe/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="sep_detalhe" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/sep_detalhe/fields/nip_matriz">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/nip_matriz/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/num_doc">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/num_doc/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/suj_ativo">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/suj_ativo/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/localidade">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/localidade/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/tp_area">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/tp_area/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/uso">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/uso/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/natureza">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/natureza/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/valor">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/valor/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/sep_detalhe/fields/detalhes">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/sep_detalhe/fields/detalhes/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/sep_detalhe/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="nip_matriz">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/nip_matriz/label}" class="text">
                                          <xsl:value-of select="nip_matriz"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="num_doc">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/num_doc/label}" class="text">
                                          <xsl:value-of select="num_doc"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="suj_ativo">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/suj_ativo/label}" class="text">
                                          <xsl:value-of select="suj_ativo"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="localidade">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/localidade/label}" class="text">
                                          <xsl:value-of select="localidade"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="tp_area">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/tp_area/label}" class="text">
                                          <xsl:value-of select="tp_area"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="uso">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/uso/label}" class="text">
                                          <xsl:value-of select="uso"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="natureza">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/natureza/label}" class="text">
                                          <xsl:value-of select="natureza"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="valor">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/valor/label}" class="text">
                                          <xsl:value-of select="valor"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="detalhes">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/detalhes}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="detalhes != ''">
                                              <a href="{detalhes}" class="link bClick" target="_blank" name="detalhes">
                                                <xsl:value-of select="detalhes_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="detalhes_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/lista_doc_anex">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/lista_doc_anex/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="lista_doc_anex" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/lista_doc_anex/fields/tipo_documento">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/lista_doc_anex/fields/tipo_documento/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/lista_doc_anex/fields/documento">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/lista_doc_anex/fields/documento/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/lista_doc_anex/fields/ver_doc">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/lista_doc_anex/fields/ver_doc/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/lista_doc_anex/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="tipo_documento">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/tipo_documento/label}" class="text">
                                          <xsl:value-of select="tipo_documento"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="documento">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/documento/label}" class="text">
                                          <xsl:value-of select="documento"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="ver_doc">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/ver_doc}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="ver_doc != ''">
                                              <a href="{ver_doc}" class="link bClick" target="_blank" name="ver_doc">
                                                <xsl:value-of select="ver_doc_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="ver_doc_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/lista_projecto">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/lista_projecto/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="lista_projecto" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/lista_projecto/fields/tipo_projecto">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/lista_projecto/fields/tipo_projecto/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/lista_projecto/fields/data_aprovacao_proj">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/lista_projecto/fields/data_aprovacao_proj/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/lista_projecto/fields/nm_resp_proj">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/lista_projecto/fields/nm_resp_proj/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/lista_projecto/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="tipo_projecto">
                                        <td  align="left" data-row="{position()}" data-title="{../../label/tipo_projecto}" class="link">
                                          <xsl:choose>
                                            <xsl:when test="tipo_projecto != ''">
                                              <a href="{tipo_projecto}" class="link bClick" target="_blank" name="tipo_projecto">
                                                <xsl:value-of select="tipo_projecto_desc" disable-output-escaping="yes"/>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="tipo_projecto_desc" disable-output-escaping="yes"/>
                                              </span>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="data_aprovacao_proj">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/data_aprovacao_proj/label}" class="date">
                                          <xsl:value-of select="data_aprovacao_proj"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="nm_resp_proj">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/nm_resp_proj/label}" class="text">
                                          <xsl:value-of select="nm_resp_proj"/>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/entidades">
                          <div  class="box gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/entidades/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body IGRP-separatorlist" tag="entidades" dialog="false">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                  <xsl:if  test="rows/content/entidades/fields/entidade">
                                    <div  class="form-group col-md-3   gen-fields-holder" item-name="entidade" item-type="text">
                                      <label for="{rows/content/entidades/fields/entidade/@name}">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/entidades/fields/entidade/label"/>
                                        </span>
                                      </label>
                                      <input type="text" value="{rows/content/entidades/fields/entidade/value}" class="form-control" id="{rows/content/entidades/fields/entidade/@name}" name="{rows/content/entidades/fields/entidade/@name}" maxlength="200">
                                      </input>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_entidades" id="entidades" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr gen-id="drop-zone" gen-field-template="th">
                                      <xsl:if  test="rows/content/entidades/fields/entidade">
                                        <xsl:if  test="//rows/content/entidades/fields/entidade/@table='true'">
                                          <th align="" item-name="entidade">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/entidades/fields/entidade/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <span class="table-row-add btn">
                                          <i class="fa fa-plus"/>
                                        </span>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/entidades/table/value/row">
                                      <tr gen-id="drop-zone" gen-field-template="td">
                                        <input type="hidden" class="sl-row-id" name="p_entidades_id" value="{entidades_id}"/>
                                        <xsl:if  test="entidade">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/entidades/fields/entidade/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/entidade/label}" class="text">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="entidade_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_entidade_fk" value="{entidade}"/>
                                                <input type="hidden" name="p_entidade_fk_desc" value="{entidade_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_entidade_fk" value="{entidade}"/>
                                              <input type="hidden" name="p_entidade_fk_desc" value="{entidade_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <span class="table-row-edit btn" rel="entidades">
                                            <i class="fa fa-pencil"/>
                                          </span>
                                          <span class="table-row-remove btn" rel="entidades">
                                            <i class="fa fa-times"/>
                                          </span>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/proximas_datas">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/proximas_datas/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="proximas_datas" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/proximas_datas/fields/data">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/proximas_datas/fields/data/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/proximas_datas/fields/hora">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/proximas_datas/fields/hora/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/proximas_datas/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="data">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/data/label}" class="date">
                                          <xsl:value-of select="data"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="hora">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/hora/label}" class="text">
                                          <xsl:value-of select="hora"/>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/anexar_documentos">
                          <div  class="box gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/anexar_documentos/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body IGRP-separatorlist" tag="anexar_documentos" dialog="false">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                  <xsl:if  test="rows/content/anexar_documentos/fields/wf_acti_doctype_fk">
                                    <div  class="col-md-3 form-group  gen-fields-holder" item-name="wf_acti_doctype_fk" item-type="select">
                                      <label for="{rows/content/anexar_documentos/fields/wf_acti_doctype_fk/@name}">
                                        <xsl:value-of select="rows/content/anexar_documentos/fields/wf_acti_doctype_fk/label"/>
                                      </label>
                                      <select class="form-control select2 " id="anexar_documentos_wf_acti_doctype_fk" name="{rows/content/anexar_documentos/fields/wf_acti_doctype_fk/@name}" required="required">
                                        <xsl:for-each select="rows/content/anexar_documentos/fields/wf_acti_doctype_fk/list/option">
                                          <option value="{value}" label="{text}">
                                            <xsl:if test="@selected='true'">
                                              <xsl:attribute name="selected">selected
                                              </xsl:attribute>
                                            </xsl:if>
                                            <span>
                                              <xsl:value-of select="text"/>
                                            </span>
                                          </option>
                                        </xsl:for-each>
                                      </select>
                                    </div>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/anexar_documentos/fields/wf_document">
                                    <div  class="form-group col-md-3  gen-fields-holder" item-name="wf_document" item-type="file">
                                      <label for="{rows/content/anexar_documentos/fields/wf_document/@name}">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/anexar_documentos/fields/wf_document/label"/>
                                        </span>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" class="form-control not-form" readonly=""/>
                                        <span class="input-group-btn">
                                          <span class="btn btn-default file-btn-holder">
                                            <i class="fa fa-upload"/>
                                            <input id="{rows/content/anexar_documentos/fields/wf_document/@name}" name="{rows/content/anexar_documentos/fields/wf_document/@name}" required="required" value="{rows/content/anexar_documentos/fields/wf_document/value}" class="transparent" type="file" multiple=""/>
                                          </span>
                                        </span>
                                      </div>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_anexar_documentos" id="anexar_documentos" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr gen-id="drop-zone" gen-field-template="th">
                                      <xsl:if  test="rows/content/anexar_documentos/fields/wf_acti_doctype_fk">
                                        <xsl:if  test="//rows/content/anexar_documentos/fields/wf_acti_doctype_fk/@table='true'">
                                          <th align="" item-name="wf_acti_doctype_fk">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/anexar_documentos/fields/wf_acti_doctype_fk/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/anexar_documentos/fields/wf_document">
                                        <xsl:if  test="//rows/content/anexar_documentos/fields/wf_document/@table='true'">
                                          <th align="" item-name="wf_document">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/anexar_documentos/fields/wf_document/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <span class="table-row-add btn">
                                          <i class="fa fa-plus"/>
                                        </span>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/anexar_documentos/table/value/row">
                                      <tr gen-id="drop-zone" gen-field-template="td">
                                        <input type="hidden" class="sl-row-id" name="p_anexar_documentos_id" value="{anexar_documentos_id}"/>
                                        <xsl:if  test="wf_acti_doctype_fk">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/anexar_documentos/fields/wf_acti_doctype_fk/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/wf_acti_doctype_fk/label}" class="select">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="wf_acti_doctype_fk_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_wf_acti_doctype_fk_fk" value="{wf_acti_doctype_fk}"/>
                                                <input type="hidden" name="p_wf_acti_doctype_fk_fk_desc" value="{wf_acti_doctype_fk_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_wf_acti_doctype_fk_fk" value="{wf_acti_doctype_fk}"/>
                                              <input type="hidden" name="p_wf_acti_doctype_fk_fk_desc" value="{wf_acti_doctype_fk_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="wf_document">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/anexar_documentos/fields/wf_document/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/wf_document/label}" class="file">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="wf_document_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_wf_document_fk" value="{wf_document}"/>
                                                <input type="hidden" name="p_wf_document_fk_desc" value="{wf_document_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_wf_document_fk" value="{wf_document}"/>
                                              <input type="hidden" name="p_wf_document_fk_desc" value="{wf_document_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <span class="table-row-edit btn" rel="anexar_documentos">
                                            <i class="fa fa-pencil"/>
                                          </span>
                                          <span class="table-row-remove btn" rel="anexar_documentos">
                                            <i class="fa fa-times"/>
                                          </span>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/lista_matriz">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/lista_matriz/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="lista_matriz" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th"/>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/lista_matriz/table/value/row">
                                    <tr gen-id="drop-zone">
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/wfo_other_notify">
                          <div  class="box gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/wfo_other_notify/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body IGRP-separatorlist" tag="wfo_other_notify" dialog="false">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                  <xsl:if  test="rows/content/wfo_other_notify/fields/wfo_template">
                                    <div  class="form-group col-md-3  gen-fields-holder" item-name="wfo_template" item-type="lookup">
                                      <label for="{rows/content/wfo_other_notify/fields/wfo_template/@name}">
                                        <xsl:value-of select="rows/content/wfo_other_notify/fields/wfo_template/label"/>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" value="{rows/content/wfo_other_notify/fields/wfo_template/value}" class="form-control gen-lookup" id="wfo_other_notify_wfo_template" name="{rows/content/wfo_other_notify/fields/wfo_template/@name}"/>
                                        <xsl:call-template name="lookup-tool">
                                          <xsl:with-param name="page" select="rows/page"/>
                                          <xsl:with-param name="ad_hoc" select="'1'"/>
                                          <xsl:with-param name="action" select="'LOOKUP'"/>
                                          <xsl:with-param name="name" select="rows/content/wfo_other_notify/fields/wfo_template/@name"/>
                                          <xsl:with-param name="js_lookup" select="rows/content/wfo_other_notify/fields/wfo_template/lookup"/>
                                          <xsl:with-param name="input-id" select="'wfo_other_notify_wfo_template'"/>
                                          <xsl:with-param name="btnClass" select="'default'"/>
                                        </xsl:call-template>
                                      </div>
                                    </div>
                                  </xsl:if>
                                  <xsl:if  test="rows/content/wfo_other_notify/fields/wfo_other_preview">
                                    <div  class="form-group col-md-3  gen-fields-holder" item-name="wfo_other_preview" item-type="link">
                                      <input type="link" label="{rows/content/wfo_other_notify/fields/wfo_other_preview/label}" name="{rows/content/wfo_other_notify/fields/wfo_other_preview/@name}" value="{rows/content/wfo_other_notify/fields/wfo_other_preview/value}" style="display:none;"/>
                                      <a href="{rows/content/wfo_other_notify/fields/wfo_other_preview/value}" class="link  form-link" target="_blank">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/wfo_other_notify/fields/wfo_other_preview/label"/>
                                        </span>
                                      </a>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_wfo_other_notify" id="wfo_other_notify" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr gen-id="drop-zone" gen-field-template="th">
                                      <xsl:if  test="rows/content/wfo_other_notify/fields/wfo_template">
                                        <xsl:if  test="//rows/content/wfo_other_notify/fields/wfo_template/@table='true'">
                                          <th align="" item-name="wfo_template">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/wfo_other_notify/fields/wfo_template/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if  test="rows/content/wfo_other_notify/fields/wfo_other_preview">
                                        <xsl:if  test="//rows/content/wfo_other_notify/fields/wfo_other_preview/@table='true'">
                                          <th align="" item-name="wfo_other_preview">
                                            <span gen-lbl-setter="">
                                              <xsl:value-of select="rows/content/wfo_other_notify/fields/wfo_other_preview/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <span class="table-row-add btn">
                                          <i class="fa fa-plus"/>
                                        </span>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/wfo_other_notify/table/value/row">
                                      <tr gen-id="drop-zone" gen-field-template="td">
                                        <input type="hidden" class="sl-row-id" name="p_wfo_other_notify_id" value="{wfo_other_notify_id}"/>
                                        <xsl:if  test="wfo_template">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/wfo_other_notify/fields/wfo_template/@table='true'">
                                              <td data-row="{position()}" data-title="{../../../fields/wfo_template/label}" class="lookup">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="wfo_template_desc" disable-output-escaping="yes"/>
                                                </span>
                                                <input type="hidden" name="p_wfo_template_fk" value="{wfo_template}"/>
                                                <input type="hidden" name="p_wfo_template_fk_desc" value="{wfo_template_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_wfo_template_fk" value="{wfo_template}"/>
                                              <input type="hidden" name="p_wfo_template_fk_desc" value="{wfo_template_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if  test="wfo_other_preview">
                                          <xsl:choose >
                                            <xsl:when test="//rows/content/wfo_other_notify/fields/wfo_other_preview/@table='true'">
                                              <td data-row="{position()}" data-title="{../../fields/wfo_other_preview/label}" class="link">
                                                <xsl:choose>
                                                  <xsl:when test="wfo_other_preview != ''">
                                                    <a href="{wfo_other_preview}" class="link bClick" target="_blank" name="wfo_other_preview">
                                                      <xsl:value-of select="wfo_other_preview_desc" disable-output-escaping="yes"/>
                                                    </a>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                    <xsl:value-of select="wfo_other_preview_desc" disable-output-escaping="yes"/>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                                <input type="hidden" name="p_wfo_other_preview_fk" value="{wfo_other_preview}"/>
                                                <input type="hidden" name="p_wfo_other_preview_fk_desc" value="{wfo_other_preview_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_wfo_other_preview_fk" value="{wfo_other_preview}"/>
                                              <input type="hidden" name="p_wfo_other_preview_fk_desc" value="{wfo_other_preview_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <span class="table-row-edit btn" rel="wfo_other_notify">
                                            <i class="fa fa-pencil"/>
                                          </span>
                                          <span class="table-row-remove btn" rel="wfo_other_notify">
                                            <i class="fa fa-times"/>
                                          </span>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/wfo_notifications">
                          <div  class="box box-table-contents gen-container-item">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/wfo_notifications/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <table id="wfo_notifications" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/wfo_notifications/fields/wfo_notification">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/wfo_notifications/fields/wfo_notification/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/wfo_notifications/fields/wfo_preview">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/wfo_notifications/fields/wfo_preview/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/wfo_notifications/fields/wfo_status">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/wfo_notifications/fields/wfo_status/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/wfo_notifications/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="wfo_notification">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/wfo_notification/label}" class="text">
                                          <xsl:value-of select="wfo_notification"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="wfo_preview">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/wfo_preview/label}" class="text">
                                          <xsl:value-of select="wfo_preview"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="wfo_status">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/wfo_status/label}" class="text">
                                          <xsl:value-of select="wfo_status"/>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/gen_table">
                          <div  class="box box-table-contents gen-container-item">
                            <div class="box-body table-box">
                              <table id="gen_table" class="table table-striped gen-data-table ">
                                <thead>
                                  <tr gen-id="drop-zone" gen-field-template="th">
                                    <xsl:if  test="rows/content/gen_table/fields/title">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/title/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/gen_table/fields/type">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/type/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if  test="rows/content/gen_table/fields/link">
                                      <th  align="left" class=" gen-fields-holder">
                                        <span gen-lbl-setter="">
                                          <xsl:value-of select="rows/content/gen_table/fields/link/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/gen_table/table/value/row">
                                    <tr gen-id="drop-zone">
                                      <xsl:if  test="title">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/title/label}" class="text">
                                          <xsl:value-of select="title"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="type">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/type/label}" class="text">
                                          <xsl:value-of select="type"/>
                                        </td>
                                      </xsl:if>
                                      <xsl:if  test="link">
                                        <td  align="left" data-row="{position()}" data-title="{../../fields/link/label}" class="text">
                                          <xsl:value-of select="link"/>
                                        </td>
                                      </xsl:if>
                                    </tr>
                                  </xsl:for-each>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <xsl:call-template name="IGRP-bottom"/>
        <!-- TOOLSBAR JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/toolsbar/includes/toolsbar.js">
        </script>
        <!-- FORM JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
        </script>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js">
        </script>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js">
        </script>
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.full.min.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/select/includes/select2.init.js">
        </script>
        <!-- LOOKUP JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/lookup/includes/igrp.lookup.js">
        </script>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/datetimepicker.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/js/dtp.init.js">
        </script>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1460460584048"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1460460584048"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1460460584048"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1460460584048"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1460460584048"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1460460584048"/>
</xsl:stylesheet>
