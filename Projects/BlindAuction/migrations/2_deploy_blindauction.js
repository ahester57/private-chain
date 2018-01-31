var BlindAuction = artifacts.require("./BlindAuction.sol");

module.exports = function(deployer) {
  deployer.deploy(BlindAuction);
};
