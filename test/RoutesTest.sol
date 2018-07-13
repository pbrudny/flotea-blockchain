pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Routes.sol";

contract RoutesTest {
    Routes instance;

    function beforeEach() public {
        instance = new Routes();
    } 
  
    function testSetOwner() public {
        Assert.equal(instance.owner(), address(this), "missing owner address");
    }

    function testAddStop() public {
        Assert.equal(instance.addStop("Cieszyn", "49.7629645", "18.6279841"), true, "Can not add new stop");
    }
}
