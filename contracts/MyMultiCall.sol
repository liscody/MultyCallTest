// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract MyMultiCall {
    function multiCall(address[] calldata targets, bytes[] calldata data)
        external
        view
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);

        for (uint i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].staticcall(data[i]);
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }
    
    function getDataFromBalanceOf(address nftOwner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("balanceOf(address)", nftOwner);// Selector(this.test.selector, nftOwner);
    }

    function getDataFromName() external pure returns (bytes memory) {
        //return abi.encodeWithSelector(this.test.selector, _i);
        return abi.encodeWithSignature("name()");
    }
    
    function bytesToUint(bytes memory b) public pure returns (uint256){
        uint256 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint(uint8(b[i]))*(2**(8*(b.length-(i+1))));
        }
        return number;
    }
}