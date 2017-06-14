<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="home-header" />
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"></script>
            </head>
            <body class="bodyColor">
                <div class="IGRP_overlay" />
                <xsl:call-template name="home-top-main" />
                <div id="igrp-bodyPage">
                    <xsl:call-template name="home-slide-menu" />
                    <div class="bodyPageRigth">
                        <xsl:apply-templates select="rows/content/messages" mode="notif_messages" />
                        <form class="default_form" name="formular_default" method="post" id="formular_default" enctype="multipart/form-data" action="#">
                            <div class="gen-row">
                                <div class="gen-column col-1-1">
                                    <div class="gen-inner">
                                        <xsl:if  test="rows/content/form_1">
                                            <div class="box-content resetPadding gen-container-item" gen-id="body">
                                                <div class="box-collapser">
                                                    <div class="col">
                                                        <div gen-id="drop-zone">
                                                            <xsl:apply-templates  select="rows/content/form_1/fields" mode="hidden-fields" />
                                                            <xsl:if  test="rows/content/form_1/fields/data_inicio">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="data_inicio">
                                                                    <div class="igrp_item date">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/form_1/fields/data_inicio/label) &gt; 45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/data_inicio/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="itemIcon">
                                                                            <input class="date  " type="text" name="{rows/content/form_1/fields/data_inicio/@name}" trel="IGRP_datePicker" value="{rows/content/form_1/fields/data_inicio/value}">
                                                                                <xsl:call-template name="FIELD_validator">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/data_inicio" />
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <div class="calendar" /></div>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/form_1/fields/data_fim">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="data_fim">
                                                                    <div class="igrp_item date">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/form_1/fields/data_fim/label) &gt; 45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/data_fim/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="itemIcon">
                                                                            <input class="date  " type="text" name="{rows/content/form_1/fields/data_fim/@name}" trel="IGRP_datePicker" value="{rows/content/form_1/fields/data_fim/value}">
                                                                                <xsl:call-template name="FIELD_validator">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/data_fim" />
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <div class="calendar" /></div>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/form_1/fields/perido">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="select">
                                                                    <div class="igrp_item select">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/form_1/fields/perido/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/perido/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span>
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/perido/label" />
                                                                                </span>
                                                                            </span>
                                                                        </label>
                                                                        <select class="select  " name="{rows/content/form_1/fields/perido/@name}" data-placeholder="{rows/content/form_1/fields/perido/list/option[position() = 1]/text}" chosen="select" id="{rows/content/form_1/fields/perido/@name}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/perido" />
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/perido/list/option[position() != 1]">
                                                                                <option value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/form_1/fields/recurso">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="recurso">
                                                                    <div class="igrp_item LOOKUP">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/form_1/fields/recurso/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/recurso/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/form_1/fields/recurso/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="itemIcon">
                                                                            <input class="LOOKUP  " type="LOOKUP" name="{rows/content/form_1/fields/recurso/@name}" value="{rows/content/form_1/fields/recurso/value}">
                                                                                <xsl:call-template name="FIELD_validator">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/recurso" />
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page" />
                                                                                <xsl:with-param name="ad_hoc" select="'1'" />
                                                                                <xsl:with-param name="action" select="'LOOKUP'" />
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/recurso/@name" />
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/recurso/lookup" />
                                                                            </xsl:call-template>
                                                                        </div>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/form_1/fields/aplicacao">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="select">
                                                                    <div class="igrp_item select">
                                                                        <label class="">
                                                                            <xsl:if test="string-length(rows/content/form_1/fields/aplicacao/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/aplicacao/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span>
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/form_1/fields/aplicacao/label" />
                                                                                </span>
                                                                            </span>
                                                                        </label>
                                                                        <select class="select  " name="{rows/content/form_1/fields/aplicacao/@name}" data-placeholder="{rows/content/form_1/fields/aplicacao/list/option[position() = 1]/text}" chosen="select" id="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/aplicacao" />
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option[position() != 1]">
                                                                                <option value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                        </div>
                                                        <div class="_clear" />
                                                        <xsl:if  test="rows/content/form_1/tools-bar">
                                                            <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="button-bar" />
                                                        </xsl:if>
                                                    </div>
                                                    <div class="_clear" /></div>
                                            </div>
                                        </xsl:if>
                                        <xsl:if  test="rows/content/table_1">
                                            <div class="box-content resetPadding gen-container-item" gen-structure="label,values">
                                                <xsl:call-template  name="table-view">
                                                    <xsl:with-param name="rel" select="'table_1'" />
                                                </xsl:call-template>
                                                <div class="box-collapser">
                                                    <div class="col borderColor">
                                                        <div class="box-table table-responsive">
                                                            <div class="table-container">
                                                                <xsl:variable  name="hasContextMenu" select="rows/content/table_1/table/context-menu" />
                                                                <xsl:if  test="$hasContextMenu">
                                                                    <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="context-menu">
                                                                        <xsl:with-param name="contextId" select="'table_1'" />
                                                                    </xsl:apply-templates>
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/table_1/fields/*[@type='color']">
                                                                    <xsl:apply-templates select="rows/content/table_1/table/legend_color" mode="table-legend" />
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/table_1/fields/filter">
                                                                    <xsl:call-template name="filter-az">
                                                                        <xsl:with-param name="name" select="rows/content/table_1/fields/filter/@name" />
                                                                        <xsl:with-param name="value" select="rows/content/table_1/fields/filter/value" />
                                                                        <xsl:with-param name="type" select="''" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                <xsl:variable  name="contextMenuType" select="'menu'" />
                                                                <table class="IGRP_table default-table" gen-id="table" context-menu-type="menu" data-control="table_1">
                                                                    <thead>
                                                                        <tr gen-id="drop-zone" gen-field-template="th">
                                                                            <xsl:if  test="rows/content/table_1/fields/data">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/data/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/projectoprodutoassunto">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/projectoprodutoassunto/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/actividadeobservacao">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/actividadeobservacao/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/text_1">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/text_1/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/periodo">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/periodo/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/aplicacao">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/aplicacao/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/fields/recurso">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/table_1/fields/recurso/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/table_1/table/context-menu/item and  $contextMenuType = 'line'">
                                                                                <th />
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each  select="rows/content/table_1/table/value/row">
                                                                            <tr gen-id="drop-zone">
                                                                                <xsl:if test="$contextMenuType = 'menu'">
                                                                                    <xsl:attribute name="class">IGRP_contextMenu</xsl:attribute>
                                                                                </xsl:if>
                                                                                <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                                <xsl:apply-templates select="." mode="tr-hidden-fields" />
                                                                                <xsl:if test="data">
                                                                                    <td class="text" align="left" data-row="{position()}" data-title="{../../../fields/data/label}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="data" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="projectoprodutoassunto">
                                                                                    <td class="text" align="left" data-row="{position()}" data-title="{../../../fields/projectoprodutoassunto/label}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="projectoprodutoassunto" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="actividadeobservacao">
                                                                                    <td class="link" align="left" data-row="{position()}" data-title="{../../label/actividadeobservacao}">
                                                                                        <xsl:choose>
                                                                                            <xsl:when test="actividadeobservacao != ''">
                                                                                                <a class="link bClick" name="actividadeobservacao" target="_blank" href="{actividadeobservacao}">
                                                                                                    <xsl:value-of select="actividadeobservacao_desc" disable-output-escaping="yes" />
                                                                                                </a>
                                                                                            </xsl:when>
                                                                                            <xsl:otherwise>
                                                                                                <span>
                                                                                                    <xsl:value-of select="actividadeobservacao_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                            </xsl:otherwise>
                                                                                        </xsl:choose>
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="text_1">
                                                                                    <td class="text" align="left" data-row="{position()}" data-title="{../../../fields/text_1/label}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="text_1" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="periodo">
                                                                                    <td class="text" align="left" data-row="{position()}" data-title="{../../../fields/periodo/label}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="periodo" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="aplicacao">
                                                                                    <td class="text" align="left" data-row="{position()}" data-title="{../../../fields/aplicacao/label}">
                                                                                        <xsl:apply-templates select="../../context-menu" mode="cxtmenu-resp">
                                                                                            <xsl:with-param name="ctx" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                        <xsl:value-of select="aplicacao" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="recurso">
                                                                                    <td class="link" align="left" data-row="{position()}" data-title="{../../label/recurso}">
                                                                                        <xsl:choose>
                                                                                            <xsl:when test="recurso != ''">
                                                                                                <a class="link bClick" name="recurso" target="_blank" href="{recurso}">
                                                                                                    <xsl:value-of select="recurso_desc" disable-output-escaping="yes" />
                                                                                                </a>
                                                                                            </xsl:when>
                                                                                            <xsl:otherwise>
                                                                                                <span>
                                                                                                    <xsl:value-of select="recurso_desc" disable-output-escaping="yes" />
                                                                                                </span>
                                                                                            </xsl:otherwise>
                                                                                        </xsl:choose>
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="../../context-menu/item and $contextMenuType = 'line'">
                                                                                    <td class="operationTable" data-row="{position()}">
                                                                                        <xsl:apply-templates select="//rows/content/table_1/table/context-menu" mode="operation-table">
                                                                                            <xsl:with-param name="ContextMenuRow" select="context-menu" />
                                                                                        </xsl:apply-templates>
                                                                                    </td>
                                                                                </xsl:if>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="_clear" /></div>
                    <xsl:call-template name="link-opener" />
                    <div class="_clear" /></div>
                <div id="igrp-footerPage">
                    <xsl:call-template name="footer" />
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1462183343681"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1462183343681"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1462183343681"/>
    <xsl:include href="../../xsl/tmpl/IGRP-operation-table.tmpl.xsl?v=1462183343681"/>
    <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=1462183343681"/>
    <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=1462183343681"/>
</xsl:stylesheet>