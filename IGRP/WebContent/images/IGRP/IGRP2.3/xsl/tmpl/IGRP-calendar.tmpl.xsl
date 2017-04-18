<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
    <xsl:template name="IGRP-calendar" mode="IGRP-calendar" match="*">
        <xsl:param name="id" select="'calendar'"/>
        <xsl:param name="lang" select="'pt'"/>
        <xsl:param name="dataUrl"/>
        
        <div class="igrp-calendar-holder">

            <div id="{$id}" class="igrp-calendar"></div>
            <div class="dropdown clearfix igrp-calendar-ctx rc-ctx">
                <ul id="{$id}-calendar-ctx" class="dropdown-menu ctx-holder">
                    <xsl:for-each select="context-menu/item">
                       <li class="igrp-calendar-ctx-item" trel="{title}">
                            <a class="{target}" target="{target}">
                                <xsl:call-template name="page-nav">
                                    <xsl:with-param name="action" select="link"/>
                                    <xsl:with-param name="page" select="page"/>
                                    <xsl:with-param name="app" select="app"/>
                                    <xsl:with-param name="linkextra" select="parameter"/>
                                </xsl:call-template>
                                <!-- <xsl:if test="img!=''">
                                    <xsl:copy>
                                        <xsl:call-template name="get-icon-item">
                                            <xsl:with-param name="list" select="img"/>
                                            <xsl:with-param name="delimiter" select="'|'"/>
                                        </xsl:call-template>
                                        <xsl:attribute name="class"></xsl:attribute>
                                    </xsl:copy>
                                </xsl:if> -->
                                <span class="ctx-title"><xsl:value-of select="title"/></span>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
            <script>
                $(function(){
                    $.IGRP.components.calendar.init('<xsl:value-of select="$id"/>',{
                        locale    : '<xsl:value-of select="$lang"/>',
                        eventsUrl : '<xsl:value-of select="$dataUrl"/>'
                    });
                });
            </script>

        </div>

       

    </xsl:template> 
    
</xsl:stylesheet>