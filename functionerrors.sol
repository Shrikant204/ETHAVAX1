// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FunctionAndError {
    address public owner;
    uint256 public num;

    // initialize the owner variable
    constructor() {
        owner = msg.sender;
    }

    // Modifier that checks if the sender is the owner
    modifier authorOnly() {
        require(msg.sender == owner);
        _;
    }
    // Require Error
    function testRequire(int _value) public pure returns (int) {
        require(_value > 0, "Value must be greater than zero."); // Check if the value is greater than 9
        return _value;
    }
    // Assert Error
    function testAssert(int _a, int _b) public pure returns (int) {
        assert(_a > _b); // check if a is greater than b. To prevent a negative output
        return _a - _b;
    }
    // Revert Error
    function testRevert(uint256 _newValue) external authorOnly{
        if (_newValue == 100) { // Check if the new value is 100
            revert("The value cannot be 100");}
        num = _newValue;
    }
}
