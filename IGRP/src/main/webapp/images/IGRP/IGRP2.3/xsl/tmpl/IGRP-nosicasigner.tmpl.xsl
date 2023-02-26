<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="IGRP-nosicasigner" match="*" mode="IGRP-nosicasigner">
        <div class="box igrp-forms">
            <div class="box-body">
                <xsl:if test="./fields/nosicasigner_file">
                    <div class="form-group col-sm-3" item-name="nosicasigner_file" item-type="file">
                        <label for="{./fields/nosicasigner_file/@name}">
                            <xsl:value-of select="./fields/nosicasigner_file/label" />
                        </label>
                        <div class="input-group">
                            <input type="text" class="form-control not-form" readonly="">
                                <xsl:if test="./fields/nosicasigner_file/@temp-value">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="./fields/nosicasigner_file/@temp-value" />
                                    </xsl:attribute>
                                </xsl:if>
                            </input>
                            <span class="input-group-btn">
                                <span class="btn btn-primary file-btn-holder">
                                    <i class="fa fa-upload"></i>
                                    <input id="{./fields/nosicasigner_file/@name}" nosicasigner-control="nosicasigner_base64" value="{./fields/nosicasigner_file/value}" class="transparent file2base64" target-rend="nosicasigner_iframe" type="file" accept="application/pdf">
                                        <xsl:call-template name="setAttributes">
                                            <xsl:with-param name="field" select="./fields/nosicasigner_file" />
                                        </xsl:call-template>
                                    </input>
                                </span>
                            </span>
                        </div>
                        <span class="desc_label text-muted"><xsl:value-of select="./fields/nosicasigner_file/@placeholder" /></span>
                    </div>
                </xsl:if>

                <xsl:if test="./fields/nosicasigner_available_tokens">

                    <div class="col-sm-3 form-group holder_select hidden nosicasigner_available_tokens" id="holder_nosicasigner_available_tokens" item-name="nosicasigner_available_tokens" item-type="select">
                        <label for="{./fields/nosicasigner_available_tokens/@name}">
                            <xsl:value-of select="./fields/nosicasigner_available_tokens/label" />
                        </label>
                        <select class="form-control select2" id="nosicasigner_available_tokens">
                            <xsl:call-template name="setAttributes">
                                <xsl:with-param name="field" select="./fields/nosicasigner_available_tokens" />
                            </xsl:call-template>
                            <xsl:for-each select="./fields/nosicasigner_available_tokens/list/option">
                                <option value="{value}" label="{text}">
                                    <xsl:if test="@selected='true'">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <span>
                                        <xsl:value-of select="text" />
                                    </span>
                                </option>
                            </xsl:for-each>
                        </select>
                        <span class="desc_label text-muted"><xsl:value-of select="./fields/nosicasigner_available_tokens/@placeholder" /></span>
                    </div>

                </xsl:if>

                <xsl:if test="./fields/nosicasigner_available_certificates">

                    <div class="col-sm-3 form-group holder_select hidden nosicasigner_available_certificates" id="holder_nosicasigner_available_certificates" item-name="nosicasigner_available_certificates" item-type="select">
                        <label for="{./fields/nosicasigner_available_certificates/@name}">
                            <xsl:value-of select="./fields/nosicasigner_available_certificates/label" />
                        </label>
                        <select class="form-control select2" id="nosicasigner_available_certificates">
                            <xsl:call-template name="setAttributes">
                                <xsl:with-param name="field" select="./fields/nosicasigner_available_certificates" />
                            </xsl:call-template>
                            <xsl:for-each select="./fields/nosicasigner_available_certificates/list/option">
                                <option value="{value}" label="{text}">
                                    <xsl:if test="@selected='true'">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <span>
                                        <xsl:value-of select="text" />
                                    </span>
                                </option>
                            </xsl:for-each>
                        </select>
                        <span class="desc_label text-muted"><xsl:value-of select="./fields/nosicasigner_available_certificates/@placeholder" /></span>
                    </div>

                </xsl:if>

                <xsl:if test="./fields/nosicasigner_btn">
                    <div class="form-group col-sm-2 hidden" id="nosicasigner_btn" item-name="nosicasigner_btn" item-type="link">
                        <a href="{./fields/nosicasigner_btn}" class="link btn btn-primary form-link" target="nosicasigner_pdf">
                            <i class="fa fa-pencil"></i>
                            <span>
                                <xsl:value-of select="./fields/nosicasigner_btn/label" />
                            </span>
                        </a>
                    </div>
                </xsl:if>

                <div class="igrp-iframe  gen-container-item hidden" gen-class="" item-name="nosicasigner_iframe">  
                    <div class="box-body">
                      <iframe id="id-nosicasigner_iframe" style="min-height:650px" src=""/>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>