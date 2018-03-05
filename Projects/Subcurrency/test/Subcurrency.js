var Subcurrency = artifacts.require("Subcurrency");

var Sub;
var balance;
var accounts;
var acct;

//web3.eth.getAccounts(function(e,a) { accounts = a; });
//console.log(accounts);
acct = "0x627306090abaB3A6e1400e9345bC60c78a8BEf57";

Subcurrency.deployed().then(function(instance) {
	Sub = instance;
	Sub.mint(acct, 1000, {from: acct});
	return Sub.getBalance.call(acct);
}).then(function(result) {
	//alert("Transaction success");
	console.log(result.toString(10));
}).catch(function(e) {
	alert("errorrr");
});
