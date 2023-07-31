<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="GEN-separatorlist">
        <xsl:param name="tag" select="name()"/>
        <xsl:param name="isDialog" select="'false'"/>
        <xsl:param name="fields" select="ancestor::form/label/*[(@rel=$tag)]"/>
        <xsl:variable name="table-fields" select="$fields[@type!='hidden' and @type!='group' and not(@visible)]"/>
        <div class="box gen-container-item" gen-class="" item-name="{$tag}">
            <xsl:call-template name="box-header">
                <xsl:with-param name="title" select="."/>
                <xsl:with-param name="collapsible" select="'true'"/>
            </xsl:call-template>
            <div class="box-body IGRP-separatorlist" dialog="{$isDialog}" tag="{$tag}">
            	
                <div class="splist-form-holder">
                    <div class="splist-form" role="form">
                        <xsl:apply-templates mode="form-hidden" select="//rows/content/form/value">
                            <xsl:with-param name="rel" select="$tag"/>
                        </xsl:apply-templates>
                        <xsl:for-each select="$fields">
                            <xsl:call-template name="GEN-formfield">
                                <xsl:with-param name="tableEdit" select="true()"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </div>
                </div>
                <xsl:variable name="auxclass">
                    <xsl:if test="@style = 'ordertable'">ordertable</xsl:if>
                </xsl:variable>
                <div class="table-box box-body box-table-contents splist-table">
                    <table rel="T_separatorlist_1" id="{$tag}" class="table table-striped gen-data-table {$auxclass}">
                        <thead>
                            <tr>
                                <xsl:for-each select="$table-fields">
                                    <xsl:call-template name="GEN-table-field-head"/>
                                </xsl:for-each>
                                <th class="table-btn">
                                    <a class="table-row-add btn-xs link btn form-link btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                                        <i class="fa fa-plus"/>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:variable name="rows" select="//rows/content/form/table/*[name() = $tag]/value/row[not(@type) or not(@type = 'total')]"/>
                            <xsl:for-each select="$rows">
                                <tr>
                                    <input type="hidden" class="sl-row-id" name="p_{$tag}_id" value="{ *[name() = concat($tag,'_id')] }"/>
                                    <xsl:for-each select="*">
                                        <xsl:call-template name="GEN-table-row-items"/>
                                    </xsl:for-each>
                                    <td data-row="{position()}" class="table-btn">
                                        <xsl:if test="not(@noupdate)">
                                            <span class="table-row-edit btn btn-default " rel="{$tag}">
                                                <i class="fa fa-pencil"/>
                                            </span>
                                        </xsl:if>
                                        <xsl:if test="not(@nodelete)">
                                            <span class="table-row-remove btn btn-danger" rel="{$tag}">
                                                <i class="fa fa-times"/>
                                            </span>
                                        </xsl:if>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>