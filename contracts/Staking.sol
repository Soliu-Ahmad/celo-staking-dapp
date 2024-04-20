

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Staking is ReentrancyGuard{
  IERC20 public s_stakingToken;
  IERC20 public s_rewardToken;

  uint public constant REWARD_RATE=1e18; // uint public constant REWARD_RATE=10;
  uint private totalStakedTokens;
  uint public rewardPerTokenStored;
  uint public lastUpdateTime;

  mapping(address=>uint) public stakedBalance;
  mapping(address=>uint) public rewards;
  mapping(address=>uint) public userRewardPerTokenPaid;

  event Staked(address indexed user, uint256 indexed amount);
  event Withdrawn(address indexed user, uint256 indexed amount);
  event RewardsClaimed(address indexed user, uint256 indexed amount);
  
  constructor(address stakingToken,address rewardToken){
    s_stakingToken=IERC20(stakingToken);
    s_rewardToken=IERC20(rewardToken);
  }

  function rewardPerToken() public view returns(uint){
    if(totalStakedTokens==0){
        return rewardPerTokenStored;
    }
    uint totalTime = block.timestamp - lastUpdateTime;
    uint totalRewards = REWARD_RATE * totalTime; 
    return rewardPerTokenStored + totalRewards / totalStakedTokens;
  }

  function earned(address account) public view returns(uint){
    return stakedBalance[account] * (rewardPerToken() - userRewardPerTokenPaid[account]) + rewards[account];
  }

  modifier updateReward(address account){
    rewardPerTokenStored=rewardPerToken();
    lastUpdateTime=block.timestamp;
    rewards[account]=earned(account);
    userRewardPerTokenPaid[account]=rewardPerTokenStored;
    _;
  }

  function stake(uint amount) external nonReentrant updateReward(msg.sender){
    require(amount>0,"Amount must be greater than zero");
    totalStakedTokens+=amount;
    stakedBalance[msg.sender]+=amount;
    emit Staked(msg.sender,amount);
    bool success = s_stakingToken.transferFrom(msg.sender,address(this),amount);
    require(success,"Transfer Failed");
  }


    function withdraw(uint amount) external nonReentrant updateReward(msg.sender) {
        require(amount> 0, "Amount must be greater than zero");
        totalStakedTokens-=amount;
        stakedBalance[msg.sender]-=amount;
        emit Withdrawn(msg.sender, amount);

        bool success = s_stakingToken.transfer(msg.sender, amount);
        require(success, "Transfer Failed");
    }

   function getReward() external nonReentrant updateReward(msg.sender){
     uint reward = rewards[msg.sender];
     require(reward>0,"No rewards to claim");
     rewards[msg.sender]=0;
     emit RewardsClaimed(msg.sender, reward);
     bool success = s_rewardToken.transfer(msg.sender,reward);
     require(success,"Transfer Failed");
  }
}


/**
 * // SPDX-License-Identifier: GPL-3.0
This line specifies the SPDX license identifier for the Solidity contract.
 In this case, it indicates that the contract is licensed under the GNU General Public License version 3.0.
pragma solidity >=0.8.2 <0.9.0;
This line specifies the version pragma for the Solidity compiler.
 It indicates that the contract should be compiled using a Solidity compiler 
 version greater than or equal to 0.8.2 and less than 0.9.0.


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
This line imports the IERC20 interface from the OpenZeppelin library.
 IERC20 defines the standard functions that an ERC20 token contract must implement.

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
This line imports the ReentrancyGuard contract from the OpenZeppelin library.
 ReentrancyGuard provides protection against reentrancy attacks by using mutex locks.

contract Staking is ReentrancyGuard {
This line declares a new Solidity contract named Staking that inherits from ReentrancyGuard. 
Inheriting from ReentrancyGuard adds reentrancy protection to the Staking contract.


IERC20 public s_stakingToken;
This line declares a public state variable s_stakingToken of type IERC20, 
representing the ERC20 token that users will stake.

IERC20 public s_rewardToken;
This line declares a public state variable s_rewardToken of type IERC20,
 representing the ERC20 token that users will receive as rewards.

uint public constant REWARD_RATE = 1e18;
This line declares a public constant REWARD_RATE with a value of 1e18 (1 with 18 zeros), 
which represents the reward rate per token staked.

uint private totalStakedTokens;
This line declares a private state variable totalStakedTokens to keep track of the 
total number of tokens staked in the contract.

uint public rewardPerTokenStored;
This line declares a public state variable rewardPerTokenStored 
to store the current reward rate per token.

uint public lastUpdateTime;
This line declares a public state variable lastUpdateTime to store the
 timestamp of the last update to the reward rate.

mapping(address => uint) public stakedBalance;
This line declares a public state variable stakedBalance as a mapping from 
addresses to uint, representing the balance of tokens staked by each user.


mapping(address => uint) public rewards;
This line declares a public state variable rewards as a mapping from addresses to uint,
 representing the rewards earned by each user.


mapping(address => uint) public userRewardPerTokenPaid;
This line declares a public state variable userRewardPerTokenPaid as a mapping 
from addresses to uint, representing the reward per token paid to each user.


event Staked(address indexed user, uint256 indexed amount);
This line declares an event Staked that is emitted when a user stakes tokens.
 It logs the user's address and the amount of tokens staked.


event Withdrawn(address indexed user, uint256 indexed amount);
This line declares an event Withdrawn that is emitted when a user withdraws tokens.
 It logs the user's address and the amount of tokens withdrawn.


event RewardsClaimed(address indexed user, uint256 indexed amount);
This line declares an event RewardsClaimed that is emitted when a user claims rewards. 
It logs the user's address and the amount of rewards claimed.


constructor(address stakingToken, address rewardToken) {
This line defines the constructor function for the Staking contract.
 It takes two parameters: stakingToken and rewardToken, 
 representing the addresses of the ERC20 tokens used for staking and rewards, respectively.


s_stakingToken = IERC20(stakingToken);
This line initializes the s_stakingToken state
 variable with the ERC20 token contract at the specified stakingToken address.

s_rewardToken = IERC20(rewardToken);
This line initializes the s_rewardToken state variable with the ERC20
 token contract at the specified rewardToken address.


function rewardPerToken() public view returns (uint) {
This line defines a public view function rewardPerToken() that
 calculates and returns the current reward rate per token based on the total staked
  tokens and elapsed time since the last update.
 */