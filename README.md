# Eth-avax-Project4
# DegenGameToken Solidity Smart Contract

The `DegenGameToken` is a Solidity smart contract representing a token for a decentralized game platform. This repository contains the Solidity smart contract code for the DEGEN token, an ERC-20 compatible token designed for gaming purposes on the Avalanche Fuji Test Network. This contract provides functionalities for minting, transferring, redeeming in-game items, burning tokens, and checking balances within the gaming ecosystem.

## Contract Overview


## Description

The `DegenGameToken` contract provides the following main functionalities:

- Minting new tokens: The owner of the contract can mint new tokens and assign them to user accounts.
- Transferring tokens: Users can transfer their tokens to other addresses.
- Redeeming items: Users can redeem in-game items from the store using their tokens.
- Burning tokens: Users can burn their tokens when they are no longer needed.
- Checking balances: Users can check their token balances at any time.

The contract also includes a store feature where items can be added, and users can redeem items using tokens.


## Getting Started

### Prerequisites

Before proceeding, ensure you have a basic understanding of Solidity and Ethereum smart contract development.


## Deployment on Avalanche Fuji Test Network using Remix Injector

To deploy the DEGEN token contract to the Avalanche Fuji Test Network using Remix Injector, follow these steps:

* Open the [Remix](https://remix.ethereum.org/) online IDE in your browser.

* Create a new file and Copy the provided Solidity code from this Github Repository.

* Confirm that your Solidity compiler version is compatible (at least 0.8.0) and compile the code.

* Switch to the "Deploy & Run Transactions" tab. and in the "Environment" dropdown, select "Injected Web3" to connect Remix to your MetaMask wallet.

* Make sure your MetaMask wallet is connected to the Avalanche Fuji Test Network.

* Click the "Deploy" button next to the `DegenToken` contract and confirm the deployment transaction in MetaMask.


## Interacting with the Contract using Remix

 You can now interact with the DEGEN token contract by calling through the provided functions with appropriate arguments.

   * Use the `checkBalance` function to check your token balance.
   * Use the `transfer` function to send DEGEN tokens from your address to another address..
   * Use the `redeem` function to redeem in-game items from the store using tokens. Specify the `itemId` and quantity to redeem.
   * Use the `mint` function (accessible only to the contract owner) to mint new DEGEN tokens.
   * Use the `burn` function to burn (destroy) your tokens when they are no longer needed
   * Use the `addItem` function to add new items to the store with prices and initial stock.


## Author

This project is authored by Vibhor Tayal.


## License

The SimpleContract project is licensed under the MIT License, granting you the flexibility to modify and distribute the code as needed.
