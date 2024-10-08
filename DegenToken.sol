// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract DegenToken is ERC20, Ownable(msg.sender) {

    struct Item {
        uint itemId;
        string itemName;
        uint itemPrice;
    }

    mapping(uint => Item) public items;
    uint public itemCount;

    // Mapping to track redeemed items for each user
    mapping(address => mapping(uint => bool)) public redeemedItems;

    // Event to log item redemption
    event RedeemToken(address account, uint rewardCategory);
    event BurnToken(address account, uint amount);
    event ItemRedeemed(address indexed user, uint indexed itemId, string itemName, uint itemPrice);

    constructor() ERC20("Degen", "DGN") {
        transferOwnership(msg.sender);
    }

    function mint(address receiver, uint amount) public{
        _mint(receiver, amount);
    }

    function burn(uint amount) public {
        _burn(msg.sender, amount);
        emit BurnToken(msg.sender, amount);
    }
    
    function addItem(string memory itemName, uint itemPrice) public{
        itemCount++;
        Item memory newItem = Item(itemCount, itemName, itemPrice);
        items[itemCount] = newItem;
    }

    function getItems() external view returns (Item[] memory) {
        Item[] memory allItems = new Item[](itemCount);

        for (uint i = 1; i <= itemCount; i++) {
            allItems[i - 1] = items[i];
        }

        return allItems;
    }

function redeem(uint rewardCategory) public {
    uint requiredAmount = rewardCategory * 1;
    require(balanceOf(msg.sender) >= requiredAmount, "Insufficient Amount");

    // Burn the required amount of tokens
    burn(requiredAmount);

    // Mark the item as redeemed for the user
    redeemedItems[msg.sender][rewardCategory] = true;

    emit RedeemToken(msg.sender, rewardCategory);
    emit ItemRedeemed(msg.sender, rewardCategory, items[rewardCategory].itemName, items[rewardCategory].itemPrice);
}
}