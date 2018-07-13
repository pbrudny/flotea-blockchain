const RouteManager = artifacts.require("./RouteManager.sol");

module.exports = function(deployer) {
  deployer.deploy(RouteManager);
};