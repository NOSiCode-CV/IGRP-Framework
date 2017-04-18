<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
      </head>

      <body class="{$bodyClass} sidebar-off">
        
        <xsl:call-template name="IGRP-topmenu"/>

        <div class="container-fluid">
          <div class="row">
            
            <xsl:call-template name="IGRP-sidebar"/>
            
            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
              
              <section class="content-header">
                <h1>
                  <xsl:value-of select="rows/content/title"/>
                </h1>
              </section>
              
              <div class="content">
                <div class="row">
                  <div class="col-md-12">
                    
                    <!-- <div class="box" box-rel="form">
                      <div class="box-header">
                        <h3 class="box-title">Elementos de Formulário</h3>
                      </div>

                      <div class="box-body">
                        
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="nome">Nome</label>
                            <input type="text" class="form-control" name="p_nome" id="nome"/>
                          </div>               
                        </div>

                        <div class="form-group col-md-2" item-name="" item-type="">
                          <label for="data">Data Nascimento</label>
                          <div class="input-group">
                              <input type="text" class="form-control gen-date" id="data" name="p_data"/>
                              <span class="input-group-addon gen-date-icon"><i class="fa fa-calendar"></i></span>
                          </div>
                        </div>

                        <div class="col-md-1">
                          <div class="form-group">
                            <label for="idade">Idade</label>
                            <input type="number" class="form-control" name="p_idade" id="idade"/>
                          </div>               
                        </div>

                        <div class="col-md-2">
                          <div class="form-group">
                            <label for="file">Upload</label>
                            <input type="file" class="form-control" name="p_file" id="file"/>
                          </div>               
                        </div>

                        <div class="col-md-3">
                          <div class="form-group">
                            <div class="checkbox form-check-offset">
                              <label>
                                  <input type="checkbox" class="checkbox"/>
                                  <span>checkbox</span>
                              </label>
                            </div>
                          </div>               
                        </div>

                      </div>

                      <div class="box-footer">
                        <button class="btn">Enviar</button>
                      </div>
                    </div> -->

                  </div>
                </div>


              </div>
              


            </div>
          </div>
        </div>

        <xsl:call-template name="IGRP-bottom"/>
        
      </body>
    </html>
  </xsl:template>

  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>

</xsl:stylesheet>
