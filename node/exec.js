var exec = require('child_process').exec
var Web3 = require('web3')
var loadChainMessage = require('./loadChainMessage.js')

var provider = 'ws://localhost:35355'

//if (typeof web3 !== 'undefined')
//	web3 = new Web3(web3.currentProvider);
//else
	web3 = new Web3(new Web3.providers.WebsocketProvider(provider));

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
});

// watch a contract
web3.eth.net.getId().then(function(networdId) {

		message.events['SentMessage(address,string)'](function(error, event) {
			console.log(error)
		})
		.on('data', function(log) {
			let {returnValues: {_to, _msg}, blockNumber} = log
			console.log(log);
		}).on('changed', function(log) {
			console.log(log);
		}).on('error', function(log) {
			console.log(log);
		})

}).catch(function(err) {
	console.log(err);
});


//console.log(SentMessageEvent.watch())
//console.log(message.events)

// execute a child process
exec('ls', function(error, stdout, stderr) {
	if (error) {
		console.log(error.code);
	} else {
		console.log(stdout);
	}
});
