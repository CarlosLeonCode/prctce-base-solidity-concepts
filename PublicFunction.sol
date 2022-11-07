// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0 ;

contract PublicFunction {

    function getNumber() public returns (uint number) {
        number = 1999;
    }

    function changeNumber() public returns (uint number) {
        number = getNumber() * 2;
    }
}
