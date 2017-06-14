<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--CABEÇALHO DA LISTAGEM-->
  <xsl:template name="table" mode="table" match="table">
  	<xsl:param name="dataCrontrol" select="'data-talbe'"/>
    <div class="box-content resetPadding">
      <xsl:call-template name="titlecollapser">
        <xsl:with-param name="title" select="title"/>
      </xsl:call-template>
      <xsl:call-template name="table-view">
        <xsl:with-param name="rel" select="$dataCrontrol"/>
      </xsl:call-template>
      <div class="box-collapser addPaddingBottom10">
      	<xsl:apply-templates mode="tools-bar" select="tools-bar">
        	<xsl:with-param name="isTable" select="'true'"/>
        </xsl:apply-templates>
        <div class="box-table table-responsive">
          <!--LEGENDA DA TABELA-->
          <xsl:apply-templates select="legend_color" mode="table-legend" />
          <!--FIM LEGENDA DA TABELA--> 
          <!--FILTER AZ--> 
           <xsl:call-template name="filter-az">
                <xsl:with-param name="name" select="'A'"/>
                <xsl:with-param name="value" select="'B'"/>
                <xsl:with-param name="type" select="'filter_aznum'"/>
            </xsl:call-template>
            <!--FILTER AZ--> 
           <!-- TABELA-->
          <div class="table-container">
          	<!-- CTX MENU -->
            <xsl:apply-templates mode="context-menu" select="context-menu">
            	<xsl:with-param name="contextId" select="$dataCrontrol"/>
            </xsl:apply-templates>
            <table data-control="{$dataCrontrol}" class="IGRP_table default-table" cellspacing="0" width="100%" data-view="block">
            	<xsl:if test="control">
                	<xsl:for-each select="control/*">
                    	<xsl:if test=". != ''">
                    		<xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
              <thead>
                <tr>
                  <xsl:for-each select="label/*">
                    <th class="sorting"> <xsl:value-of select="text()" /> </th>
                  </xsl:for-each>
                  <th class="tdcolor">Cor</th>
                  <th class="checkbox">
                  	<input type="checkbox" class="IGRP_checkall" name="p_checkbox" value="1"  alt="Checkall" title="Checkall"/>
                  </th>
                  <th>Operacao</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="value/row">
                  <xsl:variable name="vPos" select="position()"/>
                  <tr class="IGRP_contextMenu" row="{$vPos}">
                  	<xsl:apply-templates mode="context-param" select="context-menu" /> 
                    <xsl:for-each select="*[name()!='context-menu' and name()!='color']">
                      <xsl:variable name="vName" select="name()"/>
                      <td data-title="{../../../label/*[name() = $vName]}" data-row="{$vPos}"><xsl:value-of select="." />
                           <xsl:if test="position() = 1">
                           		<xsl:apply-templates mode="cxtmenu-resp" select="../../../context-menu">
                                <xsl:with-param name="ctx" select="../context-menu"/>
                              </xsl:apply-templates>
                          </xsl:if>
                      </td>
                    </xsl:for-each>
                    <td class="tdcolor" data-title="Cor" data-row="{$vPos}"><xsl:call-template name="tdcolor">
						<xsl:with-param name="color" select="color"/>
					</xsl:call-template></td>
                    <td data-title="Checkbox" data-row="{$vPos}"><input type="checkbox" name="p_checkbox1" value="1"/></td>
                    <td data-title="Operacao" data-row="{$vPos}" class="operationTable">
                    	<xsl:apply-templates mode="operation-table" select="../../context-menu">
							<xsl:with-param name="ContextMenuRow" select="context-menu"/>
						</xsl:apply-templates>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <div class="_clear"/>
          </div>
          <!-- TABELA--> 
          <div class="_clear"/>
        </div>
        <div class="_clear"/>
      </div>
    </div>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl"/>
  <xsl:include href="../../xsl/tmpl/IGRP-operation-table.tmpl.xsl"/>
</xsl:stylesheet>