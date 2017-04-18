<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/paragraph_1">
                                                    <div class="gen-container-item " gen-class="" item-name="paragraph_1">
                                                        <div class="box-body">
                                                            <p>
                                                                <xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/paragraph_1_text/value"/>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="gen_form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_form_1/fields"/>
                                                                <xsl:if test="rows/content/gen_form_1/fields/text_1">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="text_1" item-type="text">
                                                                        <label for="{rows/content/gen_form_1/fields/text_1/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/text_1/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/gen_form_1/fields/text_1/value}" class="form-control" id="{rows/content/gen_form_1/fields/text_1/@name}" name="{rows/content/gen_form_1/fields/text_1/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/gen_form_1/fields/number_1">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="number_1" item-type="number">
                                                                        <label for="{rows/content/gen_form_1/fields/number_1/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/number_1/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/gen_form_1/fields/number_1/value}" class="form-control" id="{rows/content/gen_form_1/fields/number_1/@name}" name="{rows/content/gen_form_1/fields/number_1/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/gen_form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/titulo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/titulo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/date_1">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/date_1/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="titulo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/titulo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="titulo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="date_1">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/date_1/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="date_1"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="table-context-menu"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484062807841"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484062807841"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484062807841"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484062807841"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1484062807841"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1484062807841"/>
</xsl:stylesheet>