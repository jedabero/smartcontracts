pragma solidity ^0.4.20;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract Token is DetailedERC20, StandardToken, Ownable {

  /**
   * Struct used for storing conversion value
   */
  struct Rate {
    uint n;
    uint d;
  }

  /**
   Allows to define a rational number to calulate the amount of wei to exchange for tokens
   */
  Rate public sellPrice;
  /**
   Allows to define a rational number to calulate the amount of tokens to exchange for wei
   */
  Rate buyPrice;

  function Token() Ownable() DetailedERC20("Token", "TKX", 18) public {
    uint ts = 1000000;
    totalSupply_ = ts.mul(10 ** 18);
    balances[this] = totalSupply_;
  }

  function setBuyPrices(uint numerator, uint denominator) onlyOwner public {
    buyPrice.n = numerator;
    buyPrice.d = denominator;
  }

  function setSellPrices(uint numerator, uint denominator) onlyOwner public {
    sellPrice.n = numerator;
    sellPrice.d = denominator;
  }

  function () payable public {
    buy();
  }

  function convertToTokens(uint amount, Rate rate) internal pure returns (uint tokens) {
    tokens = (amount * rate.n) / rate.d;
    return tokens;
  }

  function convertToWei(uint tokens, Rate rate) internal pure returns (uint amount) {
    amount = (tokens * rate.d) / rate.n;
    return amount;
  }

  function buy() payable public returns (uint amount) {
    amount = convertToTokens(amount, buyPrice);
    require(balances[this] >= amount);
    balances[msg.sender] += amount;
    balances[this] -= amount;
    Transfer(this, msg.sender, amount);
    return amount;
  }

  function sell(uint amount) public returns (uint value) {
    require(balances[msg.sender] >= amount);
    balances[this] += amount;
    balances[msg.sender] -= amount;
    value = convertToWei(amount, sellPrice);
    msg.sender.transfer(value);
    Transfer(msg.sender, this, amount);
    return value;
  }

}
