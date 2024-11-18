Smart Contract with Require, Assert, and Revert Statements
This project demonstrates the use of require(), assert(), and revert() statements in Solidity by implementing a smart contract called SmartContractWithChecks. The contract allows Ether deposits, withdrawals, and a conditional reset feature, showcasing error handling and validation mechanisms.

Features
Ether Deposit:

Allows users to deposit Ether into the contract.
Uses require() to ensure the deposit amount is greater than zero.
Withdraw Funds:

Allows only the owner to withdraw funds.
Ensures sufficient balance and validates the owner using require().
Uses assert() to check successful Ether transfer.
Reset Contract:

Allows the owner to reset the contract by destroying it.
Ensures the balance is zero before proceeding using revert().
