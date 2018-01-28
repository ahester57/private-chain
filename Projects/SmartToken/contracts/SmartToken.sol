pragma solidity ^0.4.0;

contract SmartToken {
	mapping(address => uint) tokens;

	event OnValueChanged(address indexed _from, uint _value);

	function depositToken(address recipient, uint value)
	public returns (bool success) {
		tokens[recipient] += value;
		OnValueChanged(recipient, tokens[recipient]);
		return true;
	}

	function withdrawToken(address recipient, uint value)
	public returns (bool success) {
		if ( (tokens[recipient] - value < 0)) {
			tokens[recipient] = 0;
		} else {
			tokens[recipient] -= value;
		}

		OnValueChanged(recipient, tokens[recipient]);
		return true;
	}

	function getTokens(address recipient)
	public constant returns(uint value) {
		return tokens[recipient];
	}

	function add12(uint value)
	public pure returns (uint newvalue) {
		return value + 12;
	}
}
