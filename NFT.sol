// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    uint256 private _tokenIds;
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("MyNFT", "MNFT") {}

    // Function to approve another address to transfer the given token ID
    function approve(address to, uint256 tokenId) public override {
        super.approve(to, tokenId);
    }

    // Function to get the number of NFTs owned by an address
    function balanceOf(address owner) public view override returns (uint256) {
        return super.balanceOf(owner);
    }

    // Function to get the owner of a specific NFT
    function ownerOf(uint256 tokenId) public view override returns (address) {
        return super.ownerOf(tokenId);
    }

    // Function to safely transfer ownership of a given token ID to another address
    function safeTransferFrom(address from, address to, uint256 tokenId) public override {
        super.safeTransferFrom(from, to, tokenId);
    }

    // Overloaded function to safely transfer ownership of a given token ID to another address
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override {
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    // Function to transfer ownership of a given token ID to another address
    function transferFrom(address from, address to, uint256 tokenId) public override {
        super.transferFrom(from, to, tokenId);
    }

    // Function to enable or disable approval for a third party to manage all of the caller's assets
    function setApprovalForAll(address operator, bool approved) public override {
        super.setApprovalForAll(operator, approved);
    }

    // Function to get the approved address for a single NFT
    function getApproved(uint256 tokenId) public view override returns (address) {
        return super.getApproved(tokenId);
    }

    // Function to query if an address is an authorized operator for another address
    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return super.isApprovedForAll(owner, operator);
    }

    // Function to create new NFTs and assign them to the admin
    function mint(address to, string memory tokenURI) public onlyOwner returns (uint256) {
        _tokenIds += 1;
        uint256 newItemId = _tokenIds;
        _mint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    // Function to get the metadata URL for a given token ID
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }

    // Internal function to set the token URI for a given token
    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        _tokenURIs[tokenId] = uri;
    }
}
