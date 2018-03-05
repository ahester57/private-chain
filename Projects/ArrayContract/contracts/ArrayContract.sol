pragma solidity ^0.4.0;


contract Owned {
    address public owner;
    
    function Owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner)
        public
        onlyOwner()
    {
        owner = newOwner;
    }
}


contract ArrayContract is Owned {
    uint[2**20] mLotOfIntegers;
    // The following is a dynamic array of pairs
    bool[2][] mPairsOfFlags;

    function ArrayContract() public {
        if (owner != 0)
            owner = msg.sender;
    }

    function setAllFlagPairs(bool[2][] newPairs) public {
        mPairsOfFlags = newPairs;
    }

    function setFlagPair(
        uint index,
        bool flagA,
        bool flagB
    ) public {
        mPairsOfFlags[index][0] = flagA;
        mPairsOfFlags[index][1] = flagB;
    }

    function changeFlagArraySize(uint newSize) public {
        mPairsOfFlags.length = newSize;
    }

    function clear() public {
        // clear the arrays completely
        delete mPairsOfFlags;
        delete mLotOfIntegers;
        // 'identical' effect here
        mPairsOfFlags.length = 0;
    }

    bytes mByteData;

    function byteArrays(bytes data) public {
        // 'bytes' are stored without padding
        // but can be treated as 'uint8[]'
        mByteData = data;
        mByteData.length += 7;
        mByteData[3] = byte(8);
        delete mByteData[2];
    }

    function addFlag(bool[2] flag) public returns (uint) {
        return mPairsOfFlags.push(flag);
    }

    function createMemoryArray(uint size) public pure
        returns (bytes)
    {
        // dynamic memory arrays created using 'new'
        //uint[2][] memory arrayOfPairs = new uint[2][](size);
        // Create a dynamic bye array:
        bytes memory b = new bytes(size);
        for (uint i = 0; i < b.length; i++) {
            b[i] = byte(i);
        }
        return b;
    }
}