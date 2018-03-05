const MyToken = artifacts.require("./MyToken.sol");
const Token = artifacts.require("./Token.sol");

module.exports = function(deployer) {
  deployer.deploy(MyToken);
  deployer.deploy(Token);
};