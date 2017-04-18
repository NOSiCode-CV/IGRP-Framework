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
define("esri/layers/FeatureTemplate","dojo/_base/declare dojo/_base/lang dojo/has esri/kernel esri/lang esri/graphic".split(" "),function(b,c,d,e,f,g){b=b(null,{declaredClass:"esri.layers.FeatureTemplate",constructor:function(a){a&&c.isObject(a)&&(this.name=a.name,this.description=a.description,this.drawingTool=a.drawingTool,a=a.prototype,this.prototype=new g(a.geometry,null,a.attributes))},toJson:function(){return f.fixJson({name:this.name,description:this.description,drawingTool:this.drawingTool,
prototype:this.prototype&&this.prototype.toJson()})}});c.mixin(b,{TOOL_AUTO_COMPLETE_POLYGON:"esriFeatureEditToolAutoCompletePolygon",TOOL_CIRCLE:"esriFeatureEditToolCircle",TOOL_ELLIPSE:"esriFeatureEditToolEllipse",TOOL_FREEHAND:"esriFeatureEditToolFreehand",TOOL_LINE:"esriFeatureEditToolLine",TOOL_NONE:"esriFeatureEditToolNone",TOOL_POINT:"esriFeatureEditToolPoint",TOOL_POLYGON:"esriFeatureEditToolPolygon",TOOL_RECTANGLE:"esriFeatureEditToolRectangle",TOOL_ARROW:"esriFeatureEditToolArrow",TOOL_TRIANGLE:"esriFeatureEditToolTriangle",
TOOL_LEFT_ARROW:"esriFeatureEditToolLeftArrow",TOOL_RIGHT_ARROW:"esriFeatureEditToolRightArrow",TOOL_UP_ARROW:"esriFeatureEditToolUpArrow",TOOL_DOWN_ARROW:"esriFeatureEditToolDownArrow"});d("extend-esri")&&c.setObject("layers.FeatureTemplate",b,e);return b});