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
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><!-- START SEPARADOR TAB--><xsl:apply-templates mode="workFlow_tab" select="rows/content/form/label"/><!-- END SEPARADOR TAB--><!--START TOOLS BAR FROM--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/><!--END TOOLS BAR FORM--><div class="col"><div class="col addMarginTop addPaddingBottom10" sep-name="form">
                <xsl:if test="rows/content/form/label/area_fk">
                  <div class="col-1-4 item" item-name="area_fk">
                    <div class="igrp_item selectchange">
                      <a id="idp_area_fk"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/area_fk) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/area_fk" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <span class="riquired">*</span>
                        <xsl:value-of select="rows/content/form/label/area_fk" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/area_fk/@name}" chosen="select" id="{rows/content/form/list/area_fk/@name}" data-placeholder="{rows/content/form/list/area_fk/option[position() = 1]}" class="selectchange required IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/area_fk"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/area_fk/option[position() != 1]">
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
           </div><div id="sep_proc" class="col workFlow-content">
        <!-- INICIO SEPARADOR sep_proc--><xsl:if test="rows/content/form/label/sep_proc">
                  <div class="box-content resetPadding" sep-name="sep_proc">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/sep_proc"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/name">
                  <div class="col-1-4 item" item-name="name">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/name) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/name" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
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
                <xsl:if test="rows/content/form/label/code">
                  <div class="col-1-4 item" item-name="code">
                    <div class="igrp_item text">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/code) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/code" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
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
                <xsl:if test="rows/content/form/label/descr">
                  <div class="col-1-4 item" item-name="descr">
                    <div class="igrp_item textarea">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/descr) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/descr" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/descr" disable-output-escaping="yes"/>
                      </label>
                      <textarea name="{rows/content/form/value/descr/@name}" class="textarea" maxlength="4000">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/descr"/>
                        </xsl:call-template>
                        <xsl:value-of select="rows/content/form/value/descr" disable-output-escaping="yes"/>
                      </textarea>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/start_mod">
                  <div class="col-1-4 item" item-name="start_mod">
                    <div class="igrp_item checkbox">
                      <div class="col-1-1">
                        <input type="checkbox" name="{rows/content/form/value/start_mod/@name}" value="1" class="checkbox">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/start_mod"/>
                          </xsl:call-template>
                          <xsl:if test="rows/content/form/value/start_mod='1'">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                          </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/form/label/start_mod" disable-output-escaping="yes"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
           </div><div id="bpmn_diag" class="col workFlow-content">
        <!-- INICIO SEPARADOR bpmn_diag--><xsl:if test="rows/content/form/label/bpmn_diag">
                  <div class="box-content resetPadding" sep-name="bpmn_diag">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/bpmn_diag"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/file">
                  <div class="col-1-4 item" item-name="file">
                    <div class="igrp_item file">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/file) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/file" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/file" disable-output-escaping="yes"/>
                      </label>
                      <div class="itemIcon">
                        <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{rows/content/form/value/file/@name}"/>
                        <span class="upload"/>
                        <input type="file" name="{rows/content/form/value/file/@name}" value="{rows/content/form/value/file}" id="id_{rows/content/form/value/file/@name}" class="file uploadFile">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/file"/>
                          </xsl:call-template>
                        </input>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
           </div><div id="param_exec" class="col workFlow-content">
        <!-- INICIO SEPARADOR param_exec--><xsl:if test="rows/content/form/label/param_exec">
                  <div class="box-content resetPadding" sep-name="param_exec">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/param_exec"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/time_unity">
                  <div class="col-1-4 item" item-name="time_unity">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/time_unity) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/time_unity" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/time_unity" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/time_unity/@name}" chosen="select" id="{rows/content/form/list/time_unity/@name}" data-placeholder="{rows/content/form/list/time_unity/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/time_unity"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/time_unity/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/work_time">
                  <div class="col-1-4 item" item-name="work_time">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/work_time) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/work_time" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/work_time" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/work_time/@name}" value="{rows/content/form/value/work_time}" class="number" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/work_time"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/limit_time">
                  <div class="col-1-4 item" item-name="limit_time">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/limit_time) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/limit_time" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/limit_time" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/limit_time/@name}" value="{rows/content/form/value/limit_time}" class="number" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/limit_time"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/warn_time">
                  <div class="col-1-4 item" item-name="warn_time">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/warn_time) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/warn_time" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/warn_time" disable-output-escaping="yes"/>
                      </label>
                      <input type="number" name="{rows/content/form/value/warn_time/@name}" value="{rows/content/form/value/warn_time}" class="number" maxlength="22">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/warn_time"/>
                        </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
           </div><div id="clone" class="col workFlow-content">
        <!-- INICIO SEPARADOR clone--><xsl:if test="rows/content/form/label/clone">
                  <div class="box-content resetPadding" sep-name="clone">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/clone"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/aplicacao_origem">
                  <div class="col-1-4 item" item-name="aplicacao_origem">
                    <div class="igrp_item selectchange">
                      <a id="idp_aplicacao_origem"/>
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/aplicacao_origem) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/aplicacao_origem" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/aplicacao_origem" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/aplicacao_origem/@name}" chosen="select" id="{rows/content/form/list/aplicacao_origem/@name}" data-placeholder="{rows/content/form/list/aplicacao_origem/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/aplicacao_origem"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/aplicacao_origem/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/processo">
                  <div class="col-1-4 item" item-name="processo">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/processo) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/processo" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/processo/@name}" chosen="select" id="{rows/content/form/list/processo/@name}" data-placeholder="{rows/content/form/list/processo/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/processo"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/processo/option[position() != 1]">
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
                <xsl:if test="rows/content/form/label/incluir">
                  <div class="col-1-4 item" item-name="incluir">
                    <div class="igrp_item selectlist">
                      <label>
                        <xsl:if test="string-length(rows/content/form/label/incluir) > 45">
                          <xsl:attribute name="title">
                            <xsl:value-of select="rows/content/form/label/incluir" disable-output-escaping="yes"/>
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/form/label/incluir" disable-output-escaping="yes"/>
                      </label>
                      <select name="{rows/content/form/list/incluir/@name}" chosen="select" id="{rows/content/form/list/incluir/@name}" data-placeholder="{rows/content/form/list/incluir/option[position() = 1]}" multiple="multiple" class="selectlist">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/form/label/incluir"/>
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/form/list/incluir/option[position() != 1]">
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
              </div></div></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150901"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150901"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150901"/>
  <xsl:include href="../../xsl/tmpl/IGRP-workflowtab.tmpl.xsl?v=20150901"/>
</xsl:stylesheet>
