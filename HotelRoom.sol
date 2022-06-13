// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract HotelRoom {
    enum Status {Vacant,Occupied}
    Status curr;
    address payable public owner;

    event Occupy (address customer, uint value);

    constructor(){
        owner = payable(msg.sender);
        curr = Status.Vacant;
    }

    modifier onlyWhileVacant{
        require(curr == Status.Vacant,"Currently occupied");
        _;
    }

    modifier costs(uint amount){
        require(msg.value >= amount,"Not Enough Ether");
        _;
    }

    receive() external payable  onlyWhileVacant costs(2 ether){
        curr = Status.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}