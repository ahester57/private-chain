var ChainMessage = loadChainMessage();

function loadChainMessage() {
	var abi =
	eth.contract([{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"message","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"init","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_msg","type":"string"}],"name":"SentMessage","type":"event"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_msg","type":"string"}],"name":"sendMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_of","type":"address"}],"name":"getMessage","outputs":[{"name":"_msg","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_of","type":"address"}],"name":"clearMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"string"},{"name":"b","type":"string"}],"name":"strcmp","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"pure","type":"function"}]);
	var instance = abi.at("0x46ad779ce79b44ef01826feb7868d230c232779d");
	return instance;
}
