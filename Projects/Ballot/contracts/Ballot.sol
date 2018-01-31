pragma solidity ^0.4.0;


/// @title Voting with delegtation.
contract Ballot {

    // Represent a voter
    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    // Represent a proposal
    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    address public chairperson;
    
    // stores Voter struct for each address
    mapping(address => Voter) public voters;

    // dynamically-sized array of Proposal structs
    Proposal[] public proposals;

    /// Create a new ballot
    function Ballot(bytes32[] proposalNames) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        
        //for each provided proposal, create a Proposal object
        for (uint i = 0; i < proposalNames.length; i++) {
            // push new Proposal objects to proposals array
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    /// Give 'voter' a right to vote.
    /// Only from chairperson
    function giveRightToVote(address voter) public {
        // 'require' when false:
        //      terminates
        //      reverts changes
        require((msg.sender == chairperson) &&
                !voters[voter].voted &&
                (voters[voter].weight == 0));
        voters[voter].weight = 1;
    }

    /// Delegate your vote to the voter 'to'
    function delegateTo(address to) public {
        // assign reference: 'storage' makes it a pointer
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        require(to != msg.sender);

        // forward delegation if delegate has already delegated
        while (voters[to].delegate != address(0)) {
            to = voters[to].delegate;
            require(to != msg.sender);
        }

        // Modify sender Voter object
        sender.voted = true;
        sender.delegate = to;
        Voter storage delegate = voters[to];
        if (delegate.voted) {
            // If delegate has voted, vote for what they did
            proposals[delegate.vote].voteCount += sender.weight;
        } else {
            // otherwise, add weight to whatever they vote for
            delegate.weight += sender.weight;
        }
    }

    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        sender.voted = true;
        sender.vote = proposal;
        
        // If there is an IndexOutOfRange error, 
        // it throws an error and is automatically reverted.
        proposals[proposal].voteCount += sender.weight;
    }

    /// @dev Computes winning proposal
    function winningProposal() public view 
        returns (uint winner) 
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winner = p;
            }
        }
    }

    /// Calls winningProposal() and gets name 
    function winnerName() public view
        returns (bytes32 winner)
    {
        winner = proposals[winningProposal()].name;
    }

}
