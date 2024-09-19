// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Address } from "@openzeppelin/contracts/utils/Address.sol";
import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";
import { Token } from "./Token.sol";

contract Distribution {
    uint256 constant LOWWER_TOKEN = 1 ether;
    uint256 constant UPPER_TOKEN = 100 ether;
    uint256 constant LOWWER_NATIVE = 0.01 ether;
    uint256 constant UPPER_NATIVE = 0.1 ether;
    IERC20 public token;

    bytes32 prevSalt;

    constructor() { 
        token = new Token();
    }

    function sendNative() external {
        (address randomAddress, uint256 randomValue) = _getRandomAddressAndValue(LOWWER_NATIVE, UPPER_NATIVE);
        Address.sendValue(payable(randomAddress), randomValue);
    }

    function sendToken() external {
        (address randomAddress, uint256 randomValue) = _getRandomAddressAndValue(LOWWER_TOKEN, UPPER_TOKEN);
        token.transfer(randomAddress, randomValue);
    }

    function _getRandomAddressAndValue(uint256 lowwer, uint256 upper) private returns(address randomAddress, uint256 randomValue) {
        bytes32 salt = keccak256(abi.encodePacked(block.timestamp, prevSalt));
        prevSalt = salt;
        randomAddress = address(uint160(uint256(salt)));
        randomValue = (uint256(salt) % upper) + lowwer;
    }

    receive() external payable {}
}
