pragma solidity ^0.4.0;


/// Safe Remote Purchase
contract Purchase {
    uint public value;
    address public seller;
    address public buyer;
    
    enum State { Created, Locked, Inactive }
    State public state;

    // ensure msg.value is even.
    // Division will truncate if odd.
    function Purchase() public payable {
        seller = msg.sender;
        value = msg.value / 2;
        require((2 * value) == msg.value); 
    }

    modifier condition(bool _condition) {
        require(_condition);
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer);
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller);
        _;
    }

    modifier inState(State _state) {
        require(state == _state);
        _;
    }

    event Aborted();
    event PurchaseConfirmed();
    event ItemReceived();

    /// Abort the purchase and reclaim Ether.
    /// Only called by seller before contract locked
    function abort()
        public
        onlySeller()
        inState(State.Created)
    {
        Aborted();
        state = State.Inactive;
        seller.transfer(this.balance);
    }

    /// Confirm the purchase as buyer.
    /// Transaction has to include `2 * value` ether.
    /// The ether will be locked until confirmReceived
    /// is called.
    function confirmPurchase()
        public
        inState(State.Created)
        condition(msg.value == (2 * value))
        payable
    {
        PurchaseConfirmed();
        buyer = msg.sender;
        state = State.Locked;
    }
    
    /// Confirm that you (the buyer) received the item.
    /// Releases locked ether
    function confirmReceived()
        public
        onlyBuyer()
        inState(State.Locked)
    {
        state = State.Inactive;
        ItemReceived();
        buyer.transfer(value);
        seller.transfer(this.balance);
    }
}