<div  class="box-content resetPadding gen-container-item" gen-id="body">
    <div class="box-collapser">
        <div class="col">
            <div gen-id="view-content">
                <div class="col" gen-id="view-data">
                    <div class="viewDados addPaddingBottom10" gen-id="drop-zone">
                        <xsl:if  test="#path#/fields/text">
                            <div  class="groupView borderColor gen-fields-holder">
                                <span class="viewLabel">
                                    <span gen-lbl-setter="">
                                        <xsl:value-of select="#path#/fields/text/label"/>
                                    </span>
                                </span>
                                <span class="viewValue">
                                    <xsl:value-of select="#path#/fields/text/value"/>
                                </span>
                            </div>
                        </xsl:if>
                        <xsl:if  test="#path#/fields/separator">
                            <div  class="col gen-fields-holder">
                                <h1>
                                    <span gen-lbl-setter="">
                                        <xsl:value-of select="#path#/fields/separator/label"/>
                                    </span>
                                </h1>
                            </div>
                        </xsl:if>
                        <xsl:if  test="#path#/fields/link">
                            <div  class="groupView borderColor gen-fields-holder">
                                <span class="viewValue link">
                                    <a class="bClick" href="{#path#/fields/link/value}" target="_blank">
                                        <span gen-lbl-setter="">
                                            <xsl:value-of select="#path#/fields/link/label"/>
                                        </span>
                                    </a>
                                </span>
                            </div>
                        </xsl:if>
                        <xsl:if  test="#path#/fields/separator">
                            <div  class="col gen-fields-holder">
                                <h1>
                                    <span gen-lbl-setter="">
                                        <xsl:value-of select="#path#/fields/separator/label"/>
                                    </span>
                                </h1>
                            </div>
                        </xsl:if>
                    </div>
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
        <div class="_clear"/>
    </div>
    <div class="_clear"/>
</div>