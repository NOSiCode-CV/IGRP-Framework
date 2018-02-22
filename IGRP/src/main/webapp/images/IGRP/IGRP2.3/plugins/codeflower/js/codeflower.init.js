(function () {
   var com,
      currentCodeFlower = [];
      
   $.IGRP.component('codeflower',{
      convertFromClocToJSON : function(data) {
         var lines = data.split("\n");
         lines.shift(); // drop the header line

         var json = {};

         lines.forEach(function(line) {
            var cols    = line.split(','),
               filename = cols[1];

            if (!filename) return;

            var elements   = filename.split(/[\/\\]/),
               current     = json;

            elements.forEach(function(element) {
               if (!current[element]) {
                  current[element] = {};
               }
               current = current[element];
            });

            current.language = cols[0];
            current.size = parseInt(cols[4], 10);
         });

         json      = com.getChildren(json)[0];
         json.name = 'root';

        return json;
      },
      convertFromWcToJSON : function(data) {

         /**
            * Convert a simple json object into another specifying children as an array
            * Works recursively
            *
            * example input:
            * { a: { b: { c: { size: 12 }, d: { size: 34 } }, e: { size: 56 } } }
            * example output
            * { name: a, children: [
            *   { name: b, children: [
            *     { name: c, size: 12 },
            *     { name: d, size: 34 }
            *   ] },
            *   { name: e, size: 56 }
            * ] } }
         */

         var lines   = data.split("\n"),
            json     = {},
            filename, size, cols, elements, current;

         lines.forEach(function(line) {
            cols = line.trim().split(' ');
            size = parseInt(cols[0], 10);

            if (!size) return;

            filename = cols[1];

            if (filename === "total") return;

            if (!filename) return;

            elements = filename.split(/[\/\\]/);
            current  = json;

            elements.forEach(function(element) {
               if (!current[element]) {
                  current[element] = {};
               }

               current = current[element];
            });

            current.size = size;
         });

         json.children  = com.getChildren(json);
         json.name      = 'root';

         return json;
      },
      getChildren : function(json) {
         var children = [];

         if (json.language) return children;

         for (var key in json) {
            var child = { name: key };

            if (json[key].size) {
               // value node
               child.size     = json[key].size;
               child.language = json[key].language;

            } else {
               // children node
               var childChildren = com.getChildren(json[key]);

               if (childChildren) 
                  child.children = childChildren;
            }
            children.push(child);
            delete json[key];
         }
         return children;
      },
      countElements : function(node) {
         var nbElements = 1;

         if (node.children) {
            nbElements += node.children.reduce(function(p, v) { 
               return p + com.countElements(v); 
            },0);
         }
         return nbElements;
      },
      convertToJSON : function(data, origin) {
        return (origin == 'cloc') ? com.convertFromClocToJSON(data) : com.convertFromWcToJSON(data);
      },
      type : {
         training : function(p){
            return new Training("#"+p.id, p.width, p.height).update(p.json);
         },
         codeflower : function(p){
            $("#"+p.id).css({'margin-left':- parseInt(p.width/2)});
            return new CodeFlower("#"+p.id, p.width, p.height).update(p.json);
         }
      },
      createCodeFlower : function(t){
         var id = t.attr('id');

         d3.json(t.attr('href'), function(error,json){
             if (error) throw error;

            if (currentCodeFlower[id])
               currentCodeFlower[id].cleanup();

            // adapt layout size to the total number of elements
            var total   = com.countElements(json),
               width    = parseInt(Math.sqrt(total) * 30, 10),
               height   = parseInt(Math.sqrt(total) * 30, 10);

            // create a new CodeFlower
            var codeflower = com.type[t.attr('rel')]({
               id       : id,
               json     : json,
               width    : width,
               height   : height
            });
            
            currentCodeFlower[id] = codeflower;
         });
      },
      init:function(){
         com = this;

         $('.codeflower').each(function(){
            com.createCodeFlower($(this));
         });         
      }
   },true);
})();

