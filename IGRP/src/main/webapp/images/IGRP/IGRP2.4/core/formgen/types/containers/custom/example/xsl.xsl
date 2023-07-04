<div class="box igrp-forms gen-container-item " item-name="form_1">
  <div class="box-body">
    <div role="form">
      <xsl:apply-templates mode="form-hidden-fields" select="#path#/fields"/>
      <xsl:if test="#path#/fields/text_1">
        <div class="form-group col-md-3 gen-fields-holder" item-name="text_1" item-type="text">
          <label for="{#path#/fields/text_1/@name}">
            <span>
              <xsl:value-of select="#path#/fields/text_1/label"/>
            </span>
          </label>
          <input type="text" value="{#path#/fields/text_1/value}" class="form-control" id="{#path#/fields/text_1/@name}" name="{#path#/fields/text_1/@name}" maxlength="30"></input>
        </div>
      </xsl:if>
      <xsl:if test="#path#/fields/email_1">
        <div class="form-group col-md-3 gen-fields-holder" item-name="email_1" item-type="email">
          <label for="{#path#/fields/email_1/@name}">
            <span>
              <xsl:value-of select="#path#/fields/email_1/label"/>
            </span>
          </label>
          <input type="email" value="{#path#/fields/email_1/value}" class="form-control" id="{#path#/fields/email_1/@name}" name="{#path#/fields/email_1/@name}" maxlength="30"></input>
        </div>
      </xsl:if>
    </div>
  </div>
  <xsl:apply-templates select="#path#/tools-bar" mode="form-buttons"/>
</div>