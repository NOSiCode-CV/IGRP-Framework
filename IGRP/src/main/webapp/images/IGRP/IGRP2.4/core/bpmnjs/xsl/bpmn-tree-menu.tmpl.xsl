<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- GLOBAL PARAMS (WHEN TEMPLATE IS CALLED BY JS XML/XSL TRANSFORM) -->
  
  <!-- template name -->
  <xsl:param name="template" select="''"/>
  <!-- can edit? -->
  <xsl:param name="edit" select="'true'"/>
  <!-- edit title/alt node -->
  <xsl:param name="editTitleNode" select="'link_edit_desc'"/>
  <!-- can delete? -->
  <xsl:param name="delete" select="'false'"/>
  <!-- can add? -->
  <xsl:param name="add" select="'true'"/>
  <!-- add title/alt node -->
  <xsl:param name="addTitleNode" select="'link_add_desc'"/>
  <!-- type that cannot add - last level EX:(PAGE/PROC) -->
  <xsl:param name="hideAddBtnType" select="'PROC'"/>
  <!-- cick class (for js control) -->
  <xsl:param name="classClick" select="'treeClick'"/>

  <!-- TEMPLATE MANAGER -->
  <xsl:template match="*">
    <xsl:choose>
        <xsl:when test="$template = 'tree-menu'">
            <xsl:apply-templates select="." mode="tree-menu">
                <xsl:with-param name="edit" select="$edit"/>
                <xsl:with-param name="editTitleNode" select="$editTitleNode"/>
                <xsl:with-param name="delete" select="$delete"/>
                <xsl:with-param name="add" select="$add"/>
                <xsl:with-param name="addTitleNode" select="$addTitleNode"/>
                <xsl:with-param name="classClick" select="$classClick"/>
                <xsl:with-param name="hideAddBtnType" select="$hideAddBtnType"/>

            </xsl:apply-templates>
        </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- /TEMPLATE MANAGER -->

  <xsl:template name="tree-menu" mode="tree-menu" match="table">
    <xsl:param name="edit" select="'true'"/>
    <xsl:param name="editTitleNode" select="'link_edit_desc'"/>
    <xsl:param name="delete" select="'false'"/>
    <xsl:param name="add" select="'true'"/>
    <xsl:param name="addTitleNode" select="'link_add_desc'"/>
    <xsl:param name="classClick" select="'treeClick'"/>
    <xsl:param name="hideAddBtnType" select="'PROC'"/>

    <ul class="nav nav-sidebar" id="sa-service-list">
        <xsl:for-each select="value/row[id_pai = '']/title">
            <xsl:variable name="vId" select="../id"/>
            
            <li class="treeview">
                <xsl:if test="//value/row[id_pai = $vId]">
                  <xsl:attribute name="type">node</xsl:attribute>
                </xsl:if>
                <a id="{$vId}">
                    <xsl:if test="../id_pai != ''">
                        <xsl:attribute name="idPai">
                            <xsl:value-of select="../id_pai"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../id_objeto != ''">
                        <xsl:attribute name="idObj">
                            <xsl:value-of select="../id_objeto"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../tipo != ''">
                        <xsl:attribute name="tipo">
                            <xsl:value-of select="../tipo"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../link_add != ''">
                        <xsl:attribute name="linkAdd">
                            <xsl:value-of select="../link_add"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../link_edit != ''">
                        <xsl:attribute name="linkEdit">
                            <xsl:value-of select="../link_edit"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="//value/row[id_pai = $vId]">
                          <i class="fa fa-angle-right pull-right icon"></i>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="type">line</xsl:attribute>
                          <xsl:if test="../link != ''">
                              <xsl:attribute name="href">
                                <xsl:value-of select="../link"/>
                              </xsl:attribute>
                              <xsl:attribute name="class">
                                <xsl:value-of select="$classClick"/>
                              </xsl:attribute>
                          </xsl:if>
                          <xsl:if test="../target != ''">
                                <xsl:attribute name="target">
                                    <xsl:value-of select="../target"/>
                                </xsl:attribute>
                          </xsl:if>
                          <i class="fa fa-angle-right"></i>
                        </xsl:otherwise>
                    </xsl:choose>
                    <span><xsl:value-of select="."/></span>
                    <div class="tree-menu-options">

                        <xsl:variable name="addTitle">
                          <xsl:choose>
                            <xsl:when test="../*[name() = $addTitleNode ]"><xsl:value-of select="../*[name() = $addTitleNode ]"/></xsl:when>
                            <xsl:otherwise>Add</xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="editTitle">
                          <xsl:choose>
                            <xsl:when test="../*[name() = $editTitleNode ]"><xsl:value-of select="../*[name() = $editTitleNode ]"/></xsl:when>
                            <xsl:otherwise>Edit</xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>

                        <xsl:if test="//value/row[id_pai = $vId]  or (../id_pai = '' or not(../id_pai))">
                            <xsl:if test="$add = 'true'">
                              <div class="btn addItem noHide" title="{$addTitle}">
                                <i class="fa fa-plus-circle"/>
                              </div>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="$edit = 'true'">
                          <div class="btn editItem" title="{$editTitle}">
                            <i class="fa fa-edit"/>
                          </div>
                        </xsl:if>
                        <xsl:if test="$delete = 'true'">
                          <div class="btn deleteItem" title="Delete"/>
                        </xsl:if>
                    </div>
                </a>
                <xsl:if test="//value/row[id_pai = $vId]">
                    <xsl:call-template name="pes-tree-menu">
                        <xsl:with-param name="id" select="$vId"/>
                        <xsl:with-param name="edit" select="$edit"/>
                        <xsl:with-param name="delete" select="$delete"/>
                        <xsl:with-param name="add" select="$add"/>
                        <xsl:with-param name="classClick" select="$classClick"/>
                        <xsl:with-param name="hideAddBtnType" select="$hideAddBtnType"/>
                    </xsl:call-template>
                </xsl:if>
            </li>
        </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template name="pes-tree-menu">
    <xsl:param name="edit" select="'true'"/>
    <xsl:param name="editTitleNode" select="'link_edit_desc'"/>
    <xsl:param name="delete" select="'false'"/>
    <xsl:param name="add" select="'true'"/>
    <xsl:param name="addTitleNode" select="'link_add_desc'"/>
    <xsl:param name="id" select="''"/>
    <xsl:param name="classClick" select="'treeClick'"/>
    <xsl:param name="hideAddBtnType" select="'PROC'"/>

   <!--  <xsl:variable name="addTitle">
      <xsl:choose>
        <xsl:when test="label/link_add"><xsl:value-of select="label/link_add"/></xsl:when>
        <xsl:otherwise>Add</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="editTitle">
      <xsl:choose>
        <xsl:when test="label/link_edit"><xsl:value-of select="label/link_edit"/></xsl:when>
        <xsl:otherwise>Edit</xsl:otherwise>
      </xsl:choose>
    </xsl:variable> -->

    <ul class="treeview-menu">
        <xsl:for-each select="//value/row[id_pai = $id]/title">
            <xsl:variable name="vId" select="../id"/>
            <li class="treeview">
                <a id="{$vId}">
                    <xsl:if test="../id_pai != ''">
                        <xsl:attribute name="idPai">
                            <xsl:value-of select="../id_pai"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../id_objeto != ''">
                        <xsl:attribute name="idObj">
                            <xsl:value-of select="../id_objeto"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../tipo != ''">
                        <xsl:attribute name="tipo">
                            <xsl:value-of select="../tipo"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../link_add != ''">
                        <xsl:attribute name="linkAdd">
                            <xsl:value-of select="../link_add"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="../link_edit != ''">
                        <xsl:attribute name="linkEdit">
                            <xsl:value-of select="../link_edit"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="//value/row[id_pai = $vId]">
                          <xsl:attribute name="type">node</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:attribute name="type">line</xsl:attribute>
                          <xsl:if test="../link != ''">
                              <xsl:attribute name="href">
                                <xsl:value-of select="../link"/>
                              </xsl:attribute>
                          
                            <xsl:attribute name="class">
                              <xsl:value-of select="$classClick"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:if test="../target != ''">
                                <xsl:attribute name="target">
                                    <xsl:value-of select="../target"/>
                                </xsl:attribute>
                          </xsl:if>
                          <i class="fa fa-angle-right"></i>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="//value/row[id_pai = $vId]">
                      <i class="fa fa-angle-right icon"></i>
                    </xsl:if>
                    <span><xsl:value-of select="."/></span>
                    
                    <div class="tree-menu-options">
                        <xsl:variable name="addTitle">
                          <xsl:choose>
                            <xsl:when test="../*[name() = $addTitleNode ]"><xsl:value-of select="../*[name() = $addTitleNode ]"/></xsl:when>
                            <xsl:otherwise>Add</xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="editTitle">
                          <xsl:choose>
                            <xsl:when test="../*[name() = $editTitleNode ]"><xsl:value-of select="../*[name() = $editTitleNode ]"/></xsl:when>
                            <xsl:otherwise>Edit</xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>
                        <!-- <xsl:if test="//value/row[id_pai = $vId]  or (../id_pai = '' or not(../id_pai))"> -->
                        <xsl:if test="../tipo != $hideAddBtnType">
                            <xsl:if test="$add = 'true'">
                              <div class="btn addItem noHide" title="{$addTitle}">
                                <i class="fa fa-plus-circle"/>
                              </div>
                            </xsl:if>
                        </xsl:if>
                        <!-- </xsl:if> -->

                        <xsl:if test="$edit = 'true'">
                          <div class="btn editItem" title="{$editTitle}">
                            <i class="fa fa-edit"/>
                          </div>
                        </xsl:if>

                        <xsl:if test="$delete = 'true'">
                          <div class="btn deleteItem" title="Delete"/>
                        </xsl:if>
                    </div>
                </a>
                <xsl:if test="//value/row[id_pai = $vId]">
                    <xsl:call-template name="pes-tree-menu">
                        <xsl:with-param name="id" select="$vId"/>
                        <xsl:with-param name="edit" select="$edit"/>
                        <xsl:with-param name="delete" select="$delete"/>
                        <xsl:with-param name="add" select="$add"/>
                        <xsl:with-param name="classClick" select="$classClick"/>
                        <xsl:with-param name="hideAddBtnType" select="$hideAddBtnType"/>
                    </xsl:call-template>
                </xsl:if>
            </li>
        </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>