// SPDX-License-Identifier: GPL-3.0
// Permiten definir posibles valores a una variable.
pragma solidity >=0.7.0 <0.9.0 ;

contract Enums {
  // Internamente se guardan dentro de un array, por ende se referencian con su indice
  enum State { Active, Inactive }

  State public state = State.Active;

  function changeState(State newState) public {
    state = newState;
  }
}
