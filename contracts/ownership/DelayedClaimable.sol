pragma solidity ^0.4.8;


import './Claimable.sol';


/**
 * @title DelayedClaimable
 * @dev Extension for the Claimable contract, where the ownership needs to be claimed before/after
 * a certain block number.
 */
contract DelayedClaimable is Claimable {

  uint public end;
  uint public start;

  /**
   * @dev Used to specify the time period during which a pending 
   * owner can claim ownership. 
   * @params _start The earliest time ownership can be claimed.
   * @params _end The latest time ownership can be claimed. 
   */
  function setLimits(uint _start, uint _end) onlyOwner {
    if (_start > _end)
        throw;
    end = _end;
    start = _start;
  }


  /**
   * @dev Allows the pendingOwner address to finalize the transfer, as long as it is called within 
   * the specified start and end time. 
   */
  function claimOwnership() onlyPendingOwner {
    if ((block.number > end) || (block.number < start))
        throw;
    owner = pendingOwner;
    pendingOwner = 0x0;
    end = 0;
  }

}
