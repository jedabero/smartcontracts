# smartcontracts

A compilation of multiple smart contracts

## Installation

```
yarn install
```

### Quick test

- Go to [Remix](https://remix.ethereum.org/)
- Create a new file with the contract name to test (MyToken, Token)
- Paste the contract's code
- Change the start of all the `zeppelin-solidity` imports to `import "http://github.com/OpenZeppelin/...";`
```
import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
// -> Change to ->
import "http://github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
```
- In the `Compile` tab choose the contract name and click "Start to compile"
- In the `Run` tab choose the contract and click "Create"

## Zeppelin solidity

All contracts and libraries defined in the zeppelin-solidity repository follow the standards from the [EIPs (Ethereum Improvement Proposals)](https://github.com/ethereum/EIPs).

The contracts defined here extend the DetailedERC20, StandardToken and Ownable contracts, these allows the contracts to be named, have a symbol, to tranfer from and to, to be owned by an account and to be tranfered to another account.
