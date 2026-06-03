# Smart Contract for Automated Supply Chain Management

## Overview

This project demonstrates how blockchain and smart contracts can automate supply chain operations. The smart contract is developed using Solidity and deployed through Remix IDE on a JavaScript VM blockchain.

## Problem Statement

In traditional factories, managers manually monitor production levels and decide when to order raw materials. This process can lead to delays, errors, and lack of transparency.

## Solution

The SupplyManager smart contract automatically tracks production and triggers a supply request when production reaches a predefined threshold of 10,000 kg.

## Features

* Automated supply request generation
* Real-time production tracking
* Transparent blockchain records
* Event-based notifications
* Supply delivery confirmation
* Decentralized and tamper-proof workflow

## Workflow

1. Add production quantity using `addProduction()`.
2. Production is accumulated in the contract.
3. When total production exceeds 10,000 kg:

   * Supply request is automatically generated.
   * `SupplyRequested` event is emitted.
4. Supplier delivers materials using `markSupplyDelivered()`.
5. Contract resets production count and emits `SupplyDelivered` event.

## Technologies Used

* Solidity
* Ethereum Smart Contracts
* Remix IDE
* JavaScript VM
* Blockchain

## Testing Results

* Added 5000 kg production → No supply request generated.
* Added 6000 kg production → Threshold crossed (11000 kg total).
* `SupplyRequested` event emitted.
* Delivered 2000 kg supply.
* `SupplyDelivered` event emitted and system reset.

## Future Enhancements

* Multi-supplier support
* Role-based access control
* Inventory management
* Real-time IoT integration
* Supply analytics dashboard
