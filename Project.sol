// SPDX-License-Identifier: GPL-3.

pragma solidity >=0.7.0 <0.9.0 ;

contract CrowdFunding {
  enum State { Active, Inactive }
  // ???, esto es un tipo de dato como los objetos en JS o los hashes/Objets en Ruby
  struct Schema {
    string id;
    string name;
    string description;
    address payable author;
    State state;
    uint funds;
    uint fundraisingGoal;
  }

  // ???, asi se usa un struct
  Schema public project;


  constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
    project.id = _id;
    project.name = _name;
    project.description = _description;
    project.fundraisingGoal = _fundraisingGoal;
    project.author = payable(msg.sender);
    project.state = State.Active;
  }

  // ? Modifiers, permiten hacer validaciones antes de ejecutar funciones.
  modifier onlyOwner() {
    require(
      msg.sender == project.author,
      'Only owner can do this operation!'
    );
    _;
  }

  modifier differentOwner() {
    require(
      msg.sender != project.author,
      'You cannot do this as owner'
    );
    _;
  }

  // ? Events, Permiten escuchar eventos, ya sea para notificar o recibir feedback 
  event FundProject(address sender, uint funds);
  
  event ChangeProjectState(string id, State newState);

  // ? What?, Esta es otra manera de manejar los errores
  error ProjectClosed(string id);

  function fundProject() public payable differentOwner{
    // ? what?, Es otra manera de definir errores
    require(msg.value > 0, 'You cannot send 0 as value');

    if(project.state == State.Active){
      project.author.transfer(msg.value);
      project.funds += msg.value;
      emit FundProject(msg.sender, project.funds);
    }else{
      revert ProjectClosed(project.id);
    }
  }

  function changeProjectState(State newState) public onlyOwner{
    project.state = newState;
    emit ChangeProjectState(project.id, newState);
  }
}
