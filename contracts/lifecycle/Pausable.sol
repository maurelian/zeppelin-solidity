pragma solidity ^0.4.8;


import "../ownership/Ownable.sol";


/**
 * @title Pausable
 * @dev Base contract which allows children to implement a pause mechanism.
 */
contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool public paused = false;

  /**
   * @dev Modifier to check that the contract is not paused.
   */
  modifier whenNotPaused() {
    if (paused) throw;
    _;
  }

  /**
   * @dev Modifier to ensure that the contract is paused.
   */
  modifier whenPaused {
    if (!paused) throw;
    _;
  }

  /**
   * @dev Called by the owner to pause, triggers stopped state.
   */
  function pause() onlyOwner whenNotPaused returns (bool) {
    paused = true;
    Pause();
    return true;
  }

  /**
   * @dev Called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwner whenPaused returns (bool) {
    paused = false;
    Unpause();
    return true;
  }
}
