var contractflag = 0;
var currentblock = 0;
var until = -1;

function checkWork() {
	currentblock = eth.blockNumber;
	var pending = eth.getBlock("pending").transactions;
	var latest = eth.getBlock("latest").transactions;
	if (pending.length > 0 || latest.length > 0) {
		for (var i = 0; i < pending.length; i++) {
			var tx = eth.getTransaction(pending[i]);
			var input = tx.input;
			if (input != '0x') {
				until = currentblock + 4;
			}
		}
		for (var i = 0; i < latest.length; i++) {
			var tx = eth.getTransaction(latest[i]);
			var input = tx.input;
			if (input != '0x') {
				until = currentblock + 4;
			}
		}

		if (eth.mining) return;
		console.log("Pending transactions! Mining...");
		miner.start(1);
	} else {
		if (until == -1) {
			miner.stop();
			console.log("No transactions! Mining stopped.");
		} else {
			if (currentblock > until) {
				
				miner.stop();
				console.log("No transactions! Mining stopped.");
				until = -1;
			}
		}
	}
}

eth.filter("latest", function(err, block) { checkWork(); });
eth.filter("pending", function(err, block) { checkWork(); });

checkWork();
