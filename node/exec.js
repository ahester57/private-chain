var exec = require('child_process').exec
var Web3 = require('web3')
var loadChainMessage = require('./loadChainMessage.js')

if (typeof web3 !== 'undefined')
	web3 = new Web3(web3.currentProvider);
else
	web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:42024"));

// get the contract instance
var message = loadChainMessage();

// interact
var cb = web3.eth.personal.getAccounts().then(function (ac) {
	return ac[0];
}).then(function (cb) {
	console.log(cb);
	var call = message.methods['getMessage(address)'](cb);
	call.call().then( function(msg) {
		console.log(msg);
	});
})

	//console.log(message.methods.getMessage.call(cb))

// execute a child process
exec('ls', function(error, stdout, stderr) {
	if (error) {
		console.log(error.code);
	} else {
		console.log(stdout);
	}
});
