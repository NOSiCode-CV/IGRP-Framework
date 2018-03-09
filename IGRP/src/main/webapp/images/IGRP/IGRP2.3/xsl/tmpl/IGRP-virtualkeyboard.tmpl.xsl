<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template name="VirtualKeyBoard">
        <xsl:param name="type" select="'vkb_num'"/>
        <xsl:param name="rel" select="'rel'"/>
        <xsl:param name="input_type" select="'password'"/>
        <xsl:param name="input_name" select="'p_vkb'"/>
        <xsl:param name="vkimg" select="'true'"/>
        <xsl:param name="id"/>
        <xsl:param name="vRequired"/>
        <div class="VKB_geral input-group" id="{$id}" rel="{$rel}" vkbtype="{$type}">
            <input type="{$input_type}" name="{$input_name}" class="VKB_input form-control {$vRequired}" id="INP_{$rel}" readonly="readonly" rel="{$rel}" post="{$type}"/>
            <xsl:if test="$vkimg = 'true'">
                <span class="input-group-addon VKB_ctrl" rel="{$rel}">
                    <i class="fa fa-keyboard-o"></i>
                </span>
            </xsl:if>
            <div class="VKB_main {$type}" id="VKB_{$rel}">
                <div class="VKB_num" id="VKBnum_{$rel}">
                    <div class="_clear"/>
                </div>
                <div class="VKB_az" id="VKBaz_{$rel}">
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
                <div class="VKB_but">
                    <input type="button" id="VKBOK_{$rel}" class="VKBOK_but" value="OK"/>
                    <input type="button" id="SHIFT_{$rel}" class="SHIFT_but but" value="SHIFT" rel="{$rel}"/>
                    <input type="button" id="VKBCAN_{$rel}" class="VKBCAN_but but hideItem" value="Cancelar"/>
                    <input type="button" id="VKBLP_{$rel}" class="VKBLP_but but" value="Limpar"/>
                <div class="_cliar"/>
                </div>
            </div>
        </div>
        <script>
            $(function(){
                $('#<xsl:value-of select="$id"/>').IGRP_vkboard();
            });
        </script>
   </xsl:template>
</xsl:stylesheet>