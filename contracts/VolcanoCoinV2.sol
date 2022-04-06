// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract VolcanoCoinV2 is ERC20, Ownable {
    constructor(uint256 _initialSupply) ERC20("VolcanoCoin", "VLC") {
        _mint(msg.sender, _initialSupply);
    }

}
