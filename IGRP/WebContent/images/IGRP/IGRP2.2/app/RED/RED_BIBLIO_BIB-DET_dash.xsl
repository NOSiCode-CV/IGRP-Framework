<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="home-header" />
                <link rel="stylesheet" type="text/css" href="{$path}/extentions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <script type="text/javascript" src="{$path}/extentions/formgen/types/containers/form/includes/igrp.forms.js"></script>
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
                                        <xsl:if  test="rows/content/gen_form_1">
                                            <div class="box-content resetPadding gen-container-item" gen-id="body">
                                                <div class="box-collapser">
                                                    <div class="col">
                                                        <div gen-id="drop-zone">
                                                            <xsl:apply-templates  select="rows/content/gen_form_1/fields" mode="hidden-fields" />
                                                            <xsl:if  test="rows/content/gen_form_1/fields/nome">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="nome">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/gen_form_1/fields/nome/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/gen_form_1/fields/nome/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/nome/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/gen_form_1/fields/nome/@name}" maxlength="30" value="{rows/content/gen_form_1/fields/nome/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/nome" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/gen_form_1/fields/tipo">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="tipo">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/gen_form_1/fields/tipo/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/gen_form_1/fields/tipo/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/tipo/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="text" type="text" name="{rows/content/gen_form_1/fields/tipo/@name}" maxlength="100" value="{rows/content/gen_form_1/fields/tipo/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/tipo" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                            <xsl:if  test="rows/content/gen_form_1/fields/n_aplicacoes">
                                                                <div class="col-1-4 item gen-fields-holder" item-name="n_aplicacoes">
                                                                    <div class="igrp_item color">
                                                                        <label>
                                                                            <xsl:if test="string-length(rows/content/gen_form_1/fields/n_aplicacoes/label) &gt;45">
                                                                                <xsl:attribute name="title">
                                                                                    <xsl:value-of select="rows/content/gen_form_1/fields/n_aplicacoes/label" />
                                                                                </xsl:attribute>
                                                                            </xsl:if>
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/gen_form_1/fields/n_aplicacoes/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input class="number" type="number" name="{rows/content/gen_form_1/fields/n_aplicacoes/@name}" maxlength="10" value="{rows/content/gen_form_1/fields/n_aplicacoes/value}">
                                                                            <xsl:call-template name="FIELD_validator">
                                                                                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/n_aplicacoes" />
                                                                            </xsl:call-template>
                                                                        </input>
                                                                        <div class="_clear" /></div>
                                                                    <div class="_clear" /></div>
                                                            </xsl:if>
                                                        </div>
                                                        <div class="_clear" />
                                                        <xsl:if  test="rows/content/gen_form_1/tools-bar">
                                                            <xsl:apply-templates select="rows/content/gen_form_1/tools-bar" mode="button-bar" />
                                                        </xsl:if>
                                                    </div>
                                                    <div class="_clear" /></div>
                                            </div>
                                        </xsl:if>
                                        <xsl:if  test="rows/content/lista_aplicacoes">
                                            <div class="box-content resetPadding gen-container-item" gen-structure="label,values">
                                                <xsl:call-template  name="titlecollapser">
                                                    <xsl:with-param name="title" select="'Lista Aplicacoes'" />
                                                    <xsl:with-param name="collapsible" select="'true'" />
                                                </xsl:call-template>
                                                <div class="box-collapser">
                                                    <div class="col borderColor">
                                                        <div class="box-table table-responsive">
                                                            <div class="table-container">
                                                                <xsl:variable  name="hasContextMenu" select="rows/content/lista_aplicacoes/table/context-menu" />
                                                                <xsl:if  test="$hasContextMenu">
                                                                    <xsl:apply-templates select="rows/content/lista_aplicacoes/table/context-menu" mode="context-menu">
                                                                        <xsl:with-param name="contextId" select="'lista_aplicacoes'" />
                                                                    </xsl:apply-templates>
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/lista_aplicacoes/fields/*[@type='color']">
                                                                    <xsl:apply-templates select="rows/content/lista_aplicacoes/table/legend_color" mode="table-legend" />
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/lista_aplicacoes/fields/filter">
                                                                    <xsl:call-template name="filter-az">
                                                                        <xsl:with-param name="name" select="rows/content/lista_aplicacoes/fields/filter/@name" />
                                                                        <xsl:with-param name="value" select="rows/content/lista_aplicacoes/fields/filter/value" />
                                                                        <xsl:with-param name="type" select="''" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                <table class="IGRP_table default-table" gen-id="table" data-control="lista_aplicacoes">
                                                                    <thead>
                                                                        <tr gen-id="drop-zone" gen-field-template="th">
                                                                            <xsl:if  test="rows/content/lista_aplicacoes/fields/nome_aplicacao">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/lista_aplicacoes/fields/nome_aplicacao/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/lista_aplicacoes/fields/processomodulo">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/lista_aplicacoes/fields/processomodulo/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                            <xsl:if  test="rows/content/lista_aplicacoes/fields/preview">
                                                                                <th class=" gen-fields-holder" align="left">
                                                                                    <span gen-lbl-setter="">
                                                                                        <xsl:value-of select="rows/content/lista_aplicacoes/fields/preview/label" />
                                                                                    </span>
                                                                                </th>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each  select="rows/content/lista_aplicacoes/table/value/row">
                                                                            <tr class="IGRP_contextMenu" gen-id="drop-zone">
                                                                                <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                                <xsl:apply-templates select="." mode="tr-hidden-fields" />
                                                                                <xsl:if test="nome_aplicacao">
                                                                                    <td class="text" align="left" data-title="{../../fields/nome_aplicacao/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="nome_aplicacao" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="processomodulo">
                                                                                    <td class="text" align="left" data-title="{../../fields/processomodulo/label}" data-row="{position()}">
                                                                                        <xsl:value-of select="processomodulo" />
                                                                                    </td>
                                                                                </xsl:if>
                                                                                <xsl:if test="preview">
                                                                                    <td class="link" align="left" data-title="{../../label/preview}" data-row="{position()}">
                                                                                        <xsl:choose>
                                                                                            <xsl:when test="preview != ''">
                                                                                                <a class="link bClick" name="preview" href="{preview}" target="_blank">
                                                                                                    <xsl:value-of select="preview_desc" disable-output-escaping="yes" />
                                                                                                </a>
                                                                                            </xsl:when>
                                                                                            <xsl:otherwise>
                                                                                                <span>
                                                                                                    <xsl:value-of select="preview_desc" disable-output-escaping="yes" />
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
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1452255725138"/>
    <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=1452255725138"/>
    <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=1452255725138"/>
</xsl:stylesheet>