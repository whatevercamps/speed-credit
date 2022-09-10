// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.8;

import "hardhat/console.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";
import "./7_funds.sol";

contract Loan is ChainlinkClient, ConfirmedOwner {

    using Chainlink for Chainlink.Request;
    Funds funds;

    struct Detail {
        uint256 approvedAmount;
        uint256 score;
        string name;
    }

    bytes32 private jobId;
    uint256 public score;
    uint256 private fee;
    uint256 private amount;
    address user;

    mapping(address => Detail) loans;

    event RequestScore(bytes32 indexed requestId, uint256 score);
    
    function requestLoan(uint256 _amount) public returns (bytes32 requestId) {
        amount = _amount;
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        req.add("get", "https://631cbc311b470e0e12095423.mockapi.io/score/credit-score");
        req.add("path", "0,creditScore");
        req.addInt("times", 1);

        return sendChainlinkRequest(req, fee);
    }

    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0x40193c8518BB267228Fc409a613bDbD8eC5a97b3);
        jobId = "fcf4140d696d44b687012232948bdd5d";
        fee = 0;
        user = msg.sender;
    }

    function fulfill(bytes32 _requestId, uint256 _score) public recordChainlinkFulfillment(_requestId) {
        emit RequestScore(_requestId, _score);
        score = _score;

        loans[user] = Detail({
            score: _score,
            approvedAmount: amount,
            name: "Juan Camilo"
        });
    }

    function getLoan() public view returns (Detail memory loan) {
        return loans[user];
    }
}