pragma solidity ^0.4.0;


contract MinimunViableToken {
    // array of all balances
    mapping (address => uint256) public balance;

    function MinimunViableToken(
        uint256 initialSupply
    ) public {
        balance[msg.sender] = initialSupply;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public { 
        require(balance[msg.sender] > _value);
        require(balance[_to] + _value >= balance[_to]);
        balance[msg.sender] -= _value;
        balance[_to] += _value;
    }
}