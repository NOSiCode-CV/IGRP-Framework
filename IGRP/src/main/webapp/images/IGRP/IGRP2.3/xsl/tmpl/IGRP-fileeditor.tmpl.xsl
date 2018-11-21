<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  >
  <!-- IGRP FILE EDITOR TMPL -->
  <xsl:template name="IGRP-fileeditor">
    <xsl:param name="dataURL"/>
    <xsl:param name="saveURL"/>
    <xsl:param name="saveLabel"/>
    <div id="igrp-fileeditor" class="igrp-fileeditor clearfix" data-url="{$dataURL}">
      <div class="igrp-fileeditor-left-panel col-xs-2" bg-color="secondary"></div>
      <div class="igrp-fileeditor-main-panel col-xs-10">
        <div class="gen-tab-holder nav-tabs-custom igrp-fileeditor-tab" item-name="igrp-fileeditor" tab-template="clean"> 
          <button class="igrp-fileeditor-save btn btn-sm btn-outline btn-success" href="{$saveURL}">
            <span><xsl:value-of select="$saveLabel"/></span>
          </button>
          <ul class="nav nav-tabs"></ul>
          <div class="tab-content">
          </div>
        </div>
      </div>
      <div id="fileeditor-add-modal" class="modal fade" role="dialog" >
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-body">
              <div class="form-group col-sm-8">
                <label>Name</label>
                <input type="text" class="form-control"/>
              </div>
              <button type="button" class="btn btn-primary col-sm-4 confirm-add" data-dismiss="modal">Confirm</button>
            </div>
          </div>
        </div>
      </div>
    </div>

  </xsl:template>

</xsl:stylesheet>