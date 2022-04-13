const SaleToken = artifacts.require("SaleToken");

module.exports = function (deployer) {
  deployer.deploy(SaleToken,1200000000);
};
