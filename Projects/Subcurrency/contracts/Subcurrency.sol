pragma solidity  ^0.4.0;


contract Subcurrency {
    address public minter;
    mapping (address => uint) public balances;

    // events allow light nodes to react to changes
    event Sent(address from, address to, uint amount);

    // Constructor, run on creation
    function Subcurrency() public {
        // msg.sender is the address of who called a function
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Sent(msg.sender, receiver, amount);
    }

    function getBalance(address _account) public view returns (uint) {
        return balances[_account];
    }
    
}