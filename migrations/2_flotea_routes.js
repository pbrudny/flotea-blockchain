const FloteaRoutes = artifacts.require("./FloteaRoutes.sol");

module.exports = function(deployer) {
  deployer.deploy(FloteaRoutes);
};