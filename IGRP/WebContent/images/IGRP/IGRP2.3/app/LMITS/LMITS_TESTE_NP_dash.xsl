<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORMLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/formlist_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="formlist_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/>
                                                            <table id="formlist_1" class="table table-striped gen-data-table IGRP_formlist" rel="T_formlist_1" data-control="data-formlist_1">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/formlist_1/fields/checkbox_1">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="checkbox_1"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/text_1">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/text_1/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/formlist_1/fields/email_1">
                                                                            <th align="" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/formlist_1/fields/email_1/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)">
                                                                            <th class="table-btn">
                                                                                <xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <a class="formlist-row-add" rel="formlist_1">
                                                                                            <i class="fa fa-plus"/>
                                                                                        </a>
                                                                                    </xsl:if>
                                                                                </xsl:if>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/formlist_1/table/value/row">
                                                                        <tr row="{position()}">
                                                                            <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/>
                                                                            <xsl:if test="checkbox_1">
                                                                                <xsl:if test="not(checkbox_1/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/checkbox_1/label}">
                                                                                        <div class="form-group" item-name="checkbox_1" item-type="checkbox">
                                                                                            <input type="hidden" name="p_checkbox_1_fk_desc" value="{checkbox_1_desc}"/>
                                                                                            <xsl:if test="checkbox_1 != '-0'">
                                                                                                <input type="checkbox" name="p_checkbox_1_fk" value="{checkbox_1}" class="checkbox" rel="F_formlist_1" check-rel="checkbox_1">
                                                                                                    <xsl:if test="checkbox_1_check= checkbox_1">
                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                    </xsl:if>
                                                                                                </input>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="text_1">
                                                                                <xsl:if test="not(text_1/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/text_1/label}" class="text">
                                                                                        <input type="hidden" name="{../../../fields/text_1/@name}_fk_desc" value="{text_1_desc}"/>
                                                                                        <div class="form-group" item-name="text_1" item-type="text">
                                                                                            <input type="text" name="{../../../fields/text_1/@name}_fk" value="{text_1}" class="text form-control" rel="F_formlist_1"/>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="email_1">
                                                                                <xsl:if test="not(email_1/@visible)">
                                                                                    <td align="" data-row="{position()}" data-title="{../../fields/email_1/label}" class="email">
                                                                                        <input type="hidden" name="{../../../fields/email_1/@name}_fk_desc" value="{email_1_desc}"/>
                                                                                        <div class="form-group" item-name="email_1" item-type="email">
                                                                                            <input type="email" name="{../../../fields/email_1/@name}_fk" value="{email_1}" class="email form-control" rel="F_formlist_1"/>
                                                                                        </div>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="not(@nodelete) or not(@noupdate)">
                                                                                <td class="table-btn" data-row="{position()}">
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="formlist-row-remove btn btn-danger" rel="formlist_1">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
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
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORMLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485256755674"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485256755674"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485256755674"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485256755674"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485256755676"/>
</xsl:stylesheet>