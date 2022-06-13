// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Greetings{
    string public greeting;

    function Greeter() public {
        greeting = 'hello';
    }

    function setGreeting(string memory message) public {
        greeting = message;
    }

    function getGreeting() view public returns (string memory) {
        return greeting;
    }
}