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
      <xsl:call-template name="home-slide-menu"/>
      <div class="bodyPageRigth"> 
        <!--PUT YOUT CODE HERE--> 
        <div class="box-head showTabMobile"><xsl:value-of select="rows/content/title"/></div>
        <!--APPLICATION DIRECTORY-->
        <xsl:apply-templates mode="app" select="document(rows/applications/@file)" />
        <!--TAB MENU-->
        <xsl:apply-templates mode="tab-menu" select="rows/content/menu" />
        <!--SIMPLE MENU-->
         <xsl:apply-templates mode="simple-menu" select="rows/content/menu" />
        <!--NOTIFICATION--> 
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" />
        <!--Graficos-->
        <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="'Graficos'"/>
            </xsl:call-template>
            <div class="box-collapser">
            	<div class="col-1-3">
                    <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/grafico" />
                        <xsl:with-param name="chart_type" select="'stackedgroupedcolumn'"/>
                        <xsl:with-param name="height" select="'250'"/>
                        <xsl:with-param name="title" select="'Grafico spline'"/>
                        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'"/>
                    </xsl:call-template>
                <div class="_clear"/>
                </div>
                <div class="col-1-3">
                    <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/graficopie" />
                        <xsl:with-param name="chart_type" select="'pie'"/>
                        <xsl:with-param name="height" select="'250'"/>
                        <xsl:with-param name="title" select="'Grafico pie'"/>
                    </xsl:call-template>
                	<div class="_clear"/>
                </div>
                <div class="col-1-3">
                    <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/grafifunel" />
                        <xsl:with-param name="chart_type" select="'tablecharts'"/>
                        <xsl:with-param name="height" select="'250'"/>
                        <xsl:with-param name="title" select="'Grafico Funnel'"/>
                    </xsl:call-template>
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
    	</div>
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">
        <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="'Elementos de Formulario'"/>
            </xsl:call-template>
            <div class="box-collapser">
                	<div id="IGRP_item_form">
                	<div class="col-1-4 item">
                    	<div class="igrp_item">
                   			<label><span class="riquired">*</span>Nome</label><input type="text" name="p_name" class="required email"/>
                        	<div class="_clear"/>
                        </div>
                    	<div class="_clear"/>
                    </div>
                    <div class="col-1-4 item">
                    	<div class="igrp_item">
                            <label>Idade</label><input type="number" name="p_number" class=""/>
                            <div class="_clear"/>
                         </div>
                        <div class="_clear"/>
                    </div>
                    <div class="col-1-4 item">
                        <div class="igrp_item">
                            <label>Data Nascimento Data Nascimento Data Nascimento Data Nascimento</label>
                            <div class="itemIcon">
                            	<input type="text" name="p_date" class="date" trel="IGRP_datePicker"/>
                            	<div class="calendar"/>
                            </div>
                        	<div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
                    <div class="col-1-4 item">
                    	<div class="igrp_item"><label>Lookup</label>
                        	<div class="itemIcon">
                        		<input type="LOOKUP" name="p_lookup" class="lookup required"/>
                                <xsl:call-template name="lookup-tool">
                                    <xsl:with-param name="page" select="'LOOKUP'"/>
                                    <xsl:with-param name="action" select="'LOOKUP_BI'"/>
                                    <xsl:with-param name="name" select="'edson'"/>
                                    <xsl:with-param name="js_lookup" select="'IGRP-biblia.xml'"/>
                                </xsl:call-template>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
                    <div class="col-1-4 item">
                    	<div class="igrp_item">
                            <label>Radio list</label>
                            <div class="col-1-1"><input type="radio" name="radio" class="radio"/>Fogo</div>
                            <div class="col-1-1"><input type="radio" name="radio" class="radio"/>Brava</div>
                            <div class="col-1-1"><input type="radio" name="radio" class="radio"/>Santiago</div>
                           <!-- <div class="col-1-1"><input type="radio" name="radio" class="radio"/>Maio</div>-->
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                    	<div class="igrp_item">
                            <label>Checkbox list</label>
                            <div class="col-1-1"><input type="checkbox" name="Arroz" class="radio"/>Arroz</div>
                            <div class="col-1-1"><input type="checkbox" name="Batata" class="radio"/>Batata</div>
                            <div class="col-1-1"><input type="checkbox" name="Manteiga" class="radio"/>Manteiga</div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-2 item">
                   		<div class="igrp_item">
                        	<label>Informacao</label><textarea name="p_critica" class="">critica</textarea>
                        	<div class="_clear"/>
                        </div>
                   		<div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                    	<div class="igrp_item radio">
                        	<div class="col-1-1"><input type="radio" name="radioe" class="radio"/>Ilha<span class="riquired">*</span></div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                    	<div class="igrp_item checkbox">
                        	<div class="col-1-1"><input type="checkbox" name="checkbox" class="radio"/>Tipo</div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   	  <div class="igrp_item">
                           <label>Escola</label><select name="p_select" class="" chosen="select" data-placeholder="Escolhe Escola...">
                           <option value=""></option>
                           <option value="Liceu">Liceu</option>
                           <option value="Univercidade">Univercidade</option>
                           </select>
                           <div class="_clear"/>
                        </div>
                   		<div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   	  <div class="igrp_item">
                           <label>Escola</label><select name="" class="p_selectm required" chosen="select" data-placeholder="Escolhe Escola..." multiple="multiple">
                           <option value=""></option>
                           <option value="01">Liceu</option>
                           <option value="02">Univercidade</option>
                           <option value="03">Liceu</option>
                           <option value="04">Jardim</option>
                           <option value="05">Ebi</option>
                           <option value="06">Primaria</option>
                           <option value="07">Escola Publica</option>
                           <option value="08">Escola Privado</option>
                           </select>
                           <div class="_clear"/>
                        </div>
                   		<div class="_clear"/>
                   </div>
                   <div class="col-1-4 item ">
                   		<div class="igrp_item">
                            <label>File</label>
                            <div class="itemIcon">
                                <input class="notForm" placeholder="Choose File" disabled="disabled" file="nemeIput"/>
                                <span class="upload"></span>
                                <input type="file" class="uploadFile" name="nemeIput" id="nemeIput"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                    	<div class="igrp_item radio">
                        	<div class="col-1-1"><input type="radio" name="radioe" class="radio"/>Ilha</div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col item">
                   		<div class="igrp_item texteditor">
                            <label>Text Editor</label>
                            <xsl:call-template name="text-editor">
                            	<xsl:with-param name="name" select="'teste'"/>
                                <xsl:with-param name="value" select="'Teste Text Editor'"/>
                            </xsl:call-template>
                        </div>
                   </div>
                   <div class="col-1-4 item itemFile">
                   		<div class="igrp_item">
                            <label>File</label>
                            <div class="itemIcon">
                                <input class="uploadFile" placeholder="Choose File" disabled="disabled" file="nemeIput1"/>
                                <span class="upload"></span>
                                <input type="file" class="uploadFile" name="nemeIput" id="nemeIput1"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   		<div class="igrp_item">
                            <label>Tecaldo Virtual</label>
                            <div class="itemIcon">
                                <xsl:call-template name="VirtualKeyBoard">
                                    <xsl:with-param name="type" select="'vkb_aznum'"/>
                                    <xsl:with-param name="rel" select="'vkbaznum'"/>
                                    <xsl:with-param name="input_type" select="'password'"/>
                                    <xsl:with-param name="input_name" select="'vkb_aznum'"/>
                                </xsl:call-template>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                    	<div class="igrp_item link">
                        	<a href="" class="link">Link</a>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   		<div class="igrp_item">
                            <label>Tecaldo Virtual</label>
                            <div class="itemIcon">
                                <xsl:call-template name="VirtualKeyBoard">
                                    <xsl:with-param name="type" select="'vkb_all'"/>
                                    <xsl:with-param name="rel" select="'vkbaz'"/>
                                    <xsl:with-param name="input_type" select="'password'"/>
                                    <xsl:with-param name="input_name" select="'vkb_aznum'"/>
                                </xsl:call-template>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   
                   <div class="col-1-4 item">
                   		<div class="igrp_item">
                            <label>Tecaldo Virtual</label>
                            <div class="itemIcon">
                                <xsl:call-template name="VirtualKeyBoard">
                                    <xsl:with-param name="type" select="'vkb_num'"/>
                                    <xsl:with-param name="rel" select="'vkbnum'"/>
                                    <xsl:with-param name="input_type" select="'password'"/>
                                    <xsl:with-param name="input_name" select="'vkb_aznum'"/>
                                </xsl:call-template>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   		<div class="igrp_item color">
                            <label>Color Picker HEX</label>
                            <div class="itemIcon">
                                <input type="text" class="color" name="p_colorPicker" id="colorPicker"/>
                                <input type="text" class="colorPicker notForm" relColor="colorPicker"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   		<div class="igrp_item color">
                            <label>Color Picker RBGA</label>
                            <div class="itemIcon">
                                <input type="text" class="color" name="p_colorPicker" id="colorPicker1"/>
                                <input type="text" class="colorPicker notForm" relColor="colorPicker1" format="rgba" defaultColor="a7d447"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="col-1-4 item">
                   		<div class="igrp_item color">
                            <label>Color Picker RGB</label>
                            <div class="itemIcon">
                                <input type="text" class="color" name="p_colorPicker" id="colorPicker2"/>
                                <input type="text" class="colorPicker notForm" relColor="colorPicker2" format="rgb" defaultColor='00F'/>
                            </div>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                   </div>
                   <div class="_clear"/>
                   </div>
                   <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/>
            	<div class="_clear"/>
            </div>
            <div class="_clear"/>
    	</div>
        <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="'Separador Lista'"/>
            </xsl:call-template>
            <div class="box-collapser">
            	 <div class="col" rel="DIV_separador" sep-name="group-separador">
                    <div class="col-1-4 item">
                        <div class="igrp_item">
                            <label>Nome</label><input type="text" name="p_nome" class="important" rel="F_separador"/>
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
                           <select name="p_selected" id="p_selected" class="important" chosen="select" data-placeholder="Escolha o Sexo..." rel="F_separador">
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
                            <input type="link" desc="Link" name="p_link" rel="F_separador" value="http://www.hctmnbfiqs.bkv" target="_blank" style="display:none;"/>
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
       
       <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="'Separador Dialog'"/>
            </xsl:call-template>
            <div class="box-collapser">
                 <div class="D_separador_dialog IGRP_dialogbox">
                 	 <div class="IGRP_dialogboxTop">
                     	<div class="titlecollapser">Separador Dialog</div>
                        <div class="IGRP_btn_close" rel="separador_dialog"/>
                     </div>
                     <div class="IGRP_dialogboxCenter">
                         <div class="col" rel="DIV_separador_dialog" sep-name="group-separador_dialog">
                            <div class="col-1-4 item">
                                <div class="igrp_item">
                                    <label>Nome</label><input type="text" name="p_nome" class="" rel="F_separador_dialog"/>
                                </div>
                            </div>
                            <div class="col-1-4 item">
                                <div class="igrp_item">
                                    <label>Idade</label><input type="number" name="p_idade" class="" rel="F_separador_dialog"/>
                                 </div>
                            </div>
                            <div class="col-1-4 item">
                                <div class="igrp_item">
                                    <label>Data Nascimento</label>
                                    <div class="itemIcon">
                                        <input type="text" name="p_data" class="date"  rel="F_separador_dialog" trel="IGRP_datePicker"/>
                                        <div class="calendar"/>
                                    </div>
                                    <div class="_clear"/>
                                </div>
                            </div>
                            <div class="col-1-4 item">
                              <div class="igrp_item">
                                   <label>Sexo</label>
                                   <select name="p_selected" id="p_selected" class="" chosen="select" data-placeholder="Escolha o Sexo..." rel="F_separador_dialog">
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
                                    <label>Morada</label><textarea name="p_morada" class="" rel="F_separador_dialog"></textarea>
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
                                        <input type="file" class="uploadFile" name="p_file" id="fnemeIput1" rel="F_separador_dialog"/>
                                    </div>
                                    <div class="_clear"/>
                                </div>
                                <div class="_clear"/>
                           </div>
                           <div class="col-1-4 item">
                              <div class="igrp_item">
                                   <label>Escola</label>
                                   <select name="p_select" multiple="multiple" id="p_select" class="" chosen="select" data-placeholder="Escolhe Escola..." rel="F_separador_dialog">
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
                                        <input type="checkbox" name="p_checkbox" class="radio" rel="F_separador_dialog" value="1"/>Tipo</div>
                                    <div class="_clear"/>
                                </div>
                                <div class="_clear"/>
                           </div>
                           <!--<div class="col-1-4 item">
                                <div class="igrp_item link">
                                    <a href="" class="link">Link</a>
                                    <input type="link" desc="Link" name="p_link" rel="F_separador_dialog" value="http://www.hctmnbfiqs.bkv" target="_blank" style="display:none;"/>
                                </div>
                                <div class="_clear"/>
                           </div>-->
                           <div class="col-1-4 item">
                                <div class="igrp_item color">
                                    <label>Estado</label>
                                    <div class="itemIcon">
                                        <input type="text" class="color" name="p_colorPicker" id="colorPickerrgba_diag" rel="F_separador_dialog"/>
                                        <input type="text" class="colorPicker notForm" relColor="colorPickerrgba_diag" format="rgba" defaultColor="267199"/>
                                    </div>
                                    <div class="_clear"/>
                                </div>
                                <div class="_clear"/>
                           </div>
                            <div class="_clear"/>
                        </div>
                    	<div class="_clear"/>
                    </div>
                    <div class="dialog_btnContainer">
                    	<div class="col">
                    		<div class="addRow separador">
                        		<a rel="separador_dialog" class="IGRP_row_confirm">
                                	<img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" /><span>Confirmar</span></a>
                                <a rel="separador_dialog" class="IGRP_row_confirmClose">
                                	<img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" /><span>Confirmar e Fechar</span></a>
                   			 </div>
                		</div>
                    </div>
                	<div class="_clear"/>
                </div>
                <div class="col">
                    <div class="addRow separador">
                        <a rel="separador_dialog" class="IGRP_addRow_diag">
                        <img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" /><span>Adicionar</span></a>
                    </div>
                </div>
                <div class="col">
                    <div class="box-table table-responsive">
                    	<ul class="contextMenu ctxSepListDialog" id="data-separador_dialog">
                            <li rel="separador_dialog" class="IGRP_editRow operationTable" type="_diag">
                                <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
                                <span>Edit</span>
                            </li>
                            <li rel="separador_dialog" class="IGRP_delRow operationTable" type="_diag">
                                <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
                                <span>Delete</span>
                            </li>
                        </ul>
                        <table rel="T_separador_dialog" data-control="data-separador_dialog" class="">
                            <thead>
                                <tr><th>Nome</th><th>Idade</th><th>Data Nascimento</th><th>Sexo</th><th>Morada</th><th>File</th>
                                <th>Escola</th><th>Tipo</th><!--<th>Link</th>--><th class="tdcolor">Estado</th><th class="bEdDel"></th></tr>
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
                                    <!--<td data-title="Link" data-row="1"></td>--><td data-title="Estado" data-row="1"></td>
                                    <td  data-title="Operacao"  data-row="1" class="bEdDel">
                                        <img src="{$path_tmpl}/img/icon/tools-bar/edit.png" rel="separador_dialog" class="IGRP_editRow_diag"/>
                                        <img src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="separador_dialog" class="IGRP_delRow"/>
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
       
       
       <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="'Form Lista'"/>
            </xsl:call-template>
            <div class="box-collapser">
             	<div class="col showResponsiveTable">
                    <div class="addRowFormlist addRow">
                        <a rel="formlist" class="IGRP_addRowForm" >
                            <img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png"/>
                            <span>Adicionar</span>
                        </a>
                    </div>
                 </div>
            	 <div class="col">
                    <div class="box-table table-responsive">
                        <table rel="T_formlist" data-control="data-formlist" class="IGRP_formlist">
                            <thead>
                                <tr><th>Nome</th><th>Idade</th><th>Data Nascimento</th>
                                <th>Sexo</th><th>File</th><th>Escola</th><th>Tipo</th><th>Link</th>
                                <th class="fBtn">
                                	<img src="{$path_tmpl}/img/icon/tools-bar/add.png" rel="formlist" class="IGRP_addRowForm"/>
                                </th></tr>
                            </thead>
                            <tbody>
                                <tr row='1'>
                                    <td data-title="Name" data-row="1">
                                    	<div class="itemIcon">
                                            <input type="text" name="p_data" class="date" trel="IGRP_datePicker"/>
                                            <div class="calendar"/>
                                        </div>
                                    	
                                    	<span class="showResponsiveTable respDelRow">
                                        <img src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="formlist" class="IGRP_delRowForm"/></span>
                                    </td>
                                    <td data-title="Idade" data-row="1"><input type='number' name='p_idade_fk' value='23'/></td>
                                    <td data-title="Data Nascimento" data-row="1">
                                    	<input type="text" name='p_nome' value='Antonio Pires'/>
                                    </td>
                                    <td data-title="Sexo" data-row="1">
                                       <select name="p_selected" id="p_selected" chosen="select" data-placeholder="Escolha o Sexo...">
                                           <option value=""></option>
                                           <option value="M">Maculino</option>
                                           <option value="F">Femenino</option>
                                       </select>
                           			</td>
                                    <td data-title="File" data-row="1">
                                    	<div class="itemIcon">
                                            <input class="notForm" placeholder="Choose File" disabled="disabled" file="fnemeIput1"/>
                                            <span class="upload"></span>
                                            <input type="file" class="uploadFile" name="p_file" id="fnemeIput1"/>
                                        </div>
                                    </td>
                                    <td data-title="Escola" data-row="1">
                                        <select name="p_select" id="p_select" chosen="select" data-placeholder="Escolhe Escola..." multiple="multiple">
                                           <option value=""></option>
                                           <option value="1">Liceu</option>
                                           <option value="2">Univercidade</option>
                                           <option value="3">Liceu</option>
                                           <option value="4">Jardim</option>
                                           <option value="5">Ebi</option>
                                           <option value="6">Primaria</option>
                                           <option value="7">Escola Publica</option>
                                           <option value="8">Escola Privado</option>
                                        </select>
                           			</td>
                                    <td data-title="Tipo" data-row="1"><input type="checkbox" name="p_checkbox" class="radio" value="1"/></td>
                                    <td data-title="Link" data-row="1"><a href="" class="link">Link</a></td>
                                    <td class="fBtn">
                                        <img src="{$path_tmpl}/img/icon/tools-bar/delete.png" rel="formlist" class="IGRP_delRowForm"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
               		 </div>
                 	<div class="_clear"/>
                 </div>
                 <div class="_clear"/>
            </div>
         	<div class="_clear"/>
         </div>
       	<div class="_clear"/>
        </form>
        <xsl:apply-templates mode="table" select="rows/content/table"/>
        <!--<xsl:apply-templates mode="table" select="rows/content/tableTest/table">
        	<xsl:with-param name="dataCrontrol" select="'data-crontrol'"/>
        </xsl:apply-templates>-->
        <!--Mapa Processo-->
        <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
            	<xsl:with-param name="title" select="'Mapa Processo'"/>
            </xsl:call-template>
            <div class="box-collapser">
            	<xsl:call-template name="process-map">
        			<xsl:with-param name="no" select="rows/content/menus"/>
        		</xsl:call-template>
            <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
        <!--Fluxo Processo-->
        <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
            	<xsl:with-param name="title" select="'Fluxo Processo'"/>
            </xsl:call-template>
            <div class="box-collapser">
            	<xsl:apply-templates mode="process-flow" select="rows/content/process_flow/table"/>
            <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
       <!-- Finger Print-->
        <xsl:apply-templates mode="fingerprint" select="rows/content/fingerprint"/>
        <!-- Lateral Menu
        <div class="box-content resetPadding">
            <xsl:call-template name="titlecollapser">
            	<xsl:with-param name="title" select="'Lateral Menu'"/>
            </xsl:call-template>
            <div class="box-collapser">-->
            	<xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/>
            <!--<div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>-->
        
        <!-- Lateral Menu-->
       	<xsl:apply-templates mode="IGRP-view" select="rows/content/view"/>
        
        <div class="_clear"/>
      </div>
      	<xsl:if test="rows/content/form/label/*[contains(@type,'LOOKUP')] or rows/content/filter/label/*[contains(@type,'LOOKUP')]">
    		<xsl:call-template name="link-opener"/>
    	</xsl:if>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage"><xsl:call-template name="footer"/></div>
    </body>
    </html>
  </xsl:template>
  <!--INCLUDE TEMPLATE-->
  <!--TEMPLATE HOME INCLUDE-->
  <xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-form-text-editor.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-applications.tmpl.xsl?v=1"/>
  <xsl:include href="tmpl/IGRP-slide-menu.tmpl.xsl?v=1"/>
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