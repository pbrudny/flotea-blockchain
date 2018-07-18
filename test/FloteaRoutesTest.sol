pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FloteaRoutes.sol";

contract FloteaRoutesTest {
    FloteaRoutes instance;

    function beforeEach() public {
        instance = new FloteaRoutes();
    } 
  
    function testSetOwner() public {
        Assert.equal(instance.owner(), address(this), "missing owner address");
    }

    function testAddStop() public {
        instance.addStop("PL1","Cieszyn", "49.7629645", "18.6279841");
        Assert.equal(instance.stops.length(), 1, "Can not add new stop");
    }
}