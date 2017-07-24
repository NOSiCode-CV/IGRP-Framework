<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <!--XSL Generator (RED/DIM 2015)-->
      <head>
        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
        <link media="all" type="text/css" href="{$path}/extensions/webReport/css/webReport.css" rel="stylesheet"/>
        <script type="text/javascript">
          var dataSource = '<xsl:value-of select="rows/content/form/label/datasorce_app"/>',
          app = '<xsl:value-of select="rows/content/form/label/env_fk"/>',
          dtr ='<xsl:value-of select="rows/content/form/label/dialog_titulo_report"/>',
          dtr_LTinput ='<xsl:value-of select="rows/content/form/label/title_report"/>',
          dtr_NTinput ='<xsl:value-of select="rows/content/form/value/title_report/@name"/>',
          dtr_LCinput ='<xsl:value-of select="rows/content/form/label/codigo_report"/>',
          dtr_NCinput ='<xsl:value-of select="'p_code'"/>',
          dkr = '<xsl:value-of select="rows/content/form/label/dialog_keys_report"/>',
          vTmpl = '<xsl:value-of select="rows/content/form/value/hidden[@name='p_fwl_tmplconfig']"/>';
        </script>
        <script type="text/javascript" src="{$path}/extensions/webReport/js/webReport.vars.js"></script>
        <script type="text/javascript" src="{$path}/extensions/ui/draggable.js"></script>
        <script type="text/javascript" src="{$path}/extensions/ui/droppable.js"></script> 
        <script type="text/javascript" src="{$path}/extensions/webReport/js/toImages.js"></script>
      </head>
      <body class="bodyColor">
        <xsl:variable name="pTmpl">
          <xsl:choose>
            <xsl:when test="rows/content/form/value/hidden[@name='p_fwl_tmplconfig']">
              <xsl:value-of select="rows/content/form/value/hidden[@name='p_fwl_tmplconfig']"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>0</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <div class="IGRP_overlay"/>
        <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>
        <!--HOME-->
        <div id="igrp-bodyPage">
          <!--HOME LEFT-->
          <xsl:call-template name="home-slide-menu"/>
          <!--HOME RIGTH-->
          <div class="bodyPageRigth">
            <!--START YOUR CODE HERE-->
            <!--SHOW TABLET AND MOBILE TITLE
            <div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div>-->
            <!--SHOW NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <!--SHOW HIDDEN-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              <!--START FORM-->
              <!--START TOOLS BAR FROM-->
              <div class="col">
                <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar">
                  <xsl:with-param name="vClassClick" select="'bWebReport'"/>
                  <xsl:with-param name="isTable" select="'true'"/>
                </xsl:apply-templates>
                <!--END TOOLS BAR FORM-->
                <div class="report_app">
                  <xsl:if test="$pTmpl = 1">
                    <xsl:attribute name="class">hideItem</xsl:attribute>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/env_fk">
                    <div class="col item" item-name="env_fk">
                      <div class="igrp_item select">
                        <select name="{rows/content/form/list/env_fk/@name}" chosen="select" id="{rows/content/form/list/env_fk/@name}" data-placeholder="{rows/content/form/list/env_fk/option[position() = 1]}" class="select">
                          <xsl:if test="$pTmpl = 1">
                            <xsl:attribute name="disabled">disabled</xsl:attribute>
                          </xsl:if>
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/env_fk"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/env_fk/option[position() != 1]">
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
                </div>
                <div id="showTitle">
                  <span><xsl:value-of select="rows/content/form/label/dialog_titulo_report"/>:</span>
                  <span class="spanTitle"></span>
                </div>
                <div class="_clear"/>
              </div>
              <br/>
              <div class="colLR divLeft">
                <xsl:if test="$pTmpl = 1">
                    <xsl:attribute name="class">hideItem</xsl:attribute>
                </xsl:if>
                <div class="box-content resetPadding">
                  <div id="tabsMenu">
                    <ul class="IGRP-menu" id="tabs">
                      <xsl:for-each select="rows/content/menu/group">
                        <li rel="tab{position()}">
                          <xsl:choose>
                            <xsl:when test="position() = 1">
                              <xsl:attribute name="class">active</xsl:attribute>
                              <xsl:if test="$pTmpl = 1">
                                <xsl:attribute name="class">hideItem</xsl:attribute>
                              </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:if test="$pTmpl = 1">
                                <xsl:attribute name="class">active</xsl:attribute>
                              </xsl:if>
                            </xsl:otherwise>
                          </xsl:choose>
                          <!-- <xsl:if test="position() = 1">
                            <xsl:attribute name="class">active</xsl:attribute>
                            <xsl:if test="$pTmpl = 1">
                              <xsl:attribute name="class">hideItem</xsl:attribute>
                            </xsl:if>
                          </xsl:if> -->
                          <a><span><xsl:value-of select="@title"/></span></a>
                        </li>
                      </xsl:for-each>
                      <div class="_clear"/>
                    </ul>
                    <div class="_clear"/>
                  </div>
                  <div class="itemTab">
                    <div class="IGRP-menu groupItemTab itemMenu active" id="tab1" type="tab">
                      <xsl:if test="$pTmpl = 1">
                        <xsl:attribute name="class">hideItem</xsl:attribute>
                      </xsl:if>
                      <div class="col">
                        <a class="addReports" title="{$lngPath/js_messages/message[@name ='add']} {rows/content/menu/group[position() = 1]/@title}">
                          <img src="{$path_tmpl}/img/icon/tools-bar/add.png"/>
                        </a>
                      </div>
                      <div class="box-content resetBorder" id="listReports">
                        <xsl:call-template name="reports"/>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>

                    <div class="IGRP-menu groupItemTab itemMenu" id="tab2" type="tab">
                      <xsl:if test="$pTmpl = 1">
                        <xsl:attribute name="class">IGRP-menu groupItemTab itemMenu active</xsl:attribute>
                      </xsl:if>
                      <xsl:if test="rows/content/form/label/datasorce_app">
                        <div class="col item" item-name="datasorce_app">
                          <div class="igrp_item select">
                            <div class="itemIcon">
                              <xsl:if test="rows/content/form/value/link_add_source !='' and $pTmpl != 1">
                                <xsl:attribute name="add">on</xsl:attribute>
                              </xsl:if>
                              <select name="{rows/content/form/list/datasorce_app/@name}" chosen="select" id="{rows/content/form/list/datasorce_app/@name}" data-placeholder="{rows/content/form/list/datasorce_app/option[position() = 1]}" class="select selectlist"  multiple="multiple">
                                <xsl:if test="$pTmpl = 1">
                                  <xsl:attribute name="disabled">disabled</xsl:attribute>
                                </xsl:if>
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/datasorce_app"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/datasorce_app/option[position() != 1]">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              </select>
                              <xsl:if test="$pTmpl != 1">
                                <xsl:if test="rows/content/form/value/link_add_source !=''">
                                  <a class="addDataSource bClick" target="_blank" href="{rows/content/form/value/link_add_source}" title="{$lngPath/js_messages/message[@name ='add']} {rows/content/form/label/datasorce_app}" id="addDataSource">
                                    <img src="{$path_tmpl}/img/icon/tools-bar/add.png"/>
                                  </a>
                                  <a class="addDataSource" target="_blank" href="{rows/content/form/value/link_add_source}" title="{$lngPath/js_messages/message[@name ='edit']} {rows/content/form/label/datasorce_app}" id="editDataSource">
                                    <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                                  </a>
                                </xsl:if>
                              </xsl:if>
                            </div>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>
                      </xsl:if>
                      <div id="listElement">
                        <xsl:if test="count(rows/content/form/list/datasorce_app/option[position() != 1]) > 0">
                          <xsl:call-template name="datasorce"/>
                        </xsl:if>
                      </div>
                      <div class="_clear"/>
                    </div>

                    <div class="_clear"/>
                  </div>
                  <div class="_clear"/>
                </div>
              </div>
              <div class="colCenter" sep-name="form">
                <xsl:if test="$pTmpl = 1">
                    <xsl:attribute name="class">col</xsl:attribute>
                </xsl:if>
                <div class="ui-dialog" id="reportTitle">
                  <div class="dialog">
                    <div class="title"><xsl:value-of select="rows/content/form/label/dialog_titulo_report"/></div>
                    <div class="message">
                      <div class="igrp_item">
                        <div class="col-1-4">
                          <label><xsl:value-of select="rows/content/form/label/title_report"/></label>
                        </div>
                        <div class="col-9-12">
                          <input type="text" name="{rows/content/form/value/title_report/@name}"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="igrp_item">
                        <div class="col-1-4">
                          <label>
                            <xsl:value-of select="rows/content/form/label/codigo_report"/>
                          </label>
                        </div>
                        <div class="col-9-12">
                          <input type="text" name="'p_code'"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </div>
                  <div class="ui-dialog-buttonpane">
                    <div class="ui-dialog-buttonset">
                      <button type="button" role="button" id="btrOK">
                        <span class="ui-button-text"><xsl:value-of select="$lngPath/js_messages/message[@name ='yes']"/></span>
                      </button>
                      <button type="button" role="button" id="btrCancel">
                        <span class="ui-button-text"><xsl:value-of select="$lngPath/js_messages/message[@name ='no']"/></span>
                      </button>
                    </div>
                  </div>
                </div>
                <xsl:if test="rows/content/form/label/report_editor">
                  <div class="box-content resetPadding resetBorder" sep-name="report_editor">
                    <xsl:if test="$pTmpl = 1">
                      <xsl:attribute name="style">width:100%;position: relative;</xsl:attribute>
                    </xsl:if>
                    <textarea name="{rows/content/form/value/report_editor/@name}" id="{rows/content/form/value/report_editor/@name}" class="textEditor" maxlength="{rows/content/form/label/report_editor/@maxlength}" rows="10" cols="80">
                      <xsl:value-of select="rows/content/form/value/report_editor"/>
                    </textarea>
                    <script type="text/javascript">
                    //CKEDITOR.disableAutoInline = true;
                    CKEDITOR.env.isCompatible = true;
                    CKEDITOR.scriptLoader.load(path+'/extensions/webReport/js/webReport.init.js');
                    $(function(){
                      var _div = "<xsl:value-of select='rows/content/form/value/report_editor/@name'/>";
                      $('#'+_div).ckeditor();
                    });
                    </script>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
              </form>
              <div class="_clear"/>
              <div id="transfome">
                <div class="gTransform"></div>
              </div>
            <!--END YOUR CODE HERE-->
            <div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div>
        <!--FOOTER PAGE-->
        <div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150629"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150629"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150629"/>
  <xsl:include href="../../../extensions/webReport/xsl/IGRP-datasorce.tmpl.xsl?v=20150629"/>
  <xsl:include href="../../../extensions/webReport/xsl/IGRP-reports.tmpl.xsl?v=20150629"/>
</xsl:stylesheet>
