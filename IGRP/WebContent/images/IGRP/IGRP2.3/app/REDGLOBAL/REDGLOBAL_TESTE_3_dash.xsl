<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
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
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/org_fk">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="org_fk">
                                                                        <label for="{rows/content/form_1/fields/org_fk/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/org_fk/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/org_fk/@name}" id="form_1_org_fk">
                                                                            <xsl:for-each select="rows/content/form_1/fields/org_fk/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/prof_tp_fk">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="prof_tp_fk">
                                                                        <label for="{rows/content/form_1/fields/prof_tp_fk/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/prof_tp_fk/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/prof_tp_fk/@name}" id="form_1_prof_tp_fk">
                                                                            <xsl:for-each select="rows/content/form_1/fields/prof_tp_fk/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="nome">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/nome/@name}" value="{rows/content/form_1/fields/nome/value}" id="{rows/content/form_1/fields/nome/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/table_1/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="table_1">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/organica">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/organica/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/perfil">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/perfil/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/username">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/username/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
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
                                                                            <xsl:if test="username">
                                                                                <td class="text" align="left" data-title="{../../fields/username/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="username" />
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1481131576431" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1481131576431" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1481131576431" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1481131576431" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1481131576431" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1481131576431" />
</xsl:stylesheet>