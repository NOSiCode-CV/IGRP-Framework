<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template name="wr-table" match="*" mode="wr-table">
      <table class="table table-striped gen-data-table">
         <thead>
            <xsl:for-each select="./table/value/row[@type = 'head']">
               <tr>
                  <xsl:for-each select="*">
                     <th>
                        <xsl:if test="@rowspan">
                           <xsl:attribute name="rowspan"><xsl:value-of select="@rowspan"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@colspan">
                           <xsl:attribute name="colspan"><xsl:value-of select="@colspan"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@style">
                           <xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="." disable-output-escaping="yes"/>
                     </th>
                  </xsl:for-each>
               </tr>
            </xsl:for-each>
         </thead>
         <tbody>
            <xsl:for-each select="./table/value/row[@type != 'head' or not(@type)]">
               <tr>
                  <xsl:for-each select="*">
                     <td>
                        <xsl:value-of select="." disable-output-escaping="yes" />
                     </td>
                  </xsl:for-each>
               </tr>
            </xsl:for-each>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>