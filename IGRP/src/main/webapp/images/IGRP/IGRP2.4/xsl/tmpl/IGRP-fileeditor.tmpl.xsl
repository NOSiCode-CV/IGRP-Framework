<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  >
  <!-- IGRP FILE EDITOR TMPL -->
  <xsl:template name="IGRP-fileeditor">
    <xsl:param name="dataURL"/>
    <xsl:param name="createURL"/>
    <xsl:param name="saveURL"/>
    <xsl:param name="saveLabel"/>
    <div id="igrp-fileeditor" class="igrp-fileeditor clearfix" data-url="{$dataURL}" create-url="{$createURL}">
      <div class="igrp-fileeditor-left-panel" bg-color="secondary"></div>
      <div class="igrp-fileeditor-main-panel">
        <div class="gen-tab-holder nav-tabs-custom igrp-fileeditor-tab" item-name="igrp-fileeditor" tab-template="clean"> 
          <a class="igrp-fileeditor-save btn btn-sm btn-outline btn-success" href="{$saveURL}">
            <i class="fa fa-send"></i>
            <span><xsl:value-of select="$saveLabel"/></span> 
          </a>
          <ul class="nav nav-tabs"></ul>
          <div class="tab-content">
          </div>
        </div>
      </div>
      <div class="add-new-options hidden">
        <div class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">
              <i class="fa fa fa-ellipsis-v"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li class="add-new" type="folder"><a href="#">Add Folder</a></li>
              <li role="presentation" class="divider"></li>
              <li class="add-new" type="file" file-type="annotation" file-ext="java"><a href="#">Add Annotation</a></li>
              <li class="add-new" type="file" file-type="class" file-ext="java"><a href="#">Add Class</a></li>
              <li class="add-new" type="file" file-type="enum" file-ext="java"><a href="#">Add Enum</a></li>
              <li role="presentation" class="divider"></li>
              <li class="add-new" type="file" file-type="xml" file-ext="xml"><a href="#">Add XML</a></li>
              <li class="add-new" type="file" file-type="txt" file-ext="txt"><a href="#">Add Txt</a></li>
            </ul>
          </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>