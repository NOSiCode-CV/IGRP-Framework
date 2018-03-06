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
define("esri/layers/RenderMode","dojo/_base/kernel dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/has dojo/io/script esri/kernel".split(" "),function(m,f,n,k,p,g,q){f=f(null,{declaredClass:"esri.layers._RenderMode",constructor:function(){this._prefix="jsonp_"+(m._scopeName||"dojo")+"IoScript"},initialize:function(a){this.map=a;this._init=!0},startup:function(){},propertyChangeHandler:function(a){},destroy:function(){this._init=!1},drawFeature:function(a){},suspend:function(){},resume:function(){},
refresh:function(){},_incRefCount:function(a){(a=this._featureMap[a])&&a._count++},_decRefCount:function(a){(a=this._featureMap[a])&&a._count--},_getFeature:function(a){return this._featureMap[a]},_addFeatureIIf:function(a,b){var c=this._featureMap,e=c[a],d=this.featureLayer;e||(c[a]=b,d._add(b),b._count=0);return e||b},_removeFeatureIIf:function(a){var b=this._featureMap[a],c=this.featureLayer;if(b){if(b._count)return;delete this._featureMap[a];c._remove(b)}return b},_clearIIf:function(){var a;a=
this.featureLayer;var b=a.graphics,c=a._selectedFeatures,e=a.objectIdField;for(a=b.length-1;0<=a;a--){var d=b[a],h=d.attributes[e];h in c?d._count=1:(d._count=0,this._removeFeatureIIf(h))}},_isPending:function(a){return g[this._prefix+a]?!0:!1},_cancelPendingRequest:function(a,b){if(a=a||g[this._prefix+b])try{a.cancel(),g._validCheck(a)}catch(c){}},_purgeRequests:function(){g._validCheck(null)},_toggleVisibility:function(a){var b=this.featureLayer,c=b.graphics,e=a?"show":"hide",d,h=c.length;a=a&&
b._ager;for(d=0;d<h;d++){var l=c[d];l[e]();a&&b._repaint(l)}},_applyTimeFilter:function(a){var b=this.featureLayer;if(b.timeInfo&&!b.suspended){a||b._fireUpdateStart();var c=b._trackManager;c&&c.clearTracks();var e=b.getTimeDefinition(),d=b._getOffsettedTE(b._mapTimeExtent);d?(d=b._getTimeOverlap(e,d))?(e=b._filterByTime(b.graphics,d.startTime,d.endTime),c&&c.addFeatures(e.match),k.forEach(e.match,function(a){var c=a._shape;a.visible||(a.show(),(c=a._shape)&&c._moveToFront());b._ager&&c&&b._repaint(a)}),
k.forEach(e.noMatch,function(a){a.visible&&a.hide()})):this._toggleVisibility(!1):(c&&c.addFeatures(b.graphics),this._toggleVisibility(!0));c&&(c.moveLatestToFront(),c.drawTracks());a||b._fireUpdateEnd()}}});p("extend-esri")&&n.setObject("layers._RenderMode",f,q);return f});