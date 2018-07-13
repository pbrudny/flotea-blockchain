pragma solidity ^0.4.24;

contract Routes {
    address public owner;   

    struct Stop {
        bytes32 name;
        bytes10 latitude;
        bytes10 longitude;    
    }

    constructor() public {
        owner = msg.sender;
    }
}
