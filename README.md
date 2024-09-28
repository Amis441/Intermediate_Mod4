# DegenToken Smart Contract

## Overview
`DegenToken` is an ERC20 token based on Solidity using OpenZeppelin libraries. It provides functionality to mint and burn tokens, manage redeemable items, and allow users to redeem tokens for specific items. This smart contract is designed with a marketplace feature where users can exchange their tokens for virtual items.

## Features
- **Minting Tokens**: The owner or other specified addresses can mint tokens to specified users.
- **Burning Tokens**: Users can burn their tokens, reducing the total supply.
- **Adding Redeemable Items**: The owner can add items that users can redeem using tokens.
- **Redeeming Tokens for Items**: Users can redeem their tokens for specific items.
- **Track Redeemed Items**: The contract maintains a record of redeemed items by each user.

## Contract Details

### Constructor

- **DegenToken (string name, string symbol)**:
  Initializes the token with the name "Degen" and symbol "DGN". The contract deployer is made the owner.

### State Variables
- **items** (`mapping(uint => Item)`)  
  A mapping that stores items available for redemption, where the key is `itemId`.
  
- **itemCount** (`uint`)  
  Tracks the number of items available in the marketplace.

- **redeemedItems** (`mapping(address => mapping(uint => bool))`)  
  A nested mapping that tracks whether a user has redeemed a particular item.

### Structs
- **Item**:
  - `itemId` (uint): Unique identifier for the item.
  - `itemName` (string): Name of the item.
  - `itemPrice` (uint): Price of the item in tokens.

### Functions

#### Token Operations

- **mint(address receiver, uint amount)**:
  - Mints the specified `amount` of tokens to the `receiver`'s address.
  
- **burn(uint amount)**:
  - Burns the specified `amount` of tokens from the caller's balance and emits a `BurnToken` event.

#### Marketplace Operations

- **addItem(string memory itemName, uint itemPrice)**:
  - Adds a new item to the marketplace with the given `itemName` and `itemPrice`. This increases `itemCount`.

- **getItems() external view returns (Item[] memory)**:
  - Returns an array containing all the items in the marketplace.

- **redeem(uint rewardCategory)**:
  - Allows users to redeem tokens for items based on `rewardCategory`. Tokens are burned, and the transaction is logged using the `RedeemToken` event.

### Events

- **RedeemToken(address account, uint rewardCategory)**:
  - Emitted when tokens are redeemed by a user for a specific reward category.

- **BurnToken(address account, uint amount)**:
  - Emitted when a user burns tokens.

- **ItemRedeemed(address indexed user, uint indexed itemId, string itemName, uint itemPrice)**:
  - Emitted when a user redeems an item.

