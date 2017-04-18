<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
                <style></style>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu" />
                <form>
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if  test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of  select="rows/content/page_title/fields/text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if  test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form" gen-id="drop-zone">
                                                                <xsl:if  test="rows/content/form_1/fields/number_1">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="number" item-name="number_1">
                                                                        <label for="{rows/content/form_1/fields/number_1/@name}">
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/form_1/fields/number_1/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" class="form-control" name="{rows/content/form_1/fields/number_1/@name}" value="{rows/content/form_1/fields/number_1/value}" id="{rows/content/form_1/fields/number_1/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if  test="rows/content/form_1/fields/password_1">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="password" item-name="password_1">
                                                                        <label for="{rows/content/form_1/fields/password_1/@name}">
                                                                            <span gen-lbl-setter="">
                                                                                <xsl:value-of select="rows/content/form_1/fields/password_1/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="password" class="form-control" name="{rows/content/form_1/fields/password_1/@name}" value="{rows/content/form_1/fields/password_1/value}" id="{rows/content/form_1/fields/password_1/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates  select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if  test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <table class="table table-striped gen-data-table " id="gen_table">
                                                                <thead>
                                                                    <tr gen-id="drop-zone" gen-field-template="th" />
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each  select="rows/content/gen_table/table/value/row">
                                                                        <tr gen-id="drop-zone"></tr>
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/jquery.dataTables.min.js"></script>
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.min.js"></script>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1477572050284"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1477572050284"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1477572050284"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1477572050284"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1477572050284"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1477572050284"/>
</xsl:stylesheet>