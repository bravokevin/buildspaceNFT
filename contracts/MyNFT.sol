//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyNFT is ERC721URIStorage {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("FabolusNFT", "FNFT") {
        console.log("hello world");
    }

    function mintNFT() public {
             // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();
             // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

    // Set the NFTs data. using json keeper to host the metadata of the nft
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/QQY4");

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}