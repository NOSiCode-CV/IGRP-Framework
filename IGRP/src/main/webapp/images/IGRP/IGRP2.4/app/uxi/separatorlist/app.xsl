<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
      <head>
        <xsl:call-template name="igrp-head"/>
        <!-- SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
        <style/>
      </head>
      <body class="">
        <div id="layout-wrapper">
          <xsl:call-template name="igrp-header"/>
          <xsl:call-template name="igrp-sidebar"/>
          <div class="main-content">
            <div class="page-content">
              <div class="container-fluid">
                <xsl:call-template name="igrp-page-title"/>
                <form>
                <div class="igrp-page-contents">
                  <div class="row " id="row-497ec196">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:if test="rows/content/separatorlist_1">
                          <div class="box card gen-container-item " id="separatorlist1686919281083" gen-class="" item-name="separatorlist_1">
                            <div class="box-body card-body IGRP-separatorlist p-0" tag="separatorlist_1" dialog="false">
                              <xsl:if test="rows/content/separatorlist_1/@noedit and rows/content/separatorlist_1/@noedit = 'true'">
                                <xsl:attribute name="noedt">
                                  <xsl:value-of select="rows/content/separatorlist_1/@noedit"/>
                                </xsl:attribute>
                              </xsl:if>
                              <xsl:if test="rows/content/separatorlist_1/@noadd and rows/content/separatorlist_1/@noadd = 'true'">
                                <xsl:attribute name="noadd">
                                  <xsl:value-of select="rows/content/separatorlist_1/@noadd"/>
                                </xsl:attribute>
                              </xsl:if>
                              <xsl:if test="rows/content/separatorlist_1/@nodelete and rows/content/separatorlist_1/@nodelete = 'true'">
                                <xsl:attribute name="nodel">
                                  <xsl:value-of select="rows/content/separatorlist_1/@nodelete"/>
                                </xsl:attribute>
                              </xsl:if>
                              <div class="splist-form-holder px-3 pt-4">
                                <xsl:if test="(not(rows/content/separatorlist_1/@noadd) or rows/content/separatorlist_1/@noadd != 'true')">
                                  <div class="splist-form row g-4" role="form">
                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_1">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_1" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_1/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_1/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_1/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_1/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_1/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_1/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_email_1">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_email_1" item-type="email">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_email_1/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_email_1/label"/>
                                          </span>
                                        </label>
                                        <input type="email" value="{rows/content/separatorlist_1/fields/separatorlist_1_email_1/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_email_1/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_email_1/@name}" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_email_1/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_email_1_1">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_email_1_1" item-type="email">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/label"/>
                                          </span>
                                        </label>
                                        <input type="email" value="{rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/@name}" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_2">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_2" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_2/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_2/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_2/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_2/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_2/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_2/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_3">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_3" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_3/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_3/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_3/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_3/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_3/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_3/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_4">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_4" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_4/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_4/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_4/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_4/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_4/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_4/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_5">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_5" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_5/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_5/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_5/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_5/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_5/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_5/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_6">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_6" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_6/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_6/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_6/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_6/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_6/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_6/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                    <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_7">
                                      <div class="col-md-3 gen-fields-holder" item-name="separatorlist_1_text_7" item-type="text">
                                        <label for="{rows/content/separatorlist_1/fields/separatorlist_1_text_7/@name}" class="form-label">
                                          <span>
                                            <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_7/label"/>
                                          </span>
                                        </label>
                                        <input type="text" value="{rows/content/separatorlist_1/fields/separatorlist_1_text_7/value}" class="form-control  " inputmask="" id="{rows/content/separatorlist_1/fields/separatorlist_1_text_7/@name}" name="{rows/content/separatorlist_1/fields/separatorlist_1_text_7/@name}" disablehtml="true" maxlength="250" placeholder="{rows/content/separatorlist_1/fields/separatorlist_1_text_7/@placeholder}"/>
                                      </div>
                                    </xsl:if>
                                  </div>
                                </xsl:if>
                              </div>
                              <div class="table-box box-body box-table-contents splist-table">
                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table  table-striped gen-data-table">
                                  <thead>
                                    <tr>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_1">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_1/@visible)">
                                          <th align="" item-name="separatorlist_1_text_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_email_1">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_email_1/@visible)">
                                          <th align="" item-name="separatorlist_1_email_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_email_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_email_1_1">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/@visible)">
                                          <th align="" item-name="separatorlist_1_email_1_1">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_2">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_2/@visible)">
                                          <th align="" item-name="separatorlist_1_text_2">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_2/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_3">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_3/@visible)">
                                          <th align="" item-name="separatorlist_1_text_3">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_3/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_4">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_4/@visible)">
                                          <th align="" item-name="separatorlist_1_text_4">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_4/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_5">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_5/@visible)">
                                          <th align="" item-name="separatorlist_1_text_5">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_5/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_6">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_6/@visible)">
                                          <th align="" item-name="separatorlist_1_text_6">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_6/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="rows/content/separatorlist_1/fields/separatorlist_1_text_7">
                                        <xsl:if test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_7/@visible)">
                                          <th align="" item-name="separatorlist_1_text_7">
                                            <span>
                                              <xsl:value-of select="rows/content/separatorlist_1/fields/separatorlist_1_text_7/label"/>
                                            </span>
                                          </th>
                                        </xsl:if>
                                      </xsl:if>
                                      <th class="table-btn">
                                        <xsl:if test="(not(rows/content/separatorlist_1/@noadd) or rows/content/separatorlist_1/@noadd != 'true')">
                                          <a class="table-row-add btn-xs btn btn-primary" title="Add" data-toggle="tooltip" data-placement="left">
                                            <i class="fa fa-plus"/>
                                          </a>
                                        </xsl:if>
                                      </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                      <tr>
                                        <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                        <xsl:apply-templates mode="form-hidden-fields" select="."/>		
                                        <xsl:if test="separatorlist_1_text_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_1/@visible)">
                                              <td field="separatorlist_1_text_1" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_1/label}" class="text" item-name="separatorlist_1_text_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_1_fk" value="{separatorlist_1_text_1}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_1_fk_desc" value="{separatorlist_1_text_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_1_fk" value="{separatorlist_1_text_1}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_1_fk_desc" value="{separatorlist_1_text_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_email_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_email_1/@visible)">
                                              <td field="separatorlist_1_email_1" data-row="{position()}" data-title="{../../../fields/separatorlist_1_email_1/label}" class="email" item-name="separatorlist_1_email_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_email_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_email_1_fk" value="{separatorlist_1_email_1}"/>
                                                <input type="hidden" name="p_separatorlist_1_email_1_fk_desc" value="{separatorlist_1_email_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_email_1_fk" value="{separatorlist_1_email_1}"/>
                                              <input type="hidden" name="p_separatorlist_1_email_1_fk_desc" value="{separatorlist_1_email_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_email_1_1">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_email_1_1/@visible)">
                                              <td field="separatorlist_1_email_1_1" data-row="{position()}" data-title="{../../../fields/separatorlist_1_email_1_1/label}" class="email" item-name="separatorlist_1_email_1_1">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_email_1_1_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_email_1_1_fk" value="{separatorlist_1_email_1_1}"/>
                                                <input type="hidden" name="p_separatorlist_1_email_1_1_fk_desc" value="{separatorlist_1_email_1_1_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_email_1_1_fk" value="{separatorlist_1_email_1_1}"/>
                                              <input type="hidden" name="p_separatorlist_1_email_1_1_fk_desc" value="{separatorlist_1_email_1_1_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_text_2">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_2/@visible)">
                                              <td field="separatorlist_1_text_2" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_2/label}" class="text" item-name="separatorlist_1_text_2">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_2_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_2_fk" value="{separatorlist_1_text_2}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_2_fk_desc" value="{separatorlist_1_text_2_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_2_fk" value="{separatorlist_1_text_2}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_2_fk_desc" value="{separatorlist_1_text_2_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_text_3">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_3/@visible)">
                                              <td field="separatorlist_1_text_3" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_3/label}" class="text" item-name="separatorlist_1_text_3">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_3_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_3_fk" value="{separatorlist_1_text_3}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_3_fk_desc" value="{separatorlist_1_text_3_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_3_fk" value="{separatorlist_1_text_3}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_3_fk_desc" value="{separatorlist_1_text_3_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_text_4">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_4/@visible)">
                                              <td field="separatorlist_1_text_4" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_4/label}" class="text" item-name="separatorlist_1_text_4">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_4_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_4_fk" value="{separatorlist_1_text_4}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_4_fk_desc" value="{separatorlist_1_text_4_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_4_fk" value="{separatorlist_1_text_4}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_4_fk_desc" value="{separatorlist_1_text_4_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_text_5">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_5/@visible)">
                                              <td field="separatorlist_1_text_5" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_5/label}" class="text" item-name="separatorlist_1_text_5">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_5_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_5_fk" value="{separatorlist_1_text_5}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_5_fk_desc" value="{separatorlist_1_text_5_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_5_fk" value="{separatorlist_1_text_5}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_5_fk_desc" value="{separatorlist_1_text_5_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_text_6">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_6/@visible)">
                                              <td field="separatorlist_1_text_6" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_6/label}" class="text" item-name="separatorlist_1_text_6">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_6_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_6_fk" value="{separatorlist_1_text_6}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_6_fk_desc" value="{separatorlist_1_text_6_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_6_fk" value="{separatorlist_1_text_6}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_6_fk_desc" value="{separatorlist_1_text_6_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="separatorlist_1_text_7">
                                          <xsl:choose>
                                            <xsl:when test="not(//rows/content/separatorlist_1/fields/separatorlist_1_text_7/@visible)">
                                              <td field="separatorlist_1_text_7" data-row="{position()}" data-title="{../../../fields/separatorlist_1_text_7/label}" class="text" item-name="separatorlist_1_text_7">
                                                <span class="separator-list-td-val">
                                                  <xsl:value-of select="separatorlist_1_text_7_desc"/>
                                                </span>
                                                <input type="hidden" name="p_separatorlist_1_text_7_fk" value="{separatorlist_1_text_7}"/>
                                                <input type="hidden" name="p_separatorlist_1_text_7_fk_desc" value="{separatorlist_1_text_7_desc}"/>
                                              </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                              <input type="hidden" name="p_separatorlist_1_text_7_fk" value="{separatorlist_1_text_7}"/>
                                              <input type="hidden" name="p_separatorlist_1_text_7_fk_desc" value="{separatorlist_1_text_7_desc}"/>
                                            </xsl:otherwise>
                                          </xsl:choose>
                                        </xsl:if>
                                        <td data-row="{position()}" class="table-btn">
                                          <xsl:if test="not(//rows/content/separatorlist_1/@noedit) or //rows/content/separatorlist_1/@noedit != 'true'">
                                            <span class="table-row-undo btn btn-info d-none" rel="separatorlist_1" title="Undo" data-toggle="tooltip" data-placement="left">
                                              <i class="fa fa-undo"/>
                                            </span>	
                                            <span class="table-row-edit btn btn-warning " rel="separatorlist_1" title="Edit" data-toggle="tooltip" data-placement="left">
                                              <i class="fa fa-pencil"/>
                                            </span>
                                          </xsl:if>
                                          <xsl:if test="not(//rows/content/separatorlist_1/@nodelete) or //rows/content/separatorlist_1/@nodelete != 'true'">
                                            <span class="table-row-remove btn btn-danger" rel="separatorlist_1" title="Remove" data-toggle="tooltip" data-placement="right">
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
                      </div>
                    </div>
                  </div>
                </div>
                </form>
                
              </div>
            </div>
            <xsl:call-template name="igrp-footer"/>
          </div>
        </div>
        <xsl:call-template name="igrp-page-helpers"/>
        <xsl:call-template name="igrp-scripts"/>
        <!-- SEPARATORLIST JS INCLUDES -->
        <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/igrp/components/list-association/igrp.list.association.1.1.js?v={$version}"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=16"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=16"/>
</xsl:stylesheet>
