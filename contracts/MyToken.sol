pragma solidity ^0.4.20;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract MyToken is DetailedERC20, StandardToken, Ownable {

  uint public sellPrice = 125; // Geth 1 ether per X tokens
  uint public buyPrice = 100; // Get X tokens per ether

  function MyToken() Ownable() DetailedERC20("My Token", "MTX", 18) public {
    uint ts = 1000000;
    totalSupply_ = ts.mul(10 ** 18);
    balances[this] = totalSupply_;
  }

  function setPrices(uint _sellPrice, uint _buyPrice) onlyOwner public {
    sellPrice = _sellPrice;
    buyPrice = _buyPrice;
  }

  function () payable public {
    buy();
  }

  function buy() payable public returns (uint amount) {
    amount = msg.value * buyPrice;
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
    value = amount / sellPrice;
    msg.sender.transfer(value);
    Transfer(msg.sender, this, amount);
    return value;
  }

}
