// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Import this file to use console.log
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC777/ERC777.sol";
import "./ISnapshot.sol";

/// @author  Mehdi R.
/// @dev ERC777 token retrieving balance with timestamp

contract Snapshot is ERC777, ISnapshot {


    struct Snap {
        uint256 timestamp;
        uint256 balance;
    }

    mapping (address => Snap[]) balanceSnap;


    constructor(
        string memory name_,
        string memory symbol_,
        address[] memory defaultOperators_
    )
        public
        ERC777(name_, symbol_, defaultOperators_)
    {

    }

    /// @dev returns balance at a certain timestamp

    function balanceAt(address account, uint256 timestamp) external override view returns (uint256) {

        Snap[] storage snaps = balanceSnap[account];

        // check if timestamp is before / after the request
        uint256 snapsHistory = snaps.length;
        if (snapsHistory == 0 || timestamp < snaps[0].timestamp){
            return 0;
        }

        uint256 last = snapsHistory - 1;
        if (timestamp >= snaps[last].timestamp){
            return snaps[last].balance;
        }

    }





    




}




