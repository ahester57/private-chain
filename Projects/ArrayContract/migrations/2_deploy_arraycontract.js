var ArrayContract = artifacts.require("./ArrayContract.sol");

module.exports = function(deployer) {
    deployer.deploy(ArrayContract);
};