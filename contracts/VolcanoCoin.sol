// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint256 public totalSupply = 10000 ether;
    address owner;

    constructor() {}

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increasTotalSupply() public onlyOwner {
        totalSupply += 1000 ether;
    }
}
