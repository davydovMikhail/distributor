// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Distribution} from "../src/Distribution.sol";

contract DistributionTest is Test {
    Distribution public distribution;

    function setUp() public {
        distribution = new Distribution();
        vm.deal(address(distribution), 100 ether);
    }

    function test_sendToken() public {
        distribution.sendToken();
        distribution.sendToken();
        distribution.sendToken();
        distribution.sendToken();
        distribution.sendToken();
        distribution.sendToken();
        distribution.sendToken();
        distribution.sendToken();
    }

    function test_sendNative() public {
        distribution.sendNative();
        distribution.sendNative();
        distribution.sendNative();
        distribution.sendNative();
        distribution.sendNative();
        distribution.sendNative();
        distribution.sendNative();
        distribution.sendNative();
    }
}
