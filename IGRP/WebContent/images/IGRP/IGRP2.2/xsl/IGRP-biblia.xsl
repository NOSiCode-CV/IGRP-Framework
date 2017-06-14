<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <head>
    <xsl:call-template name="home-header"/>
    </head>
    <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    
    <!--BODY PAGE-->
    <div id="igrp-bodyPage">
      <xsl:if test="not(rows/target) or rows/target!='_blank'">
        <div class="bodyPageLeft">
          <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)" />
          
        </div>
      </xsl:if>
      <div class="bodyPageRigth"> 
        <!--PUT YOUT CODE HERE--> 
        <!--APPLICATION DIRECTORY-->
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
          <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="'Separador Lista'"/>
            </xsl:call-template>
            <div class="box-collapser">
               <div class="col" rel="DIV_separador" sep-name="group-separador">
                    <div class="col-1-4 item">
                        <div class="igrp_item">
                            <label>Nome</label><input type="text" name="p_nome" class="" rel="F_separador"/>
                        </div>
                    </div>
                    <div class="col-1-4 item">
                        <div class="igrp_item">
                            <label>Idade</label><input type="number" name="p_idade" class="" rel="F_separador"/>
                         </div>
                    </div>
                    <div class="col-1-4 item">
                        <div class="igrp_item">
                            <label>Data Nascimento</label>
                            <div class="itemIcon">
                                <input type="text" name="p_data" class="date"  rel="F_separador" trel="IGRP_datePicker"/>
                                <div class="calendar"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </div>
                    <div class="col-1-4 item">
                      <div class="igrp_item">
                           <label>Sexo</label>
                           <select name="p_selected" id="p_selected" class="" chosen="select" data-placeholder="Escolha o Sexo..." rel="F_separador">
                           <option value=""></option>
                           <option value="M" selected="selected">Maculino</option>
                           <option value="F">Femenino</option>
                           </select>
                           <div class="_clear"/>
                        </div>
                      <div class="_clear"/>
                   </div>
                    <div class="col-1-4 item">
                      <div class="igrp_item">
                          <label>Morada</label><textarea name="p_morada" class="" rel="F_separador"></textarea>
                          <div class="_clear"/>
                        </div>
                      <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item itemFile">
                      <div class="igrp_item">
                            <label>File</label>
                            <div class="itemIcon">
                                <input placeholder="Choose File"  class="notForm" disabled="disabled" file="fnemeIput1"/>
                                <span class="upload"></span>
                                <input type="file" class="uploadFile" name="p_file" id="fnemeIput1" rel="F_separador"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                      <div class="igrp_item">
                           <label>Escola</label>
                           <select name="p_select" multiple="multiple" id="p_select" class="" chosen="select" data-placeholder="Escolhe Escola..." rel="F_separador">
                           <option value=""></option>
                           <option value="1">Liceu</option>
                           <option value="2" selected="selected">Univercidade</option>
                           <option value="3">Liceu</option>
                           <option value="4">Jardim</option>
                           <option value="5">Ebi</option>
                           <option value="6">Primaria</option>
                           <option value="7">Escola Publica</option>
                           <option value="8">Escola Privado</option>
                           </select>
                           <div class="_clear"/>
                        </div>
                      <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                      <div class="igrp_item radio">
                          <div class="col-1-1">
                              <input type="checkbox" name="p_checkbox" class="radio" rel="F_separador" value="1"/>Tipo</div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                      <div class="igrp_item link">
                          <a href="" class="link">Link</a>
                            <input type="link" desc="Link" name="p_link" rel="F_separador" value="" target="_blank" style="display:none;"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                      <div class="igrp_item color">
                            <label>Estado</label>
                            <div class="itemIcon">
                                <input type="text" class="color" name="p_colorPicker" id="colorPickerrgba" rel="F_separador"/>
                                <input type="text" class="colorPicker notForm" relColor="colorPickerrgba" format="rgba" defaultColor="267199"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                  <div class="_clear"/>
                </div>
                <div class="col">
                    <div class="addRow separador">
                        <a rel="separador" class="IGRP_addRow"><img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" /><span>Adicionar</span></a>
                    </div>
                </div>
                <div class="col">
                    <div class="box-table table-responsive">
                      <ul class="contextMenu ctxSepListDialog" id="data-separador">
                            <li rel="separador" class="IGRP_editRow operationTable">
                                <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                                <span>Edit</span>
                            </li>
                            <li rel="separador" class="IGRP_delRow operationTable">
                                <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                                <span>Delete</span>
                            </li>
                        </ul>
                        <table rel="T_separador" data-control="data-separador" class="">
                            <thead>
                                <tr><th>Nome</th><th>Idade</th><th>Data Nascimento</th><th>Sexo</th><th>Morada</th><th>File</th>
                                <th>Escola</th><th>Tipo</th><th>Link</th><th class="tdcolor">Estado</th><th class="bEdDel"></th></tr>
                            </thead>
                            <tbody>
                                <tr row="1">
                                    <td data-title="Nome" data-row="1">Antonio Pires
                                    <input type='hidden' name='p_nome_fk' value='Antonio Pires'/>
                                    <span class="showResponsiveTable ctxmenu"></span>
                                    </td>
                                    <td data-title="Idade"  data-row="1">23<input type='hidden' name='p_idade_fk' value='23'/></td>
                                    <td data-title="Data Nascimento"  data-row="1">12-10-2010
                                    <input type='hidden' name='p_data_fk' value='12-10-2010'/></td>
                                    <td data-title="Sexo" data-row="1"></td>
                                    <td data-title="Morada" data-row="1"></td>
                                    <td data-title="File" data-row="1"></td>
                                    <td data-title="Escola" data-row="1"></td>
                                    <td data-title="Tipo" data-row="1">Tipo<input type='hidden' name='p_checkbox_fk' value='1'/></td>
                                    <td data-title="Link" data-row="1"></td><td data-title="Estado" data-row="1"></td>
                                    <td  data-title="Operacao"  data-row="1" class="bEdDel">
                                        <img src="{$path_tmpl}/img/icon/tools-bar/edit.png" rel="separador" class="IGRP_editRow"/>
                                        <img src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="separador" class="IGRP_delRow"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
               <div class="_clear"/>
           </div>
           <div class="_clear"/>
       </div>
        </form>
        <!--<xsl:apply-templates mode="table" select="rows/content/table"/>-->
        <div class="_clear"/>
      </div>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage"> </div>
    </body>
    </html>
  </xsl:template>
  <!--INCLUDE TEMPLATE-->
  <!--TEMPLATE HOME INCLUDE-->
  <xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-slide-menu.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-form-text-editor.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-applications.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-tab-menu.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-menu.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-table.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-virtualkeyboard.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-graph.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-process.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-finger-print.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-view.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-workflowtab.tmpl.xsl?v=1"/>
</xsl:stylesheet>