// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract Ownable{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier checkOwner{
        require(owner == msg.sender, "You must be owner to access further");
        _;
    }
}

contract SecretVault{
    string secret;

    constructor(string memory message){
        secret=message;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MyContract is Ownable{
    address vaultAddress;

    constructor(string memory message){
        SecretVault secretVault = new SecretVault(message);
        vaultAddress = address(secretVault);
        super;
    }

    function getSecret() public view checkOwner returns(string memory){
        SecretVault secretVault = SecretVault(vaultAddress);
        return secretVault.getSecret();
    }
}