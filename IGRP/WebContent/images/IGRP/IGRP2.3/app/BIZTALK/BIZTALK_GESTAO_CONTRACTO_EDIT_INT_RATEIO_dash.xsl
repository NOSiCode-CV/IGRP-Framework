<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <!--XSL Generator (RED / DIM )--><!--HOME-HEADER-->
    <xsl:call-template name="home-header"/>
    <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
    <body>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    <!--CENTER PANE-->
    <div class="general">
      <div id="content">
        <div class="ui-layout-center">
          <xsl:call-template name="dialog-modal"/>
          <!-- START YOUR CODE HERE -->
          <div class="box-content"><!--PAGE TITLE-->
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="rows/content/title"/>
              
            </xsl:call-template>
            <!--END PAGE TITLE--><!-- START NOTIFICATION MESSAGES-->
            <xsl:apply-templates mode="notif_messages" select="rows/content/messages">
              <xsl:with-param name="class" select="'notification'"/>
              
            </xsl:apply-templates>
            <!-- END NOTIFICATION MESSAGES-->
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
              <!-- START HIDDEN FILTER-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <!-- END HIDDEN FILTER--><!-- START HIDDEN FORM-->
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
              <!-- END HIDDEN FORM--><!-- START FORM--><!--START TOOL BAR FROM-->
              <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"/>
              <!--END TOOL BAR FORM-->
              <div class="box-content">
                <xsl:if test="rows/content/form/label/interveniente">
                  <label> <span> <xsl:value-of select="rows/content/form/label/interveniente"/> </span>
                    <input type="text" name="{rows/content/form/value/interveniente/@name}" value="{rows/content/form/value/interveniente}" class="text" readonly="readonly" maxlength="30">
                    <xsl:call-template name="FIELD_validator">
                      <xsl:with-param name="field" select="rows/content/form/label/interveniente"/>
                      
                    </xsl:call-template>
                    </input>
                  </label>
                </xsl:if>
                <xsl:if test="rows/content/form/label/lista">
                  <div rel="lista" name="sep_lista">
                    <div id="lista">
                      <xsl:call-template name="page-title">
                        <xsl:with-param name="title" select="rows/content/form/label/lista"/>
                        
                        <xsl:with-param name="class" select="'subtitle'"/>
                        
                      </xsl:call-template>
                    </div>
                    <!-- START FORM LIST-->
                    <div class="simple-table" rel="DIV_lista">
                      <table class="editable-table" rel="T_lista">
                        <thead>
                          <tr>
                            <xsl:if test="rows/content/form/table/lista/label/contrato">
                              <xsl:if test="not(rows/content/form/table/lista/label/contrato/@visible)">
                                <th> <xsl:value-of select="rows/content/form/table/lista/label/contrato"/> </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/form/table/lista/label/produto">
                              <xsl:if test="not(rows/content/form/table/lista/label/produto/@visible)">
                                <th> <xsl:value-of select="rows/content/form/table/lista/label/produto"/> </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/form/table/lista/label/percentagem">
                              <xsl:if test="not(rows/content/form/table/lista/label/percentagem/@visible)">
                                <th> <xsl:value-of select="rows/content/form/table/lista/label/percentagem"/> </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/form/table/lista/label/valor">
                              <xsl:if test="not(rows/content/form/table/lista/label/valor/@visible)">
                                <th> <xsl:value-of select="rows/content/form/table/lista/label/valor"/> </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="rows/content/form/table/lista/label/prestador">
                              <xsl:if test="not(rows/content/form/table/lista/label/prestador/@visible)">
                                <th> <xsl:value-of select="rows/content/form/table/lista/label/prestador"/> </th>
                              </xsl:if>
                            </xsl:if>
                            <xsl:if test="not(rows/content/form/table/lista/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/lista/value/row[position() = 1]/@nodelete)">
                              <th align="center" width="10"> <xsl:if test="not(rows/content/form/table/lista/value/row[position() = 1]/@noupdate)">
                                  <img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" name="btn_lista_add" rel="lista" class="IGRP_addRow_form"/>
                                </xsl:if>
                              </th>
                            </xsl:if>
                          </tr>
                        </thead>
                        <tbody>
                          <xsl:for-each select="rows/content/form/table/lista/value/row[not(@total='yes')]">
                            <xsl:variable name="pos" select="(position()+1) mod 2"/>
                            <tr rel="{$pos}">
                              <xsl:if test="contrato">
                                <xsl:if test="not(contrato/@visible)">
                                  <td class="table_row{$pos}"><input type="hidden" name="p_contrato_fk_desc" value="{contrato_desc}"/>
                                    <xsl:value-of select="contrato_desc"/>
                                    <input type="hidden" name="p_contrato_fk" value="{contrato}"/></td>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="produto">
                                <xsl:if test="not(produto/@visible)">
                                  <td class="table_row{$pos}"><input type="hidden" name="p_produto_fk_desc" value="{produto_desc}"/>
                                    <xsl:value-of select="produto_desc"/>
                                    <input type="hidden" name="p_produto_fk" value="{produto}"/></td>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="percentagem">
                                <xsl:if test="not(percentagem/@visible)">
                                  <td class="table_row{$pos}"><input type="hidden" name="p_percentagem_fk_desc" value="{percentagem_desc}"/>
                                    <input type="texteditor" name="{../../label/percentagem/@name}_fk" value="{percentagem}" class="texteditor changeItem v_percentagem{$pos}" maxlength="6" rel="F_lista">
                                    <xsl:call-template name="FIELD_validator">
                                      <xsl:with-param name="field" select="../../label/percentagem"/>
                                      
                                    </xsl:call-template>
                                    </input></td>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="valor">
                                <xsl:if test="not(valor/@visible)">
                                  <td class="table_row{$pos}"><input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
                                    <input type="texteditor" name="{../../label/valor/@name}_fk" value="{valor}" class="texteditor changeItem v_valor{$pos}" maxlength="9" rel="F_lista">
                                    <xsl:call-template name="FIELD_validator">
                                      <xsl:with-param name="field" select="../../label/valor"/>
                                      
                                    </xsl:call-template>
                                    </input></td>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="prestador">
                                <xsl:if test="not(prestador/@visible)">
                                  <td class="table_row{$pos}"><input type="hidden" name="p_prestador_fk_desc" value="{prestador_desc}"/>
                                    <select name="{../../../../list/prestador/@name}_fk" class="select" maxlength="30" rel="F_lista">
                                      <xsl:call-template name="FIELD_validator">
                                        <xsl:with-param name="field" select="../../label/prestador"/>
                                        
                                      </xsl:call-template>
                                      <xsl:variable name="v_prestador" select="prestador"/>
                                      <xsl:for-each select="../../../../list/prestador/option">
                                        <option value="{value}">
                                        <xsl:if test="$v_prestador = value">
                                          <xsl:attribute name="selected">selected</xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="text"/> </option>
                                      </xsl:for-each>
                                    </select></td>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="not(@nodelete) or not(@noupdate)">
                                <td align="center" width="10"><xsl:if test="not(@nodelete)">
                                    <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_lista_del" class="IGRP_delRow_form" rel="lista"/>
                                  </xsl:if></td>
                              </xsl:if>
                              <input type="hidden" name="p_lista_id" value="{lista_id}"/>
                              <input type="hidden" name="p_contratoprod_id_fk" value="{contratoprod_id}"/>
                              <input type="hidden" name="p_contratoprod_id_fk_desc" value="{contratoprod_id_desc}"/>
                              <input type="hidden" name="p_contrato_id_fk" value="{contrato_id}"/>
                              <input type="hidden" name="p_contrato_id_fk_desc" value="{contrato_id_desc}"/>
                              <input type="hidden" name="p_produto_id_fk" value="{produto_id}"/>
                              <input type="hidden" name="p_produto_id_fk_desc" value="{produto_id_desc}"/>
                            </tr>
                          </xsl:for-each>
                        </tbody>
                      </table>
                    </div>
                    <!-- END FORM LIST--></div>
                </xsl:if>
              </div>
              <!-- END FORM--><!-- START FILTER--><!-- END FILTER--><!-- START TABELA--><!--  CONTEXT-MENU  -->
              <div class="table">
                <table class="sortable IGRP_table">
                  <thead>
                    <tr/>
                  </thead>
                  <tbody>
                    <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                      <xsl:variable name="pos" select="(position()+1) mod 2"/>
                      <tr class="">
                        <xsl:apply-templates mode="context-param" select="context-menu"/>
                        
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
              <!-- END TABELA-->
            </form>
            <!-- END YOUR CODE HERE --></div>
        </div>
        <!-- START HOME BOTTOM -->
        <xsl:call-template name="home-side"/>
        
      </div>
    </div>
    <!--HOME-FOOTER-->
     <script type="text/javascript">
		$(document).ready(function(e) {
			$(".changeItem").keypress(function(){
				var trId = $(this).parents("tr").attr("rel");
				//console.log($("tr:gt("+trId+") td input.v_percentagem","table[rel='T_produtos']").val());
				if($(this).val() != ''){
					if($(this).hasClass("v_valor"+trId))
						$("tr td input.v_percentagem"+trId,"table[rel='T_lista']").val('');
					else
						$("tr td input.v_valor"+trId,"table[rel='T_lista']").val('');	
				}
				else{
					if($(this).hasClass("v_valor"+trId))
						$("tr td input.v_percentagem"+trId,"table[rel='T_lista']").val('');
					else
						$("tr td input.v_valor"+trId,"table[rel='T_lista']").val('');
				}
			});
		});
	</script>
    </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20140625"/>
  <xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=20140625"/>
  <xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=20140625"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20140625"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20140625"/>
</xsl:stylesheet>
