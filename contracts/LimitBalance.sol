pragma solidity ^0.4.8;


/**
 * @title LimitBalance
 * @notice Simple contract to limit the balance of child contract.
 * @notice Note this doesn't prevent other contracts to send funds by using selfdestruct(address);
 * @notice See: https://github.com/ConsenSys/smart-contract-best-practices#remember-that-ether-can-be-forcibly-sent-to-an-account
 */
contract LimitBalance {

  uint public limit;

  /**
   * @dev Constructor that sets the passed value as a limit.
   * @param _limit Uint to represent the limit.
   */
  function LimitBalance(uint _limit) {
    limit = _limit;
  }

  /**
   * @dev Checks if limit was reached. Case true, it throws.
   */
  modifier limitedPayable() {
    if (this.balance > limit) {
      throw;
    }
    _;

  }

}
