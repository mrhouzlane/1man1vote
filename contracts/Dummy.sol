// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Snapshot.sol";

contract MyToken is Snapshot {
    address payable public founder;

    constructor(
        address payable _founder
    )
        public
        Snapshot("1man1vote", "1M1V", new address[](0))
    {
        founder = _founder;
    }

    function mint(address account) external payable {
        _mint(account, msg.value, Utils.EMPTY_BYTES, Utils.EMPTY_BYTES);

        founder.transfer(msg.value);
    }
}