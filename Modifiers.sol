// SPDX-License-Identifier: GPL-3.0
// Permiten realizar validaciones antes de ejecutar cualquier función.
pragma solidity >=0.7.0 <0.9.0 ;

contract Modifiers {
  address private owner;
  string public projectName = 'Ready Player One';

  constructor(){
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(
      msg.sender == owner,
      'Only owner can change the project name'
    );
    // funcion inserta aqui
    _;
  }

  function changeProjectName(string memory _projectName) public onlyOwner {
    projectName = _projectName;
  }
}
