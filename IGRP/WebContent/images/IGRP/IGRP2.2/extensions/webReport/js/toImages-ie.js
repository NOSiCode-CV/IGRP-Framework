$.fn.toImage = function() {
  $(this).each(function() {
    var svg$ = $(this);
    var width = svg$.width();
    var height = svg$.height();

      // Create a blob from the SVG data
    var svgData = new XMLSerializer().serializeToString(this);
    var blob = new Blob([svgData], { type: "image/svg+xml;charset=utf-8" });

      // Get the blob's URL
    var blobUrl = (self.URL || self.webkitURL || self).createObjectURL(blob);

      // Load the blob into an image
    $('<img />')
      .width(width)
      .height(height)
      .on('load', function() {
           // Overwrite the SVG tag with the img tag
          svg$.replaceWith(this);
    }).attr('src', blobUrl);
  });
};