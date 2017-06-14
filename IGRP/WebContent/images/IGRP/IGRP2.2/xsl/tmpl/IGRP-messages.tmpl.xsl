<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="message_template" select="''"/>
<!-- TEMPLATE MANAGER -->
  <xsl:template match="*">
    <xsl:choose>
        <xsl:when test="$message_template = 'notif_messages'">
            <xsl:apply-templates mode="notif_messages" select="."/>
        </xsl:when>
    </xsl:choose>
  </xsl:template>

<xsl:template name="notif_messages" mode="notif_messages" match="messages">
    <div col="col" rel="notification">
        <xsl:for-each select="message[@type!='confirm' and @type!='debug']">
            <div class="notification {@type}">
            	<div class="icon"></div>
                <div class="messages"><xsl:value-of select="text()" disable-output-escaping="yes"/></div>
                <div class="close IGRP_notClose"></div>
            </div>
        </xsl:for-each>
    </div>
</xsl:template>

<xsl:template name="dialog-modal">
    <div class="dialog" id="dialog-modal">
    	<div class="title"><xsl:value-of select="$lngPath/title_modal_dialog"/></div>
        <div class="message">
            <xsl:value-of select="rows/content/messages/message[@type='confirm']" disable-output-escaping="yes"/>
        </div>
    </div>
</xsl:template>

<xsl:template name="JSlog_messages">
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <xsl:variable name="vFavUrl" select="document(rows/slide-menu/@file)/menus/link"/>
    <script type="text/javascript">
		var path_tmpl	="<xsl:value-of select='$path_tmpl_default'/>";
		var path		="<xsl:value-of select='$path'/>";
		var vFavUrl		="<xsl:value-of select='$vFavUrl'/>";
        <xsl:for-each select="$lngPath/js_messages/message">
        var JSMSG_<xsl:value-of select="translate(@name, $smallcase, $uppercase)"/> = '<xsl:value-of select="."/>';
        </xsl:for-each>
    </script>
</xsl:template> 
</xsl:stylesheet>