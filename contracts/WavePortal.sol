// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    struct Wave {
        address sender;
        string senderName;
        uint256 time;
        string message;
    }

    Wave[] wavesArray;

    constructor() {
        console.log("Running my first ever smart contract");
    }

    function timeCall() public view returns (uint256) {
        return block.timestamp;
    }

    function wave(string calldata _senderName, string calldata _message)
        public
    {
        totalWaves += 1;
        uint256 time = timeCall();
        wavesArray.push(Wave(msg.sender, _senderName, time, _message));
        console.log("%s has waved!", msg.sender);
        console.log("Timestamp:", time); // need to convert to human-readable date/time
        console.log("Sender:", _senderName);
        console.log("Message:", _message);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function printLastWaver() public view {
        console.log(
            "Last wave from:",
            wavesArray[totalWaves - 1].senderName,
            "at",
            wavesArray[totalWaves - 1].time
        );
    }
}
