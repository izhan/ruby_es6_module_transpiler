var get = function(obj, key) {
  return obj[key];
};

var set = function(obj, key, value) {
  obj[key] = value;
  return obj;
};

export { get, set };