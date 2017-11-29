<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
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
                                    <div class="row " id="row-91d33195">
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
                                                        <xsl:if test="rows/content/tabcontent_1/fields/videos">
                                                            <li item-name="videos" class="active gen-fields-holder" rel="tab-tabcontent_1-videos">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/videos/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-videos">
                                                                    <i class="fa fa-video-camera"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/videos/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/documentos">
                                                            <li item-name="documentos" class=" gen-fields-holder" rel="tab-tabcontent_1-documentos">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/documentos/value"/>
                                                                </xsl:call-template>
                                                                <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-documentos">
                                                                    <i class="fa fa-file-text"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/documentos/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/videos">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-videos" rel="tab-tabcontent_1-videos">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/videos/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-da24fef1">
                                                                    <div class="gen-column col-sm-12">
                                                                        <div class="gen-inner">
                                                                            <div class="gen-tab-holder nav-tabs-custom    gen-container-item " tab-template="accordion" gen-class="" item-name="tabcontent_2">
                                                                                <ul class="nav nav-tabs">
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/bem_vindo">
                                                                                        <li item-name="bem_vindo" class="active gen-fields-holder" rel="tab-tabcontent_2-bem_vindo">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/bem_vindo/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-bem_vindo">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_2/fields/bem_vindo/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/como_instalar_o_igrp">
                                                                                        <li item-name="como_instalar_o_igrp" class=" gen-fields-holder" rel="tab-tabcontent_2-como_instalar_o_igrp">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/como_instalar_o_igrp/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-como_instalar_o_igrp">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_2/fields/como_instalar_o_igrp/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/demo_de_um_aplicacao">
                                                                                        <li item-name="demo_de_um_aplicacao" class=" gen-fields-holder" rel="tab-tabcontent_2-demo_de_um_aplicacao">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/demo_de_um_aplicacao/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-demo_de_um_aplicacao">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_2/fields/demo_de_um_aplicacao/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/minha_primeira_aplicacao">
                                                                                        <li item-name="minha_primeira_aplicacao" class=" gen-fields-holder" rel="tab-tabcontent_2-minha_primeira_aplicacao">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/minha_primeira_aplicacao/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-minha_primeira_aplicacao">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_2/fields/minha_primeira_aplicacao/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/como_contribuir">
                                                                                        <li item-name="como_contribuir" class=" gen-fields-holder" rel="tab-tabcontent_2-como_contribuir">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/como_contribuir/value"/>
                                                                                            </xsl:call-template>
                                                                                            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_2-como_contribuir">
                                                                                                <i class="fa fa-hand-o-right"/>
                                                                                                <span>
                                                                                                    <xsl:value-of select="rows/content/tabcontent_2/fields/como_contribuir/label"/>
                                                                                                </span>
                                                                                            </a>
                                                                                        </li>
                                                                                    </xsl:if>
                                                                                </ul>
                                                                                <div class="tab-content">
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/bem_vindo">
                                                                                        <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_2-bem_vindo" rel="tab-tabcontent_2-bem_vindo">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/bem_vindo/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-b9fc232e">
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
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/como_instalar_o_igrp">
                                                                                        <div class="tab-pane gen-rows-holder " id="tab-tabcontent_2-como_instalar_o_igrp" rel="tab-tabcontent_2-como_instalar_o_igrp">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/como_instalar_o_igrp/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-e05a2f5e">
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
                                                                                                                    <iframe style="height:400px" src="{rows/content/video_3/fields/video_3_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/demo_de_um_aplicacao">
                                                                                        <div class="tab-pane gen-rows-holder " id="tab-tabcontent_2-demo_de_um_aplicacao" rel="tab-tabcontent_2-demo_de_um_aplicacao">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/demo_de_um_aplicacao/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-d6fefc98">
                                                                                                <div class="gen-column col-sm-12">
                                                                                                    <div class="gen-inner">
                                                                                                        <xsl:if test="rows/content/paragraph_5">
                                                                                                            <div class="gen-container-item " gen-class="" item-name="paragraph_5">
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
                                                                                                        <xsl:if test="rows/content/video_5">
                                                                                                            <div class="gen-container-item " gen-class="" item-name="video_5">
                                                                                                                <div class="box-body">
                                                                                                                    <iframe style="height:400px" src="{rows/content/video_5/fields/video_5_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/minha_primeira_aplicacao">
                                                                                        <div class="tab-pane gen-rows-holder " id="tab-tabcontent_2-minha_primeira_aplicacao" rel="tab-tabcontent_2-minha_primeira_aplicacao">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/minha_primeira_aplicacao/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-99ffdc78">
                                                                                                <div class="gen-column col-sm-12">
                                                                                                    <div class="gen-inner">
                                                                                                        <xsl:if test="rows/content/paragraph_4">
                                                                                                            <div class="box gen-container-item " gen-class="" item-name="paragraph_4">
                                                                                                                <xsl:call-template name="box-header">
                                                                                                                    <xsl:with-param name="title" select="rows/content/paragraph_4/@title"/>
                                                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                                                    <xsl:with-param name="collapsed" select="'false'"/>
                                                                                                                </xsl:call-template>
                                                                                                                <div class="box-body">
                                                                                                                    <p>
                                                                                                                        <xsl:value-of select="rows/content/paragraph_4/fields/paragraph_4_text/value"/>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/video_4">
                                                                                                            <div class="gen-container-item " gen-class="" item-name="video_4">
                                                                                                                <div class="box-body">
                                                                                                                    <iframe style="height:400px" src="{rows/content/video_4/fields/video_4_text/value}" frameborder="0" allowfullscreen=""/>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="rows/content/tabcontent_2/fields/como_contribuir">
                                                                                        <div class="tab-pane gen-rows-holder " id="tab-tabcontent_2-como_contribuir" rel="tab-tabcontent_2-como_contribuir">
                                                                                            <xsl:call-template name="get-active-tab">
                                                                                                <xsl:with-param name="value" select="rows/content/tabcontent_2/fields/como_contribuir/value"/>
                                                                                                <xsl:with-param name="class" select="'tab-pane'"/>
                                                                                            </xsl:call-template>
                                                                                            <div class="row " id="row-3e9140a0">
                                                                                                <div class="gen-column col-sm-12">
                                                                                                    <div class="gen-inner">
                                                                                                        <xsl:if test="rows/content/paragraph_2">
                                                                                                            <div class="box gen-container-item " gen-class="" item-name="paragraph_2">
                                                                                                                <xsl:call-template name="box-header">
                                                                                                                    <xsl:with-param name="title" select="rows/content/paragraph_2/@title"/>
                                                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                                                    <xsl:with-param name="collapsed" select="'false'"/>
                                                                                                                </xsl:call-template>
                                                                                                                <div class="box-body">
                                                                                                                    <p>
                                                                                                                        <xsl:value-of select="rows/content/paragraph_2/fields/paragraph_2_text/value"/>
                                                                                                                    </p>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="rows/content/video_1">
                                                                                                            <div class="gen-container-item " gen-class="" item-name="video_1">
                                                                                                                <div class="box-body">
                                                                                                                    <iframe style="height:400px" src="{rows/content/video_1/fields/video_1_text/value}" frameborder="0" allowfullscreen=""/>
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
                                                        <xsl:if test="rows/content/tabcontent_1/fields/documentos">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-documentos" rel="tab-tabcontent_1-documentos">
                                                                <xsl:call-template name="get-active-tab">
                                                                    <xsl:with-param name="value" select="rows/content/tabcontent_1/fields/documentos/value"/>
                                                                    <xsl:with-param name="class" select="'tab-pane'"/>
                                                                </xsl:call-template>
                                                                <div class="row " id="row-bb565826">
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
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1511971141625"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1511971141625"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1511971141625"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1511971141625"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1511971141626"/>
</xsl:stylesheet>
