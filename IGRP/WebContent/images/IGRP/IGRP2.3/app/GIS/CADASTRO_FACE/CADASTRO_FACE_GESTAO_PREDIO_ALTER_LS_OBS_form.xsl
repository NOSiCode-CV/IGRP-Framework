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
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
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
                                                <xsl:if test="rows/content/page_obs">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_obs">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_obs/fields/page_obs_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_obs">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_obs">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_obs/fields"/>
                                                                <xsl:if test="rows/content/form_obs/fields/reg_observacao">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="reg_observacao" item-type="textarea">
                                                                        <label for="{rows/content/form_obs/fields/reg_observacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_obs/fields/reg_observacao/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_obs/fields/reg_observacao/@name}" class="textarea form-control" maxlength="4000">
                                                                            <xsl:value-of select="rows/content/form_obs/fields/reg_observacao/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_obs/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/ls_observacao">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="ls_observacao">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/ls_observacao/fields"/>
                                                            <table id="ls_observacao" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/ls_observacao/fields/entidade">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/ls_observacao/fields/entidade/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/ls_observacao/fields/data_obs">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/ls_observacao/fields/data_obs/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/ls_observacao/fields/observacao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/ls_observacao/fields/observacao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/ls_observacao/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="entidade">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/entidade/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="entidade"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_obs">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_obs/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_obs"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="observacao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/observacao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="observacao"/>
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
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487253085996"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487253085996"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487253085996"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487253085996"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487253085996"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1487253085996"/>
</xsl:stylesheet>