pragma solidity ^0.4.8;

import './StandardToken.sol';
import '../lifecycle/Pausable.sol';

/**
 * @title Pausable token
 *
 * @notice Simple ERC20 Token example, with pausable token creation
 * Issue:
 * https://github.com/OpenZeppelin/zeppelin-solidity/issues/194
 * Based on code by BCAPtoken:
 * https://github.com/BCAPtoken/BCAPToken/blob/5cb5e76338cc47343ba9268663a915337c8b268e/sol/BCAPToken.sol#L27
 **/

contract PausableToken is Pausable, StandardToken {

  /**
  * @dev Transfer from one addres to another.
  * @param _to address The addres to transfer to
  * @param _value uint The value to transfer
  */
  function transfer(address _to, uint _value) whenNotPaused {
    return super.transfer(_to, _value);
  }

  /**
  * @dev Transfer from one addres to another.
  * @param _to address The addres to transfer to
  * @param _from address The addres to transfer from
  * @param _value uint The value to transfer
  */
  function transferFrom(address _from, address _to, uint _value) whenNotPaused {
    return super.transferFrom(_from, _to, _value);
  }
}
