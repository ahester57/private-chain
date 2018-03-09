
module.exports = function(callback) {
var json = require("./build/contracts/Subcurrency.json");

var contract = require("truffle-contract");
var Subcurrency = contract(json);

var Web3 = require('web3');
var provider = new Web3.providers.HttpProvider("http://127.0.0.1:7545");
Subcurrency.setProvider(provider);

var coinbase = "0x627306090abaB3A6e1400e9345bC60c78a8BEf57";

Subcurrency.deployed().then(function(instance) {
	return instance.getBalance.call(coinbase);
});
}
