pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/RouteManager.sol";

contract RouteManagerTest {
    RouteManager instance;

    function beforeEach() public {
        instance = new RouteManager();
    } 
  
    function testSetOwner() public {
        Assert.equal(instance.owner(), address(this), "missing owner address");
    }

    function testAddStop() public {
        instance.addStop("PL1","Cieszyn", "49.7629645", "18.6279841");
        Assert.equal(instance.stops.length(), 1, "Can not add new stop");
    }

    function testStringToBytes32() public {
        Assert.equal(
            instance.stringToBytes32("Sample string"), 
            0x53616d706c6520737472696e6700000000000000000000000000000000000000, 
            "missing byte32 result"
        );    
    }
}