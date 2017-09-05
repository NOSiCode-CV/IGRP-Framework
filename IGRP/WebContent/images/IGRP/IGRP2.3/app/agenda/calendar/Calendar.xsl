<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- CALENDAR CSS INCLUDES -->
                <link media="print" rel="stylesheet" type="text/css" href="{$path}/core/calendar/3.0.1/css/fullcalendar.print.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/calendar/3.0.1/css/fullcalendar.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/calendar/3.0.1/css/igrp.calendar.css"/>
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
                                    <div class="row" id="row-d72b31d4">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/calendar_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="calendar_1">
                                                        <div class="box-body">
                                                            <xsl:apply-templates mode="IGRP-calendar" select="rows/content/calendar_1">
                                                                <xsl:with-param name="id" select="'calendar_1'"/>
                                                                <xsl:with-param name="lang" select="'pt'"/>
                                                                <xsl:with-param name="loadevents" select="rows/content/calendar_1/fields/calendar_1_event/value"/>
                                                                <xsl:with-param name="addevents" select="rows/content/calendar_1/fields/calendar_1_add/value"/>
                                                                <xsl:with-param name="defaultview" select="rows/content/calendar_1/fields/calendar_1_view/value"/>
                                                                <xsl:with-param name="defaultdate" select="rows/content/calendar_1/fields/calendar_1_date/value"/>
                                                            </xsl:apply-templates>
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
                <!-- CALENDAR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/moment/moment.min.js"/>
                <script type="text/javascript" src="{$path}/core/calendar/3.0.1/js/fullcalendar.min.js"/>
                <script type="text/javascript" src="{$path}/core/calendar/3.0.1/js/locale-all.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/calendar/3.0.1/js/igrp.calendar.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1504176267190"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1504176267190"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1504176267190"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1504176267190"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-calendar.tmpl.xsl?v=1504176267190"/>
</xsl:stylesheet>
