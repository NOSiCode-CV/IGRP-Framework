<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TOOLSBAR CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css" rel="stylesheet" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- TABLE CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" rel="stylesheet" />
                <!-- SELECT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/select2/select2.min.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/plugins/select2/select2.style.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-fields=".btns-holder a.btn" item-name="fmn" gen-structure="toolsbar">
                                                        <div role="group" class="btns-holder   pull-right">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'" />
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/descricao_l">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="descricao_l">
                                                                        <label for="{rows/content/form_1/fields/descricao_l/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/descricao_l/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/descricao_l/@name}" value="{rows/content/form_1/fields/descricao_l/value}" id="{rows/content/form_1/fields/descricao_l/@name}" maxlength="100"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/estado_l">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="estado_l">
                                                                        <label for="{rows/content/form_1/fields/estado_l/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_l/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/estado_l/@name}" id="form_1_estado_l">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado_l/list/option">
                                                                                <option label="{text}" value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/tb_toolsbar">
                                                    <div class="toolsbar-holder default gen-container-item " gen-fields=".btns-holder a.btn" item-name="tb_toolsbar" gen-structure="toolsbar">
                                                        <div role="group" class="btns-holder   pull-right">
                                                            <xsl:apply-templates select="rows/content/tb_toolsbar" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'" />
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/gen_table/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="gen_table">
                                                                <thead>
                                                                    <tr />
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr></tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js" />
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js" />
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js" />
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1483639843905" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1483639843905" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1483639843905" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1483639843905" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1483639843905" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1483639843906" />
</xsl:stylesheet>