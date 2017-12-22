pragma solidity ^0.4.0

contract Mortal {
  address owner;

  modifier onlyOwner() {
    if (owner == msg.sender) {
      _;
    } else {
      throw;
    }
  }

  function Mortal() {
    owner = msg.sender;
  }

  function kill() onlyOwner {
    suicide(owner);
  }
}
