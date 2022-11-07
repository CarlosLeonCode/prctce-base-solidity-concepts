// SPDX-License-Identifier: GPL-3.0
// Indica que la función no puede leer ni modificar las variables de estado.
pragma solidity >=0.7.0 <0.9.0 ;

contract PureKey {
  int number = 3;
  function sum(int a, int b) public pure returns (int result) {
    // result = a + b + number; => Error
    result = a + b;
  }
}
