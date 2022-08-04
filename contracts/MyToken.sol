// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721 {
    constructor() ERC721("MyToken", "MTK") {
        {
            for (uint256 a = 1; a <= 50; a++) {
                _safeMint(msg.sender, a);
            }
        }
    }
}