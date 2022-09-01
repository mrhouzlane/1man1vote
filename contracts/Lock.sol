// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Import this file to use console.log
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract OneManOnevote is IERC20 {


    IERC20 token; 

    function createVotingObj() external {


    }
    

    function startVoting(
        address[] calldata voters, 
        uint duration, 
        string calldata description
    ) external {
        for (uint i = 0; i < voters.length; i++) {
            require(token.balanceOf(voters[i]) > 0); 
        }
        createVotingObj(voters, duration, description);
    }






}




