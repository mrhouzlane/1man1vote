// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface ISnapshot {
    function balanceAt(address account, uint256 timestamp) external view returns (uint256);
    function clearAccountHistory() external;
}

