// contracts/GLDToken.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardToken is ERC20{
    constructor(uint256 initialSupply) ERC20("RewarToken", "RWD"){
        _mint(msg.sender, initialSupply*10**18);
    }


}

/**
 * pragma solidity ^0.8.0;
This line specifies the version of the Solidity compiler that should be used to compile the contract. In this case, it indicates that the contract should be compiled using Solidity version 0.8.0 or higher.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


This line imports the ERC20.sol file from the OpenZeppelin library. ERC20.sol contains the standard ERC20 token implementation, which includes functions for token transfers, approvals, and other ERC20-related functionalities.
contract RewardToken is ERC20 {

This line declares a new Solidity contract named RewardToken. It indicates that 
RewardToken inherits from the ERC20 contract, meaning that RewardToken will have
 all the functions and properties defined in ERC20.sol.

 
constructor(uint256 initialSupply) ERC20("RewarToken", "RWD") {
This line defines the constructor function for the RewardToken contract. The constructor is executed only once, during the contract deployment.
uint256 initialSupply is a parameter passed to the constructor, representing the initial supply of tokens that will be minted.
ERC20("RewarToken", "RWD") calls the constructor of the parent ERC20 contract with arguments "RewarToken" (token name) and "RWD" (token symbol). This initializes the ERC20 token with the specified name and symbol.
_mint(msg.sender, initialSupply*10**18);
This line calls the _mint function inherited from the ERC20 contract to mint tokens and assign them to the contract deployer (msg.sender).
initialSupply*10**18 calculates the total number of tokens to mint. In ERC20, the token decimals are usually set to 18, so multiplying by 10**18 converts the initialSupply to the correct decimal format.
The _mint function creates new tokens and assigns them to the specified address (msg.sender in this case, which is the deployer's address).
 */