<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_de_documento">
                                                                    <div class="col-md-2  gen-fields-holder" item-name="tipo_de_documento" item-type="radiolist" required="required">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/tipo_de_documento/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_de_documento/list/option">
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input required="required" type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                            <xsl:if test="@selected='true'">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </xsl:for-each>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/binome">
                                                                    <div class="form-group col-md-4  gen-fields-holder" item-name="binome" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/binome/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/binome/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/binome/value}" class="form-control gen-lookup " id="form_1_binome" name="{rows/content/form_1/fields/binome/@name}" required="required" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/binome/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/binome/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_binome'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nome_completo">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="nome_completo" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/nome_completo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome_completo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome_completo/value}" class="form-control " id="{rows/content/form_1/fields/nome_completo/@name}" name="{rows/content/form_1/fields/nome_completo/@name}" readonly="readonly" required="required" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/inps">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="inps" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/inps/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/inps/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/inps/value}" class="form-control gen-lookup " id="form_1_inps" name="{rows/content/form_1/fields/inps/@name}" required="required" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/inps/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/inps/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_inps'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nif">
                                                                    <div class="form-group col-md-2  gen-fields-holder" item-name="nif" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/nif/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/nif/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/nif/value}" class="form-control gen-lookup " id="form_1_nif" name="{rows/content/form_1/fields/nif/@name}" required="required" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/nif/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/nif/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_nif'"/>
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
                                                                        <xsl:if test="rows/content/table_1/fields/nome">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/bi">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/bi/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/nif">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/nif/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/passaporte">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/passaporte/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="nome">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="bi">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/bi/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="bi"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nif">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nif/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nif"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="passaporte">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/passaporte/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="passaporte"/>
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
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491918320881"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491918320881"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491918320881"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491918320881"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491918320881"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1491918320881"/>
</xsl:stylesheet>