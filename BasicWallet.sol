pragma solidity ^0.4.0

import 'Mortal.sol';

contract BasicWallet is Mortal {

  mapping(address => Permission) permittedAddresses;

  event someoneAddedToSendersList(address personWhoAdded, address personWhoIsAllowedNow, uint amountTheyCanSend);

  struct Permission {
    bool isAllowed;
    uint maxTransferAmount;
  }

  function addAddressToSendersList(address permitted, uint maxTransferAmount) onlyOwner {
    permittedAddresses[permitted] = Permission(true, maxTransferAmount);
    someoneAddedToSendersList(msg.sender, permitted, maxTransferAmount);
  }

  function sendFunds(address receiver, uint amountInWei) {
    if (permittedAddresses[msg.sender].isAllowed) {
      if (permittedAddresses[msg.sender].maxTransferAmount >= amountInWei) {
        bool amountActuallySent = receiever.send(amountInWei);
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

  function removeAddressFromSendersList(address theAddress) {
    delete permittedAddresses[theAdress];
  }

  function payable() {

  }
}
