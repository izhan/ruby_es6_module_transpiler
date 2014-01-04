(function(__exports__) {
  "use strict";
  var get = function(obj, key) {
    return obj[key];
  };

  var set = function(obj, key, value) {
    obj[key] = value;
    return obj;
  };

  __exports__.get = get;
  __exports__.set = set;
})(window);