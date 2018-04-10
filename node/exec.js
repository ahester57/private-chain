const exec = require('child_process').exec
const Web3 = require('web3')
const ChainMessageArt = require('./ChainMessage.json')

const networkId = '9111'
const provider = 'ws://localhost:35355'

//if (typeof web3 !== 'undefined')
//	web3 = new Web3(web3.currentProvider);
//else
const web3 = new Web3(new Web3.providers.WebsocketProvider(provider));



web3.eth.net.getId().then(function(networdId) {
		// get the contract instance
		const address = ChainMessageArt.networks[networkId].address;
		//var message = loadChainMessage();
		const message = new web3.eth.Contract(ChainMessageArt.abi, address);

		// interact
		var cb = web3.eth.personal.getAccounts().then(function (ac) {
			return ac[0];
		}).then(function (cb) {
			console.log(cb);
//			var call = message.methods['getMessage(address)'](cb);
//			call.call().then( function(msg) {
//				console.log(msg);
//			});
		});

		console.log(message)
		// watch for event SentMessage
		message.events['SentMessage'] 
		(function(error,event) {
			console.log(error)
		})
		.on('data', function(log) {
			var info = log.returnValues;
			var from = info._from;
			var to = info._to;
			var msg = info._msg;
			console.log("from: ", from);
			console.log("to: ", to);
			console.log("msg: ", msg);
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
