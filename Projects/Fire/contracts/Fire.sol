pragma solidity ^0.4.0;


/// @title Fire
contract Fire {
    mapping(address => uint256) public wood;

    function Fire(
        uint initialSticks
    ) public {
        wood[msg.sender] = initialSticks;
    }

    /// Send sticks
    function transfer(
        address _to,
        uint256 _value
    ) public {
        require(wood[msg.sender] > _value);
        require(wood[_to] + _value >= wood[_to]);
        wood[msg.sender] -= _value;
        wood[_to] += _value;
    }
}