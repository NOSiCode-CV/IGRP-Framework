<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- FIELD VALIDATOR -->
  <xsl:template name="FIELD_validator">
    <xsl:param name="type" />
    <xsl:param name="required" select="''"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="change" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="maxlength" select="30"/>
    <xsl:param name="visible" select="''"/>
    <xsl:attribute name="class">
      <xsl:value-of select="$type" />
      <xsl:if test="$type='date'">
        <xsl:text>IGRP_datepicker</xsl:text>
      </xsl:if>
      <xsl:if test="$required='true'">
        <xsl:text>required</xsl:text>
      </xsl:if>
      <xsl:if test="$change='true'">
        <xsl:text>IGRP_change</xsl:text>
      </xsl:if>
      <xsl:if test="$readonly='onchange'">
        <xsl:text>IGRP_change</xsl:text>
      </xsl:if>
    </xsl:attribute>
    <xsl:if test="$readonly='true'">
      <xsl:attribute name="disabled">
        <xsl:value-of select="'disabled'" />
      </xsl:attribute>
      <xsl:attribute name="Tdis">
        <xsl:value-of select="'disabled'"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="$readonly='readonly'">
      <xsl:attribute name="readonly">
        <xsl:value-of select="'readonly'" />
      </xsl:attribute>
      <xsl:attribute name="Tread">
        <xsl:value-of select="'readonly'" />
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="$visible='false'">
      <xsl:attribute name="visible">
        <xsl:value-of select="'false'" />
      </xsl:attribute>
    </xsl:if>
    <xsl:attribute name="maxlength">
      <xsl:value-of select="$maxlength" />
    </xsl:attribute>
    <xsl:if test="$rel!=''">
      <xsl:attribute name="rel">
        <xsl:text>F_</xsl:text>
        <xsl:value-of select="$rel" />
      </xsl:attribute>
    </xsl:if>
  </xsl:template>
  <!-- FIELD OPTIONS -->
  <xsl:template name="FIELD_options">
    <xsl:param name="list" />
    <xsl:param name="type_list" select="''"/>
    <xsl:param name="value" select="''"/>
    <xsl:for-each select="$list/option">
      <xsl:choose>
        <xsl:when test="$type_list = '1'">
          <option value="{value}">
            <xsl:if test="value = $value">
              <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="text"/>
          </option>
        </xsl:when>
        <xsl:otherwise>
          <option value="{value}">
            <xsl:if test="@selected='true'">
              <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="text"/>
          </option>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!-- INPUT FIELD -->
  <xsl:template name="FIELD_input">
    <xsl:param name="type" select="'text'"/>
    <xsl:param name="name" />
    <xsl:param name="value" />
    <xsl:param name="value_checked" select="'0'"/>
    <xsl:param name="required" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="maxlength" select="'30'"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="js_lookup" select="''"/>
    <xsl:param name="visible" select="''"/>
    <xsl:param name="change" select="''" />
    <xsl:variable name="v_type">
      <xsl:choose>
        <xsl:when test="$type='date'">
          <xsl:value-of select="'text'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$type"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <input type="{$v_type}" name="{$name}" value="{$value}">
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="type" select="$type" />
        <xsl:with-param name="required" select="$required" />
        <xsl:with-param name="readonly" select="$readonly" />
        <xsl:with-param name="maxlength" select="$maxlength" />
        <xsl:with-param name="rel" select="$rel" />
        <xsl:with-param name="visible" select="$visible" />
        <xsl:with-param name="change" select="$change" />
      </xsl:call-template>
      <xsl:if test="$type='checkbox'">
        <xsl:if test="$value=$value_checked">
          <xsl:attribute name="checked">checked</xsl:attribute>
        </xsl:if>
      </xsl:if>
    </input>
    <xsl:value-of select="text"/>
    <!--<xsl:if test="$lookvar='LOOKUP'">-->
    <xsl:if test="contains($type,'LOOKUP')">
      <xsl:variable name="ad_hoc">
        <xsl:choose>
          <xsl:when test="$type='LOOKUP'">1</xsl:when>
          <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:call-template name="lookup-tool">
        <!--<xsl:with-param name="page" select="rows/page" />-->
        <xsl:with-param name="action" select="$type" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="js_lookup" select="$js_lookup" />
        <xsl:with-param name="ad_hoc" select="$ad_hoc" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- TEXTAREA FIELD -->
  <xsl:template name="FIELD_textarea">
    <xsl:param name="name" />
    <xsl:param name="value" />
    <xsl:param name="required" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="maxlength" select="'100'"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="visible" select="''"/>
    <xsl:param name="change" select="''" />
    <xsl:param name="type" select="'textarea'" />
    <textarea name="{$name}" class="{$type}">
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="type" select="$type" />
        <xsl:with-param name="required" select="$required" />
        <xsl:with-param name="readonly" select="$readonly" />
        <xsl:with-param name="maxlength" select="$maxlength" />
        <xsl:with-param name="rel" select="$rel" />
        <xsl:with-param name="visible" select="$visible" />
        <xsl:with-param name="change" select="$change" />
      </xsl:call-template>
      <xsl:value-of select="$value" />
    </textarea>
  </xsl:template>
  <!-- RADIO-LIST/CHECKBOX-LIST FIELD -->
  <xsl:template name="FIELD_list">
    <xsl:param name="type" />
    <xsl:param name="name" />
    <xsl:param name="value" />
    <xsl:param name="rel" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="list" />
    <xsl:param name="visible" select="''" />
    <xsl:param name="change" select="''" />
    <xsl:for-each select="$list/option">
      <input type="{$type}" name="{$name}" value="{value}">
        <xsl:if test="@selected='true'">
          <xsl:attribute name="checked">checked</xsl:attribute>
        </xsl:if>
        <xsl:call-template name="FIELD_validator">
          <xsl:with-param name="type" select="$type" />
          <xsl:with-param name="rel" select="$rel" />
          <xsl:with-param name="readonly" select="$readonly" />
          <xsl:with-param name="visible" select="$visible" />
          <xsl:with-param name="change" select="$change" />
        </xsl:call-template>
      </input>
      <xsl:value-of select="text"/>
    </xsl:for-each>
  </xsl:template>
  <!-- SELECT/SELECT-LIST FIELD -->
  <xsl:template name="FIELD_select">
    <xsl:param name="type" />
    <xsl:param name="name" />
    <xsl:param name="value" />
    <xsl:param name="required" select="''"/>
    <xsl:param name="readonly" select="''"/>
    <xsl:param name="rel" select="''"/>
    <xsl:param name="list" />
    <xsl:param name="visible" select="''"/>
    <xsl:param name="type_list" select="''"/>
    <xsl:param name="change" select="''" />
    <!--<xsl:variable name="change">
                        <xsl:if test="$type='selectchange' or $change='true'">true</xsl:if>
                    </xsl:variable>-->
    <select name="{$name}">
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="type" select="'select'" />
        <xsl:with-param name="required" select="$required" />
        <xsl:with-param name="readonly" select="$readonly" />
        <xsl:with-param name="rel" select="$rel" />
        <xsl:with-param name="change" select="$change" />
        <xsl:with-param name="visible" select="$visible" />
      </xsl:call-template>
      <xsl:if test="$type='selectlist'">
        <xsl:attribute name="multiple">true</xsl:attribute>
        <xsl:attribute name="size">5</xsl:attribute>
      </xsl:if>
      <xsl:call-template name="FIELD_options">
        <xsl:with-param name="type_list" select="$type_list"/>
        <xsl:with-param name="value" select="$value"/>
        <xsl:with-param name="list" select="$list" />
      </xsl:call-template>
    </select>
  </xsl:template>
  <!-- FIELD GENERATOR ONLY-->
  <xsl:template name="GEN-FIELD-ONLY">
    <xsl:param name="formlist" select="'false'" />
    <xsl:param name="label" />
    <xsl:param name="value" />
    <xsl:param name="value_desc"/>
    <xsl:param name="list" />
    <xsl:param name="lookup" select="''" />
    <xsl:param name="type_list" select="''"/>
    <xsl:variable name="v_name">
      <xsl:choose>
        <xsl:when test="$formlist = 'true'">
          <xsl:value-of select="$label/@name"/>
          <xsl:text>_fk</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$label/@name"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$label/@type='textarea' or $label/@type='textarea_m' or $label/@type='textarea_g'">
        <xsl:call-template name="FIELD_textarea">
          <xsl:with-param name="name" select="$v_name"/>
          <xsl:with-param name="value" select="$value/text()"/>
          <xsl:with-param name="required" select="$label/@required"/>
          <xsl:with-param name="readonly" select="$label/@readonly"/>
          <xsl:with-param name="maxlength" select="$label/@maxlength"/>
          <xsl:with-param name="rel" select="$label/@rel" />
          <xsl:with-param name="visible" select="$label/@visible" />
          <xsl:with-param name="change" select="$label/@change" />
          <xsl:with-param name="type" select="$label/@type" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$label/@type='select' or $label/@type='selectchange' or $label/@type='selectlist'">
        <xsl:call-template name="FIELD_select">
          <xsl:with-param name="type" select="$label/@type"/>
          <xsl:with-param name="name" select="$v_name"/>
          <xsl:with-param name="value" select="$value/text()"/>
          <xsl:with-param name="required" select="$label/@required"/>
          <xsl:with-param name="readonly" select="$label/@readonly"/>
          <xsl:with-param name="rel" select="$label/@rel" />
          <xsl:with-param name="list" select="$list" />
          <xsl:with-param name="visible" select="$label/@visible" />
          <xsl:with-param name="type_list" select="$type_list"/>
          <xsl:with-param name="change" select="$label/@change" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$label/@type='radiolist'">
        <xsl:call-template name="FIELD_list">
          <xsl:with-param name="type" select="'radio'"/>
          <xsl:with-param name="name" select="$v_name"/>
          <xsl:with-param name="value" select="$value/text()"/>
          <xsl:with-param name="rel" select="$label/@rel" />
          <xsl:with-param name="readonly" select="$label/@readonly"/>
          <xsl:with-param name="list" select="$list" />
          <xsl:with-param name="visible" select="$label/@visible" />
          <xsl:with-param name="change" select="$label/@change" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$label/@type='checkboxlist'">
        <xsl:call-template name="FIELD_list">
          <xsl:with-param name="type" select="'checkbox'"/>
          <xsl:with-param name="name" select="$v_name"/>
          <xsl:with-param name="value" select="$value/text()"/>
          <xsl:with-param name="rel" select="$label/@rel" />
          <xsl:with-param name="readonly" select="$label/@readonly"/>
          <xsl:with-param name="list" select="$list" />
          <xsl:with-param name="visible" select="$label/@visible" />
          <xsl:with-param name="change" select="$label/@change" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$label/@type='checkbox'">
        <xsl:call-template name="FIELD_input">
          <xsl:with-param name="type" select="$label/@type"/>
          <xsl:with-param name="name" select="$v_name"/>
          <xsl:with-param name="value_checked" select="$value/text()"/>
          <xsl:with-param name="required" select="$label/@required"/>
          <xsl:with-param name="value" select="'1'"/>
          <xsl:with-param name="rel" select="$label/@rel" />
          <xsl:with-param name="readonly" select="$label/@readonly"/>
          <xsl:with-param name="visible" select="$label/@visible" />
          <xsl:with-param name="change" select="$label/@change" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$label/@type='hidden' or $label/@type='link'"></xsl:when>
      <xsl:when test="$label/@type='plaintext'">
        <xsl:apply-templates mode="plaintext" select="$value/text()" />
      </xsl:when>
      <xsl:when test="contains($label/@type,'vkb_')">
        <xsl:call-template name="VirtualKeyBoard">
          <xsl:with-param name="type" select="$label/@type"/>
          <xsl:with-param name="rel" select="$v_name"/>
          <xsl:with-param name="input_type" select="'password'"/>
          <xsl:with-param name="input_name" select="$v_name" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@type='iframe'">
        <xsl:call-template name="simple_iframes">
          <xsl:with-param name="url" select="$value/text()"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@type='texteditor'">
        <xsl:call-template name="text-editor">
          <xsl:with-param name="name" select="$v_name" />
          <xsl:with-param name="value" select="$value/text()" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@type='image'">
        <xsl:call-template name="simple_images">
          <xsl:with-param name="img" select="$value/text()"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="@type='signature' and $formlist = 'false'">
        <div class="divSignature" rel="{$v_name}" name="sep_{$v_name}">
          <xsl:if test="$value/text() != ''">
            <xsl:attribute name="style">background-image:url(data:png;BASE64,
              <xsl:value-of select="$value/text()"/>);
            </xsl:attribute>
            <xsl:attribute name="signature">true</xsl:attribute>
          </xsl:if>
          <ul rel="{$v_name}" class="control-signature">
            <li rel="edit" class="control-edit"></li>
            <li rel="confirm" class="control-confirm"></li>
          </ul>
          <object name="{$v_name}" classid="clsid:84C046A7-4370-4D91-8737-87C12F4C63C5" id="{$v_name}obj" data="data:application/x-oleobject;BASE64,p0bAhHBDkU2HN4fBL0xjxQADAAB4DgAArwUAABMAAAAAABMA////AA==" class="signature"></object>
        </div>
        <span class="signatureDesc">/
          <xsl:value-of select="$value_desc/text()"/>/
        </span>
        <input type="hidden" name="{$v_name}" id="{$v_name}" value="{$value/text()}" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="FIELD_input">
          <xsl:with-param name="type" select="$label/@type"/>
          <xsl:with-param name="name" select="$v_name"/>
          <xsl:with-param name="value" select="$value/text()"/>
          <xsl:with-param name="required" select="$label/@required"/>
          <xsl:with-param name="readonly" select="$label/@readonly"/>
          <xsl:with-param name="rel" select="$label/@rel" />
          <xsl:with-param name="js_lookup" select="$lookup" />
          <xsl:with-param name="maxlength" select="$label/@maxlength"/>
          <xsl:with-param name="visible" select="$label/@visible" />
          <xsl:with-param name="change" select="$label/@change" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- FIELD GENERATOR -->
  <xsl:template name="GEN-FIELD">
    <xsl:param name="label" />
    <xsl:param name="value" />
    <xsl:param name="list" />
    <xsl:param name="value_desc" />
    <xsl:param name="lookup" select="''" />
    <xsl:choose>
      <xsl:when test="$label/@type='group'">
        <div name="sep_{local-name($label)}">
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="$label/text()" />
            <xsl:with-param name="class" select="'subtitle'" />
          </xsl:call-template>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$label/@type!='hidden'">
          <xsl:choose>
            <xsl:when test="$label/@type = 'texteditor'">
              <label class="{$label/@type}">
                <xsl:if test="$label/@type='selectchange' or $label/@readonly='onchange' or $label/@change='true'">
                  <a id="id{$label/@name}" />
                </xsl:if>
                <span>
                  <xsl:if test="$label/@required">
                    <xsl:text>(*)</xsl:text>
                  </xsl:if>
                  <xsl:value-of select="$label/text()"/>
                </span>
              </label>
              <div class="{$label/@type}">
                <xsl:call-template name="GEN-FIELD-ONLY">
                  <xsl:with-param name="label"  select="$label" />
                  <xsl:with-param name="value"  select="$value" />
                  <xsl:with-param name="list" select="$list" />
                  <xsl:with-param name="lookup" select="$lookup" />
                </xsl:call-template>
              </div>
            </xsl:when>
            <xsl:otherwise>
              <label class="{$label/@type}">
                <xsl:if test="$label/@type='selectchange' or $label/@readonly='onchange' or $label/@change='true'">
                  <a id="id{$label/@name}" />
                </xsl:if>
                <span>
                  <xsl:choose>
                    <xsl:when test="$label/@type='link'">
                      <xsl:if test="$label/@rel">
                        <input type="link" desc="{$label/text()}" name="{$label/@name}" rel="F_{$label/@rel}" value="{$value/text()}" style="display:none;"/>
                      </xsl:if>
                      <xsl:variable name="ltargt">
                        <xsl:choose>
                          <xsl:when test="@target">
                            <xsl:value-of select="@target"/>
                          </xsl:when>
                          <xsl:otherwise>_blank</xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>
                      <xsl:if test="$value/text()!=''">
                        <a href="{$value/text()}" class="{$ltargt} form_link" name="{$label/@name}">
                          <xsl:value-of select="$label/text()"/>
                        </a>
                      </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:if test="$label/@required">
                        <xsl:text>(*)</xsl:text>
                      </xsl:if>
                      <xsl:value-of select="$label/text()"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
                <xsl:call-template name="GEN-FIELD-ONLY">
                  <xsl:with-param name="label"  select="$label" />
                  <xsl:with-param name="value"  select="$value" />
                  <xsl:with-param name="list" select="$list" />
                  <xsl:with-param name="value_desc"  select="$value_desc"/>
                  <xsl:with-param name="lookup" select="$lookup" />
                </xsl:call-template>
              </label>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- SIMPLE TABLE GENERATOR -->
  <xsl:template name="GEN-SIMPLE-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="dialog" />
    <xsl:param name="table" />
    <div class="simple-table" rel="DIV_{$rel}">
      <table rel="T_{$rel}">
        <thead>
          <tr>
            <xsl:for-each select="$table/label/*[@type!='hidden' and @type!='group' and not(@visible)]">
              <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check') and @type!='hidden'">
                <th>
                  <xsl:value-of select="text()" />
                </th>
              </xsl:if>
            </xsl:for-each>
            <th align="center" width="10"></th>
            <th align="center" width="10"></th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$table/value/row">
            <tr>
              <xsl:for-each select="*">
                <xsl:variable name="nome" select="@name" />
                <xsl:variable name="nome_desc">
                  <xsl:value-of select="name()" />
                  <xsl:text>_desc</xsl:text>
                </xsl:variable>
                <xsl:variable name="separator_id">
                  <xsl:value-of select="concat($rel,'_id')" />
                </xsl:variable>
                <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
                  <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                  <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                  <!-- <xsl:variable name="nome_field">
                                                                                                     <xsl:when test="not(substring(name(),(string-length(name())-2),3) =  '_fk')"> 
                                                                                                     </xsl:if>
                                                                                                  </xsl:variable>-->
                  <xsl:variable name="v_type">
                    <xsl:choose>
                      <xsl:when test="@visible or @type='group'">
                        <xsl:value-of select="'hidden'"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="@type"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="$v_type='hidden'">
                      <input type="hidden" name="{@name}_fk" value="{text()}" />
                      <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                      <xsl:if test="position()=1">
                        <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="$v_type='link' or $v_type='file'">
                      <td align="{@align}">
                        <xsl:choose>
                          <xsl:when test="text()!=''">
                            <xsl:variable name="ltargt">
                              <xsl:choose>
                                <xsl:when test="@target">
                                  <xsl:value-of select="@target"/>
                                </xsl:when>
                                <xsl:otherwise>_blank</xsl:otherwise>
                              </xsl:choose>
                            </xsl:variable>
                            <a href="{text()}" class="{$ltargt}">
                              <xsl:value-of select="$value_desc" />
                            </a>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$value_desc" />
                          </xsl:otherwise>
                        </xsl:choose>
                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td align="{@align}">
                        <xsl:value-of select="$value_desc" />
                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </xsl:for-each>
              <td align="center" width="10">
                <xsl:if test="not(@nodelete)">
                  <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_{$rel}_del" rel="{$rel}" class="IGRP_delRow{$dialog}"/>
                </xsl:if>
              </td>
              <td align="center" width="10">
                <xsl:if test="not(@noupdate)">
                  <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_{$rel}_edit" rel="{$rel}" class="IGRP_editRow{$dialog}"/>
                </xsl:if>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <!-- LIST TABLE GENERATOR -->
  <xsl:template name="GEN-LIST-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="sep" select="'0'" />
    <xsl:param name="table" />
    <div class="simple-table" rel="DIV_{$rel}">
      <table>
        <thead>
          <tr>
            <xsl:for-each select="$table/label/*[@type!='hidden' and not(@visible) and @type != 'total']">
              <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check') and @type!='hidden'">
                <!-- <xsl:if test="not(substring(@nome,(string-length(@nome)-4),5) =  '_desc') and not(substring(@nome,(string-length(@nome)-5),6) =  '_check') and @type!='hidden'">-->
                <xsl:choose>
                  <xsl:when test="@type='checkbox'">
                    <th class="checkbox sorttable_nosort" align="center">
                      <input type="checkbox" name="{@name}_all" value="" class="IGRP_checkall" />
                      <xsl:value-of select="text()" />
                    </th>
                  </xsl:when>
                  <xsl:otherwise>
                    <th>
                      <xsl:value-of select="text()" />
                    </th>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test="$sep='1'">
              <th align="center" width="10"></th>
              <th align="center" width="10"></th>
            </xsl:if>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$table/value/row[not(@type) or not(@type = 'total')]">
            <xsl:variable name="pos" select="(position()+1) mod 2"/>
            <tr class="table_row{$pos}">
              <xsl:for-each select="*">
                <xsl:variable name="nome" select="@name" />
                <xsl:variable name="nome_desc">
                  <xsl:value-of select="name()" />
                  <xsl:text>_desc</xsl:text>
                </xsl:variable>
                <xsl:variable name="nome_check">
                  <xsl:value-of select="name()" />
                  <xsl:text>_check</xsl:text>
                </xsl:variable>
                <xsl:variable name="separator_id">
                  <xsl:value-of select="concat($rel,'_id')" />
                </xsl:variable>
                <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
                  <!--<xsl:if test="not($nome,(string-length($nome)-4),5) =  '_desc') and not(substring($nome,(string-length($nome)-5),6) =  '_check') and @type!='hidden'">  -->
                  <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                  <xsl:variable name="value_check" select="../*[name()=$nome_check]/text()" />
                  <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                  <xsl:variable name="v_type">
                    <xsl:choose>
                      <xsl:when test="@visible">
                        <xsl:value-of select="'hidden'"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="@type"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="$v_type='hidden'"></xsl:when>
                    <xsl:when test="$v_type='checkbox' or $v_type='radio'">
                      <td class="table_row{$pos} checkbox">
                        <xsl:if test="text()!='-0'">
                          <input type="{@type}" name="{@name}" value="{text()}">
                            <xsl:if test="$value_check=text()">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                        </xsl:if>
                        <xsl:value-of select="$value_desc" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <xsl:when test="$v_type='link' or $v_type='file'">
                      <td class="table_row{$pos}">
                        <xsl:choose>
                          <xsl:when test="text()!=''">
                            <xsl:variable name="ltargt">
                              <xsl:choose>
                                <xsl:when test="@target">
                                  <xsl:value-of select="@target"/>
                                </xsl:when>
                                <xsl:otherwise>_blank</xsl:otherwise>
                              </xsl:choose>
                            </xsl:variable>
                            <a href="{text()}" class="{$ltargt}">
                              <xsl:value-of select="$value_desc" />
                            </a>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$value_desc" />
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td class="table_row{$pos}">
                        <xsl:value-of select="." />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </xsl:for-each>
              <xsl:if test="$sep='1'">
                <td align="center" width="10">
                  <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_{$rel}_del" rel="{$rel}" class="IGRP_delRow"/>
                </td>
                <td align="center" width="10">
                  <img alt="editar" src="{$path_tmpl}/img/icon/edit.png" name="btn_{$rel}_edit" rel="{$rel}" class="IGRP_editRow"/>
                </td>
              </xsl:if>
            </tr>
          </xsl:for-each>
        </tbody>
        <xsl:if test="$table/label/*[@type ='total' and not(@visible)]">
          <tfoot>
            <tr>
              <xsl:for-each select="$table/value/row[@type = 'total']/*">
                <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
                  <td>
                    <xsl:value-of select="."/>
                  </td>
                </xsl:if>
              </xsl:for-each>
            </tr>
          </tfoot>
        </xsl:if>
      </table>
    </div>
  </xsl:template>
  <!-- FORM TABLE GENERATOR -->
  <xsl:template name="GEN-FORM-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="sep" select="'1'" />
    <xsl:param name="table" />
    <div class="simple-table" rel="DIV_{$rel}">
      <table class="editable-table" rel="T_{$rel}">
        <thead>
          <tr>
            <xsl:for-each select="$table/label/*[@type!='hidden' and not(@visible)]">
              <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check') and @type!='hidden'">
                <th>
                  <xsl:value-of select="text()" />
                </th>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test="$sep = '1'">
              <xsl:if test="not($table/value/row[@nodelete]) or not($table/value/row[@noupdate])">
                <th align="center" width="10">
                  <xsl:if test="not($table/value/row[@noupdate])">
                    <img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" name="btn_{$rel}_add" rel="{$rel}" class="IGRP_addRow_form"/>
                  </xsl:if>
                </th>
              </xsl:if>
            </xsl:if>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$table/value/row">
            <xsl:variable name="pos" select="(position()+1) mod 2"/>
            <tr>
              <xsl:for-each select="*">
                <xsl:variable name="nome" select="@name" />
                <xsl:variable name="tag" select="name()" />
                <xsl:variable name="nome_desc">
                  <xsl:value-of select="name()" />
                  <xsl:text>_desc</xsl:text>
                </xsl:variable>
                <xsl:variable name="nome_check">
                  <xsl:value-of select="name()" />
                  <xsl:text>_check</xsl:text>
                </xsl:variable>
                <xsl:variable name="separator_id">
                  <xsl:value-of select="concat($rel,'_id')" />
                </xsl:variable>
                <xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
                  <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                  <xsl:variable name="value_check" select="../*[name()=$nome_check]/text()" />
                  <xsl:variable name="check_value" select="../*[name()=$tag]/text()" />
                  <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                  <!-- <xsl:variable name="nome_field">
                                                                                                     <xsl:when test="not(substring(name(),(string-length(name())-2),3) =  '_fk')"> 
                                                                                                     </xsl:if>
                                                                                                  </xsl:variable>-->
                  <xsl:variable name="v_type">
                    <xsl:choose>
                      <xsl:when test="@visible">
                        <xsl:value-of select="'hidden'"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="@type"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="$v_type='hidden'">
                      <input type="hidden" name="{@name}_fk" value="{text()}" />
                      <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                      <xsl:if test="position()=1">
                        <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="$v_type='file'">
                      <td class="table_row{$pos}">
                        <input type="file" name="{@name}_fk" />
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <xsl:when test="$v_type='link'">
                      <td class="table_row{$pos}">
                        <xsl:choose>
                          <xsl:when test="text() != ''">
                            <xsl:variable name="ltargt">
                              <xsl:choose>
                                <xsl:when test="@target">
                                  <xsl:value-of select="@target"/>
                                </xsl:when>
                                <xsl:otherwise>_blank</xsl:otherwise>
                              </xsl:choose>
                            </xsl:variable>
                            <a href="{text()}" class="{$ltargt}" name="{@name}">
                              <xsl:value-of select="$value_desc"/>
                            </a>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$value_desc"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        <input type="hidden" name="{@name}_fk" value="{text()}"/>
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}"/>
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <xsl:when test="$v_type='text'">
                      <td class="table_row{$pos}">
                        <xsl:value-of select="$value_desc" />
                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <xsl:when test="$v_type='texteditor'">
                      <td class="table_row{$pos}">
                        <input type="texteditor" name="{@name}_fk" value="{text()}">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="type" select="'text'" />
                            <xsl:with-param name="required" select="ancestor::form/label/*[name()=$tag]/@required" />
                            <xsl:with-param name="readonly" select="ancestor::form/label/*[name()=$tag]/@readonly" />
                            <xsl:with-param name="maxlength" select="ancestor::form/label/*[name()=$tag]/@maxlength" />
                            <xsl:with-param name="rel" select="$rel" />
                            <xsl:with-param name="visible" select="ancestor::form/label/*[name()=$tag]/@visible" />
                            <xsl:with-param name="change" select="ancestor::form/label/*[name()=$tag]/@change" />
                          </xsl:call-template>
                        </input>
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <!--Edson 17/05/13-->
                    <xsl:when test="$v_type='checkbox'">
                      <td class="table_row{$pos}">
                        <xsl:if test="$check_value!='-0'">
                          <input type="checkbox" name="{@name}_fk" value="{$check_value}">
                            <xsl:if test="$value_check = $check_value">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                          </input>
                          <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        </xsl:if>
                        <xsl:value-of select="$value_desc" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:when>
                    <!--<xsl:when test="$v_type='checkbox' and $check_value != ''"> 
                                                                                                                    <td class="table_row{$pos}">
                                                                                                                    <xsl:if test="$check_value!='-0'">
                                                                                                                   <input type="checkbox" name="{@name}_fk" value="{$check_value}">
                                                                                                                    <xsl:if test="$value_check = $check_value">
                                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                                    </xsl:if>   
                                                                                                                    </input>
                                                                                                                   <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                                                                                                    </xsl:if>
                                                                                                                   <xsl:value-of select="$value_desc" />
                                                                                                                    
                                                                                                                    <xsl:if test="position()=1">
                                                                                                                    <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                                                                                                    </xsl:if>
                                                                                                                    </td>
                                                                                                                </xsl:when>
                                                                                                                fim de implementacao-->
                    <xsl:otherwise>
                      <td class="table_row{$pos}">
                        <!--<xsl:value-of select="$value_desc" />
                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>-->
                        <xsl:call-template name="GEN-FIELD-ONLY">
                          <xsl:with-param name="formlist" select="'true'"/>
                          <xsl:with-param name="label" select="ancestor::form/label/*[name()=$tag]" />
                          <xsl:with-param name="value" select="." />
                          <xsl:with-param name="type_list" select="1"/>
                          <!--<xsl:with-param name="name" select="ancestor::form/label/*[name()=$tag]"/>-->
                          <xsl:with-param name="list" select="ancestor::form/list/*[name()=$tag]" />
                          <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$tag]" />
                        </xsl:call-template>
                        <xsl:if test="position()=1">
                          <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                        </xsl:if>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </xsl:for-each>
              <xsl:if test="$sep = '1'">
                <xsl:if test="not(@nodelete) or not(@noupdate)">
                  <td class="table_row{$pos}" align="center" width="10">
                    <xsl:if test="not(@nodelete)">
                      <img alt="apagar" src="{$path_tmpl}/img/icon/ctx-delete.png" name="btn_{$rel}_del" rel="{$rel}" class="IGRP_delRow_form"/>
                    </xsl:if>
                  </td>
                </xsl:if>
              </xsl:if>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <!-- ALL FORM FIELD GENERATOR -->
  <xsl:template name="GEN-FORM">
    
    <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
    
    <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
    
    <xsl:for-each select="rows/content/form/label/*[@type!='hidden']">
      
      <xsl:variable name="nome" select="name()" />
      
      <xsl:variable name="nome_desc">
        <xsl:value-of select="name()" />
        <xsl:text>_desc</xsl:text>
      </xsl:variable>

      <xsl:choose>
        <!-- SEPARADOR -->
        <xsl:when test="@type='separator'">
          
          <div class="box-head subtitle" text-color="primary">
            <span>
              <xsl:value-of select="text()"/>
            </span>
          </div>
          
        </xsl:when>
        <!-- biometric and  biometric_view-->
        <xsl:when test="@type='biometric' or @type='biometric_view'">
          bio
          <!-- <div rel="{name()}" name="sep_{name()}">
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="text()" />
              <xsl:with-param name="class" select="'subtitle'" />
            </xsl:call-template>
            <xsl:variable name="view_only">
              <xsl:choose>
                <xsl:when test="@type='biometric'">
                  <xsl:value-of select="'false'" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'true'" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:apply-templates mode="fingerprint" select="../../../fingerprint">
              <xsl:with-param name="view_only" select="$view_only" />
            </xsl:apply-templates>
          </div> -->
        </xsl:when>
        <!-- MAPA ESRI 15/07.2014 EDSON WILLY -->
        <xsl:when test="@type = 'mapp_esri'">
          map esri
          <!-- <xsl:variable name="maplink" select="ancestor::form/value/*[name()=$nome]"/>
          <xsl:choose>
            <xsl:when test="$maplink != ''">
              <xsl:variable name="map_link">
                <xsl:choose>
                  <xsl:when test="contains($maplink,'http://') or contains($maplink,'https://') ">
                    <xsl:value-of select="$maplink  "/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>/images/IGRP/xml/REDGISAPP.TMPL.xml</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <div id="igrp-mapp-holder">
                <xsl:apply-templates mode="igrp-mapp" select="document($map_link)"/>
              </div>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>Erro no carregamento do mapa...</xsl:text>
            </xsl:otherwise>
          </xsl:choose> -->
        </xsl:when>
        <!-- SEPARADOR LISTA-->
        <xsl:when test="@type='separatorlist'">
          separadorlist
          <!-- <div rel="{name()}" name="sep_{name()}">
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="text()" />
              <xsl:with-param name="class" select="'subtitle'" />
            </xsl:call-template>
            <xsl:call-template name="tools-bar-form-group">
              <xsl:with-param name="rel" select="name()" />
            </xsl:call-template>
            <xsl:for-each select="ancestor::form/label/*[(@rel=$nome)]">
              <xsl:if test="not(substring(@name,(string-length(name())-4),5) = '_desc')">
                <xsl:variable name="nome2" select="name()" />
                <xsl:call-template name="GEN-FIELD">
                  <xsl:with-param name="label" select="." />
                  <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome2]" />
                  <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome2]" />
                  <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome2]" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
            <xsl:call-template name="GEN-SIMPLE-TABLE">
              <xsl:with-param name="rel" select="name()" />
              <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
            </xsl:call-template>
          </div> -->
        </xsl:when>
        <!-- SEPARADOR DIALOG-->
        <xsl:when test="@type='separatordialog'">
          sepdial
          <!-- <div rel="{name()}" name="sep_{name()}">
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="text()" />
              <xsl:with-param name="class" select="'subtitle'" />
            </xsl:call-template>
            <xsl:call-template name="tools-bar-form-group">
              <xsl:with-param name="rel" select="name()" />
              <xsl:with-param name="class" select="'IGRP_addRow_diag'" />
            </xsl:call-template>
            <div class="IGRP_overlay"></div>
            <div class="D_{name()} IGRP_dialogbox">
              <div class="IGRP_dialogboxTop">
                <div class="close">
                  <img src="{$path_tmpl}/img/close-dialog.png" class="IGRP_btn_close" rel="{name()}"/>
                </div>
                <xsl:call-template name="page-title">
                  <xsl:with-param name="title" select="text()" />
                </xsl:call-template>
              </div>
              <div class="IGRP_dialogboxCenter">
                <xsl:for-each select="ancestor::form/label/*[(@rel=$nome)]">
                  <xsl:if test="not(substring(@name,(string-length(name())-4),5) = '_desc')">
                    <xsl:variable name="nome2" select="name()" />
                    <xsl:call-template name="GEN-FIELD">
                      <xsl:with-param name="label" select="." />
                      <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome2]" />
                      <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome2]" />
                      <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome2]" />
                    </xsl:call-template>
                  </xsl:if>
                </xsl:for-each>
              </div>
              <div class="dialog_btnContainer">
                <input type="button" class="IGRP_row_confirm" value="Confirmar" rel="{name()}"/>
                <input type="button" class="IGRP_row_confirmClose" value="Confirmar e Fechar" rel="{name()}"/>
              </div>
            </div>
            <xsl:call-template name="GEN-SIMPLE-TABLE">
              <xsl:with-param name="rel" select="name()" />
              <xsl:with-param name="dialog" select="'_diag'" />
              <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
            </xsl:call-template>
          </div> -->
        </xsl:when>
        <!-- FORM LISTA-->
        <xsl:when test="@type='formlist'">
          formlist
          <!-- <div rel="{name()}" name="sep_{name()}">
            
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="text()" />
              <xsl:with-param name="class" select="'subtitle'" />
            </xsl:call-template>

            <xsl:call-template name="GEN-FORM-TABLE">
              <xsl:with-param name="rel" select="name()" />
              <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
            </xsl:call-template>
          </div> -->
        </xsl:when>
        <!-- LISTA-->
        <xsl:when test="@type='list'">
          list
          <!-- <div rel="{name()}" name="sep_{name()}">
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="text()" />
              <xsl:with-param name="class" select="'subtitle'" />
            </xsl:call-template>
            <xsl:call-template name="GEN-LIST-TABLE">
              <xsl:with-param name="rel" select="name()" />
              <xsl:with-param name="table" select="ancestor::form/table/*[name()=$nome]" />
            </xsl:call-template>
          </div> -->
        </xsl:when>
        <!-- OUTROS CAMPOS -->
        <xsl:otherwise>
          <xsl:if test="not(@rel)">
            gen field
            <!-- <xsl:call-template name="GEN-FIELD">
              <xsl:with-param name="label" select="." />
              <xsl:with-param name="value" select="ancestor::form/value/*[name()=$nome]" />
              <xsl:with-param name="list" select="ancestor::form/list/*[name()=$nome]" />
              <xsl:with-param name="lookup" select="ancestor::form/lookup/*[name()=$nome]" />
              <xsl:with-param name="value_desc" select="ancestor::form/value/*[name()=$nome_desc]" />
            </xsl:call-template> -->
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>