// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract xNFTFaucet is ERC721URIStorage {
    event Minted(
        address nftOwner,
        string tokenURI,
        uint256 tokenID,
        uint32 timeStamp
    );

    constructor() ERC721("xNFT-Faucet", "xNFT") {}

    uint256 public _tokenCount;

    function mintNFT(string memory _tokenURI) external {
        _safeMint(msg.sender, _tokenCount);
        _setTokenURI(_tokenCount, _tokenURI);
        emit Minted(msg.sender, _tokenURI, _tokenCount, uint32(block.timestamp));
        _tokenCount++;
    }
}
