<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/pesquisa_organica">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="pesquisa_organica" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/pesquisa_organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/pesquisa_organica/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/pesquisa_organica/value}" class="form-control gen-lookup IGRP_change" id="form_1_pesquisa_organica" name="{rows/content/form_1/fields/pesquisa_organica/@name}" required="required" maxlength="100"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/pesquisa_organica/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/pesquisa_organica/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_pesquisa_organica'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/utilizador">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="utilizador" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/utilizador/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/utilizador/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/utilizador/value}" class="form-control gen-lookup " id="form_1_utilizador" name="{rows/content/form_1/fields/utilizador/@name}" required="required" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/utilizador/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/utilizador/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_utilizador'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/organica_rh">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/organica_rh/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/checkbox_1">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="checkbox_1"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_org_rh_fk" value="{id_org_rh}"/>
                                                                            <input type="hidden" name="p_id_org_rh_fk_desc" value="{id_org_rh_desc}"/>
                                                                            <xsl:if test="organica_rh">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/organica_rh/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="organica_rh"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="checkbox_1">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/checkbox_1}" class="bs-checkbox">
                                                                                    <xsl:if test="checkbox_1 != '-0'">
                                                                                        <input type="checkbox" name="p_checkbox_1" value="{checkbox_1}" check-rel="checkbox_1">
                                                                                            <xsl:if test="checkbox_1_check=checkbox_1">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
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
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492086431972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492086431972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492086431972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492086431972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492086431972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1492086431972"/>
</xsl:stylesheet>