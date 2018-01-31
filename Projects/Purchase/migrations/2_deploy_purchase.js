var Purchase = artifacts.require("./Purchase.sol");

module.exports = function(deployer) {
  deployer.deploy(Purchase);
};
