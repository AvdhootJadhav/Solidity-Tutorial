// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract MyContract{
    uint [] public arr;
    string [] public s = ["apple","banana","avacados"];
    uint [][] public a = [[1,2,3],[4,5,6],[7,8,9]];

    function addtoArray(uint v) public {
        arr.push(v);
    }

    function addtoString(string memory v) public {
        s.push(v);
    }

    function transpose() public {
        for(uint i=0;i<a.length;++i){
            for(uint j=i;j<a.length;++j){
                uint temp = a[i][j];
                a[i][j]=a[j][i];
                a[j][i]=temp;
            }
        }
    }
}