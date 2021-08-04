/* SPDX-License-Identifier: MIT
    Student Coin is the first crypto platform that allows users to easily design, create, and manage personal, start-up, NFT, and DeFi tokens.
    The STC Token is an updated contract for 0xb8B7791b1A445FB1e202683a0a329504772e0E52
*/

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SMTERC20 is ERC20 {
    // 18 decimals
    constructor() ERC20("Smart Marketing Token", "SMT") {
        _mint(_msgSender(), 10_000_000 * (10 ** uint256(decimals())));
    }

    function batchTransfer(address[] calldata destinations, uint256[] calldata amounts) public {
        uint256 n = destinations.length;
        address sender = _msgSender();
        require(n == amounts.length, "SMTERC20: Invalid BatchTransfer");
        for(uint256 i = 0; i < n; i++)
            _transfer(sender, destinations[i], amounts[i]);
    }
}
