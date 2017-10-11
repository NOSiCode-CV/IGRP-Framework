var _this = null,
   Training = function(selector, w, h) {
      var margin    = {top: 20, right: 120, bottom: 20, left: 120};
     
      this.width    = 960 - margin.right - margin.left,
      this.height   = 800 - margin.top - margin.bottom;
      _this         = this;

      d3.select(selector).selectAll("svg").remove();

      this.diagonal = d3.svg.diagonal().projection(function(d) { return [d.y, d.x]; });

      this.tree     = d3.layout.tree().size([this.height, this.width]);

      this.svg      = d3.select(selector).append("svg")
      .style("width", '100%')//width + margin.right + margin.left
      .attr("height", this.height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
   },
   i        = 0,
   duration = 750;

Training.prototype.init = function(json){
   var root    = json;
      root.x0  = _this.height / 2;
      root.y0  = 0;

   function collapse(d) {
      if (d.children) {
         d._children = d.children;
         d._children.forEach(collapse);
         d.children = null;
      }
   }

   root.children.forEach(collapse);

   return root;
};

Training.prototype.update = function(source,edit) {
   if (!edit){
      _this.json = _this.init(source);
   }

   // Compute the new tree layout.
   var nodes   = _this.tree.nodes(_this.json).reverse(),
      links    = _this.tree.links(nodes);

   // Normalize for fixed-depth.
   nodes.forEach(function(d) { d.y = d.depth * 180; });

   // Update the nodes…
   var node = _this.svg.selectAll("g.node").data(nodes, function(d) { return d.id || (d.id = ++i); });

   // Enter any new nodes at the parent's previous position.
   var nodeEnter = node.enter().append("g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      .on("click", _this.click);

   nodeEnter.append("circle")
      .attr("r", 1e-6)
      .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

   nodeEnter.append("text")
      .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
      .attr("dy", ".35em")
      .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
      .text(function(d) { return d.name; })
      .style("fill-opacity", 1e-6)
      .attr("class", function(d) {
         if (d.url != null) { return 'hyper'; }

      }).on("click", function (d) { 
         $('.hyper').attr('style', 'font-weight:normal');
         d3.select(this).attr('style', 'font-weight:bold');
         if (d.url != null) {
            alert(d);
         }
      });

   // Transition nodes to their new position.
   var nodeUpdate = node.transition().duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

   nodeUpdate.select("circle").attr("r", 4.5)
      .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

   nodeUpdate.select("text").style("fill-opacity", 1);

   // Transition exiting nodes to the parent's new position.
   var nodeExit = node.exit().transition().duration(duration)
      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
      .remove();

   nodeExit.select("circle").attr("r", 1e-6);

   nodeExit.select("text").style("fill-opacity", 1e-6);

   // Update the links…
   var link = _this.svg.selectAll("path.link").data(links, function(d) { return d.target.id; });

   // Enter any new links at the parent's previous position.
   link.enter().insert("path", "g")
      .attr("class", "link")
      .attr("d", function(d) {
         var o = {x: source.x0, y: source.y0};
          return _this.diagonal({source: o, target: o});
      });

   // Transition links to their new position.
   link.transition().duration(duration).attr("d", _this.diagonal);

   // Transition exiting nodes to the parent's new position.
   link.exit().transition().duration(duration)
      .attr("d", function(d) {
        var o = {x: source.x, y: source.y};
        console.log(o);
        return _this.diagonal({source: o, target: o});
      }).remove();

   // Stash the old positions for transition.
   nodes.forEach(function(d) {
      d.x0 = d.x;
      d.y0 = d.y;
   });

   return _this;
};

Training.prototype.click =  function(d) {

   if (d.children) {
      d._children = d.children;
      d.children = null;
   } else {
      d.children = d._children;
      d._children = null;
   }
   _this.update(d,true);
};