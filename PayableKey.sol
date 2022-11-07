// SPDX-License-Identifier: GPL-3.0
// Se usa para poder enviar ether 
pragma solidity >=0.7.0 <0.9.0 ;

contract PayableKey {
  function sendEther(address payable receiver) public payable {
    receiver.transfer(msg.value);
  }
}
