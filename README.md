0x8e4ce1f2bfaefe1350be588b4d6bdaa71f6ab418fd179ac0c5d8742ef396a90b
imple Voting Smart Contract

A lightweight voting smart contract built on the Aptos blockchain using the Move programming language. This contract allows users to create polls and cast yes/no votes in a decentralized manner.

## Features

- **Simple Poll Creation**: Create binary (yes/no) voting polls
- **One Vote Per Address**: Each address can only vote once per poll
- **Transparent Voting**: All votes are recorded on-chain
- **Vote Tracking**: Maintains separate counters for yes and no votes
- **Double-Vote Prevention**: Built-in mechanism to prevent duplicate voting

## Contract Structure

### Main Resource
- `Poll`: Stores voting data including vote counts, voter addresses, and poll status

### Functions
1. `create_poll(creator: &signer)` - Creates a new voting poll
2. `cast_vote(voter: &signer, poll_owner: address, vote: bool)` - Casts a vote on an existing poll

## Usage

### Creating a Poll
```move
// Create a new poll (called by poll creator)
MyModule::SimpleVoting::create_poll(&creator_signer);
```

### Casting a Vote
```move
// Vote YES on a poll
MyModule::SimpleVoting::cast_vote(&voter_signer, poll_owner_address, true);

// Vote NO on a poll
MyModule::SimpleVoting::cast_vote(&voter_signer, poll_owner_address, false);
```

## Error Codes

| Code | Constant | Description |
|------|----------|-------------|
| 1 | `E_POLL_NOT_FOUND` | Poll does not exist at the specified address |
| 2 | `E_ALREADY_VOTED` | Voter has already cast a vote on this poll |
| 3 | `E_POLL_CLOSED` | Poll is no longer accepting votes |

## Deployment

1. Compile the Move contract:
   ```bash
   aptos move compile
   ```

2. Deploy to Aptos:
   ```bash
   aptos move publish
   ```

3. Interact with the contract using Aptos CLI or integrate with a frontend application.

## Security Considerations

- Each address can only vote once per poll
- Poll ownership is tied to the creator's address
- All voting data is immutable once recorded on-chain
- No vote modification or deletion is possible

## License

This project is open source and available under the MIT License.

## Contributing

Feel free to submit issues and enhancement requests. Pull requests are welcome!

---

Transaction Hash:0x8e4ce1f2bfaefe1350be588b4d6bdaa71f6ab418fd179ac0c5d8742ef396a90b

**Note**: This is a basic implementation for educational purposes. For production use, consider adding additional features like voting deadlines, poll descriptions, and administrative controls.
