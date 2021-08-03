pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    constructor(string memory _name, string memory _symbol, uint _totalSupply, address _issuer) ERC20(_name,_symbol) {
        _mint(_issuer, _totalSupply);
    }

}

contract Factory {
    event TokenCreated(address indexed tokenAddress);

    function deployNewToken(string memory name, string memory symbol, uint totalSupply, address issuer) 
    public returns (address) {
        MyToken t = new MyToken(name, symbol, totalSupply, issuer);
        emit TokenCreated(address(t));
        return address(t);
    }
}