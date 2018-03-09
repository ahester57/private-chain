require('truffle-contract');
require('web3');
var Subcurrency = artifacts.require("Subcurrency");

var coinbase = "0x627306090abaB3A6e1400e9345bC60c78a8BEf57";
var account1 = "0xf17f52151EbEF6C7334FAD080c5704D77216b732";

module.exports = function(callback) {
	var sub;
	var balance;
	var balance = Subcurrency.deployed().then(
	function(instance){return instance.getBalance.call(coinbase); }).then(
	function(value) {return value.toNumber()});
	console.log(balance);
	//sub.mint(coinbase, 10000, {from: coinbase});
	//sub.getBalance.call(coinbase).then(function(bal) {balance = bal;});
	//console.log(balance.toString(10));
}
