function checkWork() {
	if (eth.getBlock("pending").transactions.length > 0 || 
		eth.getBlock("latest").transactions.length > 0) {
		if (eth.mining) return;
		console.log("Pending transactions! Mining...");
		miner.start(1);
	} else {
		miner.stop();
		console.log("No transactions! Mining stopped.");
	}
}

eth.filter("latest", function(err, block) { checkWork(); });
eth.filter("pending", function(err, block) { checkWork(); });

checkWork();
