// SPDX-License-Identifier: GPL-3.0
// Indica que la función no puede modificar las variables de estado, solo leerlas.
pragma solidity >=0.7.0 <0.9.0 ;

contract ViewKey {
  string name = 'CarlosLeonCode';
  function getName() public view returns (string memory) {
    // name = 'Something else'; => Error
    return name;
  }
}
