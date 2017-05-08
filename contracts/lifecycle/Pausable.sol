pragma solidity ^0.4.8;


import "../ownership/Ownable.sol";


/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Ownable {
  bool public stopped;

  /**
   * @dev Modifier to ensure that the contract is not in a stopped state.
   */
  modifier stopInEmergency {
    if (stopped) {
      throw;
    }
    _;
  }

  /**
   * @dev Modifier to ensure that the contract is in a stopped state.
   */
  modifier onlyInEmergency {
    if (!stopped) {
      throw;
    }
    _;
  }

  /**
   * @dev Called by the owner in an emergency, triggers stopped state.
   */
  function emergencyStop() external onlyOwner {
    stopped = true;
  }

  /**
   * @dev Called by the owner after an emergency situation is resolved, returns to normal state.
   */
  function release() external onlyOwner onlyInEmergency {
    stopped = false;
  }

}
