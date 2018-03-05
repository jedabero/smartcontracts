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