<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                    <div class="row" id="row-d7adaf0e">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/nome_utente">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="nome_utente" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome_utente/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome_utente/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome_utente/value}" class="form-control " id="{rows/content/form_1/fields/nome_utente/@name}" name="{rows/content/form_1/fields/nome_utente/@name}" maxlength="98" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_consulta">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="data_consulta" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_consulta/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_consulta/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_consulta/value}" class="form-control gen-date " id="form_1-data_consulta" name="{rows/content/form_1/fields/data_consulta/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/nome_utente">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/nome_utente/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/medico_a_consultar">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/medico_a_consultar/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/data_da_consulta">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/data_da_consulta/label"/>
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
                                                                            <input name="p_id_fk" value="{id}" type="hidden"/>
                                                                            <input name="p_id_fk_desc" value="{id_desc}" type="hidden"/>
                                                                            <xsl:if test="nome_utente">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome_utente/label}" class="text" item-name="nome_utente">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome_utente"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="medico_a_consultar">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/medico_a_consultar/label}" class="text" item-name="medico_a_consultar">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="medico_a_consultar"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_da_consulta">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_da_consulta/label}" class="date" item-name="data_da_consulta">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_da_consulta"/>
                                                                                    </span>
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
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1502887937790"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1502887937790"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1502887937790"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1502887937790"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1502887937790"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1502887937791"/>
</xsl:stylesheet>
