
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Snapshot.sol";
import "./ISnapshot.sol";

abstract contract Voting is IERC20 {

    enum VoteStatus {
        NONE, ACCEPT, REJECT
    }

    enum VotingResult {
        NONE, ACCEPT, REJECT, NOT_APPLIED
    }

    struct VotingDetails {
        uint256 tokenVoteTotalSupplySnapshot;
        uint256 createdAt;
        uint256 duration;
        uint256 totalAccepted;
        uint256 totalRejected;
        bool executed;
        string description;
        mapping(address => VoteStatus) voteByAccount;
    }

    event VotingStarted(uint256 indexed votingId);
    event VotePlaced(uint256 indexed votingId, address voter, VoteStatus status, uint256 voteWeight);
    event VotingExecuted(uint256 indexed votingId, VotingResult result);

    uint256 votingIdsCounter;
    mapping(uint256 => VotingDetails) votings;
    address tokenVote;

    constructor(address _tokenVote){
        tokenVote = _tokenVote;
    }

    function startVoting(uint256 duration, string calldata description) external {
        // checking inputs
        require(IERC20(tokenVote).balanceOf(msg.sender) > 0, "You should possess at least some tokens to be able to start a voting");

        // creating new voting
        uint256 votingId = votingIdsCounter++;

        

        emit VotingStarted(votingId);
    }

    
    

    function getVoteOf(uint256 votingId, address voter) external view returns (VoteStatus) {
        VotingDetails storage votingDetails = votings[votingId];

        return votingDetails.voteByAccount[voter];
    }

    function getVoting(uint256 votingId) external view returns (
        uint256 createdAt,
        uint256 duration,
        string memory description,
        bool executed,
        uint256 totalAccepted,
        uint256 totalRejected
    ) {
        VotingDetails storage votingDetails = votings[votingId];

        return (
            votingDetails.createdAt,
            votingDetails.duration,
            votingDetails.description,
            votingDetails.executed,
            votingDetails.totalAccepted,
            votingDetails.totalRejected
        );
    }
}