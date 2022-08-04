// SPDX-License-Identifier: MIT
pragma solidity ^0.4.23;

contract MyConvertToUint {

    function bytesToUint(bytes b) public pure returns (uint256){
        uint256 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint(b[i])*(2**(8*(b.length-(i+1))));
        }
        return number;
    }
}