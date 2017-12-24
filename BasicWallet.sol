pragma solidity ^0.4.0

import 'Mortal.sol';

contract BasicWallet is Mortal {

  mapping(address => Permission) permittedAddresses;

  event someoneAddedToSendersList(address _personWhoAdded, address _personWhoIsAllowedNow, uint _amountTheyCanSend);

  struct Permission {
    bool isAllowed;
    uint maxTransferAmount;
  }

  function addAddressToSendersList(address _permitted, uint _maxTransferAmount) onlyOwner {
    permittedAddresses[_permitted] = Permission(true, _maxTransferAmount);
    someoneAddedToSendersList(msg.sender, _permitted, _maxTransferAmount);
  }

  function sendFunds(address _receiver, uint _amountInWei) {
    if (permittedAddresses[msg.sender].isAllowed) {
      if (permittedAddresses[msg.sender].maxTransferAmount >= _amountInWei) {
        bool amountActuallySent = receiever.send(_amountInWei);
        if (!amountActuallySent) {
          throw;
        }
      } else {
        throw;
      }
    } else {
      throw;
    }
  }

  function removeAddressFromSendersList(address _theAddress) {
    delete permittedAddresses[_theAddress];
  }

  function payable() {

  }
}
