const math = require('mathjs');

function lambertW(z, k) {
  let r = math.abs(z);
  let t = math.arg(z);
  let w = math.add(Math.log(r), math.multiply(math.i, t+2*Math.PI*k));

  for(let i=0;i<50;i++){
    let ew = math.exp(w);
    let f = math.subtract(math.multiply(w,ew),z);
    let fp = math.multiply(ew,math.add(w,1));
    w = math.subtract(w,math.divide(f,fp));
  }
  return w;
}
