<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:call-template name="home-slide-menu"/><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/filter/label/num">
                    <div class="col-1-4 item" item-name="num">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/num) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/num" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/num" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/num/@name}" value="{rows/content/filter/value/num}" class="text" maxlength="250">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/num"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/area_fk">
                    <div class="col-1-4 item" item-name="area_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_area_fk"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/area_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/area_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/area_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/area_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/area_fk/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/area_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/area_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/proc_tp_fk">
                    <div class="col-1-4 item" item-name="proc_tp_fk">
                      <div class="igrp_item selectchange">
                        <a id="idp_proc_tp_fk"/>
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/proc_tp_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/proc_tp_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/proc_tp_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/proc_tp_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/proc_tp_fk/option[position() = 1]}" class="selectchange IGRP_change">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/proc_tp_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/proc_tp_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/acti_tp_fk">
                    <div class="col-1-4 item" item-name="acti_tp_fk">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/acti_tp_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/acti_tp_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/acti_tp_fk" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/acti_tp_fk/@name}" chosen="select" data-placeholder="{rows/content/filter/list/acti_tp_fk/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/acti_tp_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/acti_tp_fk/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/status">
                    <div class="col-1-4 item" item-name="status">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/status) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/status" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/status" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/status/@name}" chosen="select" data-placeholder="{rows/content/filter/list/status/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/status"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/status/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/user_desc_fk">
                    <div class="col-1-4 item" item-name="user_desc_fk">
                      <div class="igrp_item LOOKUP">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/user_desc_fk) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/user_desc_fk" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/user_desc_fk" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="LOOKUP" name="{rows/content/filter/value/user_desc_fk/@name}" value="{rows/content/filter/value/user_desc_fk}" class="LOOKUP">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/user_desc_fk"/>
                            </xsl:call-template>
                          </input>
                          <xsl:call-template name="lookup-tool">
                            <xsl:with-param name="page" select="rows/page"/>
                            <xsl:with-param name="ad_hoc" select="'1'"/>
                            <xsl:with-param name="action" select="'LOOKUP'"/>
                            <xsl:with-param name="name" select="rows/content/filter/value/user_desc_fk/@name"/>
                            <xsl:with-param name="js_lookup" select="rows/content/filter/lookup/user_desc_fk"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/dt_ini">
                    <div class="col-1-4 item" item-name="dt_ini">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/dt_ini) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/dt_ini" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/dt_ini" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/dt_ini/@name}" value="{rows/content/filter/value/dt_ini}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/dt_ini"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/dt_fim">
                    <div class="col-1-4 item" item-name="dt_fim">
                      <div class="igrp_item date">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/dt_fim) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/dt_fim" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/dt_fim" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/filter/value/dt_fim/@name}" value="{rows/content/filter/value/dt_fim}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/dt_fim"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/search">
                    <div class="col-1-4 item" item-name="search">
                      <div class="igrp_item text">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/search) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/search" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/search" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/filter/value/search/@name}" value="{rows/content/filter/value/search}" class="text" maxlength="1000">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/search"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/filter/label/send_type">
                    <div class="col-1-4 item" item-name="send_type">
                      <div class="igrp_item select">
                        <label>
                          <xsl:if test="string-length(rows/content/filter/label/send_type) > 45">
                            <xsl:attribute name="title">
                              <xsl:value-of select="rows/content/filter/label/send_type" disable-output-escaping="yes"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="rows/content/filter/label/send_type" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/filter/list/send_type/@name}" chosen="select" data-placeholder="{rows/content/filter/list/send_type/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/filter/label/send_type"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/filter/list/send_type/option[position() != 1]">
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
                  <xsl:if test="rows/content/filter/label/arch">
                    <div class="col-1-4 item" item-name="arch">
                      <div class="igrp_item checkbox">
                        <div class="col-1-1">
                          <input type="checkbox" name="{rows/content/filter/value/arch/@name}" value="1" class="checkbox">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/filter/label/arch"/>
                            </xsl:call-template>
                            <xsl:if test="rows/content/filter/value/arch='1'">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <xsl:value-of select="rows/content/filter/label/arch" disable-output-escaping="yes"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="col addBorderLeftRight borderColor"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="'table'"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/n_processo">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/n_processo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/tipo_processo">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/tipo_processo"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/etapa">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/etapa"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/doctp_name_desc">
                            <th align="left">
                              <xsl:value-of select="rows/content/table/label/doctp_name_desc"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/dt_send">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/dt_send"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/estado">
                            <th align="center">
                              <xsl:value-of select="rows/content/table/label/estado"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/doc_id">
                            <th class="checkbox sorttable_nosort" align="center">
                              <input type="checkbox" name="p_doc_id_all" class="IGRP_checkall"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="n_processo">
                              <td align="center" data-row="{position()}" data-title="{../../label/n_processo}" class="text">
                                <xsl:value-of select="n_processo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="tipo_processo">
                              <td align="left" data-row="{position()}" data-title="{../../label/tipo_processo}" class="text">
                                <xsl:value-of select="tipo_processo"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="etapa">
                              <td align="left" data-row="{position()}" data-title="{../../label/etapa}" class="text">
                                <xsl:value-of select="etapa"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="doctp_name_desc">
                              <td align="left" data-row="{position()}" data-title="{../../label/doctp_name_desc}" class="text">
                                <xsl:value-of select="doctp_name_desc"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="dt_send">
                              <td align="center" data-row="{position()}" data-title="{../../label/dt_send}" class="text">
                                <xsl:value-of select="dt_send"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="estado">
                              <td align="center" data-row="{position()}" data-title="{../../label/estado}" class="text">
                                <xsl:value-of select="estado"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="doc_id">
                              <td align="center" data-row="{position()}" data-title="{../../label/doc_id}" class="checkbox">
                                <xsl:if test="doc_id != '-0'">
                                  <input type="checkbox" name="p_doc_id" value="{doc_id}">
                                    <xsl:if test="doc_id_check=doc_id">
                                      <xsl:attribute name="checked">checked</xsl:attribute>
                                    </xsl:if>
                                  </input>
                                </xsl:if>
                                <xsl:value-of select="doc_id_desc"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
