//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract Mapping{
    mapping(uint => string) public m;
    mapping(address => mapping(uint => Book)) public p;

    struct Book{
        string title;
        string author;
        string demographic;
    }

    mapping(uint => Book) public books;

    constructor(){
        m[1]="Avdhoot";
        m[2]="Roshan";
        m[3]="Dhananjay";
        m[4]="Bob";
    }

    function addBooks(uint id, string memory title, string memory author,string memory demographic) public {
        books[id]=Book(title,author,demographic);
    }

    function addUserBooks(string memory name, string memory demographic, string memory title, uint id) public {
        p[msg.sender][id]=Book(title,name,demographic);
    }
}