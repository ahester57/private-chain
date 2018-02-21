var MinimunViableToken = artifacts.require("./MinimunViableToken.sol");

module.exports = function(deployer) {
  deployer.deploy(MinimunViableToken, 42);
};
