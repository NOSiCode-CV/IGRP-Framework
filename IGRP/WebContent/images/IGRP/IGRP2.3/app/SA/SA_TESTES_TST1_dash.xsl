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
                                                <xsl:if  test="rows/content/flist">
                                                    <div class="box box-table-contents gen-container-item " item-name="flist">
                                                        <xsl:call-template  name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/flist/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <table class="table table-striped gen-data-table " id="flist">
                                                                <thead>
                                                                    <tr gen-id="drop-zone" gen-field-template="th">
                                                                        <xsl:if  test="rows/content/flist/fields/nome">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span gen-lbl-setter="">
                                                                                    <xsl:value-of select="rows/content/flist/fields/nome/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each  select="rows/content/flist/table/value/row">
                                                                        <tr gen-id="drop-zone">
                                                                            <xsl:if test="nome">
                                                                                <td class="texteditor" align="left" data-title="{../../fields/nome/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome" />
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
                <!-- TEXTEDITOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/texteditor/includes/ckeditor/ckeditor.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1477571851886"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1477571851886"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1477571851886"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1477571851886"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1477571851887"/>
</xsl:stylesheet>