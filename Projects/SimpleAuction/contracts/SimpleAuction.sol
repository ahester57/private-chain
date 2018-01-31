pragma solidity ^0.4.0;


contract SimpleAuction {
    // Creator and end time stamp
    address public beneficiary;
    uint public auctionEnd;

    // current stat of the auction
    address public highBidder;
    uint public highBid;

    // Allowed withdrawals of previous bids
    mapping(address => uint) public pendingReturns;

    bool public ended = false;

    // Events fired on changes
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // Three '/'s is a natspec comment.
    // It will be displayed when asked to confirm a transaction.
    /// Create a simple auction with '_biddingTime' seconds
    /// on behalf of '_benefeciary' address 
    function SimpleAuction(
        uint _biddingTime,
        address _beneficiary
    ) public {
        beneficiary = _beneficiary;
        auctionEnd = now + _biddingTime;
    }

    /// Bid on the auction with value sent
    /// by this TX. Value refunded only if 
    /// auction is not won.
    function bid() public payable {
        // payable keyword required for fn
        // to receive Ether
        require(now <= auctionEnd);
        
        // If not highest bid, revert & send back
        require(msg.value > highBid);

        if (highBidder != 0) {
            // Add current highBidder to pendingReturns
            pendingReturns[highBidder] += highBid;
        }
        highBidder = msg.sender;
        highBid = msg.value;
        HighestBidIncreased(msg.sender, msg.value);
    }

    /// Withdraw a bid that was overbid.
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        require(amount > 0);

        // Important to do this before send in case
        // of multiple simultaneous calls to withdraw()
        pendingReturns[msg.sender] = 0;

        if (!msg.sender.send(amount)) {
            // Send failed
            pendingReturns[msg.sender] = amount;
            return false;
        }
        return true;
    }

    /// End the auction and send the highest bid
    /// to the beneficiary
    function auctionEnd() public {
        // It is a good guideline to structure functions that interact
        // with other contracts (i.e. they call functions or send Ether)
        // into three phases:
        // 1. checking conditions
        // 2. performing actions (potentially changing conditions)
        // 3. interacting with other contracts
        // If these phases are mixed up, the other contract could call
        // back into the current contract and modify the state or cause
        // effects (ether payout) to be performed multiple times.
        // If functions called internally include interaction with external
        // contracts, they also have to be considered interaction with
        // external contracts

        // 1. Conditions
        require(now >= auctionEnd);
        require(!ended);

        // 2. Effects
        ended = true;
        AuctionEnded(highBidder, highBid);

        // 3. Interaction
        beneficiary.transfer(highBid);
    }
}