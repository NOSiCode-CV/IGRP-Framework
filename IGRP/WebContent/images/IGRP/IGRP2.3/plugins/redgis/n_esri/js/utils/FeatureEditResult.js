/*
 COPYRIGHT 2009 ESRI

 TRADE SECRETS: ESRI PROPRIETARY AND CONFIDENTIAL
 Unpublished material - all rights reserved under the
 Copyright Laws of the United States and applicable international
 laws, treaties, and conventions.

 For additional information, contact:
 Environmental Systems Research Institute, Inc.
 Attn: Contracts and Legal Services Department
 380 New York Street
 Redlands, California, 92373
 USA

 email: contracts@esri.com
 */
//>>built
define("esri/layers/FeatureEditResult",["dojo/_base/declare","dojo/_base/lang","dojo/has","esri/kernel"],function(b,c,d,e){b=b(null,{declaredClass:"esri.layers.FeatureEditResult",constructor:function(a){a&&c.isObject(a)&&(this.objectId=a.objectId,this.success=a.success,a.success||(a=a.error,this.error=Error(),this.error.code=a.code,this.error.message=a.description))}});d("extend-esri")&&c.setObject("layers.FeatureEditResult",b,e);return b});