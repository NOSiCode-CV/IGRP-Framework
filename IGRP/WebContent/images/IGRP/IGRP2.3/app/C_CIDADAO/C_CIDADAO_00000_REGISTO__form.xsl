<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FORM--><div class="col addMarginTop" sep-name="form">
                <xsl:if test="rows/content/form/label/biometrico">
                  <div class="col" sep-name="biometrico">
                    <xsl:apply-templates mode="fingerprint" select="rows/content/fingerprint">
                      <xsl:with-param name="view_only" select="'false'"/>
                      <xsl:with-param name="view_only" select="$view_only"/>
                      <xsl:with-param name="vTitle" select="rows/content/form/label/biometrico"/>
                    </xsl:apply-templates>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/grupo"/>
                <xsl:if test="rows/content/form/label/hidden"/>
                <xsl:if test="rows/content/form/label/hiperlink">
                  <xsl:if test="rows/content/form/label/hiperlink">
                    <div class="col-1-4 item" item-name="hiperlink">
                      <div class="igrp_item link">
                        <a href="{rows/content/form/value/hiperlink}" class="link bClick" name="p_hiperlink" target="_blank">
                          <xsl:value-of select="rows/content/form/label/hiperlink" disable-output-escaping="yes"/>
                        </a>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/iframe">
                  <div class="box-content resetPadding" sep-name="iframe">
                    <xsl:call-template name="iframe">
                      <xsl:with-param name="url" select="rows/content/form/value/iframe"/>
                      <xsl:with-param name="name" select="iframe"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/inagem">
                  <div class="box-content resetPadding" sep-name="inagem">
                    <xsl:call-template name="image">
                      <xsl:with-param name="img" select="rows/content/form/value/inagem"/>
                      <xsl:with-param name="name" select="inagem"/>
                    </xsl:call-template>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR lista--><xsl:if test="rows/content/form/label/lista">
                  <div class="box-content addPaddingBottom10" list-name="lista">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/lista"/>
                    </xsl:call-template>
                    <div class="box-collapser"><!-- START TABELA LIST--><div class="box-table table-responsive">
                        <table rel="T_lista" data-control="data-lista">
                          <thead>
                            <tr>
                              <xsl:if test="rows/content/form/table/lista/label/listacheckbox">
                                <xsl:if test="not(rows/content/form/table/lista/label/listacheckbox/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/listacheckbox" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/listaradio">
                                <xsl:if test="not(rows/content/form/table/lista/label/listaradio/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/listaradio" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/numero">
                                <xsl:if test="not(rows/content/form/table/lista/label/numero/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/numero" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/password">
                                <xsl:if test="not(rows/content/form/table/lista/label/password/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/password" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/pesquisabi">
                                <xsl:if test="not(rows/content/form/table/lista/label/pesquisabi/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/pesquisabi" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/pesquisacae">
                                <xsl:if test="not(rows/content/form/table/lista/label/pesquisacae/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/pesquisacae" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/pesquisageog">
                                <xsl:if test="not(rows/content/form/table/lista/label/pesquisageog/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/pesquisageog" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/pesquisanasc">
                                <xsl:if test="not(rows/content/form/table/lista/label/pesquisanasc/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/pesquisanasc" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/pesquisanif">
                                <xsl:if test="not(rows/content/form/table/lista/label/pesquisanif/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/pesquisanif" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/pesquisaoranica">
                                <xsl:if test="not(rows/content/form/table/lista/label/pesquisaoranica/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/pesquisaoranica" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/plaintext">
                                <xsl:if test="not(rows/content/form/table/lista/label/plaintext/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/plaintext" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                              <xsl:if test="rows/content/form/table/lista/label/radio">
                                <xsl:if test="not(rows/content/form/table/lista/label/radio/@visible)">
                                  <th>
                                    <xsl:value-of select="rows/content/form/table/lista/label/radio" disable-output-escaping="yes"/>
                                  </th>
                                </xsl:if>
                              </xsl:if>
                            </tr>
                          </thead>
                          <tbody>
                            <xsl:for-each select="rows/content/form/table/lista/value/row[not(@total='yes')]">
                              <tr row="{position()}">
                                <xsl:if test="listacheckbox">
                                  <xsl:if test="not(listacheckbox/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/listacheckbox}">
                                      <xsl:value-of select="listacheckbox" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_listacheckbox_fk" value="{listacheckbox}"/>
                                      <span class="showResponsiveTable ctxmenu"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="listacheckbox/@visible = 'false'">
                                    <input type="hidden" name="p_listacheckbox_fk" value="{listacheckbox}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="listaradio">
                                  <xsl:if test="not(listaradio/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/listaradio}">
                                      <xsl:value-of select="listaradio" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_listaradio_fk" value="{listaradio}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="listaradio/@visible = 'false'">
                                    <input type="hidden" name="p_listaradio_fk" value="{listaradio}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="numero">
                                  <xsl:if test="not(numero/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/numero}">
                                      <xsl:value-of select="numero" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_numero_fk" value="{numero}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="numero/@visible = 'false'">
                                    <input type="hidden" name="p_numero_fk" value="{numero}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="password">
                                  <xsl:if test="not(password/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/password}">
                                      <xsl:value-of select="password" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_password_fk" value="{password}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="password/@visible = 'false'">
                                    <input type="hidden" name="p_password_fk" value="{password}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="pesquisabi">
                                  <xsl:if test="not(pesquisabi/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/pesquisabi}">
                                      <xsl:value-of select="pesquisabi" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_pesquisabi_fk" value="{pesquisabi}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="pesquisabi/@visible = 'false'">
                                    <input type="hidden" name="p_pesquisabi_fk" value="{pesquisabi}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="pesquisacae">
                                  <xsl:if test="not(pesquisacae/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/pesquisacae}">
                                      <xsl:value-of select="pesquisacae" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_pesquisacae_fk" value="{pesquisacae}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="pesquisacae/@visible = 'false'">
                                    <input type="hidden" name="p_pesquisacae_fk" value="{pesquisacae}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="pesquisageog">
                                  <xsl:if test="not(pesquisageog/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/pesquisageog}">
                                      <xsl:value-of select="pesquisageog" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_pesquisageog_fk" value="{pesquisageog}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="pesquisageog/@visible = 'false'">
                                    <input type="hidden" name="p_pesquisageog_fk" value="{pesquisageog}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="pesquisanasc">
                                  <xsl:if test="not(pesquisanasc/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/pesquisanasc}">
                                      <xsl:value-of select="pesquisanasc" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_pesquisanasc_fk" value="{pesquisanasc}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="pesquisanasc/@visible = 'false'">
                                    <input type="hidden" name="p_pesquisanasc_fk" value="{pesquisanasc}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="pesquisanif">
                                  <xsl:if test="not(pesquisanif/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/pesquisanif}">
                                      <xsl:value-of select="pesquisanif" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_pesquisanif_fk" value="{pesquisanif}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="pesquisanif/@visible = 'false'">
                                    <input type="hidden" name="p_pesquisanif_fk" value="{pesquisanif}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="pesquisaoranica">
                                  <xsl:if test="not(pesquisaoranica/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/pesquisaoranica}">
                                      <xsl:value-of select="pesquisaoranica" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_pesquisaoranica_fk" value="{pesquisaoranica}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="pesquisaoranica/@visible = 'false'">
                                    <input type="hidden" name="p_pesquisaoranica_fk" value="{pesquisaoranica}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="plaintext">
                                  <xsl:if test="not(plaintext/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/plaintext}">
                                      <xsl:value-of select="plaintext" disable-output-escaping="yes"/>
                                      <input type="hidden" name="p_plaintext_fk" value="{plaintext}"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="plaintext/@visible = 'false'">
                                    <input type="hidden" name="p_plaintext_fk" value="{plaintext}"/>
                                  </xsl:if>
                                </xsl:if>
                                <xsl:if test="radio">
                                  <xsl:if test="not(radio/@visible)">
                                    <td data-row="{position()}" data-title="{../../label/radio}">
                                      <xsl:if test="radio != '-0'">
                                        <input type="radio" name="p_radio_fk" value="{radio}">
                                          <xsl:if test="radio_check=radio">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                          </xsl:if>
                                        </input>
                                      </xsl:if>
                                      <xsl:value-of select="radio_desc"/>
                                    </td>
                                  </xsl:if>
                                  <xsl:if test="radio/@visible = 'false'">
                                    <input type="hidden" name="p_radio_fk" value="{radio}"/>
                                  </xsl:if>
                                </xsl:if>
                                <input type="hidden" name="p_lista_id" value="{lista_id}"/>
                              </tr>
                            </xsl:for-each>
                          </tbody>
                        </table>
                      </div><!-- END TABELA LIST--><div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if><!-- INICIO SEPARADOR separador--><xsl:if test="rows/content/form/label/separador">
                  <div class="box-content resetPadding" sep-name="separador">
                    <xsl:call-template name="titlecollapser">
                      <xsl:with-param name="title" select="rows/content/form/label/separador"/>
                    </xsl:call-template>
                    <div class="box-collapser">
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/separadordialog">
                  <xsl:if test="rows/content/form/label/separadordialog">
                    <div class="col-1-4 item" item-name="separadordialog">
                      <div class="igrp_item ">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/separadordialog" disable-output-escaping="yes"/>
                        </label>
                        <input type="" name="{rows/content/form/value/separadordialog/@name}" value="{rows/content/form/value/separadordialog}" class=" required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/separadordialog"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/separadorlista">
                  <xsl:if test="rows/content/form/label/separadorlista">
                    <div class="col-1-4 item" item-name="separadorlista">
                      <div class="igrp_item ">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/separadorlista" disable-output-escaping="yes"/>
                        </label>
                        <input type="" name="{rows/content/form/value/separadorlista/@name}" value="{rows/content/form/value/separadorlista}" class=" required">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/separadorlista"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tecladoaz">
                  <xsl:if test="rows/content/form/label/tecladoaz">
                    <div class="col-1-4 item" item-name="tecladoaz">
                      <div class="igrp_item vkb_az">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/tecladoaz" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <xsl:call-template name="VirtualKeyBoard">
                            <xsl:with-param name="type" select="'vkb_az'"/>
                            <xsl:with-param name="rel" select="concat('tecladoaz_',position())"/>
                            <xsl:with-param name="input_type" select="'password'"/>
                            <xsl:with-param name="input_name" select="rows/content/form/value/tecladoaz/@name"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tecladoaz09">
                  <xsl:if test="rows/content/form/label/tecladoaz09">
                    <div class="col-1-4 item" item-name="tecladoaz09">
                      <div class="igrp_item vkb_aznum">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/tecladoaz09" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <xsl:call-template name="VirtualKeyBoard">
                            <xsl:with-param name="type" select="'vkb_aznum'"/>
                            <xsl:with-param name="rel" select="concat('tecladoaz09_',position())"/>
                            <xsl:with-param name="input_type" select="'password'"/>
                            <xsl:with-param name="input_name" select="rows/content/form/value/tecladoaz09/@name"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/tecladonumerico">
                  <xsl:if test="rows/content/form/label/tecladonumerico">
                    <div class="col-1-4 item" item-name="tecladonumerico">
                      <div class="igrp_item vkb_num">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/tecladonumerico" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <xsl:call-template name="VirtualKeyBoard">
                            <xsl:with-param name="type" select="'vkb_num'"/>
                            <xsl:with-param name="rel" select="concat('tecladonumerico_',position())"/>
                            <xsl:with-param name="input_type" select="'password'"/>
                            <xsl:with-param name="input_name" select="rows/content/form/value/tecladonumerico/@name"/>
                          </xsl:call-template>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/texteditor">
                  <div class="box-content resetPadding" sep-name="texteditor">
                    <xsl:call-template name="text-editor">
                      <xsl:with-param name="name" select="{rows/content/form/value/texteditor/@name}"/>
                      <xsl:with-param name="value" select="rows/content/form/value/texteditor"/>
                      <xsl:with-param name="maxlength" select="rows/content/form/label/texteditor/@maxlength"/>
                    </xsl:call-template>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/form/label/textarea">
                  <xsl:if test="rows/content/form/label/textarea">
                    <div class="col-1-4 item" item-name="textarea">
                      <div class="igrp_item textarea">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/textarea" disable-output-escaping="yes"/>
                        </label>
                        <textarea name="{rows/content/form/value/textarea/@name}" class="textarea required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/textarea"/>
                          </xsl:call-template>
                          <xsl:value-of select="rows/content/form/value/textarea" disable-output-escaping="yes"/>
                        </textarea>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <xsl:if test="rows/content/form/label/texto">
                  <xsl:if test="rows/content/form/label/texto">
                    <div class="col-1-4 item" item-name="texto">
                      <div class="igrp_item text">
                        <label>
                          <span class="riquired">*</span>
                          <xsl:value-of select="rows/content/form/label/texto" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/texto/@name}" value="{rows/content/form/value/texto}" class="text required" maxlength="30">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/texto"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                </xsl:if>
                <div class="_clear"/>
              </div>
            </form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <xsl:call-template name="link-opener"/>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-virtualkeyboard.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-dados_biometricos.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
