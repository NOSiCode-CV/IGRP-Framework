<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
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
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                                                <xsl:if test="rows/content/form_1/fields/organica_fil">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="organica_fil" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/organica_fil/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/organica_fil/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_organica_fil" name="{rows/content/form_1/fields/organica_fil/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/organica_fil/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/menu_principal_fil">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="menu_principal_fil" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/menu_principal_fil/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/menu_principal_fil/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_menu_principal_fil" name="{rows/content/form_1/fields/menu_principal_fil/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/menu_principal_fil/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/titulo_fil">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="titulo_fil" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/titulo_fil/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/titulo_fil/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/titulo_fil/value}" class="form-control" id="{rows/content/form_1/fields/titulo_fil/@name}" name="{rows/content/form_1/fields/titulo_fil/@name}" maxlength="255"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/procedimento_fil">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="procedimento_fil" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/procedimento_fil/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/procedimento_fil/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/procedimento_fil/value}" class="form-control" id="{rows/content/form_1/fields/procedimento_fil/@name}" name="{rows/content/form_1/fields/procedimento_fil/@name}" maxlength="2000"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/estado_fil">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_fil" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/estado_fil/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado_fil/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado_fil" name="{rows/content/form_1/fields/estado_fil/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado_fil/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/list">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="list">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/list/fields"/>
                                                            <table id="list" class="table table-striped gen-data-table IGRP_contextmenu">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/list/fields/menu_principal">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/list/fields/menu_principal/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/list/fields/titulo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/list/fields/titulo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/list/fields/estado">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/list/fields/estado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <th class="igrp-table-ctx-th"/>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/list/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_fk" value="{id}"/>
                                                                            <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                                                                            <input type="hidden" name="p_codigo_fk" value="{codigo}"/>
                                                                            <input type="hidden" name="p_codigo_fk_desc" value="{codigo_desc}"/>
                                                                            <input type="hidden" name="p_link_pagina_fk" value="{link_pagina}"/>
                                                                            <input type="hidden" name="p_link_pagina_fk_desc" value="{link_pagina_desc}"/>
                                                                            <input type="hidden" name="p_ordem_fk" value="{ordem}"/>
                                                                            <input type="hidden" name="p_ordem_fk_desc" value="{ordem_desc}"/>
                                                                            <input type="hidden" name="p_procedimento_fk" value="{procedimento}"/>
                                                                            <input type="hidden" name="p_procedimento_fk_desc" value="{procedimento_desc}"/>
                                                                            <input type="hidden" name="p_organica_fk" value="{organica}"/>
                                                                            <input type="hidden" name="p_organica_fk_desc" value="{organica_desc}"/>
                                                                            <xsl:if test="menu_principal">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/menu_principal/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="menu_principal"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="titulo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/titulo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="titulo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="estado">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/estado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="estado"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487265372304"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487265372304"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487265372304"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487265372304"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487265372304"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1487265372304"/>
</xsl:stylesheet>