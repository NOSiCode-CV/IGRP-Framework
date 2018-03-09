<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
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
                                    <div class="row row-msg">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-da8f9871">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_2">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_2">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_2/fields/sectionheader_2_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <div class="gen-tab-holder nav-tabs-custom    gen-container-item " tab-template="boxed" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/welcome">
                                                            <li item-name="welcome" class="active gen-fields-holder" rel="tab-tabcontent_1-welcome">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/welcome/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-welcome">
                                                                    <i class="fa fa-child"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/welcome/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/gestao">
                                                            <li item-name="gestao" class=" gen-fields-holder" rel="tab-tabcontent_1-gestao">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/gestao/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-gestao">
                                                                    <i class="fa fa-video-camera"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/gestao/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/desenvolvimento">
                                                            <li item-name="desenvolvimento" class=" gen-fields-holder" rel="tab-tabcontent_1-desenvolvimento">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/desenvolvimento/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-desenvolvimento">
                                                                    <i class="fa fa-video-camera"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/desenvolvimento/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/contribuicao">
                                                            <li item-name="contribuicao" class=" gen-fields-holder" rel="tab-tabcontent_1-contribuicao">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/contribuicao/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-contribuicao">
                                                                    <i class="fa fa-video-camera"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/contribuicao/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/documentos_gerais">
                                                            <li item-name="documentos_gerais" class=" gen-fields-holder" rel="tab-tabcontent_1-documentos_gerais">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/documentos_gerais/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-documentos_gerais">
                                                                    <i class="fa fa-file-text"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/documentos_gerais/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/welcome">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-welcome" rel="tab-tabcontent_1-welcome">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/welcome/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-aee41e22">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/sectionheader_1">
                                                                                <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                                                    <h2>
                                                                                        <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                                                    </h2>
                                                                                </section>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/paragraph_1">
                                                                                <div class="box gen-container-item " gen-class="" item-name="paragraph_1">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/paragraph_1/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <p>
                                                                                            <xsl:value-of select="rows/content/paragraph_1/fields/paragraph_1_text/value"/>
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/video_2">
                                                                                <div class="gen-container-item " gen-class="" item-name="video_2">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/video_2/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'false'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <iframe style="height:500px" src="{rows/content/video_2/fields/video_2_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/gestao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-gestao" rel="tab-tabcontent_1-gestao">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/gestao/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-f0f4358d">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/paragraph_3">
                                                                                <div class="box gen-container-item " gen-class="" item-name="paragraph_3">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/paragraph_3/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <p>
                                                                                            <xsl:value-of select="rows/content/paragraph_3/fields/paragraph_3_text/value"/>
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/video_3">
                                                                                <div class="gen-container-item " gen-class="" item-name="video_3">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/video_3/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'false'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <iframe style="height:500px" src="{rows/content/video_3/fields/video_3_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/desenvolvimento">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-desenvolvimento" rel="tab-tabcontent_1-desenvolvimento">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/desenvolvimento/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-84df9d98">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <div class="gen-tab-holder nav-tabs-custom    gen-container-item " tab-template="accordion" gen-class="" item-name="tabcontent_3">
                                                                                <ul class="nav nav-tabs">
                                                                                    <xsl:if test="rows/content/tabcontent_3/fields/como_instalar_igrp_java_framework">
                                                                                        <li item-name="como_instalar_igrp_java_framework" class="active gen-fields-holder" rel="tab-tabcontent_3-como_instalar_igrp_java_framework">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_3/fields/como_instalar_igrp_java_framework/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_3-como_instalar_igrp_java_framework">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_3/fields/como_instalar_igrp_java_framework/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_3/fields/my_first_app">
                                                                                        <li item-name="my_first_app" class=" gen-fields-holder" rel="tab-tabcontent_3-my_first_app">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_3/fields/my_first_app/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_3-my_first_app">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_3/fields/my_first_app/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                </ul>
                                                                                <div class="tab-content">
                                                                                    <xsl:if test="rows/content/tabcontent_3/fields/como_instalar_igrp_java_framework">
                                                                                        <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_3-como_instalar_igrp_java_framework" rel="tab-tabcontent_3-como_instalar_igrp_java_framework">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_3/fields/como_instalar_igrp_java_framework/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-6c37894d">
                                                                                                <div class="gen-column col-sm-12">
                                                                                                    <div class="gen-inner">
                                                                                                        <xsl:if test="rows/content/paragraph_8">
                                                                                                            <div class="box gen-container-item " gen-class="" item-name="paragraph_8">
                                                                                                                <xsl:call-template name="box-header">
                                                                                                                    <xsl:with-param name="title" select="rows/content/paragraph_8/@title"/>
                                                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                                                    <xsl:with-param name="collapsed" select="'false'"/>
                                                                                                                </xsl:call-template>
                                                                                                                <div class="box-body">
                                                                                                                    <p>
                                                                                                                        <xsl:value-of select="rows/content/paragraph_8/fields/paragraph_8_text/value"/>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/video_6">
                                                                                                            <div class="gen-container-item " gen-class="" item-name="video_6">
                                                                                                                <xsl:call-template name="box-header">
                                                                                                                    <xsl:with-param name="title" select="rows/content/video_6/@title"/>
                                                                                                                    <xsl:with-param name="collapsible" select="'false'"/>
                                                                                                                    <xsl:with-param name="collapsed" select="'false'"/>
                                                                                                                </xsl:call-template>
                                                                                                                <div class="box-body">
                                                                                                                    <iframe style="height:500px" src="{rows/content/video_6/fields/video_6_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_3/fields/my_first_app">
                                                                                        <div class="tab-pane gen-rows-holder " id="tab-tabcontent_3-my_first_app" rel="tab-tabcontent_3-my_first_app">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_3/fields/my_first_app/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-f32a67be">
                                                                                                <div class="gen-column col-sm-12">
                                                                                                    <div class="gen-inner">
                                                                                                        <xsl:if test="rows/content/paragraph_5">
                                                                                                            <div class="box gen-container-item " gen-class="" item-name="paragraph_5">
                                                                                                                <xsl:call-template name="box-header">
                                                                                                                    <xsl:with-param name="title" select="rows/content/paragraph_5/@title"/>
                                                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                                                    <xsl:with-param name="collapsed" select="'false'"/>
                                                                                                                </xsl:call-template>
                                                                                                                <div class="box-body">
                                                                                                                    <p>
                                                                                                                        <xsl:value-of select="rows/content/paragraph_5/fields/paragraph_5_text/value"/>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/video_1">
                                                                                                            <div class="box gen-container-item " gen-class="" item-name="video_1">
                                                                                                                <xsl:call-template name="box-header">
                                                                                                                    <xsl:with-param name="title" select="rows/content/video_1/@title"/>
                                                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                                                    <xsl:with-param name="collapsed" select="'false'"/>
                                                                                                                </xsl:call-template>
                                                                                                                <div class="box-body">
                                                                                                                    <iframe style="height:500px" src="{rows/content/video_1/fields/video_1_text/value}" frameborder="0" allowfullscreen=""/>
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
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/contribuicao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-contribuicao" rel="tab-tabcontent_1-contribuicao">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/contribuicao/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-b238c748">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/paragraph_7">
                                                                                <div class="box gen-container-item " gen-class="" item-name="paragraph_7">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/paragraph_7/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <p>
                                                                                            <xsl:value-of select="rows/content/paragraph_7/fields/paragraph_7_text/value"/>
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/video_7">
                                                                                <div class="gen-container-item " gen-class="" item-name="video_7">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/video_7/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'false'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <iframe style="height:500px" src="{rows/content/video_7/fields/video_7_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/documentos_gerais">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-documentos_gerais" rel="tab-tabcontent_1-documentos_gerais">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/documentos_gerais/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-89fcdb68">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/paragraph_6">
                                                                                <div class="box gen-container-item " gen-class="" item-name="paragraph_6">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/paragraph_6/@title"/>
                                                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                                                        <xsl:with-param name="collapsed" select="'false'"/>
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <p>
                                                                                            <xsl:value-of select="rows/content/paragraph_6/fields/paragraph_6_text/value"/>
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_1">
                                                                                <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                                                    <div class="box-body ">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                                                        <div class="table-contents-head">
                                                                                            <div class="table-contents-inner"></div>
                                                                                        </div>
                                                                                        <div class="table-box">
                                                                                            <div class="table-box-inner">
                                                                                                <table id="table_1" class="table table-striped   align" exports="null">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <xsl:if test="rows/content/table_1/fields/documento">
                                                                                                                <th align="left" class=" gen-fields-holder">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/table_1/fields/documento/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                            <xsl:if test="rows/content/table_1/fields/ver">
                                                                                                                <th align="left" class=" gen-fields-holder">
                                                                                                                    <span>
                                                                                                                        <xsl:value-of select="rows/content/table_1/fields/ver/label"/>
                                                                                                                    </span>
                                                                                                                </th>
                                                                                                            </xsl:if>
                                                                                                            <th class="igrp-table-ctx-th"/>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                                                                            <tr>
                                                                                                                <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                                                <xsl:if test="documento">
                                                                                                                    <td align="left" data-row="{position()}" data-title="{../../../fields/documento/label}" class="text" item-name="documento">
                                                                                                                        <span class="">
                                                                                                                            <xsl:value-of select="documento"/>
                                                                                                                        </span>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                                <xsl:if test="ver">
                                                                                                                    <td align="left" data-row="{position()}" data-title="{../../label/ver}" class="link" item-name="ver">
                                                                                                                        <xsl:choose>
                                                                                                                            <xsl:when test="ver != ''">
                                                                                                                                <a href="{ver}" class="link bClick btn btn-link " target-fields="" target="_newtab" name="ver">
                                                                                                                                    <i class="fa fa-link"/>
                                                                                                                                    <span>
                                                                                                                                        <xsl:value-of select="ver_desc"/>
                                                                                                                                    </span>
                                                                                                                                </a>
                                                                                                                            </xsl:when>
                                                                                                                            <xsl:otherwise>
                                                                                                                                <span>
                                                                                                                                    <xsl:value-of select="ver_desc"/>
                                                                                                                                </span>
                                                                                                                            </xsl:otherwise>
                                                                                                                        </xsl:choose>
                                                                                                                    </td>
                                                                                                                </xsl:if>
                                                                                                                <td class="igrp-table-ctx-td">
                                                                                                                    <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                                                                                        <xsl:with-param name="row-params" select="context-menu"/>
                                                                                                                    </xsl:apply-templates>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </xsl:for-each>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
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
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js?v={$version}"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1516443986600"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1516443986600"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1516443986600"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1516443986600"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1516443986601"/>
</xsl:stylesheet>
