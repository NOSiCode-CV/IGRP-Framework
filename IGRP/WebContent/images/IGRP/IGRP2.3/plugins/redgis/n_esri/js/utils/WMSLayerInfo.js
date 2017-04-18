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
define("esri/layers/WMSLayerInfo",["dojo/_base/declare","dojo/_base/lang","dojo/_base/array","dojo/has","esri/kernel"],function(c,e,d,f,g){c=c(null,{declaredClass:"esri.layers.WMSLayerInfo",name:null,title:null,description:null,extent:null,legendURL:null,subLayers:[],allExtents:[],spatialReferences:[],constructor:function(a){a&&(this.name=a.name,this.title=a.title,this.description=a.description,this.extent=a.extent,this.legendURL=a.legendURL,this.subLayers=a.subLayers?a.subLayers:[],this.allExtents=
a.allExtents?a.allExtents:[],this.spatialReferences=a.spatialReferences?a.spatialReferences:[])},clone:function(){var a={name:this.name,title:this.title,description:this.description,legendURL:this.legendURL},b;this.extent&&(a.extent=this.extent.getExtent());a.subLayers=[];d.forEach(this.subLayers,function(b){a.subLayers.push(b.clone())});a.allExtents=[];for(b in this.allExtents)b=parseInt(b,10),isNaN(b)||(a.allExtents[b]=this.allExtents[b].getExtent());a.spatialReferences=[];d.forEach(this.spatialReferences,
function(b){a.spatialReferences.push(b)});return a}});f("extend-esri")&&e.setObject("layers.WMSLayerInfo",c,g);return c});