pragma solidity ^0.4.24;

contract Routes {
    address public owner;   

    constructor() public {
        owner = msg.sender;
    }

    function sayHello() public returns(string) {
	return "Hello, World!";
	}	
}
