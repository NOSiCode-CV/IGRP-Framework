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
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/filter_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="filter_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/filter_1/fields"/>
                                                                <xsl:if test="rows/content/filter_1/fields/desc_marca_fil">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="desc_marca_fil" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/desc_marca_fil/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/desc_marca_fil/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/desc_marca_fil/value}" class="form-control" id="{rows/content/filter_1/fields/desc_marca_fil/@name}" name="{rows/content/filter_1/fields/desc_marca_fil/@name}" maxlength="50"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/desc_modelo_fil">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="desc_modelo_fil" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/desc_modelo_fil/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/desc_modelo_fil/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/desc_modelo_fil/value}" class="form-control" id="{rows/content/filter_1/fields/desc_modelo_fil/@name}" name="{rows/content/filter_1/fields/desc_modelo_fil/@name}" maxlength="50"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/list">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="list">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/list/fields"/>
                                                            <table id="list" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/list/fields/desc_marca">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/list/fields/desc_marca/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/list/fields/desc_modelo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/list/fields/desc_modelo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/list/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_modelo_fk" value="{id_modelo}"/>
                                                                            <input type="hidden" name="p_id_modelo_fk_desc" value="{id_modelo_desc}"/>
                                                                            <xsl:if test="desc_marca">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/desc_marca/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="desc_marca"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="desc_modelo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/desc_modelo/label}" class="text">
                                                                                    <span class="lookup-parser">
                                                                                        <xsl:value-of select="desc_modelo"/>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485444339600"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485444339600"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485444339600"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485444339600"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1485444339601"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1485444339601"/>
</xsl:stylesheet>