<?xml version="1.0" encoding="utf-8"?>
<gen:stylesheet xmlns:gen="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="dim-red" version="1.0" exclude-result-prefixes="xsl">
  
  <gen:namespace-alias stylesheet-prefix="xsl" result-prefix="xsl"/>
  <gen:variable name="pathAttr" select="'{$path}'"/>
  <gen:variable name="bodyClass" select="'{$bodyClass}'"/>
  <gen:variable name="version" select="'{$version}'"/>
  <gen:template match="/">
    
    <xsl:stylesheet version="1.0">
      <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-system="about:legacy-compat"/>
      <xsl:template match="/">
        <html>
          <head>
            <xsl:call-template name="IGRP-head"/>

            <gen:if test="rows/content/*[@type='toolsbar'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='view'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/view/igrp.view.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/igrp.tables.css?v={$version}"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[@type='date']">
               <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/datepicker2/daterangepicker.css?v={$version}"/>
               <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[contains(@type,'select')]">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/select2/select2.min.css"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/select2/select2.style.css"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[@type='color'] or rows/content/*/fields/*[@type='color_td']">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/table-colors.css"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[contains(@type,'vkb')]">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/virtualkeyboard/vkb.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[contains(@type,'range')]">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/bs.range/css/bootstrap.slider.min.css?v={$version}"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/bs.range/css/igrp.slider.css?v={$version}"/>
            </gen:if>
          </head>
          <body class="{$bodyClass} sidebar-off">
            <xsl:call-template name="IGRP-topmenu"/>
            <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
              <div class="container-fluid">
                <div class="row">
                  <xsl:call-template name="IGRP-sidebar"/>
                  <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                    <div class="content">
                      <!--SPLIT-->
                      <div class="row row-msg">
                        <div class="gen-column col-md-12">
                          <div class="gen-inner">
                            <xsl:apply-templates  mode="igrp-messages" select="rows/content/messages"/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="gen-column col-md-12">
                          <div class="gen-inner">
                            <gen:for-each select="rows/content/*[@type]">                            
                              <gen:choose>
                                <gen:when test="@type = 'sectionheader'">
                                  <gen:call-template name="gen_sectionheader"/>
                                </gen:when>
                                <gen:when test="@type = 'toolsbar'">
                                  <gen:call-template name="gen_toolsbar"/>
                                </gen:when>
                                <gen:when test="@type = 'view'">
                                  <gen:call-template name="gen_view"/>
                                </gen:when>
                                <gen:when test="@type = 'form'">
                                  <gen:call-template name="gen_form"/>
                                </gen:when>
                                <gen:when test="@type = 'table'">
                                  <gen:call-template name="gen_table"/>
                                </gen:when>
                              </gen:choose>
                            </gen:for-each>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <xsl:call-template name="IGRP-bottom"/>
            </form>
            <gen:if test="rows/content/*[@type='form'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/form/igrp.forms.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/igrp.table.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
            </gen:if>
            <!--DATE JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type='date']">
              <script type="text/javascript" src="{$pathAttr}/core/moment/moment.min.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/datepicker2/daterangepicker.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/datepicker2/IGRP.daterangepicker.config.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/datepicker2/locale/dp.locale.pt.js?v={$version}"/>
            </gen:if>
            <!--SELECT JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[contains(@type,'select')]">
              <script type="text/javascript" src="{$pathAttr}/plugins/select2/select2.full.min.js"></script>
              <script type="text/javascript" src="{$pathAttr}/plugins/select2/select2.init.js?v={$version}"></script>
            </gen:if>
            <!--COLOR JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type='color']">
              <script type="text/javascript" src="{$pathAttr}/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
              <script type="text/javascript" src="{$pathAttr}/plugins/colorpicker/colorpicker.init.js?v={$version}"></script>
            </gen:if>
            <!--TEXTEDITOR JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type='texteditor']">
              <script type="text/javascript" src="{$pathAttr}/core/ckeditor/ckeditor.js"></script>
            </gen:if>
            <!--LOOKUP JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[contains(@type,'lookup')]">
              <script type="text/javascript" src="{$pathAttr}/plugins/lookup/igrp.lookup.js?v={$version}"></script>
            </gen:if>
            <!--range JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type = 'range']">
              <script type="text/javascript" src="{$pathAttr}/plugins/bs.range/bootstrap.slider.min.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/bs.range/igrp.range.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[contains(@type,'vkb')]">
              <script type="text/javascript" src="{$pathAttr}/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js?v={$version}"/>
            </gen:if>
          </body>
        </html>
      </xsl:template>
      <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1513184609983"></xsl:include>
      <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1513184609983"></xsl:include>
      <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1513184609983"></xsl:include>
      <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1513184609983"></xsl:include>
      
      <gen:if test="rows/content/*[@type='form'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='table'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1513184616594"/>
      </gen:if>
    </xsl:stylesheet>
  </gen:template>

  <gen:template name="gen_sectionheader" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <section class="content-header">
          <h2>
            <xsl:value-of select="rows/content/{name()}/fields/{name()}_text/value"/>
          </h2>
        </section>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_toolsbar" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="toolsbar-holder default" gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn">
          <div class="btns-holder pull-right" role="group">
            <xsl:apply-templates select="rows/content/{name()}" mode="gen-buttons">
              <xsl:with-param name="vertical" select="'true'"/>
              <xsl:with-param name="outline" select="'false'"/>
            </xsl:apply-templates>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_view" >
    <gen:variable name="tag" select="name()"/>
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box clearfix view-block" has-img="true">
          <div class="box-body">
            <xsl:if test="rows/content/{name()}/fields/{name()}_img">
              <img src="{concat('{rows/content/',name(),'/fields/',name(),'_img/value}')}"/>
            </xsl:if>
            <div class="view-body clearfix " gen-id="drop-zone" >
              
              <gen:for-each select="fields/*">

                <gen:variable name="fieldTag" select="name()"/> 

                <gen:variable name="type" select="@type"/> 

                <xsl:if test="rows/content/{$tag}/fields/{$fieldTag}">
                  <gen:choose>
                    <gen:when test="$type = 'link'">
                      <gen:variable name="viewlink" select="concat('{rows/content/',$tag,'/fields/',$fieldTag,'/value}')"/>
                      <div class="view-item">
                        <a href="{$viewlink}">
                          <gen:call-template name="gen_target_attr"/>
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/label"/>
                        </a>
                      </div>
                    </gen:when>
                    <gen:when test="@type = 'separator'">
                      <div class="view-item view-separator">
                        <span class="view">
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/label"/>
                        </span>
                      </div>
                    </gen:when>
                    <gen:otherwise>
                      <div class="view-item">
                        <span class="view-label">
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/label"/>
                        </span>
                        <span class="view-value">
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/value"/>
                        </span>
                      </div>
                    </gen:otherwise>
                  </gen:choose>
                </xsl:if>

              </gen:for-each>

            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_form" >

    <gen:variable name="tag" select="name()"/>

    <xsl:if test="rows/content/{name()}">

      <div item-name="{name()}" class="gen-container-item">
        <div class="box igrp-forms">

          <gen:if test="@title and @title != ''">

            <xsl:call-template name="box-header">

              <xsl:with-param name="title" select="rows/content/{name()}/@title"/>

            </xsl:call-template>

          </gen:if>

          <div class="box-body">
            <div role="form" gen-id="drop-zone">
              
              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>

              <gen:for-each select="fields/*[not(@type='hidden')]">

                <gen:variable name="fieldsClass" select="''"/>
                
                <gen:variable name="fieldTag" select="name()"/>

                <gen:variable name="path" select="concat('rows/content/',$tag,'/fields/',$fieldTag)"/>

                <gen:variable name="type" select="@type"/>

                <gen:variable name="labelPath" select="concat('rows/content/',$tag,'/fields/',$fieldTag,'/label')"/>
                
                <gen:variable name="valuePath" select="concat('rows/content/',$tag,'/fields/',$fieldTag,'/value')"/>

                <gen:variable name="isRequired" select="@required='true'"/>

                <gen:variable name="nameAttr">
                  <gen:choose>
                    <gen:when test="contains(@type,'select')">
                      <gen:value-of select="concat('{',concat('rows/content/',$tag,'/fields/',$fieldTag),'/@name','}')"/>
                    </gen:when>
                    <gen:otherwise>
                      <gen:value-of select="concat('{',$path,'/@name','}')"/>
                    </gen:otherwise>
                  </gen:choose>
                </gen:variable>

                <xsl:if test="rows/content/{$tag}/fields/{$fieldTag}">
                  
                <gen:choose>
                  <!-- plaintext.form -->
                  <gen:when test="$type='plaintext'">
                    <div class="col-md-12 clearfix clear form-group" item-name="{$fieldTag}" item-type="{$type}">
                      <xsl:value-of select="{$valuePath}"/>
                    </div>
                  </gen:when>
                  
                  <!-- date.form -->
                  <gen:when test="$type='date'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="isRequiredClass">
                        <gen:with-param name="isRequired" select="$isRequired"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group">
                        <input type="text" value="{concat('{',$valuePath,'}')}" data-range="false" class="form-control gen-date-picker " id="{$nameAttr}" name="{$nameAttr}" format="">
                          <gen:call-template name="gen_fields_attr">
                            <gen:with-param name="fieldPath" select="$path"/>
                          </gen:call-template>
                        </input>
                        <span class="datepicker-clear fa fa-times"/>
                        <span class="input-group-btn gen-date-icon">
                          <a class="btn btn-default">
                            <i class="fa fa-calendar"/>
                          </a>
                        </span>
                      </div>
                    </div>

                  </gen:when>
                  <!-- select.form -->
                  <gen:when test="contains($type,'select')">
                    <gen:variable name="change">
                      <gen:if test="contains($type,'change')">IGRP_change</gen:if>
                    </gen:variable>
                    <div class="form-group col-sm-4 " item-name="{name()}" item-type="select">
                      <gen:call-template name="isRequiredClass">
                        <gen:with-param name="isRequired" select="$isRequired"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <select class="form-control select2 {$change} {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}" >
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <xsl:for-each select="{$path}/list/option">
                          <option value="{'{value}'}">
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
                  </gen:when>
                  
                  <!-- link.form -->
                  <gen:when test="$type='link'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <a href="{concat('{',$valuePath,'}')}" class="link form-link">
                        <gen:call-template name="gen_target_attr"/>
                        <xsl:value-of select="{$labelPath}"/>
                      </a>
                    </div>
                  </gen:when>

                  <!-- textarea.form -->
                  <gen:when test="$type='textarea'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="isRequiredClass">
                        <gen:with-param name="isRequired" select="$isRequired"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <textarea name="{$nameAttr}" class="textarea form-control {$fieldsClass}" >
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <xsl:value-of select="{$valuePath}"/>
                      </textarea>
                    </div>
                  </gen:when>

                  <!-- checkbox.form -->
                  <gen:when test="$type='checkbox'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="isRequiredClass">
                          <gen:with-param name="isRequired" select="$isRequired"/>
                        </gen:call-template>
                        <div class="checkbox form-check-offset">
                          <label>
                            <input type="checkbox" name="{$nameAttr}" value="1" class="checkbox {$fieldsClass}">
                              <gen:call-template name="gen_fields_attr">
                                <gen:with-param name="fieldPath" select="$path"/>
                              </gen:call-template>
                              <xsl:if test="{$valuePath} = '1'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="{$labelPath}"/>
                          </label>
                        </div>
                      </div>
                    </div>
                  </gen:when>

                  <!-- radio.form -->
                  <gen:when test="$type='radio'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="isRequiredClass">
                          <gen:with-param name="isRequired" select="$isRequired"/>
                        </gen:call-template>
                        <div class="radio form-check-offset">
                          <label>
                            <input type="radio" name="{$nameAttr}" value="1" class="radio {$fieldsClass}">
                              <gen:call-template name="gen_fields_attr">
                                <gen:with-param name="fieldPath" select="$path"/>
                              </gen:call-template>
                              <xsl:if test="{$valuePath} = '1'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="{$labelPath}"/>
                          </label>
                        </div>
                      </div>
                    </div>
                  </gen:when>

                  <!-- checkboxlist.form -->
                  <gen:when test="$type='checkboxlist'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <label for="{'{../@name}'}">
                          <xsl:value-of select="{$labelPath}"/>
                        </label>
                        <xsl:for-each select="{$path}/list/option">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" name="{'{../@name}'}" value="{'{value}'}" class="checkboxlist {$fieldsClass}" label="{'{text}'}">
                                <gen:call-template name="gen_fields_attr">
                                  <gen:with-param name="fieldPath" select="$path"/>
                                </gen:call-template>
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
                  </gen:when>

                  <!-- radio.form -->
                  <gen:when test="$type='radiolist'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <label for="{$nameAttr}">
                          <xsl:value-of select="{$labelPath}"/>
                        </label>
                        <xsl:for-each select="{$path}/list/option">
                          <div class="radio">
                            <label>
                              <input type="radio" name="{'{../@name}'}" value="{'{value}'}" class="checkboxlist {$fieldsClass}" label="{'{text}'}">
                                <gen:call-template name="gen_fields_attr">
                                  <gen:with-param name="fieldPath" select="$path"/>
                                </gen:call-template>
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
                  </gen:when>

                  <!-- file.form -->
                  <gen:when test="$type='file'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group">
                        <input type="text" class="form-control not-form {$fieldsClass}" readonly=""/>
                        <span class="input-group-btn">
                          <span class="btn btn-default file-btn-holder">
                            <i class="fa fa-upload"></i>
                            <input id="{$nameAttr}" name="{$nameAttr}" value="{concat('{',$valuePath,'}')}" class="transparent {$fieldsClass}" type="file" multiple="">
                              <gen:call-template name="gen_fields_attr">
                                <gen:with-param name="fieldPath" select="$path"/>
                              </gen:call-template>
                            </input>
                          </span>
                        </span>
                      </div>
                    </div>
                  </gen:when>

                  <!-- color.form -->
                  <gen:when test="$type='color'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group form-color-picker" id="{$nameAttr}_colorp">
                        <input type="text" value="{concat('{',$valuePath,'}')}" format="hex" class="form-control {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}">
                          <gen:call-template name="gen_fields_attr">
                            <gen:with-param name="fieldPath" select="$path"/>
                          </gen:call-template>
                        </input>
                        <span class="input-group-addon">
                          <i></i>
                        </span>
                      </div>
                    </div>
                  </gen:when>

                  <!-- image.form / img.form-->
                  <gen:when test="$type='image' or $type='img' ">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <img style="height:auto;width:100%;position:relative;display:block;" src="{concat('{',$valuePath,'}')}"/>
                    </div>
                  </gen:when>
                  <!-- separator.form -->
                  <gen:when test="$type='separator' or $type='group'">
                    <div class="box-head subtitle clearfix" item-name="{name()}" item-type="{$type}">
                      <span text-color="1">
                        <xsl:value-of select="{$labelPath}"/>
                      </span>
                    </div>
                  </gen:when>
                  <!-- virtualkeyboard.form -->
                  <gen:when test="$type='virtualkeyboard' or contains(@type,'vkb_')">
                    <gen:variable name="vkbType">
                      <gen:choose>
                        <gen:when test="@type = 'vkb_all'">vkb_aznum</gen:when>
                        <gen:otherwise>
                          <gen:value-of select="@type"/>
                        </gen:otherwise>
                      </gen:choose>
                    </gen:variable>
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:variable name="vkbRel" select="concat($valuePath,'/@name')"/>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <xsl:call-template name="VirtualKeyBoard">
                        <xsl:with-param name="type" select="'{$vkbType}'"/>
                        <xsl:with-param name="rel" select="{$vkbRel}"/>
                        <xsl:with-param name="input_type" select="'password'"/>
                        <xsl:with-param name="input_name" select="{$vkbRel}"/>
                        <xsl:with-param name="id" select="{$vkbRel}"/>
                      </xsl:call-template>
                    </div>
                  </gen:when>
                  <!-- texteditor.form -->
                  <gen:when test="$type='texteditor'">
                    <div class="form-group col-md-12" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <textarea id="{$nameAttr}" name="{$nameAttr}" class="gen-texteditor {$fieldsClass}">
                        <xsl:value-of select="{$valuePath}" disable-output-escaping="yes"/>
                      </textarea>
                    </div>
                  </gen:when>

                  <!-- lookup.form -->
                  <gen:when test="contains($type,'lookup') or contains($type,'LOOKUP')">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group">
                        <input type="text" value="{concat('{',$valuePath,'}')}" class="form-control gen-lookup {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}" >
                          <gen:call-template name="gen_fields_attr">
                            <gen:with-param name="fieldPath" select="$path"/>
                          </gen:call-template>
                        </input>
                        <gen:call-template name="gen_lookup">
                          <gen:with-param name="type" select="$type"/>
                          <gen:with-param name="name" select="concat($path,'/@name')"/>
                          <gen:with-param name="js_lookup" select="concat($path,'/lookup/',name())"/>
                          <gen:with-param name="id" select="concat($path,'/@name')"/>
                        </gen:call-template>
                      </div>
                    </div>
                  </gen:when>

                  <gen:when test="$type = 'range'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <input type="{$type}" value="{concat('{',$valuePath,'}')}" class="form-control {$fieldsClass} igrp-range" id="{$nameAttr}" name="{$nameAttr}">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                      </input>
                    </div>
                  </gen:when>

                  <gen:otherwise>
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <input type="{$type}" value="{concat('{',$valuePath,'}')}" class="form-control {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                      </input>
                    </div>
                  </gen:otherwise>

                </gen:choose>

         

                </xsl:if>

              </gen:for-each>

            </div>
          </div>
          <xsl:apply-templates select="rows/content/{name()}/tools-bar" mode="form-buttons"/>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_table" >

    <gen:variable name="tag" select="name()"/>

    <gen:variable name="hasContextMenu">
      <gen:if test="table/context-menu">IGRP_contextmenu</gen:if>
    </gen:variable>

    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box box-table-contents">

          <gen:if test="@title and @title != ''">

            <xsl:call-template name="box-header">

              <xsl:with-param name="title" select="rows/content/{name()}/@title"/>

            </xsl:call-template>
            
          </gen:if>

          <div class="box-body ">
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
            <div class="table-contents-head">
              <div class="table-contents-inner"></div>
            </div>
            <div class="table-box">
              <div class="table-box-inner">
                <table id="{name()}" class="table table-striped {$hasContextMenu} igrp-data-table">
                  <thead>
                    <tr gen-id="drop-zone" gen-field-template="th">
                        
                        <gen:for-each select="fields/*[not(@type='hidden')]">

                          <gen:variable name="fieldTag" select="name()"/>

                          <gen:variable name="fieldPath" select="concat( 'rows/content/',$tag,'/fields/',$fieldTag )"/>
                          
                          <xsl:if test="rows/content/{$tag}/fields/{$fieldTag}">

                            <th item-name="{name()}" item-type="{@type}">
                              <gen:choose>
                                <!-- radio.table th-->
                                <gen:when test="@type = 'radio'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <gen:attribute name="class">bs-checkbox</gen:attribute>
                                  <xsl:value-of select="{$fieldPath}/label"/>
                                </gen:when>
                                <!-- checkbox.table th-->
                                <gen:when test="@type = 'checkbox'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <gen:attribute name="class">bs-checkbox</gen:attribute>
                                  <span class="checkbox-label">
                                    <xsl:value-of select="{$fieldPath}/label"/>
                                  </span>
                                  <input type="checkbox" class="IGRP_checkall no-validation" title="" check-rel="{name()}"/>
                                </gen:when>
                                <!-- color.table th-->
                                <gen:when test="@type = 'color'">
                                  <gen:attribute name="class">color-th</gen:attribute>
                                  <xsl:value-of select="{$fieldPath}/label"/>
                                </gen:when>
                                <!-- default.table th-->
                                <gen:otherwise>
                                  <xsl:value-of select="{$fieldPath}/label"/>
                                </gen:otherwise>

                              </gen:choose>
                            </th>                          
                          </xsl:if>
                        </gen:for-each>

                        <gen:if test="table/context-menu">
                             <th class="igrp-table-ctx-th"></th>
                          </gen:if>

                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="rows/content/{name()}/table/value/row[not(@total='yes')]">

                      <tr gen-id="drop-zone">

                        <xsl:apply-templates mode="context-param" select="context-menu" />

                        <gen:for-each select="fields/*[not(@type='hidden')]">
 
                          <gen:variable name="fname" select="name()"></gen:variable>
                          
                          <xsl:if test="{name()}">

                            <td item-name="{name()}" item-type="{@type}" data-row="{'{position()}'}" data-title="{concat('{../../../fields/',name(),'/label }')}">
                              
                              <gen:variable name="fvalue" select="concat('{',name(),'}')"/>

                              <gen:choose>
                                <!-- checkbox.table td-->
                                <gen:when test="@type = 'checkbox'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <xsl:if test="{name()} != '-0'">
                                    <input type="checkbox" name="p_{$fname}" value="{$fvalue}" check-rel="{name()}">
                                      <xsl:if test="{name()}_check={name()}">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                      </xsl:if>
                                    </input>
                                  </xsl:if>
                                </gen:when>
                                <!-- radio.table td-->
                                <gen:when test="@type = 'radio'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <xsl:if test="{name()} != '-0'">
                                    <input type="radio" name="p_{$fname}" value="{$fvalue}" check-rel="{name()}">
                                      <xsl:if test="{name()}_check={name()}">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                      </xsl:if>
                                    </input>
                                  </xsl:if>
                                </gen:when>
                                <!-- link.table td-->
                                <gen:when test="@type = 'link'">
                                  <xsl:choose>
                                    <xsl:when test="{name()} != ''">
                                      <a href="{$fvalue}" class="link bClick" name="{name()}">
                                        <gen:call-template name="gen_target_attr"/>
                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                      </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <span>
                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                      </span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </gen:when>
                                <!-- color.table td-->
                                <gen:when test="contains(@type,'color')">
                                 <xsl:call-template name="tdcolor">
                                    <xsl:with-param name="color" select="{name()}"/>
                                  </xsl:call-template>
                                </gen:when>
                                <!-- default.table td-->
                                <gen:otherwise>
                                  <span>
                                    <gen:if test="@lookup_parser='true'">
                                      <gen:attribute name="class">lookup-parser</gen:attribute>
                                    </gen:if>
                                    <xsl:value-of select="{name()}"/>
                                  </span>
                                </gen:otherwise>
                              </gen:choose>

                            </td>

                          </xsl:if>

                        </gen:for-each>

                        <gen:if test="table/context-menu">
                          <td class="igrp-table-ctx-td" >
                            <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                              <xsl:with-param name="row-params" select="context-menu"/>
                              <xsl:with-param name="use-fa" select="'true'"/>
                            </xsl:apply-templates>
                          </td>
                        </gen:if>

                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_target_attr">
    <gen:attribute name="target">
      <gen:choose>
        <gen:when test="@target">
          <gen:choose>
            <gen:when test="@target = '_self'">_selfOld</gen:when>
            <gen:otherwise>
              <gen:value-of select="@target"/>
            </gen:otherwise>
          </gen:choose>
        </gen:when>
        <gen:otherwise>_blank</gen:otherwise>
      </gen:choose>
    </gen:attribute>
  </gen:template>
  <gen:template name="isRequiredClass">
    
    <gen:param name="isRequired" select="false()"/>

    <gen:if test="$isRequired">
      <gen:attribute name="required">required</gen:attribute>
    </gen:if>    
  </gen:template>
  <gen:template name="gen_fields_attr">
    <gen:param name="fieldPath"/>

    <gen:if test="./@required = 'true'">
      <gen:attribute name="required">required</gen:attribute>
    </gen:if>
    
    <gen:if test="./@maxlength">
      <gen:attribute name="maxlength"><gen:value-of select="./@maxlength"/></gen:attribute>
    </gen:if>

    <gen:if test="./@readonly='readonly' or ./@readonly='true'">
      <gen:attribute name="readonly">readonly</gen:attribute>
    </gen:if>

    <gen:if test="./@change='true'">
      <gen:attribute name="change">true</gen:attribute>
    </gen:if>

    <gen:if test="./@disabled='true' or ./@disabled='disabled'">
      <gen:attribute name="disabled">disabled</gen:attribute>
    </gen:if>

    <xsl:call-template name="setAttributes">
      <xsl:with-param name="field" select="{$fieldPath}"/>
    </xsl:call-template>
  </gen:template>
  <gen:template name="gen_lookup">
    <gen:param name="type" select="'LOOKUP'"/>
    <gen:param name="name"/>
    <gen:param name="js_lookup"/>
    <gen:param name="id"/>
    <xsl:call-template name="lookup-tool">
      <gen:variable name="isDefault">
        <gen:if test="$type='LOOKUP'">true</gen:if>
      </gen:variable>
      <gen:variable name="page">
        <gen:choose>
          <gen:when test="$isDefault='true'">rows/page</gen:when>
          <gen:otherwise>'LOOKUP'</gen:otherwise>
        </gen:choose>
      </gen:variable>
      <gen:variable name="action">
        <gen:choose>
          <gen:when test="$isDefault='true'">LOOKUP</gen:when>
          <gen:otherwise>
            <gen:value-of select="$type"/>
          </gen:otherwise>
        </gen:choose>
      </gen:variable>
      <xsl:with-param name="page" select="{$page}"/>
      <gen:if test="$isDefault='true'">
        <xsl:with-param name="ad_hoc" select="'1'"/>
      </gen:if>
      <xsl:with-param name="action" select="'{$action}'"/>
      <xsl:with-param name="name" select="{$name}"/>
      <xsl:with-param name="js_lookup" select="{$js_lookup}"/>
      <xsl:with-param name="input-id" select="{$id}"/>
      <xsl:with-param name="btnClass" select="'primary'"/>
    </xsl:call-template>
  </gen:template>

</gen:stylesheet>