<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-separatorlist-add">
        <a class="btn fs-12 btn-sm btn-success show-add-row text-capitalize">
            Adicionar
        </a>
    </xsl:template>

    <xsl:template name="igrp-separatorlist-row-actions" mode="igrp-separatorlist-row-actions" match="*">
        <div class="d-flex align-items-center">
            <xsl:if test="not(@noedit) or @noedit != 'true'">
                <span class="table-row-undo btn btn-ghost-dark d-none" rel="{name()}">
                    <i class="ri-arrow-go-back-line"/>
                </span>
                <span class="table-row-edit btn btn-ghost-success " rel="{name()}">
                    <i class="ri-edit-2-line"/>
                </span>
            </xsl:if>
            <xsl:if test="not(@nodelete) or @nodelete != 'true'">
                <span class="table-row-remove btn btn-ghost-danger" rel="{name()}">
                    <i class="ri-delete-bin-line"/>
                </span>
            </xsl:if>
        </div>
    </xsl:template>

    <xsl:template name="igrp-separatorlist-after-table" mode="igrp-separatorlist-after-table" match="*">
        <xsl:if test="not(table/value/row[0])">
            <div class="p-3 no-data-message">
                <i class="small">
					Lista vazia. Clique em Adicionar para inserir dados na tabela
                </i>
            </div>
        </xsl:if>
    </xsl:template>

    <xsl:template name="igrp-separatorlist-card-attributes" mode="igrp-separatorlist-card-attributes" match="*">
        <xsl:if test="@noedit and @noedit = 'true'">
	      <xsl:attribute name="noedt">
	        <xsl:value-of select="@noedit" />
	      </xsl:attribute>
	    </xsl:if>
	    <xsl:if test="@noadd and @noadd = 'true'">
	      <xsl:attribute name="noadd">
	        <xsl:value-of select="@noadd" />
	      </xsl:attribute>
	    </xsl:if>
	    <xsl:if test="@nodelete and @nodelete = 'true'">
	      <xsl:attribute name="nodel">
	        <xsl:value-of select="@nodelete" />
	      </xsl:attribute>
	    </xsl:if>
    </xsl:template>

</xsl:stylesheet>