var Web3 = require('web3')

if (typeof web3 !== 'undefined')
	web3 = new Web3(web3.currentProvider);
else
	web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:42024"));

module.exports =
function loadChainMessage() {
	var instance =
	new
	web3.eth.Contract([{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"message","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"init","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_msg","type":"string"}],"name":"SentMessage","type":"event"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_msg","type":"string"}],"name":"sendMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_of","type":"address"}],"name":"getMessage","outputs":[{"name":"_msg","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_of","type":"address"}],"name":"clearMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"string"},{"name":"b","type":"string"}],"name":"strcmp","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"pure","type":"function"}],
"0x7323f637d7c44d6a732ec04b7e8679b25af04b88");
	return instance;
}
