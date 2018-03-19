var web3 = require('web3');
var w = new web3();

w.setProvider(new HttpProvider("http://localhost:42023"));
console.log(w)
