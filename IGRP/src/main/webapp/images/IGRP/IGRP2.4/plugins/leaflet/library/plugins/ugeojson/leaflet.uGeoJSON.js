L.UGeoJSONLayer = L.GeoJSON.extend({
  options: {
    debug: false,
    light: true,
    usebbox: false,
    endpoint: -1,
    parameters: {},
    headers: {},
    maxRequests: 5,
    pollTime:0,
    once: false,
    enctype: 'form-data', //urlencoded || form-data || json
    transformData: function (data) { return data; },
    afterFetch: function () {},
    after: function (data) {},
  },
  callback: function (data) {
    console.log(data)
    if(this.options.light) {
      this.clearLayers();//if needed, we clean the layers
    }

    //Then we add the new data
    this.addData(data);
    this.options.after(data);
  },
  initialize: function (uOptions, options) {
    L.GeoJSON.prototype.initialize.call(this, undefined, options);
    L.Util.setOptions(this, uOptions);

    this._layersOld = [];
    this._requests = [];
  },
  onMoveEnd: function () {
    if (this.options.debug) {
      console.debug('load Data');
    }

    while(this._requests.length > this.options.maxRequests) { //This allows to stop the oldest requests
      this._requests.shift().abort();
    }

    var postData = {};
    if (typeof this.options.parameters === 'function') {
      postData = this.options.parameters();
    } else {
      for (var k in this.options.parameters) {
        if (typeof this.options.parameters[k].scope !== 'undefined') {
	        postData[k]=this.options.parameters[k].scope[k];
        } else {
	        postData[k]=this.options.parameters[k];
        }
      }
    }

    var bounds = this._map.getBounds();
    if (this.options.usebbox) {
      postData.bbox = bounds.toBBoxString();
    } else {
      postData.south = bounds.getSouth();
      postData.north = bounds.getNorth();
      postData.east = bounds.getEast();
      postData.west = bounds.getWest();
    }
    postData.zoom = this._map.getZoom();

    var self = this;
    var request = new XMLHttpRequest();

    request.open('POST', this.options.endpoint, true);
    for(var l in this.options.headers) {
      if (typeof this.options.headers[l].scope !== 'undefined') {
        request.setRequestHeader(l, this.options.headers[l].scope[l]);
      } else {
        request.setRequestHeader(l, this.options.headers[l]);
      }
    }

    request.onload = function() {

      for(var i in self._requests) {
        if(self._requests[i] === request) {
          self._requests.splice(i,1); //We remove the request from the list of currently running requests.
          break;
        }
      }

      if (this.status >= 200 && this.status < 400) {
        console.log(this.responseText)
        var data = JSON.parse(this.responseText);

        if (self.options.transformData) {
          data = self.options.transformData(data);
        }

        self.options.afterFetch();

        self.callback(data);
      }

    };

    this._requests.push(request);

    if (this.options.enctype=='urlencoded' || this.options.enctype=='json') {
      if (this.options.enctype=='urlencoded') {
        // urlencoded request
        var urlencoded = '';
        for (var p in postData) {
          if (postData.hasOwnProperty(p)) {
            if (urlencoded.length > 0) {
              urlencoded += '&';
            }
            urlencoded += encodeURIComponent(p) + '=' + encodeURIComponent(postData[p]);
          }
        }
        request.send(urlencoded);
      } else {
        // json request
        request.send(JSON.stringify(postData));
      }
    } else {
      var postFormData = new FormData();
      for (var q in postData) {

        if (postData.hasOwnProperty(q)) {
          postFormData.append(q, postData[q]);
        }
      }
      request.send(postFormData);
    }
  },
  onAdd: function (map) {
    this._map = map;

    if (typeof this.options.endpoint !== 'undefined' && this.options.endpoint !== -1) {
		  this.onMoveEnd();

      if (!this.options.once) {
        map.on('dragend', this.onMoveEnd, this);
        map.on('zoomend', this.onMoveEnd, this);
        map.on('refresh', this.onMoveEnd, this);

        if (this.options.pollTime > 0) {
          this.intervalID = window.setInterval(this.onMoveEnd.bind(this), this.options.pollTime);
        }
      }
    }

    if (this.options.debug) {
      console.debug('add layer');
    }
  },

  onRemove: function (map) {
    if (this.options.debug) {
      console.debug('remove layer');
    }
    L.LayerGroup.prototype.onRemove.call(this, map);

    if (!this.options.once && this.options.pollTime > 0) {
      window.clearInterval(this.intervalID);
    }

    while(this._requests.length > 0) {
      this._requests.shift().abort();
    }

    if(!this.options.once) {
      map.off({
        'dragend': this.onMoveEnd
      }, this);
      map.off({
        'zoomend': this.onMoveEnd
      }, this);
        map.off({
        'refresh': this.onMoveEnd
      }, this);
    }

    this._map = null;
  }
});

L.uGeoJSONLayer = function (uOptions, options) {
  return new L.UGeoJSONLayer(uOptions, options);
};
