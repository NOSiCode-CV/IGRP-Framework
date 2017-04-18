<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
 <xsl:template match="/">
  <html>
   <head>
    <xsl:call-template name="home-header"/>
   </head>
   <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <xsl:call-template name="home-top-main"/>
    <div id="igrp-bodyPage">
     <xsl:call-template name="home-slide-menu"/>
     <div class="bodyPageRigth">
      <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
      <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><div class="gen-row"><div class="gen-column col-1-2"><div class="gen-inner"><xsl:if test="rows/content/chart_2"><div  class="col gen-container-item" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_2"/>
        <xsl:with-param name="chart_type" select="'line'"/>
        <xsl:with-param name="height" select="'250'"/>
        <xsl:with-param name="title" select="'chart'"/>
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'"/>
    </xsl:call-template>
	<div class="_clear"/>
</div></xsl:if></div></div><div class="gen-column col-1-2"><div class="gen-inner"><xsl:if test="rows/content/chart_1"><div  class="col gen-container-item" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_1"/>
        <xsl:with-param name="chart_type" select="'stackedpercentcolumn'"/>
        <xsl:with-param name="height" select="'250'"/>
        <xsl:with-param name="title" select="'chart'"/>
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'"/>
    </xsl:call-template>
	<div class="_clear"/>
</div></xsl:if></div></div></div><div class="gen-row"><div class="gen-column col-1-2"><div class="gen-inner"><xsl:if test="rows/content/table_1"><div  class="box-content resetPadding gen-container-item" gen-structure="label,values"><xsl:call-template name="titlecollapser"><xsl:with-param name="title" select="'table'"/><xsl:with-param name="collapsible" select="'true'"/></xsl:call-template>

    <div class="box-collapser">
        <div class="col addBorderLeftRight borderColor">
            <div class="box-table table-responsive">
                <div class="table-container">
                    <xsl:variable name="hasContextMenu" select="rows/content/table_1/table/context-menu"/>
                    
                    <xsl:if test="$hasContextMenu">
                        <xsl:apply-templates mode="context-menu" select="rows/content/table_1/table/context-menu">
                            <xsl:with-param name="contextId" select="'table_1'"/>
                        </xsl:apply-templates>
                    </xsl:if>

                    <xsl:if test="rows/content/table_1/fields/*[@type='color']">
                      <xsl:apply-templates mode="table-legend" select="rows/content/table_1/table/legend_color"/>
                    </xsl:if>
                    
                    <table class="IGRP_table default-table" data-control="table_1" gen-id="table">
                        <thead>
                            <tr gen-id="drop-zone" gen-field-template="th"><xsl:if  test="rows/content/table_1/fields/checkbox"><th  class="checkbox sorttable_nosort gen-fields-holder" align="center">
  <input type="checkbox" name="p_check_all" class="IGRP_checkall"/>
</th></xsl:if><xsl:if  test="rows/content/table_1/fields/color"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/color/label"/></span></th></xsl:if><xsl:if  test="rows/content/table_1/fields/text"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/text/label"/></span></th></xsl:if></tr>
                        </thead>
                        <tbody>
                           <xsl:for-each select="rows/content/table_1/table/value/row">
                                <tr gen-id="drop-zone" class="IGRP_contextMenu">
                                    <xsl:apply-templates mode="context-param" select="context-menu"/> 
                                    <xsl:apply-templates select="../../fields" mode="hidden-fields"/>
                                <xsl:if  test="checkbox"><td  align="" data-row="{position()}" data-title="{../../label/checkbox}" class="checkbox">
    <xsl:if test="checkbox != '-0'">
        <input type="checkbox" name="p_checkbox" value="{checkbox}">
            <xsl:if test="checkbox_check=checkbox">
                <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>
        </input>
    </xsl:if>
    <!-- <xsl:value-of select="checkbox_desc"/> -->
</td></xsl:if><xsl:if  test="color"><td  align="" data-row="{position()}" data-title="{../../label/color}" class="color">
	<xsl:call-template name="tdcolor">
      <xsl:with-param name="color" select="color"/>
    </xsl:call-template>
</td></xsl:if><xsl:if  test="text"><td  align="left" data-row="{position()}" data-title="{../../fields/text/label}" class="text">
	<xsl:value-of select="text"/>
</td></xsl:if></tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div></xsl:if></div></div><div class="gen-column col-1-2"><div class="gen-inner"><xsl:if test="rows/content/view_1"><div  class="box-content resetPadding gen-container-item" gen-id="body"><xsl:call-template name="titlecollapser"><xsl:with-param name="title" select="'view'"/><xsl:with-param name="collapsible" select="'true'"/></xsl:call-template>    
    <div class="box-collapser">
        <div class="col">
            <div gen-id="view-content">
                <div class="col" gen-id="view-data">
                    <div class="viewDados addPaddingBottom10" gen-id="drop-zone">
                    <xsl:if  test="rows/content/view_1/fields/number"><div  class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/number/label"/></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/number/value"/></span>
</div></xsl:if><xsl:if  test="rows/content/view_1/fields/text"><div  class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/text/label"/></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/text/value"/></span>
</div></xsl:if><xsl:if  test="rows/content/view_1/fields/date"><div  class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/date/label"/></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/date/value"/></span>
</div></xsl:if><xsl:if  test="rows/content/view_1/fields/separator"><div  class="col gen-fields-holder">
    <h1><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/separator/label"/></span></h1>
</div></xsl:if><xsl:if  test="rows/content/view_1/fields/textarea"><div  class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/textarea/label"/></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/textarea/value"/></span>
</div></xsl:if></div>
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
        <div class="_clear"/>
    </div>
    <div class="_clear"/>
</div></xsl:if></div></div></div></form>
       <div class="_clear"/>
      </div>
      <div class="_clear"/>
     </div>
     <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
     </div>
    </body>
   </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150806"/><xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150806"/><xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=20150806"/><xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150806"/><xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150806"/>
 </xsl:stylesheet>