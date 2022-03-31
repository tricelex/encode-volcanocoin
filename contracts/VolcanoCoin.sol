// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint256 public totalSupply = 10000 ether;
    address owner;
    mapping(address => uint) balances;

    struct Payment {
        uint256 amount;
        address to;
    }

    mapping(address => Payment) payments;

    event increaseTotalSupply(uint256 amount);
    event transfer(address recipient, uint256 amount);

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

    function increasTotalSupply() public onlyOwner {
        totalSupply += 1000 ether;
        emit increaseTotalSupply(totalSupply);
    }

    function getBalanceOf(address account) public returns (uint256) {
        return balances[account];
    }

    function transferToken(address receiver, uint256 amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit transfer(receiver, amount);
    }
}
