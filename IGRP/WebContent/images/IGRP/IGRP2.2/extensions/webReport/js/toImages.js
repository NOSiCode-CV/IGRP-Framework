$.fn.toImage = function() {
  $(this).each(function() {
    var svg$ = $(this);
    var width = svg$.width();
    var height = svg$.height();

      // Create a blob from the SVG data
      var svgData = new XMLSerializer().serializeToString(this);
      var blob = new Blob([svgData], { type: "image/svg+xml;charset=utf-8" });
      // Get the blob's URL
      var domUrl = self.URL || self.webkitURL || self;
      var blobUrl = domUrl.createObjectURL(blob);
      // Load the blob into a temporary image
      $('<img />')
        .width(width)
        .height(height)
        .on('load', function() {
          try {
            var canvas = document.createElement('canvas');
            canvas.width = width;
            canvas.height = height;
            var ctx = canvas.getContext('2d');

            // Start with white background (optional; transparent otherwise)
            ctx.fillStyle = '#fff';
            ctx.fillRect(0, 0, width, height);

            // Draw SVG image on canvas
            ctx.drawImage(this, 0, 0);
            // Replace SVG tag with the canvas' image
            svg$.replaceWith($('<img />').attr({
              src: canvas.toDataURL(),
              width: width,
              height: height
            }));
          } finally {
            domUrl.revokeObjectURL(blobUrl);
          }
        }).attr('src', blobUrl); 
  });
};
