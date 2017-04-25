pragma solidity ^0.4.8;


import "../ownership/Ownable.sol";


/*
 * @title Pausable
 * @dev Abstract contract that allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {
  bool public stopped;

  /*
   * @dev modifier that ensure that the contract isn't in a stopped state
   */
  modifier stopInEmergency {
    if (stopped) {
      throw;
    }
    _;
  }

  /*
   * @dev modifier that ensure that the contract is in a stopped state
   */
  modifier onlyInEmergency {
    if (!stopped) {
      throw;
    }
    _;
  }

  /*
   * @dev called by the owner on emergency, triggers stopped state
   */
  function emergencyStop() external onlyOwner {
    stopped = true;
  }

  /*
   * @dev called by the owner on end of emergency, returns to normal state
   */
  function release() external onlyOwner onlyInEmergency {
    stopped = false;
  }

}
