<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="tdcolor">
        <xsl:param name="color" select="''"/>
        <xsl:for-each select="$color">
            <xsl:if test="(. != 0 or . != '') and . &lt; 10">
            	<xsl:attribute name="class"><xsl:text>tdcolor </xsl:text></xsl:attribute>
            	<span class="color{.}"></span>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!--TEMPLATE FOR TABLE LEGEND-->
    <xsl:template mode="table-legend" match="legend_color">
        <div class="box-legend">
            <xsl:for-each select="item">
                <div class="col-1-12 right-align">
                    <div class="legend-element">
                        <span class="label">
                        	<xsl:if test="string-length(label) &gt; 17">
                            	<xsl:attribute name="title"><xsl:value-of select="label"/></xsl:attribute>
                            </xsl:if>
                        	<xsl:value-of select="label"/>
                        </span>
                        <span class="color-label color{value}"></span>
                    </div>
                    <div class="_clear"/>
                </div>
            </xsl:for-each>
            <div class="_clear"/>
        </div>
    </xsl:template>


    <!--TEMPLATE FOR TABLE LEGEND-->
    <xsl:template mode="table-legend-ex" match="legend_color">
        <div class="box-legend">
            <xsl:for-each select="item">
                <div class="col-1-12 right-align">
                    <div class="legend-element">
                        <span class="label">
                            <xsl:if test="string-length(label) &gt; 17">
                                <xsl:attribute name="title"><xsl:value-of select="label"/></xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="label"/>
                        </span>
                        <span class="color-label" style="background-color:{value}"></span>
                    </div>
                    <div class="_clear"/>
                </div>
            </xsl:for-each>
            <div class="_clear"/>
        </div>
    </xsl:template>

    <xsl:template name="table-view">
        <xsl:param name="rel"/>
        <div class="table-view" rel="{$rel}">
            <div rel="list" class="icon list" title="Lista"/>
            <div rel="block" class="icon block" title="Lista em bloco"/>
            <div rel="slide" class="icon slide" title="Slide Lista"/>
        </div>
    </xsl:template>
    
    <xsl:template name="iframe">
    	<xsl:param name="url"/>
        <xsl:param name="name"/>
        <iframe name="{$name}" src="{$url}?v={$version}" scrolling="auto" id="id-{$name}" frameborder="0"></iframe>
    </xsl:template>
    
    <xsl:template name="image">
    	<xsl:param name="img"/>
        <xsl:param name="name"/>
        <div class="coverImage" style="background-image:url({$img}?v={$version})" id="id-{$name}"></div>
    </xsl:template>  
    
    <xsl:template name="plaintext">
    	<xsl:param name="value"/>
        <xsl:param name="name"/>
        <div class="plaintext borderColor" id="id-{$name}">
            <xsl:value-of select="$value" disable-output-escaping="yes"/>
        </div>
    </xsl:template>

    <xsl:template name="signature">
        <xsl:param name="name" select="'signature'"/>
        <xsl:param name="value"/>
        <xsl:param name="desc"/>
        <div class="_clear"/>
        <div class="divsignature" rel="{$name}" name="sep_{$name}">
            <xsl:if test="$value != ''">
                <xsl:attribute name="style">background-image:url(<xsl:value-of select="$value"/>);
                </xsl:attribute>
                <xsl:attribute name="signature">true</xsl:attribute>
            </xsl:if>
            <ul rel="{$name}" class="control-signature">
                <li rel="edit" class="control-edit"/>
                <li rel="confirm" class="control-confirm"/>
            </ul>
            <object name="{$name}" classid="clsid:84C046A7-4370-4D91-8737-87C12F4C63C5" id="{$name}obj" data="data:application/x-oleobject;BASE64,p0bAhHBDkU2HN4fBL0xjxQADAAB4DgAArwUAABMAAAAAABMA////AA==" class="signature"/>
            <div class="_clear"/>
        </div>
        <span class="signatureDesc">/<xsl:value-of select="$desc"/>/</span>
        <input type="hidden" name="{$name}" id="{$name}" value="{$value}"/>
    </xsl:template>
</xsl:stylesheet>