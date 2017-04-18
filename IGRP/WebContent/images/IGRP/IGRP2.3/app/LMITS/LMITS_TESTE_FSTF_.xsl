<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- SMALLBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/smallbox/smallbox.css"/>
                <!-- STATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css"/>
                <style/>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_1">
                                                            <li item-name="tab_item_1" class="active gen-fields-holder" rel="tab-tabcontent_1-tab_item_1">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_1">
                                                                    <i class="fa fa-dot-circle-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/tab_item_1/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_2">
                                                            <li item-name="tab_item_2" class=" gen-fields-holder" rel="tab-tabcontent_1-tab_item_2">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-tab_item_2">
                                                                    <i class="fa fa-dot-circle-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/tab_item_2/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_1">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-tab_item_1" rel="tab-tabcontent_1-tab_item_1">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/smallbox_1">
                                                                                <div class="small-box panel {rows/content/smallbox_1/fields/smallbox_1_bg/value} gen-container-item " item-name="smallbox_1">
                                                                                    <div class="panel-heading clearfix">
                                                                                        <div class="sb-icon">
                                                                                            <i class="fa {rows/content/smallbox_1/fields/smallbox_1_icon/value} fa-3x"/>
                                                                                        </div>
                                                                                        <div class="col-xs-12 text-right pull-right sb-contents">
                                                                                            <div class="huge">
                                                                                                <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_value/value"/>
                                                                                            </div>
                                                                                            <div>
                                                                                                <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_sbtitle/value"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <a href="{rows/content/smallbox_1/fields/smallbox_1_link/value}" class="{rows/content/smallbox_1/fields/smallbox_1_bg/value}-text">
                                                                                        <div class="panel-footer">
                                                                                            <span class="pull-left">
                                                                                                <xsl:value-of select="rows/content/smallbox_1/fields/smallbox_1_link_label/value"/>
                                                                                            </span>
                                                                                            <span class="pull-right">
                                                                                                <i class="fa fa-arrow-circle-right"/>
                                                                                            </span>
                                                                                            <div class="clearfix"/></div>
                                                                                    </a>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/tab_item_2">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-tab_item_2" rel="tab-tabcontent_1-tab_item_2">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/statbox_1">
                                                                                <div class="statbox_container gen-container-item " item-name="statbox_1">
                                                                                    <div class="statbox {rows/content/statbox_1/fields/statbox_1_bg/value}">
                                                                                        <div class="boxchart">
                                                                                            <canvas/>
                                                                                        </div>
                                                                                        <div class="number">
                                                                                            <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_value/value"/>
                                                                                            <i class="fa {rows/content/statbox_1/fields/statbox_1_icon/value}" aria-hidden="true"/>
                                                                                        </div>
                                                                                        <div class="title">
                                                                                            <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_btitle/value"/>
                                                                                        </div>
                                                                                        <div class="footer">
                                                                                            <a href="{rows/content/statbox_1/fields/statbox_1_link/value}">
                                                                                                <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_link_text/value"/>
                                                                                            </a>
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
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1482429441855"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1482429441855"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1482429441855"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1482429441855"/>
</xsl:stylesheet>