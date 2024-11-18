# SmartContractWithChecks
This Solidity smart contract demonstrates key features of Ethereum smart contracts, including ownership control, fund management, contract lifecycle management, and robust error handling using require(), assert(), and revert().

## Features

- **Fund Management**:
  
    Deposit and withdraw Ether securely.

    Tracks the contract balance.



- **Ownership Control**:

     Only the owner of the contract (deployer) can perform critical operations like withdrawing funds, deactivating, or reactivating the contract.

 

- **Lifecycle Management**:
    Deactivate the contract to stop further interactions.

    Reactivate the contract to resume operations.
  
  

- **Error Handling**:

   require(): Validates inputs and state conditions.
  
    assert(): Ensures critical invariants.
  
    revert(): Explicitly halts execution when conditions are not met.
  
