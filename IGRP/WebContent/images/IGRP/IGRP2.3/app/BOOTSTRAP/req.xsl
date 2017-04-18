<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <!-- TABCONTENT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.css"/>
        <!-- VIEW CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/view/includes/igrp.view.css"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <!-- SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/select/includes/select2/select2.style.css"/>
        <!-- DATE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/date/includes/dateTimePicker/css/datetimepicker.css"/>
      </head>
      <body class="{$bodyClass}">
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <div class="row">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if  test="rows/content/sectionheader_1">
                          <section  class="content-header gen-container-item">
                            <h1>
                              <xsl:value-of select="rows/content/sectionheader_1/fields/text/value"/>
                            </h1>
                          </section>
                        </xsl:if>
                        <xsl:if  test="rows/content/view_1">
                          <div  class="box clearfix view-block gen-container-item" has-img="false">
                            <div class="box-body">
                              <xsl:if test="rows/content/view_1/fields/view_img">
                                <img src="{rows/content/view_1/fields/view_img}"/>
                              </xsl:if>
                              <div class="view-body clearfix " gen-id="drop-zone">
                                <xsl:if  test="rows/content/view_1/fields/n_pedido">
                                  <div  class="view-item gen-fields-holder">
                                    <span class="view-label">
                                      <xsl:value-of select="rows/content/view_1/fields/n_pedido/label"/>
                                    </span>
                                    <span class="view-value">
                                      <xsl:value-of select="rows/content/view_1/fields/n_pedido/value"/>
                                    </span>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/view_1/fields/atopedido">
                                  <div  class="view-item gen-fields-holder">
                                    <span class="view-label">
                                      <xsl:value-of select="rows/content/view_1/fields/atopedido/label"/>
                                    </span>
                                    <span class="view-value">
                                      <xsl:value-of select="rows/content/view_1/fields/atopedido/value"/>
                                    </span>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/view_1/fields/pedido_efetuado_por">
                                  <div  class="view-item gen-fields-holder">
                                    <span class="view-label">
                                      <xsl:value-of select="rows/content/view_1/fields/pedido_efetuado_por/label"/>
                                    </span>
                                    <span class="view-value">
                                      <xsl:value-of select="rows/content/view_1/fields/pedido_efetuado_por/value"/>
                                    </span>
                                  </div>
                                </xsl:if>
                                <xsl:if  test="rows/content/view_1/fields/etapa_executada_por">
                                  <div  class="view-item gen-fields-holder">
                                    <span class="view-label">
                                      <xsl:value-of select="rows/content/view_1/fields/etapa_executada_por/label"/>
                                    </span>
                                    <span class="view-value">
                                      <xsl:value-of select="rows/content/view_1/fields/etapa_executada_por/value"/>
                                    </span>
                                  </div>
                                </xsl:if>
                              </div>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if  test="rows/content/tabcontent_1">
                          <div  class="gen-tab-holder nav-tabs-custom gen-container-item" tab-template="default">
                            <ul class="nav nav-tabs">
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='requerentes']">
                                <li class="active gen-fields-holder" rel="tab-1460997551487">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-1460997551487">
                                    <i class="fa fa-users"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='requerentes']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='predios']">
                                <li class=" gen-fields-holder" rel="tab-1460997551513">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-1460997551513">
                                    <i class="fa fa-building"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='predios']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='anexos']">
                                <li class=" gen-fields-holder" rel="tab-1460997551530">
                                  <a data-toggle="tab" aria-expanded="true" href="#tab-1460997551530">
                                    <i class="fa fa-upload"/>
                                    <span gen-lbl-setter="true">
                                      <xsl:value-of select="rows/content/tabcontent_1/item[@name='anexos']/title"/>
                                    </span>
                                  </a>
                                </li>
                              </xsl:if>
                            </ul>
                            <div class="tab-content">
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='requerentes']">
                                <div class="tab-pane gen-rows-holder active" id="tab-1460997551487" rel="tab-1460997551487">
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/separatorlist_1">
                                          <div class="box gen-container-item">
                                            <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                              <div class="splist-form-holder">
                                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                                  <xsl:if test="rows/content/separatorlist_1/fields/tipo_de_documento">
                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_de_documento" item-type="select">
                                                      <label for="{rows/content/separatorlist_1/fields/tipo_de_documento/@name}">
                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_de_documento/label"/>
                                                      </label>
                                                      <select class="form-control select2 " id="separatorlist_1_tipo_de_documento" name="{rows/content/separatorlist_1/fields/tipo_de_documento/@name}" required="required">
                                                        <xsl:for-each select="rows/content/separatorlist_1/fields/tipo_de_documento/list/option">
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
                                                  <xsl:if test="rows/content/separatorlist_1/fields/n_documento">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="n_documento" item-type="text">
                                                      <label for="{rows/content/separatorlist_1/fields/n_documento/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/n_documento/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_1/fields/n_documento/value}" class="form-control" id="{rows/content/separatorlist_1/fields/n_documento/@name}" name="{rows/content/separatorlist_1/fields/n_documento/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/nif">
                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="nif" item-type="lookup">
                                                      <label for="{rows/content/separatorlist_1/fields/nif/@name}">
                                                        <xsl:value-of select="rows/content/separatorlist_1/fields/nif/label"/>
                                                      </label>
                                                      <div class="input-group">
                                                        <input type="text" value="{rows/content/separatorlist_1/fields/nif/value}" class="form-control gen-lookup" id="separatorlist_1_nif" name="{rows/content/separatorlist_1/fields/nif/@name}"/>
                                                        <xsl:call-template name="lookup-tool">
                                                          <xsl:with-param name="page" select="rows/page"/>
                                                          <xsl:with-param name="ad_hoc" select="'1'"/>
                                                          <xsl:with-param name="action" select="'LOOKUP'"/>
                                                          <xsl:with-param name="name" select="rows/content/separatorlist_1/fields/nif/@name"/>
                                                          <xsl:with-param name="js_lookup" select="rows/content/separatorlist_1/fields/nif/lookup"/>
                                                          <xsl:with-param name="input-id" select="'separatorlist_1_nif'"/>
                                                          <xsl:with-param name="btnClass" select="'default'"/>
                                                        </xsl:call-template>
                                                      </div>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/nome">
                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nome" item-type="text">
                                                      <label for="{rows/content/separatorlist_1/fields/nome/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/nome/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_1/fields/nome/value}" class="form-control" id="{rows/content/separatorlist_1/fields/nome/@name}" name="{rows/content/separatorlist_1/fields/nome/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/data_emissao">
                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_emissao" item-type="date">
                                                      <label for="{rows/content/separatorlist_1/fields/data_emissao/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/data_emissao/label"/>
                                                        </span>
                                                      </label>
                                                      <div class="input-group">
                                                        <input type="text" value="{rows/content/separatorlist_1/fields/data_emissao/value}" class="form-control gen-date" id="separatorlist_1-data_emissao" name="{rows/content/separatorlist_1/fields/data_emissao/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                        <span class="input-group-btn gen-date-icon">
                                                          <span class="btn btn-default">
                                                            <i class="fa fa-calendar"/>
                                                          </span>
                                                        </span>
                                                      </div>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/entidade">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="entidade" item-type="text">
                                                      <label for="{rows/content/separatorlist_1/fields/entidade/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/entidade/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_1/fields/entidade/value}" class="form-control" id="{rows/content/separatorlist_1/fields/entidade/@name}" name="{rows/content/separatorlist_1/fields/entidade/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/telefone">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="telefone" item-type="number">
                                                      <label for="{rows/content/separatorlist_1/fields/telefone/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/telefone/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="number" value="{rows/content/separatorlist_1/fields/telefone/value}" class="form-control" id="{rows/content/separatorlist_1/fields/telefone/@name}" name="{rows/content/separatorlist_1/fields/telefone/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/telemovel">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="telemovel" item-type="number">
                                                      <label for="{rows/content/separatorlist_1/fields/telemovel/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/telemovel/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="number" value="{rows/content/separatorlist_1/fields/telemovel/value}" class="form-control" id="{rows/content/separatorlist_1/fields/telemovel/@name}" name="{rows/content/separatorlist_1/fields/telemovel/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="email_1" item-type="email">
                                                      <label for="{rows/content/separatorlist_1/fields/email_1/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="email" value="{rows/content/separatorlist_1/fields/email_1/value}" class="form-control" id="{rows/content/separatorlist_1/fields/email_1/@name}" name="{rows/content/separatorlist_1/fields/email_1/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_1/fields/residencia">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="residencia" item-type="text">
                                                      <label for="{rows/content/separatorlist_1/fields/residencia/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_1/fields/residencia/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_1/fields/residencia/value}" class="form-control" id="{rows/content/separatorlist_1/fields/residencia/@name}" name="{rows/content/separatorlist_1/fields/residencia/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                </div>
                                              </div>
                                              <div class="table-box box-body box-table-contents splist-table">
                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                  <thead>
                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                      <xsl:if test="rows/content/separatorlist_1/fields/tipo_de_documento">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/tipo_de_documento/@table='true'">
                                                          <th align="" item-name="tipo_de_documento">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/tipo_de_documento/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/n_documento">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/n_documento/@table='true'">
                                                          <th align="" item-name="n_documento">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/n_documento/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/nif">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/nif/@table='true'">
                                                          <th align="" item-name="nif">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/nif/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/nome">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/nome/@table='true'">
                                                          <th align="" item-name="nome">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/nome/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/data_emissao">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/data_emissao/@table='true'">
                                                          <th align="" item-name="data_emissao">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/data_emissao/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/entidade">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/entidade/@table='true'">
                                                          <th align="" item-name="entidade">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/entidade/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/telefone">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/telefone/@table='true'">
                                                          <th align="" item-name="telefone">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/telefone/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/telemovel">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/telemovel/@table='true'">
                                                          <th align="" item-name="telemovel">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/telemovel/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/email_1">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                          <th align="" item-name="email_1">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/email_1/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_1/fields/residencia">
                                                        <xsl:if test="//rows/content/separatorlist_1/fields/residencia/@table='true'">
                                                          <th align="" item-name="residencia">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_1/fields/residencia/label"/>
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
                                                    <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                      <tr gen-id="drop-zone" gen-field-template="td">
                                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                        <xsl:if test="tipo_de_documento">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/tipo_de_documento/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/tipo_de_documento/label}" class="select">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="tipo_de_documento_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_tipo_de_documento_fk" value="{tipo_de_documento}"/>
                                                                <input type="hidden" name="p_tipo_de_documento_fk_desc" value="{tipo_de_documento_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_tipo_de_documento_fk" value="{tipo_de_documento}"/>
                                                              <input type="hidden" name="p_tipo_de_documento_fk_desc" value="{tipo_de_documento_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="n_documento">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/n_documento/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/n_documento/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="n_documento_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_n_documento_fk" value="{n_documento}"/>
                                                                <input type="hidden" name="p_n_documento_fk_desc" value="{n_documento_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_n_documento_fk" value="{n_documento}"/>
                                                              <input type="hidden" name="p_n_documento_fk_desc" value="{n_documento_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="nif">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/nif/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/nif/label}" class="lookup">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="nif_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_nif_fk" value="{nif}"/>
                                                                <input type="hidden" name="p_nif_fk_desc" value="{nif_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_nif_fk" value="{nif}"/>
                                                              <input type="hidden" name="p_nif_fk_desc" value="{nif_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="nome">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/nome/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/nome/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="nome_desc" disable-output-escaping="yes"/>
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
                                                        <xsl:if test="data_emissao">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/data_emissao/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/data_emissao/label}" class="date">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="data_emissao_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_data_emissao_fk" value="{data_emissao}"/>
                                                                <input type="hidden" name="p_data_emissao_fk_desc" value="{data_emissao_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_data_emissao_fk" value="{data_emissao}"/>
                                                              <input type="hidden" name="p_data_emissao_fk_desc" value="{data_emissao_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="entidade">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/entidade/@table='true'">
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
                                                        <xsl:if test="telefone">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/telefone/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/telefone/label}" class="number">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="telefone_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_telefone_fk" value="{telefone}"/>
                                                                <input type="hidden" name="p_telefone_fk_desc" value="{telefone_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_telefone_fk" value="{telefone}"/>
                                                              <input type="hidden" name="p_telefone_fk_desc" value="{telefone_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="telemovel">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/telemovel/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/telemovel/label}" class="number">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="telemovel_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_telemovel_fk" value="{telemovel}"/>
                                                                <input type="hidden" name="p_telemovel_fk_desc" value="{telemovel_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_telemovel_fk" value="{telemovel}"/>
                                                              <input type="hidden" name="p_telemovel_fk_desc" value="{telemovel_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="email_1">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/email_1/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/email_1/label}" class="email">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="email_1_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_email_1_fk" value="{email_1}"/>
                                                                <input type="hidden" name="p_email_1_fk_desc" value="{email_1_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_email_1_fk" value="{email_1}"/>
                                                              <input type="hidden" name="p_email_1_fk_desc" value="{email_1_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="residencia">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_1/fields/residencia/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/residencia/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="residencia_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_residencia_fk" value="{residencia}"/>
                                                                <input type="hidden" name="p_residencia_fk_desc" value="{residencia_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_residencia_fk" value="{residencia}"/>
                                                              <input type="hidden" name="p_residencia_fk_desc" value="{residencia_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <td data-row="{position()}" class="table-btn">
                                                          <span class="table-row-edit btn" rel="separatorlist_1">
                                                            <i class="fa fa-pencil"/>
                                                          </span>
                                                          <span class="table-row-remove btn" rel="separatorlist_1">
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
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='predios']">
                                <div class="tab-pane gen-rows-holder " id="tab-1460997551513" rel="tab-1460997551513">
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/separatorlist_2">
                                          <div class="box gen-container-item">
                                            <div class="box-body IGRP-separatorlist" tag="separatorlist_2" dialog="false">
                                              <div class="splist-form-holder">
                                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                                  <xsl:if test="rows/content/separatorlist_2/fields/tipo_predio">
                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_predio" item-type="select">
                                                      <label for="{rows/content/separatorlist_2/fields/tipo_predio/@name}">
                                                        <xsl:value-of select="rows/content/separatorlist_2/fields/tipo_predio/label"/>
                                                      </label>
                                                      <select class="form-control select2 " id="separatorlist_2_tipo_predio" name="{rows/content/separatorlist_2/fields/tipo_predio/@name}" required="required">
                                                        <xsl:for-each select="rows/content/separatorlist_2/fields/tipo_predio/list/option">
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
                                                  <xsl:if test="rows/content/separatorlist_2/fields/nip">
                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="nip" item-type="lookup">
                                                      <label for="{rows/content/separatorlist_2/fields/nip/@name}">
                                                        <xsl:value-of select="rows/content/separatorlist_2/fields/nip/label"/>
                                                      </label>
                                                      <div class="input-group">
                                                        <input type="text" value="{rows/content/separatorlist_2/fields/nip/value}" class="form-control gen-lookup" id="separatorlist_2_nip" name="{rows/content/separatorlist_2/fields/nip/@name}"/>
                                                        <xsl:call-template name="lookup-tool">
                                                          <xsl:with-param name="page" select="rows/page"/>
                                                          <xsl:with-param name="ad_hoc" select="'1'"/>
                                                          <xsl:with-param name="action" select="'LOOKUP'"/>
                                                          <xsl:with-param name="name" select="rows/content/separatorlist_2/fields/nip/@name"/>
                                                          <xsl:with-param name="js_lookup" select="rows/content/separatorlist_2/fields/nip/lookup"/>
                                                          <xsl:with-param name="input-id" select="'separatorlist_2_nip'"/>
                                                          <xsl:with-param name="btnClass" select="'default'"/>
                                                        </xsl:call-template>
                                                      </div>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_2/fields/tipo">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="tipo" item-type="text">
                                                      <label for="{rows/content/separatorlist_2/fields/tipo/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_2/fields/tipo/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_2/fields/tipo/value}" class="form-control" id="{rows/content/separatorlist_2/fields/tipo/@name}" name="{rows/content/separatorlist_2/fields/tipo/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_2/fields/freguesia">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="freguesia" item-type="text">
                                                      <label for="{rows/content/separatorlist_2/fields/freguesia/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_2/fields/freguesia/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_2/fields/freguesia/value}" class="form-control" id="{rows/content/separatorlist_2/fields/freguesia/@name}" name="{rows/content/separatorlist_2/fields/freguesia/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_2/fields/area">
                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="area" item-type="text">
                                                      <label for="{rows/content/separatorlist_2/fields/area/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_2/fields/area/label"/>
                                                        </span>
                                                      </label>
                                                      <input type="text" value="{rows/content/separatorlist_2/fields/area/value}" class="form-control" id="{rows/content/separatorlist_2/fields/area/@name}" name="{rows/content/separatorlist_2/fields/area/@name}" maxlength="30">
                                                      </input>
                                                    </div>
                                                  </xsl:if>
                                                </div>
                                              </div>
                                              <div class="table-box box-body box-table-contents splist-table">
                                                <table rel="T_separatorlist_2" id="separatorlist_2" class="table table-striped gen-data-table">
                                                  <thead>
                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                      <xsl:if test="rows/content/separatorlist_2/fields/tipo_predio">
                                                        <xsl:if test="//rows/content/separatorlist_2/fields/tipo_predio/@table='true'">
                                                          <th align="" item-name="tipo_predio">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_2/fields/tipo_predio/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_2/fields/nip">
                                                        <xsl:if test="//rows/content/separatorlist_2/fields/nip/@table='true'">
                                                          <th align="" item-name="nip">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_2/fields/nip/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_2/fields/tipo">
                                                        <xsl:if test="//rows/content/separatorlist_2/fields/tipo/@table='true'">
                                                          <th align="" item-name="tipo">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_2/fields/tipo/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_2/fields/freguesia">
                                                        <xsl:if test="//rows/content/separatorlist_2/fields/freguesia/@table='true'">
                                                          <th align="" item-name="freguesia">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_2/fields/freguesia/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_2/fields/area">
                                                        <xsl:if test="//rows/content/separatorlist_2/fields/area/@table='true'">
                                                          <th align="" item-name="area">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_2/fields/area/label"/>
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
                                                    <xsl:for-each select="rows/content/separatorlist_2/table/value/row">
                                                      <tr gen-id="drop-zone" gen-field-template="td">
                                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_2_id" value="{separatorlist_2_id}"/>
                                                        <xsl:if test="tipo_predio">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_2/fields/tipo_predio/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/tipo_predio/label}" class="select">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="tipo_predio_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_tipo_predio_fk" value="{tipo_predio}"/>
                                                                <input type="hidden" name="p_tipo_predio_fk_desc" value="{tipo_predio_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_tipo_predio_fk" value="{tipo_predio}"/>
                                                              <input type="hidden" name="p_tipo_predio_fk_desc" value="{tipo_predio_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="nip">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_2/fields/nip/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/nip/label}" class="lookup">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="nip_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_nip_fk" value="{nip}"/>
                                                                <input type="hidden" name="p_nip_fk_desc" value="{nip_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_nip_fk" value="{nip}"/>
                                                              <input type="hidden" name="p_nip_fk_desc" value="{nip_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="tipo">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_2/fields/tipo/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/tipo/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="tipo_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                                                <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                                              <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="freguesia">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_2/fields/freguesia/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/freguesia/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="freguesia_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_freguesia_fk" value="{freguesia}"/>
                                                                <input type="hidden" name="p_freguesia_fk_desc" value="{freguesia_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_freguesia_fk" value="{freguesia}"/>
                                                              <input type="hidden" name="p_freguesia_fk_desc" value="{freguesia_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="area">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_2/fields/area/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/area/label}" class="text">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="area_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_area_fk" value="{area}"/>
                                                                <input type="hidden" name="p_area_fk_desc" value="{area_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_area_fk" value="{area}"/>
                                                              <input type="hidden" name="p_area_fk_desc" value="{area_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <td data-row="{position()}" class="table-btn">
                                                          <span class="table-row-edit btn" rel="separatorlist_2">
                                                            <i class="fa fa-pencil"/>
                                                          </span>
                                                          <span class="table-row-remove btn" rel="separatorlist_2">
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
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </xsl:if>
                              <xsl:if  test="rows/content/tabcontent_1/item[@name='anexos']">
                                <div class="tab-pane gen-rows-holder " id="tab-1460997551530" rel="tab-1460997551530">
                                  <div class="row">
                                    <div class="gen-column col-md-12">
                                      <div class="gen-inner">
                                        <xsl:if test="rows/content/separatorlist_3">
                                          <div class="box gen-container-item">
                                            <div class="box-body IGRP-separatorlist" tag="separatorlist_3" dialog="false">
                                              <div class="splist-form-holder">
                                                <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                                                  <xsl:if test="rows/content/separatorlist_3/fields/upload">
                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="upload" item-type="file">
                                                      <label for="{rows/content/separatorlist_3/fields/upload/@name}">
                                                        <span gen-lbl-setter="">
                                                          <xsl:value-of select="rows/content/separatorlist_3/fields/upload/label"/>
                                                        </span>
                                                      </label>
                                                      <div class="input-group">
                                                        <input type="text" class="form-control not-form" readonly=""/>
                                                        <span class="input-group-btn">
                                                          <span class="btn btn-default file-btn-holder">
                                                            <i class="fa fa-upload"/>
                                                            <input id="{rows/content/separatorlist_3/fields/upload/@name}" name="{rows/content/separatorlist_3/fields/upload/@name}" value="{rows/content/separatorlist_3/fields/upload/value}" class="transparent" type="file" multiple=""/>
                                                          </span>
                                                        </span>
                                                      </div>
                                                    </div>
                                                  </xsl:if>
                                                  <xsl:if test="rows/content/separatorlist_3/fields/tipo_documento">
                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_documento" item-type="select">
                                                      <label for="{rows/content/separatorlist_3/fields/tipo_documento/@name}">
                                                        <xsl:value-of select="rows/content/separatorlist_3/fields/tipo_documento/label"/>
                                                      </label>
                                                      <select class="form-control select2 " id="separatorlist_3_tipo_documento" name="{rows/content/separatorlist_3/fields/tipo_documento/@name}">
                                                        <xsl:for-each select="rows/content/separatorlist_3/fields/tipo_documento/list/option">
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
                                                  <xsl:if test="rows/content/separatorlist_3/fields/descricao">
                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="descricao" item-type="textarea">
                                                      <label for="{rows/content/separatorlist_3/fields/descricao/@name}">
                                                        <xsl:value-of select="rows/content/separatorlist_3/fields/descricao/label"/>
                                                      </label>
                                                      <textarea name="{rows/content/separatorlist_3/fields/descricao/@name}" class="textarea form-control" maxlength="30">
                                                        <xsl:value-of select="rows/content/separatorlist_3/fields/descricao/value"/>
                                                      </textarea>
                                                    </div>
                                                  </xsl:if>
                                                </div>
                                              </div>
                                              <div class="table-box box-body box-table-contents splist-table">
                                                <table rel="T_separatorlist_3" id="separatorlist_3" class="table table-striped gen-data-table">
                                                  <thead>
                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                      <xsl:if test="rows/content/separatorlist_3/fields/upload">
                                                        <xsl:if test="//rows/content/separatorlist_3/fields/upload/@table='true'">
                                                          <th align="" item-name="upload">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_3/fields/upload/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_3/fields/tipo_documento">
                                                        <xsl:if test="//rows/content/separatorlist_3/fields/tipo_documento/@table='true'">
                                                          <th align="" item-name="tipo_documento">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_3/fields/tipo_documento/label"/>
                                                            </span>
                                                          </th>
                                                        </xsl:if>
                                                      </xsl:if>
                                                      <xsl:if test="rows/content/separatorlist_3/fields/descricao">
                                                        <xsl:if test="//rows/content/separatorlist_3/fields/descricao/@table='true'">
                                                          <th align="" item-name="descricao">
                                                            <span gen-lbl-setter="">
                                                              <xsl:value-of select="rows/content/separatorlist_3/fields/descricao/label"/>
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
                                                    <xsl:for-each select="rows/content/separatorlist_3/table/value/row">
                                                      <tr gen-id="drop-zone" gen-field-template="td">
                                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_3_id" value="{separatorlist_3_id}"/>
                                                        <xsl:if test="upload">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_3/fields/upload/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/upload/label}" class="file">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="upload_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                                                <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_upload_fk" value="{upload}"/>
                                                              <input type="hidden" name="p_upload_fk_desc" value="{upload_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="tipo_documento">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_3/fields/tipo_documento/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/tipo_documento/label}" class="select">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="tipo_documento_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_tipo_documento_fk" value="{tipo_documento}"/>
                                                                <input type="hidden" name="p_tipo_documento_fk_desc" value="{tipo_documento_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_tipo_documento_fk" value="{tipo_documento}"/>
                                                              <input type="hidden" name="p_tipo_documento_fk_desc" value="{tipo_documento_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <xsl:if test="descricao">
                                                          <xsl:choose>
                                                            <xsl:when test="//rows/content/separatorlist_3/fields/descricao/@table='true'">
                                                              <td data-row="{position()}" data-title="{../../../fields/descricao/label}" class="textarea">
                                                                <span class="separator-list-td-val">
                                                                  <xsl:value-of select="descricao_desc" disable-output-escaping="yes"/>
                                                                </span>
                                                                <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                                                <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                                              </td>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                              <input type="hidden" name="p_descricao_fk" value="{descricao}"/>
                                                              <input type="hidden" name="p_descricao_fk_desc" value="{descricao_desc}"/>
                                                            </xsl:otherwise>
                                                          </xsl:choose>
                                                        </xsl:if>
                                                        <td data-row="{position()}" class="table-btn">
                                                          <span class="table-row-edit btn" rel="separatorlist_3">
                                                            <i class="fa fa-pencil"/>
                                                          </span>
                                                          <span class="table-row-remove btn" rel="separatorlist_3">
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
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </xsl:if>
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
        <!-- TABCONTENT JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/tabcontent/includes/igrp.tabs.js">
        </script>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/separatorlist/includes/igrp.separatorlist.js">
        </script>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js">
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
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1460997551536"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1460997551536"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1460997551536"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1460997551536"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1460997551537"/>
</xsl:stylesheet>
