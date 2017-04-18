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
define("esri/layers/FeatureType","dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/has esri/kernel esri/lang esri/symbols/jsonUtils esri/layers/RangeDomain esri/layers/CodedValueDomain esri/layers/InheritedDomain esri/layers/FeatureTemplate".split(" "),function(d,g,h,k,l,m,n,p,q,r,s){d=d(null,{declaredClass:"esri.layers.FeatureType",constructor:function(a){if(a&&g.isObject(a)){this.id=a.id;this.name=a.name;var c=a.symbol;c&&(this.symbol=n.fromJson(c));var c=a.domains,b,f=this.domains={};for(b in c)if(c.hasOwnProperty(b)){var e=
c[b];switch(e.type){case "range":f[b]=new p(e);break;case "codedValue":f[b]=new q(e);break;case "inherited":f[b]=new r(e)}}if(b=a.templates){c=this.templates=[];for(a=0;a<b.length;a++)c.push(new s(b[a]))}}},toJson:function(){var a={id:this.id,name:this.name,symbol:this.symbol&&this.symbol.toJson()},c,b=this.domains,f=this.templates,e=m.fixJson;if(b){var d=a.domains={};for(c in b)b.hasOwnProperty(c)&&(d[c]=b[c]&&b[c].toJson());e(d)}f&&(a.templates=h.map(f,function(a){return a.toJson()}));return e(a)}});
k("extend-esri")&&g.setObject("layers.FeatureType",d,l);return d});