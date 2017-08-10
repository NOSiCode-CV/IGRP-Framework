<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <!-- TOOLSBAR CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
        <!-- TABLE CSS INCLUDES -->
        <!-- FORM CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
        <style/>
      </head>
      <body class="{$bodyClass} sidebar-off">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row" id="row-345704f8">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                        <xsl:if test="rows/content/box_1">
                          <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                            <div class="box-body" gen-preserve-content="true">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_1/fields"/>
                              <div>
                                <div class="row" id="row-0690852c">
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/page_title">
                                        <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                          <h2>
                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                          </h2>
                                        </section>
                                      </xsl:if>
                                    </div>
                                  </div>
                                  <div class="gen-column col-sm-6">
                                    <div class="gen-inner">
                                      <xsl:if test="rows/content/toolsbar_1">
                                        <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                          <div class="btns-holder   pull-right" role="group">
                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                              <xsl:with-param name="vertical" select="'true'"/>
                                              <xsl:with-param name="outline" select="'false'"/>
                                            </xsl:apply-templates>
                                          </div>
                                        </div>
                                      </xsl:if>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/separatorlist_2">
                          <div class="box gen-container-item " gen-class="" item-name="separatorlist_2">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/separatorlist_2/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body IGRP-separatorlist" tag="separatorlist_2" dialog="false">
                              <div class="splist-form-holder">
                                <div class="splist-form" role="form">
                                  <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_2/fields"/>
                                  <xsl:if test="rows/content/separatorlist_2/fields/entidade">
                                    <div class="col-sm-2 form-group  gen-fields-holder" item-name="entidade" item-type="select" required="required">
                                      <label for="{rows/content/separatorlist_2/fields/entidade/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_2/fields/entidade/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_2_entidade" name="{rows/content/separatorlist_2/fields/entidade/@name}" required="required">
                                        <xsl:for-each select="rows/content/separatorlist_2/fields/entidade/list/option">
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
                                  <xsl:if test="rows/content/separatorlist_2/fields/servico">
                                    <div class="col-sm-2 form-group  gen-fields-holder" item-name="servico" item-type="select" required="required">
                                      <label for="{rows/content/separatorlist_2/fields/servico/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_2/fields/servico/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_2_servico" name="{rows/content/separatorlist_2/fields/servico/@name}" required="required">
                                        <xsl:for-each select="rows/content/separatorlist_2/fields/servico/list/option">
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
                                  <xsl:if test="rows/content/separatorlist_2/fields/balcao">
                                    <div class="col-sm-2 form-group  gen-fields-holder" item-name="balcao" item-type="select" required="required">
                                      <label for="{rows/content/separatorlist_2/fields/balcao/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_2/fields/balcao/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_2_balcao" name="{rows/content/separatorlist_2/fields/balcao/@name}" required="required">
                                        <xsl:for-each select="rows/content/separatorlist_2/fields/balcao/list/option">
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
                                  <xsl:if test="rows/content/separatorlist_2/fields/data">
                                    <div class="form-group col-sm-2  gen-fields-holder" item-name="data" item-type="date" required="required">
                                      <label for="{rows/content/separatorlist_2/fields/data/@name}">
                                        <span>
                                          <xsl:value-of select="rows/content/separatorlist_2/fields/data/label"/>
                                        </span>
                                      </label>
                                      <div class="input-group">
                                        <input type="text" value="{rows/content/separatorlist_2/fields/data/value}" class="form-control gen-date " id="separatorlist_2-data" name="{rows/content/separatorlist_2/fields/data/@name}" required="required" format="IGRP_datePicker" maxlength="30"/>
                                        <span class="input-group-btn gen-date-icon">
                                          <span class="btn btn-primary">
                                            <i class="fa fa-calendar"/>
                                          </span>
                                        </span>
                                      </div>
                                    </div>
                                  </xsl:if>
                                  <xsl:if test="rows/content/separatorlist_2/fields/hora">
                                    <div class="col-sm-2 form-group  gen-fields-holder" item-name="hora" item-type="select" required="required">
                                      <label for="{rows/content/separatorlist_2/fields/hora/@name}">
                                        <xsl:value-of select="rows/content/separatorlist_2/fields/hora/label"/>
                                      </label>
                                      <select class="form-control select2 " id="separatorlist_2_hora" name="{rows/content/separatorlist_2/fields/hora/@name}" required="required" multiple="multiple">
                                        <xsl:for-each select="rows/content/separatorlist_2/fields/hora/list/option">
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
                                  <xsl:if test="rows/content/separatorlist_2/fields/nome">
                                    <div class="form-group col-sm-2   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                      <label for="{rows/content/separatorlist_2/fields/nome/@name}">
                                        <span>
                                          <xsl:value-of select="rows/content/separatorlist_2/fields/nome/label"/>
                                        </span>
                                      </label>
                                      <input type="text" value="{rows/content/separatorlist_2/fields/nome/value}" class="form-control " id="{rows/content/separatorlist_2/fields/nome/@name}" name="{rows/content/separatorlist_2/fields/nome/@name}" required="required" maxlength="6" placeholder="">
                                      </input>
                                    </div>
                                  </xsl:if>
                                </div>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_separatorlist_2" id="separatorlist_2" class="table table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/separatorlist_2/fields/entidade">
                                        <xsl:if test="not(entidade/@visible)">
                                          <th align="" item-name="entidade">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/entidade/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_2/fields/servico">
                                        <xsl:if test="not(servico/@visible)">
                                          <th align="" item-name="servico">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/servico/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_2/fields/balcao">
                                        <xsl:if test="not(balcao/@visible)">
                                          <th align="" item-name="balcao">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/balcao/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_2/fields/data">
                                        <xsl:if test="not(data/@visible)">
                                          <th align="" item-name="data">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/data/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_2/fields/hora">
                                        <xsl:if test="not(hora/@visible)">
                                          <th align="" item-name="hora">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/hora/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_2/fields/nome">
                                        <xsl:if test="not(nome/@visible)">
                                          <th align="" item-name="nome">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_2/fields/nome/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                                          <i class="fa fa-plus"/>
                                        </a>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/separatorlist_2/table/value/row">
                                      <tr>
                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_2_id" value="{separatorlist_2_id}"/>
                                        <xsl:if test="entidade">
                                          <xsl:choose>
                                            <xsl:when test="not(entidade/@visible)">
                                              <td field="entidade" data-row="{position()}" data-title="{../../../fields/entidade/label}" class="select" item-name="entidade">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="entidade_desc"/>
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
                                        <xsl:if test="servico">
                                          <xsl:choose>
                                            <xsl:when test="not(servico/@visible)">
                                              <td field="servico" data-row="{position()}" data-title="{../../../fields/servico/label}" class="select" item-name="servico">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="servico_desc"/>
                                                </span>
                                                <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                                <input type="hidden" name="p_servico_fk_desc" value="{servico_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_servico_fk" value="{servico}"/>
                                              <input type="hidden" name="p_servico_fk_desc" value="{servico_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="balcao">
                                          <xsl:choose>
                                            <xsl:when test="not(balcao/@visible)">
                                              <td field="balcao" data-row="{position()}" data-title="{../../../fields/balcao/label}" class="select" item-name="balcao">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="balcao_desc"/>
                                                </span>
                                                <input type="hidden" name="p_balcao_fk" value="{balcao}"/>
                                                <input type="hidden" name="p_balcao_fk_desc" value="{balcao_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_balcao_fk" value="{balcao}"/>
                                              <input type="hidden" name="p_balcao_fk_desc" value="{balcao_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="data">
                                          <xsl:choose>
                                            <xsl:when test="not(data/@visible)">
                                              <td field="data" data-row="{position()}" data-title="{../../../fields/data/label}" class="date" item-name="data">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="data_desc"/>
                                                </span>
                                                <input type="hidden" name="p_data_fk" value="{data}"/>
                                                <input type="hidden" name="p_data_fk_desc" value="{data_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_data_fk" value="{data}"/>
                                              <input type="hidden" name="p_data_fk_desc" value="{data_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="hora">
                                          <xsl:choose>
                                            <xsl:when test="not(hora/@visible)">
                                              <td field="hora" data-row="{position()}" data-title="{../../../fields/hora/label}" class="select" item-name="hora">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="hora_desc"/>
                                                </span>
                                                <input type="hidden" name="p_hora_fk" value="{hora}"/>
                                                <input type="hidden" name="p_hora_fk_desc" value="{hora_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_hora_fk" value="{hora}"/>
                                              <input type="hidden" name="p_hora_fk_desc" value="{hora_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="nome">
                                          <xsl:choose>
                                            <xsl:when test="not(nome/@visible)">
                                              <td field="nome" data-row="{position()}" data-title="{../../../fields/nome/label}" class="text" item-name="nome">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="nome_desc"/>
                                                </span>
                                                <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                                <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                              <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(@noupdate)">
                                            <span class="table-row-edit btn btn-default " rel="separatorlist_2">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(@nodelete)">
                                            <span class="table-row-remove btn btn-danger" rel="separatorlist_2">
                                              <i class="fa fa-times"/>
                                            </span>
                                          </xsl:if>
                                        </td>
                                      </tr>
                                    </xsl:for-each>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/table_1">
                          <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                              <table id="table_1" class="table table-striped gen-data-table " exports="null">
                                <thead>
                                  <tr>
                                    <xsl:if test="rows/content/table_1/fields/tipo_requisito">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/tipo_requisito/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/descritivo">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/descritivo/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                    <xsl:if test="rows/content/table_1/fields/formulario">
                                      <th align="left" class=" gen-fields-holder">
                                        <span>
                                          <xsl:value-of select="rows/content/table_1/fields/formulario/label"/>
                                        </span>
                                      </th>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                    <tr>
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <xsl:if test="tipo_requisito">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/tipo_requisito/label}" class="text" item-name="tipo_requisito">
                                          <span class="">
                                            <xsl:value-of select="tipo_requisito"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="descritivo">
                                        <td align="left" data-row="{position()}" data-title="{../../fields/descritivo/label}" class="text" item-name="descritivo">
                                          <span class="">
                                            <xsl:value-of select="descritivo"/>
                                          </span>
                                        </td>
                                      </xsl:if>
                                      <xsl:if test="formulario">
                                        <td align="left" data-row="{position()}" data-title="{../../label/formulario}" class="link" item-name="formulario">
                                          <xsl:choose>
                                            <xsl:when test="formulario != ''">
                                              <a href="{formulario}" class="link bClick btn btn-link [object Object]" target-fields="" target="_self" name="formulario">
                                                <i class="fa fa-link"/>
                                                <span>
                                                  <xsl:value-of select="formulario_desc"/>
                                                </span>
                                              </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <span>
                                                <xsl:value-of select="formulario_desc"/>
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
                        <xsl:if test="rows/content/form_1">
                          <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                            <xsl:call-template name="box-header">
                              <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                              <xsl:with-param name="collapsible" select="'true'"/>
                            </xsl:call-template>
                            <div class="box-body">
                              <div role="form">
                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                <xsl:if test="rows/content/form_1/fields/nome2">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="nome2" item-type="text" required="required">
                                    <label for="{rows/content/form_1/fields/nome2/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/nome2/label"/>
                                      </span>
                                    </label>
                                    <input type="text" value="{rows/content/form_1/fields/nome2/value}" class="form-control " id="{rows/content/form_1/fields/nome2/@name}" name="{rows/content/form_1/fields/nome2/@name}" required="required" maxlength="100" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/tipo_documento_de_identificacao">
                                  <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_documento_de_identificacao" item-type="select" required="required">
                                    <label for="{rows/content/form_1/fields/tipo_documento_de_identificacao/@name}">
                                      <xsl:value-of select="rows/content/form_1/fields/tipo_documento_de_identificacao/label"/>
                                    </label>
                                    <select class="form-control select2 " id="form_1_tipo_documento_de_identificacao" name="{rows/content/form_1/fields/tipo_documento_de_identificacao/@name}" required="required">
                                      <xsl:for-each select="rows/content/form_1/fields/tipo_documento_de_identificacao/list/option">
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
                                <xsl:if test="rows/content/form_1/fields/documento_de_identificacao">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="documento_de_identificacao" item-type="number" required="required">
                                    <label for="{rows/content/form_1/fields/documento_de_identificacao/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/documento_de_identificacao/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/form_1/fields/documento_de_identificacao/value}" class="form-control " id="{rows/content/form_1/fields/documento_de_identificacao/@name}" name="{rows/content/form_1/fields/documento_de_identificacao/@name}" required="required" min="" max="" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/email">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="email" item-type="email">
                                    <label for="{rows/content/form_1/fields/email/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                      </span>
                                    </label>
                                    <input type="email" value="{rows/content/form_1/fields/email/value}" class="form-control " id="{rows/content/form_1/fields/email/@name}" name="{rows/content/form_1/fields/email/@name}" maxlength="100" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/telemovel">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="telemovel" item-type="number">
                                    <label for="{rows/content/form_1/fields/telemovel/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/telemovel/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/form_1/fields/telemovel/value}" class="form-control " id="{rows/content/form_1/fields/telemovel/@name}" name="{rows/content/form_1/fields/telemovel/@name}" min="" max="" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                                <xsl:if test="rows/content/form_1/fields/telefone">
                                  <div class="form-group col-sm-3   gen-fields-holder" item-name="telefone" item-type="number">
                                    <label for="{rows/content/form_1/fields/telefone/@name}">
                                      <span>
                                        <xsl:value-of select="rows/content/form_1/fields/telefone/label"/>
                                      </span>
                                    </label>
                                    <input type="number" value="{rows/content/form_1/fields/telefone/value}" class="form-control " id="{rows/content/form_1/fields/telefone/@name}" name="{rows/content/form_1/fields/telefone/@name}" min="" max="" maxlength="30" placeholder="">
                                    </input>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
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
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <!-- TABLE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js"/>
        <!-- FORM JS INCLUDES -->
        <!-- SELECT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
        <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
        <!-- DATE JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1502293981799"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1502293981799"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1502293981799"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1502293981799"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1502293981799"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1502293981799"/>
</xsl:stylesheet>
