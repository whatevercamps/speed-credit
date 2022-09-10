// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.8;

contract Funds {

    address owner;
    mapping(address => uint256) public funds;
    address [] private fundsList;
    
    function addFund(uint256 _fund) public {
        funds[owner] = _fund;
        fundsList.push(owner);
    }

    constructor() {
        owner = msg.sender;
    }

    function getTotalFunds() public view returns (uint256 totalFunds) {
        uint tF = 0;
        for (uint i = 0; i < fundsList.length; i++) {
            uint fund = funds[fundsList[i]];
            tF += fund;
        }
        return tF;
    }

    function approve(uint256 _amount) public view returns (bool approval) {
        uint totalFunds = 0;
        for (uint i = 0; i < fundsList.length; i++) {
            uint fund = funds[fundsList[i]];
            totalFunds += fund;
        }
        return totalFunds > _amount;
    }
}