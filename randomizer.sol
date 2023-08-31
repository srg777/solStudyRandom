// SPDX-License-Identifier: GPL-3.0
//0xBaa57D758c9d56CF086A15FDaC902479fD6ee6D7
pragma solidity >=0.8.2 <0.9.0;
import './libRandoms.sol';

contract randomizer {
    function test() public view returns(uint) {
        return RandomTools.randomArray([uint(5000), uint(20000), uint(50000), uint(20000), uint(5000)]);
    }
}
