
const hre = require('hardhat');

async function main() {
    const StakeToken = await hre.ethers.getContractFactory("StakeToken");
    const stakeToken = await StakeToken.deploy(1000);
    // No need to call deployed()

    console.log("StakeToken deployed at:", stakeToken.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});















// stk = 0x833e4Db978115d3b4aBfDC2B71Af1518aB843d7A

/**
 * const hre = require('hardhat');
This line imports the Hardhat Runtime Environment (HRE) into the JavaScript file.
 Hardhat is a development environment for Ethereum smart contracts.

async function main() {
This line defines an asynchronous function named main. 
The async keyword indicates that this function will work with promises and can use await inside it.


const StakeToken = await hre.ethers.getContractFactory("StakeToken");
This line uses Hardhat's ethers plugin to get the contract factory for 
the StakeToken contract. The await keyword is used because getContractFactory
 returns a promise, and we want to wait for it to resolve.


const stakeToken = await StakeToken.deploy(1000);
This line deploys an instance of the StakeToken contract with an 
initial supply of 1000 tokens (assuming the token's decimals are 18).
 The await keyword is used to wait for the deployment to complete.


console.log("StakeToken deployed at:", stakeToken.address);
This line logs the address of the deployed StakeToken contract to the console. 
The stakeToken variable contains the deployed contract instance, and address
 is a property of the contract instance that stores its Ethereum address.
}
This line marks the end of the main function definition.


main().catch((error) => {
This line calls the main function defined earlier and attaches
 a .catch() method to handle any errors that might occur during the execution of the main function.


console.error(error);
This line logs the error to the console if an error occurs during the execution of the main function.


process.exitCode = 1;
This line sets the exit code of the process to 1, indicating an error occurred.
The comment // stk = 0x833e4Db978115d3b4aBfDC2B71Af1518aB843d7A at the end seems to be an Ethereum address, likely referring to the address where the StakeToken contract was deployed.



 */