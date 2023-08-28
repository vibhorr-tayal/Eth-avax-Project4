// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegenGameToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Redeem(address indexed player, uint256 value);
    event Burn(address indexed player, uint256 value);
    event Mint(address indexed to, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed to call this function");
        _;
    }

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
        totalSupply = 0;
        addItem(0, "T-shirt", 99, 10);
        addItem(1, "CAP", 49, 10);
        addItem(2, "Hoodie", 199, 10);
    }

    function ShowStoreItems() external pure returns (string memory){
        return "Items available are: 1.T-shirt  2.Cap  3.Hoodie";
    }

    struct StoreItems{
        string name;
        uint256 price;
        uint256 stock;
    }
    mapping(uint256 => StoreItems) public items;

    function addItem(uint256 itemId, string memory itemName, uint256 price, uint256 initialStock) public onlyOwner {
        items[itemId] = StoreItems({ price: price, stock: initialStock, name: itemName});
    }

    function redeem(uint256 itemId, uint256 quantity) external returns (string memory) {
        require(balanceOf[msg.sender] >= 0, "Insufficient balance in account");
        require(items[itemId].stock >= quantity, "Items out of stock");

        uint256 redemptionAmount = items[itemId].price * quantity;

        require(balanceOf[msg.sender] >= redemptionAmount , "Insufficient balance to redeem the item.");
        balanceOf[msg.sender] -= redemptionAmount ;
        items[itemId].stock -= quantity;

        emit Redeem(msg.sender, redemptionAmount );
        return items[itemId].name;
    }

    function mint(address account, uint256 amount) external onlyOwner {
        require(account != address(0), "Invalid address");
        balanceOf[account] += amount;
        totalSupply += amount;

        emit Mint(account, amount);
        emit Transfer(msg.sender, account, amount);
    }

    function burn(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        emit Burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    function checkBalance() external view returns (uint256) {
        return balanceOf[msg.sender];
    }
}