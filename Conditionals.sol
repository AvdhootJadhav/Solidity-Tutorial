// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract Conditionals {
    mapping(string => uint) public m;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function countType(uint [] memory arr) public {
        for(uint i=0;i<arr.length;++i){
            if(arr[i]%2==0)m["even"]++;
            else m["odd"]++;
        }
    }

    function countEven() public view returns(uint){
        return m["even"];
    }

    function countOdd() public view returns(uint){
        return m["odd"];
    }

    function checkOwner(address add2) public view returns(bool){
        return owner==add2?true:false;
    } 
}