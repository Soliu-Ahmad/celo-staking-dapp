const stik = require('hardhat');

async function stook() {
    const Staking = await stik.ethers.getContractFactory("Staking");
    const staking = await Staking.deploy('0x833e4Db978115d3b4aBfDC2B71Af1518aB843d7A', '0xE9230561784886E441a604819F660c071c116B72');
    // No need to call deployed()

    console.log("Staking deployed at:", staking.address);
}

stook().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

// 3 staking adress: 0xF4D1D8965f16BE38Ed01DdEa3570a81198A9358e

// 2 Reward token adress: 0xE9230561784886E441a604819F660c071c116B72

// 1 stake token address = 0x833e4Db978115d3b4aBfDC2B71Af1518aB843d7A











/***
 * const stik = require('hardhat');
This line imports the Hardhat Runtime Environment (HRE) 
into the JavaScript file using Node.js's require syntax.
 Hardhat is a development environment for Ethereum smart contracts.

async function stook() {
This line defines an asynchronous function named stook. 
The async keyword indicates that this function will work with promises and can use await inside it.

const Staking = await stik.ethers.getContractFactory("Staking");
This line uses Hardhat's ethers plugin to get the contract factory
 for the Staking contract. The await keyword is used because getContractFactory
  returns a promise, and we want to wait for it to resolve.

const staking = await Staking.deploy('0x833e4Db978115d3b4aBfDC2B71Af1518aB843d7A',
 '0xE9230561784886E441a604819F660c071c116B72');
This line deploys an instance of the Staking contract,
 passing two addresses as constructor arguments: 0x833e4Db978115d3b4aBfDC2B71Af1518aB843d7A
  and 0xE9230561784886E441a604819F660c071c116B72. The await keyword is used to wait for the deployment to complete.


console.log("Staking deployed at:", staking.address);
This line logs the address of the deployed Staking contract to the console. 
The staking variable contains the deployed contract instance, and address is a property of the contract instance that stores its Ethereum address.
}
This line marks the end of the stook function definition.

stook().catch((error) => {
This line calls the stook function defined earlier and 
attaches a .catch() method to handle any errors that might occur during the execution of the stook function.

console.error(error);
This line logs the error to the console if an error occurs during the execution of the stook function.
process.exitCode = 1;
This line sets the exit code of the process to 1, indicating an error occurred.
The comments at the end provide additional information about the Ethereum addresses involved in the deployment, such as the address of the staking contract, reward token, and stake token.






 */