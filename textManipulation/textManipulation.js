function setup() {
var b = loadBytes("something.dat");

// Print each value, from 0 to 255
for (var i = 0; i < b.length; i++) {
  // bytes are from -128 to 127, this converts to 0 to 255
  var a = b[i] & 0xff;
  print(a + " ");
}
}
