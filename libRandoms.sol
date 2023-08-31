// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <=0.8.17;

library RandomTools {
    function random(uint number, uint8 salt) public view returns(uint){
        return uint(keccak256(
                    abi.encodePacked(
                        block.timestamp,
                        block.difficulty,  
                        msg.sender, 
                        salt))) % number;
    }

    function randomMinMax(uint min, uint max, uint8 salt) public view returns(uint) {
        require (max>=min);
        return min + random(max-min, salt);
    }

/**
* randomArray receives array of weights
* and returns randow index 
* with weighted randomnes
*/
    function randomArray(uint[5] memory weights) public view returns(uint) {
        uint total = 0;
        uint[] memory accumulated = new uint[](weights.length);
        for(uint i =0; i < weights.length; i++) {
            total += weights[i];
            accumulated[i] = total;
        }
        uint r = random(total, 7);
        for(uint i = 0; i < accumulated.length; i++) {
            if (r <= accumulated[i]) {
                return (i);
            }
        }
    }
}