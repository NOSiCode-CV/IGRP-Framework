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
define("esri/layers/TrackManager","dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/has esri/kernel esri/graphic esri/geometry/Polyline esri/layers/GraphicsLayer".split(" "),function(e,m,k,n,p,q,r,s){e=e(null,{declaredClass:"esri.layers._TrackManager",constructor:function(a){this.layer=a;this.trackMap={}},initialize:function(a){this.map=a;var b=this.layer,d=b._getRenderer(),d=d&&d.trackRenderer;if("esriGeometryPoint"===b.geometryType){var c=this.container=new s._GraphicsLayer({id:b.id+"_tracks",
_child:!0});c.loaded=!0;c.onLoad(c);c._setMap(a,b._div);c.setRenderer(d)}},addFeatures:function(a){var b,d=this.trackMap,c=this.layer,f=c._trackIdField,l,g;k.forEach(a,function(a){l=a.attributes;b=l[f];g=d[b]=d[b]||[];g.push(a)});var h=c._startTimeField,e=c.objectIdField;a=function(a,b){var d=a.attributes[h],c=b.attributes[h];return d===c?a.attributes[e]<b.attributes[e]?-1:1:d<c?-1:1};for(b in d)d[b].sort(a)},drawTracks:function(){var a=this.container;if(a){var b=this.trackMap,d=this.map.spatialReference,
c,f,e,g,h,k=this.layer._trackIdField;for(c in b){f=b[c];e=[];for(g=f.length-1;0<=g;g--)(h=f[g].geometry)&&e.push([h.x,h.y]);f={};f[k]=c;0<e.length&&a.add(new q(new r({paths:[e],spatialReference:d}),null,f))}}},moveLatestToFront:function(){k.forEach(this.getLatestObservations(),function(a){var b=a._shape;b&&b._moveToFront();this._repaint(a,null,!0)},this.layer)},getLatestObservations:function(){var a=[],b=this.layer._getRenderer(),d=this.trackMap,c;if(!b.latestObservationRenderer)return a;for(c in d)b=
d[c],a.push(b[b.length-1]);return a},clearTracks:function(){var a=this.getLatestObservations();this.trackMap={};var b=this.container;b&&b.clear();k.forEach(a,function(a){this._repaint(a,null,!0)},this.layer)},isLatestObservation:function(a){var b=this.trackMap[a.attributes[this.layer._trackIdField]];return b?b[b.length-1]===a:!1},destroy:function(){var a=this.container;a&&(a.clear(),a._unsetMap(this.map,this.layer._div));this.map=this.layer=this.trackMap=this.container=null}});n("extend-esri")&&m.setObject("layers._TrackManager",
e,p);return e});