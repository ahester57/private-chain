var Subcurrency = artifacts.require("Subcurrency");

var acct;

acct = "0x627306090abaB3A6e1400e9345bC60c78a8BEf57";

contract('Subcurrency', function(accounts) {
	it("should mint 1000 coins to accounts[1]", function() {
		return Subcurrency.deployed().then(function(instance) {
			return instance.mint(accounts[1], 1000, {from: accounts[0]});
		}).then(function(result) {
			console.log(result);
		}).catch(function(e) {
			assert.equal(1, 2, "minting failed")
		});
	});	
	it("should have 1000 coins in accounts[1]", function() {
		return Subcurrency.deployed().then(function(instance) {
			return instance.getBalance.call(accounts[1]);
		}).then(function(balance) {
			assert.equal(balance.toString(10), 1000, "1000 wasn't in the second acct");
		});
	});
});