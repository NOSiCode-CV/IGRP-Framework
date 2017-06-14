<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="calendar">
        <xsl:param name="vId" select="'calendar'"/>
        <xsl:param name="vLng" select="'pt'"/>
        <xsl:param name="vDefDate"/>
        <xsl:param name="vUrlEvent"/>
        <xsl:param name="vUrlAdd"/>
        <xsl:param name="vUrlDelete"/>
    
        <link media="all" type="text/css" href="{$path}/extensions/calendar/css/fullcalendar.css?v={$version}" rel="stylesheet"/>
        <link media="print" type="text/css" href="{$path}/extensions/calendar/css/fullcalendar.print.css?v={$version}" rel="stylesheet"/>

        <script type="text/javascript" src="{$path}/extensions/calendar/js/moment.min.js?v={$version}"></script>
        <script type="text/javascript" src="{$path}/extensions/calendar/js/fullcalendar.min.js?v={$version}" charset="utf-8"></script>
        <script type="text/javascript" src="{$path}/extensions/calendar/js/lang-all.js?v={$version}" charset="utf-8"></script>
        <script type="text/javascript" src="{$path}/extensions/calendar/js/IGRP-calendar.init.js?v={$version}" charset="utf-8"></script>
        <script type="text/javascript">
            $(function(){
                IGRP_h_calendarInit({
				    pThisId:"#<xsl:value-of select='$vId'/>",
                    pLng:"<xsl:value-of select='$vLng'/>",
                    <xsl:if test='$vDefDate'>
                        pDefDate:"<xsl:value-of select='$vDefDate'/>",
                    </xsl:if>
                    pUrlEvents:$("#p_env_frm_url").val(),
                    pUrlAdd:"<xsl:value-of select='$vUrlAdd'/>",
                    pUrlDetele:"",
                    pDefaultView:$("#p_view_type").val() 
                });
            });
        </script>
    	<div class="col main-calendar calendar" id="{$vId}">
        	<div id="ctxCalendar">
                <xsl:for-each select="rows/content/table/value/row/id[not(.=preceding::*)]">
                    <xsl:call-template name="calendar-ctx">
                        <xsl:with-param name="ContextMenuRow" select="../context-menu"/>
                        <xsl:with-param name="context-menu" select="../../../context-menu"/>
                        <xsl:with-param name="cxtid" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </div>
        </div>
        
        <div class="dialog" id="eDialog-modal">
            <div class="title" id="eTitle"></div>
            <div class="message">
                <div class="col">
                    <div class="col-1-2"><label>Inicio</label><span id="eDateStart"></span></div>
                    <div class="col-1-2"><label>Fim</label><span id="eDateEnd"></span></div>
                    <div class="_clear"/>
                </div>
                <div class="col">
                	<label>Descricao</label>
                	<span id="eDescription"></span>
                </div>
            </div>
        </div>  
    </xsl:template> 
    
    <xsl:template name="calendar-ctx">
    	<xsl:param name="ContextMenuRow" select="'context-menu'"/>
    	<xsl:param name="context-menu"/>
        <xsl:param name="cxtid"/>
        
        <xsl:variable name="ctx_hidden" select="$ContextMenuRow/param[contains(text(), 'ctx_hidden')]"/>
		<xsl:variable name="ctx_param">
			<xsl:for-each select="$ContextMenuRow/param[not(contains(., 'ctx_hidden'))]">
					<xsl:text>&amp;</xsl:text><xsl:value-of select="."/>
			</xsl:for-each>			
		</xsl:variable>
        
        <xsl:variable name="substringAfter" select="substring-after($ctx_hidden,'=')"/>
        <xsl:variable name="ctxHidden">
            <xsl:call-template name="allCtxHidden">
                <xsl:with-param name="text" select="$ctx_hidden"/>
            </xsl:call-template>
        </xsl:variable>
			
        <ul class="contextMenu calendarCtx" id="ctx-{$cxtid}">
        	<xsl:for-each select="$context-menu/item">
            	<xsl:variable name="vText">
                	 <xsl:call-template name="split">
                        <xsl:with-param name="vText" select="$substringAfter"/>
                        <xsl:with-param name="ctx" select="title"/>
                        <xsl:with-param name="item" select="string-length($ctxHidden)"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$vText != title">
                    <li class="operationTable">
                        <a target="{target}">
                            <xsl:call-template name="page-nav">
                                <xsl:with-param name="action" select="link"/>
                                <xsl:with-param name="page" select="page"/>
                                <xsl:with-param name="app" select="app"/>
                                <xsl:with-param name="linkextra" select="concat(parameter,$ctx_param)"/>
                            </xsl:call-template>
                            <xsl:if test="img!=''">
                                <img title="{title}" src="{$path_tmpl}/img/icon/tools-bar/{img}"/>
                            </xsl:if>
                            <span><xsl:value-of select="title"/></span>
                        </a>
                    </li>
                </xsl:if>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>