var SmartToken = artifacts.require("./SmartToken.sol");

module.exports = function(deployer) {
    deployer.deploy(SmartToken);
}
