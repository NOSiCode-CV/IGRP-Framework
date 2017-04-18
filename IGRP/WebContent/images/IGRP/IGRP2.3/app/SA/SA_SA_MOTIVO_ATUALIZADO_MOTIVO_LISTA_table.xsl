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
                                                <xsl:if test="rows/content/form">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form/fields"/>
                                                                <xsl:if test="rows/content/form/fields/id_aplicacao">
                                                                    <div class="col-md-4 form-group  gen-fields-holder" item-name="id_aplicacao" item-type="select">
                                                                        <label for="{rows/content/form/fields/id_aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form/fields/id_aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_id_aplicacao" name="{rows/content/form/fields/id_aplicacao/@name}">
                                                                            <xsl:for-each select="rows/content/form/fields/id_aplicacao/list/option">
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
                                                                <xsl:if test="rows/content/form/fields/id_organica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="id_organica" item-type="select">
                                                                        <label for="{rows/content/form/fields/id_organica/@name}">
                                                                            <xsl:value-of select="rows/content/form/fields/id_organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_id_organica" name="{rows/content/form/fields/id_organica/@name}">
                                                                            <xsl:for-each select="rows/content/form/fields/id_organica/list/option">
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
                                                                <xsl:if test="rows/content/form/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/form/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form/fields/nome/value}" class="form-control" id="{rows/content/form/fields/nome/@name}" name="{rows/content/form/fields/nome/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form/fields/estado">
                                                                    <div class="col-md-2 form-group  gen-fields-holder" item-name="estado" item-type="select">
                                                                        <label for="{rows/content/form/fields/estado/@name}">
                                                                            <xsl:value-of select="rows/content/form/fields/estado/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_estado" name="{rows/content/form/fields/estado/@name}">
                                                                            <xsl:for-each select="rows/content/form/fields/estado/list/option">
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
                                                        <xsl:apply-templates select="rows/content/form/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/nome">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nome/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data_insert">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data_insert/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/utilizador">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/utilizador/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/estado">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/estado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/imagem">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/imagem/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_fk" value="{id}"/>
                                                                            <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                                                                            <xsl:if test="nome">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_insert">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_insert/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_insert"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="utilizador">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/utilizador/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="utilizador"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="estado">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/estado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="estado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="imagem">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/imagem}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="imagem != ''">
                                                                                            <a href="{imagem}" class="link bClick" target="_self" name="imagem">
                                                                                                <xsl:value-of select="imagem_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="imagem_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/gen_table/table/context-menu" mode="table-context-menu"/>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1486983434402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1486983434402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1486983434402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1486983434402"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1486983434403"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1486983434403"/>
</xsl:stylesheet>