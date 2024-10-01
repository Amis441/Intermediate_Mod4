# DegenToken README

## Overview

The **DegenToken** is an ERC20 token contract that allows users to mint, burn, and redeem tokens for various items. Built using Solidity and the OpenZeppelin library, this contract provides a simple interface for managing a token economy where users can earn and spend tokens.

## Features

- **ERC20 Compliance**: The token follows the ERC20 standard, allowing compatibility with existing wallets and dApps.
- **Minting**: Allows the owner to mint new tokens to a specified address.
- **Burning**: Users can burn their tokens, reducing the total supply.
- **Item Management**: Owners can add items with associated prices that users can redeem using tokens.
- **Redemption Tracking**: The contract tracks which items have been redeemed by each user.

## Smart Contract Details

### Contract Inheritance

The contract inherits from:
- `ERC20`: Provides the standard ERC20 token functionality.
- `Ownable`: Restricts certain functions to the contract owner.

### Key Components

- **Structs**:
  - `Item`: Represents an item with an ID, name, and price.

- **State Variables**:
  - `items`: A mapping from item IDs to item details.
  - `itemCount`: Tracks the number of items added.
  - `redeemedItems`: A nested mapping that tracks redeemed items for each user.

### Events

The contract emits the following events:
- `RedeemToken`: Logs when a user redeems tokens for a specific item.
- `BurnToken`: Logs when tokens are burned by a user.
- `ItemRedeemed`: Logs the details of the item redeemed by a user.

### Functions

- **Constructor**: Initializes the token with a name and symbol, and transfers ownership to the deployer.

- **mint**: 
  ```solidity
  function mint(address receiver, uint amount) public;
  ```
  Mints a specified amount of tokens to the given address.

- **burn**: 
  ```solidity
  function burn(uint amount) public;
  ```
  Burns a specified amount of tokens from the caller's balance.

- **addItem**: 
  ```solidity
  function addItem(string memory itemName, uint itemPrice) public;
  ```
  Adds a new item to the items mapping.

- **getItems**: 
  ```solidity
  function getItems() external view returns (Item[] memory);
  ```
  Returns an array of all items added to the contract.

- **redeem**: 
  ```solidity
  function redeem(uint rewardCategory) public;
  ```
  Allows a user to redeem an item using tokens. The required amount is calculated based on the `rewardCategory`.

## Usage

1. **Deployment**: Deploy the DegenToken contract on the Ethereum network.
2. **Mint Tokens**: The contract owner can mint tokens to any address using the `mint` function.
3. **Add Items**: The owner can add items to the contract using the `addItem` function.
4. **Redeem Items**: Users can redeem items by calling the `redeem` function with the appropriate reward category.

## Example

Here’s an example of how to use the contract:

1. **Mint Tokens**:
   ```solidity
   degenToken.mint(userAddress, 100);
   ```

2. **Add Items**:
   ```solidity
   degenToken.addItem("Item Name", 1);
   ```

3. **Redeem Item**:
   ```solidity
   degenToken.redeem(1);
   ```
