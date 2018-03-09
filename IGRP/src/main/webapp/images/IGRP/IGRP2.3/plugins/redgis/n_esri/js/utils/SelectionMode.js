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
define("esri/layers/SelectionMode",["dojo/_base/declare","dojo/_base/lang","dojo/has","esri/kernel","esri/layers/RenderMode"],function(a,b,c,d,e){a=a([e],{declaredClass:"esri.layers._SelectionMode",constructor:function(a){this.featureLayer=a;this._featureMap={}},propertyChangeHandler:function(a){this._init&&0===a&&this._applyTimeFilter()},resume:function(){this.propertyChangeHandler(0)}});c("extend-esri")&&b.setObject("layers._SelectionMode",a,d);return a});