<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TABLE CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" rel="stylesheet" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title" gen-class="">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/plaintext">
                                                                    <div class="col-md-12  form-group  gen-fields-holder" item-type="plaintext" item-name="plaintext">
                                                                        <xsl:value-of select="rows/content/form_1/fields/plaintext/value" />
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table" gen-class="">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/gen_table/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="gen_table">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/utilizador">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/utilizador/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ilha">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ilha/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/organica">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/organica/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/perfil">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/perfil/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/start_time">
                                                                            <th class=" gen-fields-holder" align="center">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/start_time/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/end_time">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/end_time/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                            <xsl:if test="utilizador">
                                                                                <td class="text" align="left" data-title="{../../fields/utilizador/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="utilizador" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ilha">
                                                                                <td class="text" align="left" data-title="{../../fields/ilha/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="ilha" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="organica">
                                                                                <td class="text" align="left" data-title="{../../fields/organica/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="organica" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="perfil">
                                                                                <td class="text" align="left" data-title="{../../fields/perfil/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="perfil" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="start_time">
                                                                                <td class="date" align="center" data-title="{../../fields/start_time/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="start_time" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="end_time">
                                                                                <td class="date" align="left" data-title="{../../fields/end_time/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="end_time" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js" />
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js" />
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485451399223" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485451399223" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485451399223" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485451399223" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1485451399224" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485451399224" />
</xsl:stylesheet>