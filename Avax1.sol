// Assessment requirements
// Contract successfully uses require()
// Contract successfully uses assert()
// Contract successfully uses revert() statements

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleCounter{
    uint256 private storedValue;
    address public owner;



    constructor() {
        owner = msg.sender;
        storedValue = 0;
    }

   function setValue(uint256 newValue) public {
        if(msg.sender != owner) {
            revert("Only the owner can set the value");
        }
        if(newValue < 0) {
            revert("Value must be non-negative");
        }

        storedValue = newValue;
        assert(storedValue == newValue);
    }

    function getValue() public view returns (uint256) {
        return storedValue;
    }

        function incrementValue(uint256 increment) public {
        require(msg.sender == owner, "Only the owner can increment the value");
        require(increment > 0, "Increment must be greater than zero");

        storedValue += increment;
        assert(storedValue >= increment);
    }

    function resetValue() public {
        require(msg.sender == owner, "Only the owner can reset the value");

        storedValue = 0;
        assert(storedValue == 0);
    }
}