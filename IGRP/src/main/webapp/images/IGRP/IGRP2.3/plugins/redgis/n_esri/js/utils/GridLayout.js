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
define("esri/layers/GridLayout","dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/has esri/kernel esri/SpatialReference esri/geometry/Extent esri/geometry/Polyline".split(" "),function(k,t,u,v,w,x,y,z){k=k(null,{declaredClass:"esri.layers._GridLayout",constructor:function(a,d,b,e){this.origin=a;this.cellWidth=d.width;this.cellHeight=d.height;this.mapWidth=b.width;this.mapHeight=b.height;this.srInfo=e},setResolution:function(a){this._resolution=(a.xmax-a.xmin)/this.mapWidth;this.srInfo&&(a=
Math.round(2*this.srInfo.valid[1]/this._resolution),a=Math.round(a/this.cellWidth),this._frameStats=[a,0,a-1])},getCellCoordinates:function(a){var d=this._resolution,b=this.origin;return{row:Math.floor((b.y-a.y)/(this.cellHeight*d)),col:Math.floor((a.x-b.x)/(this.cellWidth*d))}},normalize:function(a){var d=this._frameStats;if(d){var b=d[0],e=d[1],d=d[2];a<e?(a%=b,a=a<e?a+b:a):a>d&&(a%=b)}return a},intersects:function(a,d){var b=this.srInfo;return b?u.some(d._getParts(b),function(b){return a.intersects(b.extent)}):
a.intersects(d)},getCellExtent:function(a,d){var b=this._resolution,e=this.origin,l=this.cellWidth,m=this.cellHeight;return new y(d*l*b+e.x,e.y-(a+1)*m*b,(d+1)*l*b+e.x,e.y-a*m*b,new x(e.spatialReference.toJson()))},getLatticeID:function(a){var d=this.getCellCoordinates({x:a.xmin,y:a.ymax}),b=this.getCellCoordinates({x:a.xmax,y:a.ymin});a=d.row;var e=b.row,d=this.normalize(d.col),b=this.normalize(b.col);return a+"_"+e+"_"+d+"_"+b},sorter:function(a,d){return a<d?-1:1},getCellsInExtent:function(a,d){var b=
this.getCellCoordinates({x:a.xmin,y:a.ymax}),e=this.getCellCoordinates({x:a.xmax,y:a.ymin}),l=b.row,m=e.row,b=b.col,e=e.col,k=[],c,f,n,g=[],h=[],q,r,s,p=[];for(c=l;c<=m;c++)for(f=b;f<=e;f++)n=this.normalize(f),a=this.getCellExtent(c,n),k.push({row:c,col:n,extent:a,resolution:this._resolution}),d&&(g.push(a.xmin,a.xmax),h.push(a.ymin,a.ymax));b=this.normalize(b);e=this.normalize(e);g.sort(this.sorter);h.sort(this.sorter);f=g.length;for(c=f-1;0<=c;c--)c<f-1&&g[c]===g[c+1]&&g.splice(c,1);f=h.length;
for(c=f-1;0<=c;c--)c<f-1&&h[c]===h[c+1]&&h.splice(c,1);if(g.length&&h.length){n=g[0];q=g[g.length-1];r=h[0];s=h[h.length-1];f=g.length;for(c=0;c<f;c++)p.push([[g[c],s],[g[c],r]]);f=h.length;for(c=0;c<f;c++)p.push([[n,h[c]],[q,h[c]]]);c=new z({paths:p,spatialReference:this.origin.spatialReference.toJson()});k.push({latticeID:l+"_"+m+"_"+b+"_"+e,lattice:c,resolution:this._resolution})}return{minRow:l,maxRow:m,minCol:b,maxCol:e,cells:k}}});v("extend-esri")&&t.setObject("layers._GridLayout",k,w);return k});