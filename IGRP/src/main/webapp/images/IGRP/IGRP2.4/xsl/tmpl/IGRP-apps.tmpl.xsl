<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-apps" mode="igrp-apps" match="applications">

        <div class="gen-tab-holder nav-tabs-custom" tab-template="clean" id="igrp-apps-1">
            <ul class="nav nav-tabs">

                <li class="active" rel="minhas_aplicacoes">
                    <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#minhas_aplicacoes">
                        
                        <span>
                            <xsl:value-of select="title"/>
                        </span>
                    </a>
                </li>

                <li rel="outras_apps">
                    <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#outras_apps">
                       
                        <span>
                            <xsl:value-of select="subtitle"/>
                        </span>
                    </a>
                </li>

            </ul>
            <div class="tab-content">
               
                <div class="tab-pane gen-rows-holder active" id="minhas_aplicacoes" rel="minhas_aplicacoes">
                    <div class="row " id="row-fc3bde21">
                        <div class="gen-column col-sm-12">
                            <div class="gen-inner">
                                
                                <xsl:for-each select="application[@available='yes']">
                                    <div class="col-md-3 col-sm-6 col-xs-12 apps-col">
                                        <a href="{link}" class="igrp-app-block clear clearfix" search-content="{title} - {description}">
                                            <div class="app-img">
                                                <img src="{$path}/assets/img/iconApp/{img}"/>
                                            </div>
                                            <div class="app-title">
                                                <span>
                                                    <xsl:value-of select="title"/>
                                                </span>
                                            </div>
                                            <div class="app-desc">
                                                <span>
                                                    <xsl:value-of select="description"/>
                                                </span>
                                            </div>
                                        </a>
                                    </div>
                                </xsl:for-each>
                               
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane gen-rows-holder" id="outras_apps" rel="outras_apps">
                    <div class="row " id="row-fc3bde21">
                        <div class="gen-column col-sm-12">
                            <div class="gen-inner">
                                <xsl:for-each select="application[@available='no']">
                                    <div class="col-md-3 col-sm-6 col-xs-12 apps-col">
                                        <a class="igrp-app-block clear clearfix not-available" search-content="{title} - {description}">
                                            <div class="app-img">
                                                <img src="{$path}/assets/img/iconApp/{img}"/>
                                            </div>
                                            <div class="app-title">
                                                <span>
                                                    <xsl:value-of select="title"/>
                                                </span>
                                            </div>
                                            <div class="app-desc">
                                                <span>
                                                    <xsl:value-of select="description"/>
                                                </span>
                                            </div>
                                        </a>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                </div>
           
            </div>
        </div>
    </xsl:template>

    <xsl:template name="igrp-apps-table" mode="igrp-apps-table" match="applications">
        <table>
            <tbody id="igrp-apps-1">
                <xsl:call-template name="igrp-app-loop">
                    <xsl:with-param name="apps" select="application[@available='yes']"/>
                </xsl:call-template>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template name="igrp-app-loop">
        <xsl:param name="start" select="1"/>
        <xsl:param name="end" select="4"/>
        <xsl:param name="apps"/>
        <xsl:variable name="apps-count" select="count($apps)"/>

        <xsl:if test="$apps">
            <xsl:choose>
                <xsl:when test="$end &lt;= $apps-count ">
                    <tr>
                        <xsl:for-each select="$apps[position() &gt;= $start and position() &lt;= $end]">
                            <td>
                                <a href="{link}" class="igrp-app-block clear clearfix">
                                    <div class="app-img">
                                        <img src="{$path}/assets/img/iconApp/{img}"/>
                                    </div>
                                    <div class="app-info">
                                        <div class="app-title">
                                            <span>
                                                <xsl:value-of select="title"/>
                                            </span>
                                        </div>
                                        <div class="app-desc">
                                            <span>
                                                <xsl:value-of select="description"/>
                                            </span>
                                        </div>
                                    </div>
                                </a>
                            </td>
                        </xsl:for-each>
                    </tr>
                    <xsl:call-template name="igrp-app-loop">
                        <xsl:with-param name="start" select="$start + 4"/>
                        <xsl:with-param name="end" select="$end + 4"/>
                        <xsl:with-param name="apps" select="$apps"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>

        </xsl:if>

    </xsl:template>

    <xsl:template name="igrp-apps2" mode="igrp-apps2" match="applications">
        <section class="content-header gen-container-item clearfix">
            <h2>
                <xsl:value-of select="title"/>
            </h2>
        </section>
        <div class="box-content igrp-apps-holder clear">
            <xsl:for-each select="application[@available='yes']">
                <div class="col-md-2 col-sm-3 col-xs-6">
                    <a href="{link}" class="igrp-app-block">
                        <div class="app-img">
                            <img src="{$path}/assets/img/iconApp/{img}"/>
                        </div>
                        <div class="app-title">
                            <span>
                                <xsl:value-of select="title"/>
                            </span>
                        </div>
                    </a>
                </div>
            </xsl:for-each>
        </div>
        <br/>
        <section class="content-header gen-container-item clearfix">
            <h2>
                <xsl:value-of select="subtitle"/>
            </h2>
        </section>
        <div class="box-content igrp-apps-holder clear">
            <xsl:for-each select="application[@available!='yes']">
                <div class="col-md-2 col-sm-3 col-xs-6">
                    <div class="igrp-app-block not-available">
                        <div class="app-img">
                            <img src="{$path}/assets/img/iconApp/{img}"/>
                        </div>
                        <div class="app-title">
                            <span>
                                <xsl:value-of select="title"/>
                            </span>
                        </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>