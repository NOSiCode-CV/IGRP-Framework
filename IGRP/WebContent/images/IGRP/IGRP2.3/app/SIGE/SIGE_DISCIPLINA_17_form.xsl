<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TABCONTENT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css" rel="stylesheet" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title" gen-class="">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " item-name="tabcontent_1" gen-class="" tab-template="default">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/inicio">
                                                            <li class="active gen-fields-holder" rel="tab-tabcontent_1-inicio" item-name="inicio">
                                                                <a aria-expanded="true" href="#tab-tabcontent_1-inicio" data-toggle="tab">
                                                                    <i class="fa fa-home" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/inicio/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/recurso">
                                                            <li class=" gen-fields-holder" rel="tab-tabcontent_1-recurso" item-name="recurso">
                                                                <a aria-expanded="true" href="#tab-tabcontent_1-recurso" data-toggle="tab">
                                                                    <i class="fa fa-address-book" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/recurso/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/sumario">
                                                            <li class=" gen-fields-holder" rel="tab-tabcontent_1-sumario" item-name="sumario">
                                                                <a aria-expanded="true" href="#tab-tabcontent_1-sumario" data-toggle="tab">
                                                                    <i class="fa fa-book" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/sumario/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/avaliacao">
                                                            <li class=" gen-fields-holder" rel="tab-tabcontent_1-avaliacao" item-name="avaliacao">
                                                                <a aria-expanded="true" href="#tab-tabcontent_1-avaliacao" data-toggle="tab">
                                                                    <i class="fa fa-address-book-o" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/avaliacao/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/pauta_registo">
                                                            <li class=" gen-fields-holder" rel="tab-tabcontent_1-pauta_registo" item-name="pauta_registo">
                                                                <a aria-expanded="true" href="#tab-tabcontent_1-pauta_registo" data-toggle="tab">
                                                                    <i class="fa fa-list-alt" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/pauta_registo/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/pauta_consulta">
                                                            <li class=" gen-fields-holder" rel="tab-tabcontent_1-pauta_consulta" item-name="pauta_consulta">
                                                                <a aria-expanded="true" href="#tab-tabcontent_1-pauta_consulta" data-toggle="tab">
                                                                    <i class="fa fa-search" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/pauta_consulta/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/inicio">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-inicio" rel="tab-tabcontent_1-inicio">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_1">
                                                                                <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                                            <xsl:if test="rows/content/form_1/fields/codigo">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="codigo">
                                                                                                    <label for="{rows/content/form_1/fields/codigo/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/codigo/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/codigo/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/codigo/@name}" value="{rows/content/form_1/fields/codigo/value}" maxlength="30" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/disciplina">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="disciplina">
                                                                                                    <label for="{rows/content/form_1/fields/disciplina/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/disciplina/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/disciplina/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/disciplina/@name}" value="{rows/content/form_1/fields/disciplina/value}" maxlength="200" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/area">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="area">
                                                                                                    <label for="{rows/content/form_1/fields/area/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/area/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/area/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/area/@name}" value="{rows/content/form_1/fields/area/value}" maxlength="50" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/ano">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="ano">
                                                                                                    <label for="{rows/content/form_1/fields/ano/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/ano/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/ano/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/ano/@name}" value="{rows/content/form_1/fields/ano/value}" maxlength="30" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/docente">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="docente">
                                                                                                    <label for="{rows/content/form_1/fields/docente/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/docente/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/docente/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/docente/@name}" value="{rows/content/form_1/fields/docente/value}" maxlength="200" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/turma">
                                                                                                <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="turma">
                                                                                                    <label for="{rows/content/form_1/fields/turma/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/turma/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/turma/@name}" type="text" readonly="readonly" name="{rows/content/form_1/fields/turma/@name}" value="{rows/content/form_1/fields/turma/value}" maxlength="30" placeholder=""></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/disciplina">
                                                                                                <div class="box-head subtitle gen-fields-holder">
                                                                                                    <xsl:value-of select="rows/content/form_1/fields/disciplina/label" />
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/objetivos">
                                                                                                <div class="form-group col-md-3  gen-fields-holder" item-type="textarea" item-name="objetivos">
                                                                                                    <label for="{rows/content/form_1/fields/objetivos/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/objetivos/label" />
                                                                                                    </label>
                                                                                                    <textarea class="textarea form-control " name="{rows/content/form_1/fields/objetivos/@name}" maxlength="500">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/objetivos/value" />
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/programa">
                                                                                                <div class="form-group col-md-3  gen-fields-holder" item-type="textarea" item-name="programa">
                                                                                                    <label for="{rows/content/form_1/fields/programa/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/programa/label" />
                                                                                                    </label>
                                                                                                    <textarea class="textarea form-control " name="{rows/content/form_1/fields/programa/@name}" maxlength="500">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/programa/value" />
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/metodo_ensino">
                                                                                                <div class="form-group col-md-3  gen-fields-holder" item-type="textarea" item-name="metodo_ensino">
                                                                                                    <label for="{rows/content/form_1/fields/metodo_ensino/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/metodo_ensino/label" />
                                                                                                    </label>
                                                                                                    <textarea class="textarea form-control " name="{rows/content/form_1/fields/metodo_ensino/@name}" maxlength="500">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/metodo_ensino/value" />
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/formula_calculo">
                                                                                                <div class="form-group col-md-3  gen-fields-holder" item-type="textarea" item-name="formula_calculo">
                                                                                                    <label for="{rows/content/form_1/fields/formula_calculo/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/formula_calculo/label" />
                                                                                                    </label>
                                                                                                    <textarea class="textarea form-control " name="{rows/content/form_1/fields/formula_calculo/@name}" maxlength="200">
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/formula_calculo/value" />
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/recurso">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-recurso" rel="tab-tabcontent_1-recurso">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner" /></div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/sumario">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-sumario" rel="tab-tabcontent_1-sumario">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_2">
                                                                                <div class="box igrp-forms gen-container-item " item-name="form_2" gen-class="">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates select="rows/content/form_2/fields" mode="form-hidden-fields" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons" />
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/avaliacao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-avaliacao" rel="tab-tabcontent_1-avaliacao">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner" /></div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/pauta_registo">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-pauta_registo" rel="tab-tabcontent_1-pauta_registo">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner" /></div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/pauta_consulta">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-pauta_consulta" rel="tab-tabcontent_1-pauta_consulta">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner" /></div>
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
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js" />
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489750565397" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489750565397" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489750565397" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489750565397" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1489750565397" />
</xsl:stylesheet>