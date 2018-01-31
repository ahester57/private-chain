var Subcurrency = artifacts.require("./Subcurrency.sol");

module.exports = function(deployer) {
  deployer.deploy(Subcurrency);
};