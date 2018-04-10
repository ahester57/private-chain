
var ChainMessage = loadChainMessage();

function loadChainMessage() {
	var address = "0x17ddc07445fd90087c7f2178978cc3ffdee80eba";
	var abi =
	eth.contract([{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"message","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"init","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_msg","type":"string"}],"name":"SentMessage","type":"event"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_msg","type":"string"}],"name":"sendMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_of","type":"address"}],"name":"getMessage","outputs":[{"name":"_msg","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_of","type":"address"}],"name":"clearMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"string"},{"name":"b","type":"string"}],"name":"strcmp","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"pure","type":"function"}])

	var instance = abi.at(address);
	return instance;
}
