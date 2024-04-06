// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Attack} from "../src/Attack.sol";

contract AttackTest is Test {
    Attack public attack;

    function setUp() public {
        attack = new Attack(address(0xeDBc81a4d20B616AFc6Acf43D2197f192049ca04));
    }

    function testBruteForcePassKey() public {
        attack.bruteForcePassKey();
    }

    function testGetEnoughPoint() public {
        testBruteForcePassKey();
        for (uint i = 0; i < 4; i++) {
            attack.getEnoughPoint("pope_h");
        }
    }

    function testAddYourName() public {
        vm.prank(address(attack));
        testGetEnoughPoint();
        attack.addYourName();
    }
}