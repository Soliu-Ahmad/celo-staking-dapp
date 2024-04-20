const rew = require('hardhat');

async function rewad() {
    const RewardToken = await rew.ethers.getContractFactory("RewardToken");
    const rewardToken = await RewardToken.deploy(10000000);
    // No need to call deployed()

    console.log("RewardToken deployed at:", rewardToken.address);
}

rewad().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

//0xE9230561784886E441a604819F660c071c116B72

/**
 * const rew = require('hardhat');
This line imports the Hardhat framework into the JavaScript file. 
Hardhat is a development environment for Ethereum that helps in writing, testing, and deploying smart contracts.


async function rewad() {
This line defines an asynchronous function named rewad. 
The async keyword indicates that this function will work with promises and can use await inside it.


const RewardToken = await rew.ethers.getContractFactory("RewardToken");
This line uses Hardhat's ethers plugin to get the contract factory for
 the RewardToken contract. The await keyword is used because getContractFactory
  returns a promise, and we want to wait for it to resolve.


const rewardToken = await RewardToken.deploy(10000000);
This line deploys an instance of the RewardToken contract with an 
initial supply of 10,000,000 tokens (assuming the token's decimals are 18). 
The await keyword is used to wait for the deployment to complete.


console.log("RewardToken deployed at:", rewardToken.address);
This line logs the address of the deployed RewardToken contract to the console. The rewardToken variable contains the deployed contract instance, and address is a property of the contract instance that stores its Ethereum address.
}
This line marks the end of the rewad function definition.


rewad().catch((error) => {
This line calls the rewad function defined earlier and attaches
 a .catch() method to handle any errors that might occur during the execution of the rewad function.


console.error(error);
This line logs the error to the console if an error occurs during the execution of the rewad function.


process.exitCode = 1;
This line sets the exit code of the process to 1, indicating an error occurred.
The comment //0xE9230561784886E441a604819F660c071c116B72 at the end seems to be an Ethereum address, likely referring to the address where the RewardToken contract was deployed.






 */