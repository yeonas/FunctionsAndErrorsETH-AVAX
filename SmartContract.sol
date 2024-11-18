// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SmartContractWithChecks {
    address public owner; // The owner of the contract
    uint256 public balance; // The total balance held by the contract
    bool public isActive; // Contract active status

    // Constructor: Initializes the owner as the contract deployer and sets contract as active
    constructor() {
        owner = msg.sender;
        isActive = true;
    }

    // Modifier to ensure only the owner can call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Modifier to ensure the contract is active
    modifier onlyActive() {
        require(isActive, "Contract is not active");
        _;
    }

    // Function to deposit funds into the contract
    function deposit() public payable onlyActive {
        require(msg.value > 0, "Deposit amount must be greater than 0"); // Ensure valid deposit
        balance += msg.value; // Update the contract balance
    }

    // Function to withdraw funds from the contract
    function withdraw(uint256 amount) public onlyActive onlyOwner {
        require(amount <= balance, "Insufficient balance"); // Check for sufficient balance

        balance -= amount; // Deduct the withdrawal amount from balance

        // Attempt to send Ether to the owner
        (bool success, ) = owner.call{value: amount}("");
        assert(success); // Ensure the transfer was successful
    }

    // Function to deactivate the contract (replaces selfdestruct)
    function deactivateContract() public onlyOwner {
        // Prevent deactivation if balance is greater than zero
        if (balance > 0) {
            (bool success, ) = owner.call{value: balance}("");
            require(success, "Failed to transfer remaining balance");
            balance = 0;
        }

        isActive = false; // Mark the contract as inactive
    }

    // Function to reactivate the contract
    function reactivateContract() public onlyOwner {
        require(!isActive, "Contract is already active"); // Ensure the contract is inactive
        isActive = true; // Mark the contract as active
    }
}
