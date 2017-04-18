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
                                                                <xsl:if test="rows/content/form_1/fields/informacao_avaliacao">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/informacao_avaliacao/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/organica">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="organica" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/organica/value}" class="form-control" id="{rows/content/form_1/fields/organica/@name}" name="{rows/content/form_1/fields/organica/@name}" readonly="readonly" maxlength="500"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/utilizador_d">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="utilizador_d" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/utilizador_d/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/utilizador_d/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/utilizador_d/value}" class="form-control" id="{rows/content/form_1/fields/utilizador_d/@name}" name="{rows/content/form_1/fields/utilizador_d/@name}" readonly="readonly" maxlength="500"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/atendimento">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="atendimento" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/atendimento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/atendimento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/atendimento/value}" class="form-control" id="{rows/content/form_1/fields/atendimento/@name}" name="{rows/content/form_1/fields/atendimento/@name}" readonly="readonly" maxlength="500"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/grau">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="grau" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/grau/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/grau/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/grau/value}" class="form-control" id="{rows/content/form_1/fields/grau/@name}" name="{rows/content/form_1/fields/grau/@name}" readonly="readonly" maxlength="500"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/avaliacao">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="avaliacao" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/avaliacao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/avaliacao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/avaliacao/value}" class="form-control" id="{rows/content/form_1/fields/avaliacao/@name}" name="{rows/content/form_1/fields/avaliacao/@name}" readonly="readonly" maxlength="500"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/motivo">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="motivo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/motivo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/motivo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/motivo/value}" class="form-control" id="{rows/content/form_1/fields/motivo/@name}" name="{rows/content/form_1/fields/motivo/@name}" readonly="readonly" maxlength="500"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/servicos">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/servicos/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/id_servico">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/id_servico/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data_inicio">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data_inicio/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data_fim">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data_fim/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_id_atendimento_fk" value="{id_atendimento}"/>
                                                                            <input type="hidden" name="p_id_atendimento_fk_desc" value="{id_atendimento_desc}"/>
                                                                            <xsl:if test="id_servico">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/id_servico/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="id_servico"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_inicio">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/data_inicio/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_inicio"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_fim">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/data_fim/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_fim"/>
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
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488202628394"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488202628394"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488202628394"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488202628394"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488202628395"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1488202628395"/>
</xsl:stylesheet>