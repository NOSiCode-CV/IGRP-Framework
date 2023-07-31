<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template name="VirtualKeyBoard">
        <xsl:param name="type" select="'vkb_num'"/>
        <xsl:param name="rel" select="'rel'"/>
        <xsl:param name="input_type" select="'password'"/>
        <xsl:param name="input_name" select="'p_vkb'"/>
        <xsl:param name="vkimg" select="'true'"/>
        <xsl:param name="id"/>
        <xsl:param name="placeholder" select="''" />
        <xsl:param name="vRequired"/>
        <div class="vkb_geral input-group IGRP-vkb" id="{$id}" rel="{$rel}" vkbtype="{$type}" vkbonload="false">
            <input type="{$input_type}" name="{$input_name}" class="vkb_input form-control {$vRequired}" id="inp_{$rel}" readonly="readonly" rel="{$rel}" post="{$type}" placeholder="{$placeholder}"/>
            <xsl:if test="$vkimg = 'true'">
                <span class="input-group-addon vkb_ctrl" rel="{$rel}">
                    <i class="fa fa-keyboard-o"></i>
                </span>
            </xsl:if>
            <div class="vkb_main {$type}" id="vkb_{$rel}">
                <div class="vkb_num" id="vkbnum_{$rel}">
                    <div class="_clear"/>
                </div>
                <div class="vkb_az" id="vkbaz_{$rel}">
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
                <div class="vkb_btn">
                    <input type="button" id="vkbCan_{$rel}" class="vkbCan_btn btn-sm hidden" value="Cancelar"/>
                    <input type="button" id="vkbLp_{$rel}" class="vkbLp_btn btn-sm btn-danger" value="Limpar"/>
                    
                    <input type="button" id="shift_{$rel}" class="shift_btn btn-sm btn-primary" value="SHIFT" rel="{$rel}"/>
                    <input type="button" id="vkbOk_{$rel}" class="vkbOk_btn btn-sm btn-success" value="OK"/>
                <div class="_cliar"/>
                </div>
            </div>
        </div>
   </xsl:template>
</xsl:stylesheet>