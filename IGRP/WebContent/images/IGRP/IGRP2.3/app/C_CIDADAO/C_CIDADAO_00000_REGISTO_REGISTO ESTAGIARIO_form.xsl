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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col addMarginTop" sep-name="form"><!-- INICIO SEPARADOR registos_estagiarios--><xsl:if test="rows/content/form/label/registos_estagiarios">
                  <div class="box-content resetPadding" sep-name="registos_estagiarios">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/registos_estagiarios"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/nome">
                  <xsl:if test="rows/content/form/label/nome">
                    <div class="col-1-4 item" item-name="nome">
                      <div class="igrp_item LOOKUP_BI">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/nome" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="LOOKUP_BI" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="LOOKUP_BI required">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                            </xsl:call-template>
                          </input>
                          <xsl:call-template name="lookup-tool">
                            <xsl:with-param name="page" select="'LOOKUP'"/>
                            <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                            <xsl:with-param name="name" select="rows/content/form/value/nome/@name"/>
                            <xsl:with-param name="js_lookup" select="rows/content/form/lookup/nome"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/dt_nasc">
                  <xsl:if test="rows/content/form/label/dt_nasc">
                    <div class="col-1-4 item" item-name="dt_nasc">
                      <div class="igrp_item date">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/dt_nasc" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/dt_nasc/@name}" value="{rows/content/form/value/dt_nasc}" class="date required" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/dt_nasc"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/bi">
                  <xsl:if test="rows/content/form/label/bi">
                    <div class="col-1-4 item" item-name="bi">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/bi" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/bi/@name}" value="{rows/content/form/value/bi}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/bi"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/sexo">
                  <xsl:if test="rows/content/form/label/sexo">
                    <div class="col-1-4 item" item-name="sexo">
                      <div class="igrp_item radiolist">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/sexo" disable-output-escaping="yes"/>
                        </label>
                        <xsl:for-each select="rows/content/form/list/sexo/option">
                          <div class="col-1-1">
                            <input type="radio" name="{../@name}" value="{value}" class="radiolist required">
                              <xsl:call-template name="FIELD_validator">
                                <xsl:with-param name="field" select="../../../label/sexo"/>
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
                <xsl:if test="rows/content/form/label/area_estagio">
                  <xsl:if test="rows/content/form/label/area_estagio">
                    <div class="col-1-4 item" item-name="area_estagio">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/area_estagio" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/area_estagio/@name}" chosen="select" data-placeholder="{rows/content/form/list/area_estagio/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/area_estagio"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/area_estagio/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/curso">
                  <xsl:if test="rows/content/form/label/curso">
                    <div class="col-1-4 item" item-name="curso">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/curso" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/curso/@name}" chosen="select" data-placeholder="{rows/content/form/list/curso/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/curso"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/curso/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/grau_academico">
                  <xsl:if test="rows/content/form/label/grau_academico">
                    <div class="col-1-4 item" item-name="grau_academico">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/grau_academico" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/grau_academico/@name}" chosen="select" data-placeholder="{rows/content/form/list/grau_academico/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/grau_academico"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/grau_academico/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/universidade">
                  <xsl:if test="rows/content/form/label/universidade">
                    <div class="col-1-4 item" item-name="universidade">
                      <div class="igrp_item select">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/universidade" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/universidade/@name}" chosen="select" data-placeholder="{rows/content/form/list/universidade/option[position() = 1]}" class="select required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/universidade"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/universidade/option[position() != 1]">
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
                </xsl:if><!-- INICIO SEPARADOR contato--><xsl:if test="rows/content/form/label/contato">
                  <div class="box-content resetPadding" sep-name="contato">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/contato"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/morada">
                  <xsl:if test="rows/content/form/label/morada">
                    <div class="col-1-4 item" item-name="morada">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/morada" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/morada/@name}" value="{rows/content/form/value/morada}" class="text required" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/morada"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/email">
                  <xsl:if test="rows/content/form/label/email">
                    <div class="col-1-4 item" item-name="email">
                      <div class="igrp_item email">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/email" disable-output-escaping="yes"/>
                        </label>
                        <input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}" class="email required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/email"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/rua">
                  <xsl:if test="rows/content/form/label/rua">
                    <div class="col-1-4 item" item-name="rua">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/rua" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/rua/@name}" value="{rows/content/form/value/rua}" class="text" maxlength="100">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/rua"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/numero_porta">
                  <xsl:if test="rows/content/form/label/numero_porta">
                    <div class="col-1-4 item" item-name="numero_porta">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/numero_porta" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/numero_porta/@name}" value="{rows/content/form/value/numero_porta}" class="number" maxlength="4">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/numero_porta"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/caixa_postal">
                  <xsl:if test="rows/content/form/label/caixa_postal">
                    <div class="col-1-4 item" item-name="caixa_postal">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/caixa_postal" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/caixa_postal/@name}" value="{rows/content/form/value/caixa_postal}" class="number" maxlength="8">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/caixa_postal"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/telefone">
                  <xsl:if test="rows/content/form/label/telefone">
                    <div class="col-1-4 item" item-name="telefone">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telefone" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/telefone/@name}" value="{rows/content/form/value/telefone}" class="number" maxlength="9">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telefone"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/telemovel">
                  <xsl:if test="rows/content/form/label/telemovel">
                    <div class="col-1-4 item" item-name="telemovel">
                      <div class="igrp_item number">
                        <label>
                          <xsl:value-of select="rows/content/form/label/telemovel" disable-output-escaping="yes"/>
                        </label>
                        <input type="number" name="{rows/content/form/value/telemovel/@name}" value="{rows/content/form/value/telemovel}" class="number" maxlength="9">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/telemovel"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/id"/><!-- INICIO SEPARADOR anexos--><xsl:if test="rows/content/form/label/anexos">
                  <div class="box-content resetPadding" sep-name="anexos">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/anexos"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="col" group-name="anexos">
                        <xsl:if test="rows/content/form/label/tipo">
                          <div class="col-1-4 item" item-name="tipo">
                            <div class="igrp_item select">
                              <label>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/tipo" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/tipo/@name}" chosen="select" data-placeholder="{rows/content/form/list/tipo/option[position() = 1]}" class="select important" rel="F_anexos">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/tipo"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/tipo/option[position() != 1]">
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
                        <xsl:if test="rows/content/form/label/ficheiro">
                          <div class="col-1-4 item" item-name="ficheiro">
                            <div class="igrp_item file">
                              <label>
                                <span class="riquired">*</span>
                                <xsl:value-of select="rows/content/form/label/ficheiro" disable-output-escaping="yes"/>
                              </label>
                              <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/ficheiro/@name}"/>
                                <span class="upload">File</span>
                                <input type="file" name="{rows/content/form/value/ficheiro/@name}" value="{rows/content/form/value/ficheiro}" class="file important uploadFile" rel="F_anexos">
                                  <xsl:call-template name="FIELD_validator">
                                    <xsl:with-param name="field" select="rows/content/form/label/ficheiro"/>
                                  </xsl:call-template>
                                </input>
                              </div>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>
                        <div class="_clear"/>
                      </div>
                      <xsl:call-template name="tools-bar-form-group">
                        <xsl:with-param name="class" select="'IGRP_addRow'"/>
                        <xsl:with-param name="rel" select="'anexos'"/>
                      </xsl:call-template>
                      <div class="col" list-name="anexos"><!-- START TABELA LIST--><div class="box-table table-responsive">
                          <ul class="contextMenu ctxSepListDialog" id="data-anexos">
                            <li rel="anexos" class="IGRP_editRow operationTable" name="edit_anexos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/>
                              </span>
                            </li>
                            <li rel="anexos" class="IGRP_delRow operationTable" name="del_anexos">
                              <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                              <span>
                                <xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/>
                              </span>
                            </li>
                          </ul>
                          <table rel="T_anexos" data-control="data-anexos">
                            <thead>
                              <tr>
                                <xsl:if test="rows/content/form/table/anexos/label/tipo">
                                  <xsl:if test="not(rows/content/form/table/anexos/label/tipo/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/anexos/label/tipo" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="rows/content/form/table/anexos/label/ficheiro">
                                  <xsl:if test="not(rows/content/form/table/anexos/label/ficheiro/@visible)">
                                    <th>
                                      <xsl:value-of select="rows/content/form/table/anexos/label/ficheiro" disable-output-escaping="yes"/>
                                    </th>
                                  </xsl:if>
                                </xsl:if>
                                <th class="bEdDel"/>
                              </tr>
                            </thead>
                            <tbody>
                              <xsl:for-each select="rows/content/form/table/anexos/value/row[not(@total='yes')]">
                                <tr row="{position()}">
                                  <xsl:if test="tipo">
                                    <xsl:if test="not(tipo/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/tipo}">
                                        <xsl:value-of select="tipo_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                        <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                        <span class="showResponsiveTable ctxmenu"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="tipo/@visible = 'false'">
                                      <input type="hidden" name="p_tipo_fk" value="{tipo}"/>
                                      <input type="hidden" name="p_tipo_fk_desc" value="{tipo_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <xsl:if test="ficheiro">
                                    <xsl:if test="not(ficheiro/@visible)">
                                      <td data-row="{position()}" data-title="{../../label/ficheiro}">
                                        <xsl:choose>
                                          <xsl:when test="ficheiro != ''">
                                            <a href="{ficheiro}" class="link bClick" target="_blank" name="ficheiro">
                                              <xsl:value-of select="ficheiro_desc" disable-output-escaping="yes"/>
                                            </a>
                                          </xsl:when>
                                          <xsl:otherwise>
                                            <xsl:value-of select="ficheiro_desc" disable-output-escaping="yes"/>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                        <input type="hidden" name="p_ficheiro_fk_desc" value="{ficheiro_desc}"/>
                                      </td>
                                    </xsl:if>
                                    <xsl:if test="ficheiro/@visible = 'false'">
                                      <input type="hidden" name="p_ficheiro_fk" value="{ficheiro}"/>
                                      <input type="hidden" name="p_ficheiro_fk_desc" value="{ficheiro_desc}"/>
                                    </xsl:if>
                                  </xsl:if>
                                  <td class="bEdDel" data-row="{position()}" data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}">
                                    <xsl:if test="not(@noupdate)">
                                      <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" name="edit_anexos" rel="anexos" class="IGRP_editRow"/>
                                    </xsl:if>
                                    <xsl:if test="not(@nodelete)">
                                      <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" name="del_anexos" rel="anexos" class="IGRP_delRow"/>
                                    </xsl:if>
                                  </td>
                                  <input type="hidden" name="p_anexos_id" value="{anexos_id}"/>
                                </tr>
                              </xsl:for-each>
                            </tbody>
                          </table>
                        </div><!-- END TABELA LIST--></div>
                      <div class="_clear"/>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
