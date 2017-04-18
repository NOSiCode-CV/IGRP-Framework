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
define("esri/layers/SnapshotMode","dojo/_base/declare dojo/_base/lang dojo/has esri/kernel esri/SpatialReference esri/tasks/query esri/layers/RenderMode".split(" "),function(f,e,k,l,m,n,p){f=f([p],{declaredClass:"esri.layers._SnapshotMode",constructor:function(a){this.featureLayer=a;this._featureMap={};this._drawFeatures=e.hitch(this,this._drawFeatures);this._queryErrorHandler=e.hitch(this,this._queryErrorHandler)},startup:function(){this.featureLayer._collection?this._applyTimeFilter():this._fetchAll()},
propertyChangeHandler:function(a){this._init&&(a?this.featureLayer._collection?console.log("FeatureLayer: layer created by value (from a feature collection) does not support definition expressions and time definitions. Layer id \x3d "+this.featureLayer.id):this._fetchAll():this._applyTimeFilter())},drawFeature:function(a){var b=a.attributes[this.featureLayer.objectIdField];this._addFeatureIIf(b,a);this._incRefCount(b)},resume:function(){this.propertyChangeHandler(0)},refresh:function(){var a=this.featureLayer;
a._collection?(a._fireUpdateStart(),a._refresh(!0),a._fireUpdateEnd()):this._fetchAll()},_getRequestId:function(a){return("_"+a.name+a.layerId+a._ulid).replace(/[^a-zA-Z0-9\_]+/g,"_")},_fetchAll:function(){var a=this.featureLayer;!a._collection&&!a.suspended&&(a._fireUpdateStart(),this._clearIIf(),this._sendRequest())},_sendRequest:function(){var a=this.map,b=this.featureLayer,g=b.getDefinitionExpression(),c=new n;c.outFields=b.getOutFields();c.where=g||"1\x3d1";c.returnGeometry=!0;c.outSpatialReference=
new m(a.spatialReference.toJson());c.timeExtent=b.getTimeDefinition();c.maxAllowableOffset=b._maxOffset;b._ts&&(c._ts=(new Date).getTime());c.orderByFields=b.supportsAdvancedQueries?b.getOrderByFields():null;var d;b._usePatch&&(d=this._getRequestId(b),this._cancelPendingRequest(null,d));b._task.execute(c,this._drawFeatures,this._queryErrorHandler,d)},_drawFeatures:function(a){this._purgeRequests();var b=a.features,g=this.featureLayer,c=g.objectIdField,d,f=b.length,e,h;for(d=0;d<f;d++)e=b[d],h=e.attributes[c],
this._addFeatureIIf(h,e),this._incRefCount(h);this._applyTimeFilter(!0);g._fireUpdateEnd(null,a.exceededTransferLimit?{queryLimitExceeded:!0}:null);if(a.exceededTransferLimit)g.onQueryLimitExceeded()},_queryErrorHandler:function(a){this._purgeRequests();var b=this.featureLayer;b._errorHandler(a);b._fireUpdateEnd(a)}});k("extend-esri")&&e.setObject("layers._SnapshotMode",f,l);return f});