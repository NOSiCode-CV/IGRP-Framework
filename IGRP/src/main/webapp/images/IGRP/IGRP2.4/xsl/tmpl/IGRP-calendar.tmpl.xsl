<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
    <xsl:template name="IGRP-calendar" mode="IGRP-calendar" match="*">
        <xsl:param name="id" select="'calendar'"/>
        <xsl:param name="lang" select="'pt'"/>
        <xsl:param name="editevents"/>
        <xsl:param name="alleditevents"/>
        <xsl:param name="addevents"/>
        <xsl:param name="loadevents"/>
        <xsl:param name="defaultview"/>
        <xsl:param name="defaultdate"/>
        <xsl:param name="ebeforetoday"/>
        <xsl:param name="weekends"/>
        <xsl:param name="firstday"/>
        <xsl:param name="daysoff"/>
        <xsl:param name="views"/>
        <xsl:param name="header"/>
        <xsl:param name="refreshonedit"/>
        
        <div class="igrp-calendar-holder">
            <div id="{$id}" class="igrp-calendar"></div>
            <div class="dropdown clearfix igrp-calendar-ctx rc-ctx table-context-menu">
                <ul id="{$id}-calendar-ctx" class="list-group ctx-holder">
                    <xsl:for-each select="//rows/content/*[name() = concat($id,'_events')]/table/context-menu/item|context-menu/item">
                       <li class="igrp-calendar-ctx-item" trel="{title}">
                            <a class="{target}" target="{target}">
                                <xsl:choose>
                                    <xsl:when test="contains(target, '|')">
                                      <xsl:call-template name="get-target-params">
                                        <xsl:with-param name="list" select="target"/>
                                      </xsl:call-template>
                                      <xsl:attribute name="class">
                                        <xsl:value-of select="substring-before(target,'|')"/>
                                      </xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:attribute name="target">
                                        <xsl:value-of select="target"/>
                                      </xsl:attribute>
                                      <xsl:attribute name="class">
                                        <xsl:value-of select="target"/>
                                      </xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>

                                <xsl:call-template name="page-nav">
                                    <xsl:with-param name="action" select="link"/>
                                    <xsl:with-param name="page" select="page"/>
                                    <xsl:with-param name="app" select="app"/>
                                    <xsl:with-param name="linkextra" select="parameter"/>
                                </xsl:call-template>

                                <xsl:if test="img">
                                    <xsl:call-template name="get-icon-item-with-color">
                                      <xsl:with-param name="list" select="img"/>
                                      <xsl:with-param name="use-fa" select="'true'"/>
                                      <xsl:with-param name="img-folder" select="'tools-bar'"/>
                                      <xsl:with-param name="btnClass" select="'list-group-item'"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <span class="ctx-title"><xsl:value-of select="title"/></span>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
            <script>
                $(function(){
                    $.IGRP.components.calendar.init('<xsl:value-of select="$id"/>',{
                        locale          : '<xsl:value-of select="$lang"/>',
                        editevents      : '<xsl:value-of select="$editevents"/>',
                        alleditevents   : '<xsl:value-of select="$alleditevents"/>',
                        addevents       : '<xsl:value-of select="$addevents"/>',
                        loadevents 		  : '<xsl:value-of select="$loadevents"/>',
                        defaultview     : '<xsl:value-of select="$defaultview"/>',
                        defaultdate     : '<xsl:value-of select="$defaultdate"/>',
                        ebeforetoday    : '<xsl:value-of select="$ebeforetoday"/>',
                        weekends        : '<xsl:value-of select="$weekends"/>',
                        firstday        : '<xsl:value-of select="$firstday"/>',
                        views           : '<xsl:value-of select="$views"/>',
                        daysoff         : '<xsl:value-of select="$daysoff"/>',
                        header          : '<xsl:value-of select="$header"/>',
                        refreshonedit   : '<xsl:value-of select="$refreshonedit"/>'
                    });
                });
            </script>
        </div>
    </xsl:template> 
</xsl:stylesheet>