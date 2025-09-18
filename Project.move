module MyModule::SimpleVoting {
    use aptos_framework::signer;
    use std::vector;
    
    /// Struct representing a voting poll
    struct Poll has store, key {
        yes_votes: u64,     // Number of yes votes
        no_votes: u64,      // Number of no votes
        voters: vector<address>,  // Track who has voted
        is_active: bool,    // Whether voting is still open
    }
    
    /// Error codes
    const E_POLL_NOT_FOUND: u64 = 1;
    const E_ALREADY_VOTED: u64 = 2;
    const E_POLL_CLOSED: u64 = 3;
    
    /// Function to create a new voting poll
    public fun create_poll(creator: &signer) {
        let poll = Poll {
            yes_votes: 0,
            no_votes: 0,
            voters: vector::empty<address>(),
            is_active: true,
        };
        move_to(creator, poll);
    }
    
    /// Function to cast a vote (true for yes, false for no)
    public fun cast_vote(
        voter: &signer, 
        poll_owner: address, 
        vote: bool
    ) acquires Poll {
        let voter_addr = signer::address_of(voter);
        let poll = borrow_global_mut<Poll>(poll_owner);
        
        // Check if poll is still active
        assert!(poll.is_active, E_POLL_CLOSED);
        
        // Check if voter has already voted
        assert!(!vector::contains(&poll.voters, &voter_addr), E_ALREADY_VOTED);
        
        // Record the vote
        if (vote) {
            poll.yes_votes = poll.yes_votes + 1;
        } else {
            poll.no_votes = poll.no_votes + 1;
        };
        
        // Add voter to the list
        vector::push_back(&mut poll.voters, voter_addr);
    }
}
