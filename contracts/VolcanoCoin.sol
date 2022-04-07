// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint256 public totalSupply = 10000 ether;
    address owner;
    mapping(address => uint) balances;

    struct Payment {
        uint256 transferAmount;
        address recipient;
    }

    mapping(address => Payment[]) payments;

    event IncreaseTotalSupply(uint256 amount);
    event Transfer(address recipient, uint256 amount);

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000 ether;
        emit IncreaseTotalSupply(totalSupply);
    }

    function getBalanceOf(address account) public returns (uint256) {
        return balances[account];
    }

    function transferToken(address receiver, uint256 amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Transfer(receiver, amount);
    }
}
