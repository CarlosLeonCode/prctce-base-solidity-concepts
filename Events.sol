// SPDX-License-Identifier: GPL-3.0
// Permite escuchar eventos dentro del contrato.
pragma solidity >=0.7.0 <0.9.0 ;

contract Events {
  string public tokenName = 'Tech House Vibes';

  event ChangeName(address editor, string name);

  function changeName(string memory newName) public {
    tokenName = newName;
    emit ChangeName(msg.sender, newName);
  }
}
