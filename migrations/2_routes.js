const Routes = artifacts.require("./Routes.sol");

module.exports = function(deployer) {
  deployer.deploy(Routes);
};