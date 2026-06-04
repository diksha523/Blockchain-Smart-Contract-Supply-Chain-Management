// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Supply Manager for production -> supply trigger
/// @notice Production units are in kilograms (kg). 10 tonnes = 10,000 kg.

contract SupplyManager {

    address public owner;
    uint256 public totalProducedKg;
    uint256 public triggerKg;
    bool public waitingForSupply;

    event SupplyRequested(
        uint256 requestedAmountKg,
        uint256 totalProducedKg
    );

    event SupplyDelivered(
        address supplier,
        uint256 deliveredAmountKg
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call");
        _;
    }

    constructor() {
        owner = msg.sender;
        triggerKg = 10000;
        totalProducedKg = 0;
        waitingForSupply = false;
    }

    /// @notice Add production amount in kilograms
    function addProduction(uint256 producedKg) public {
        require(producedKg > 0, "Produce more than 0 kg");

        totalProducedKg += producedKg;

        if (!waitingForSupply && totalProducedKg >= triggerKg) {
            waitingForSupply = true;

            uint256 requestedAmount = 20000;

            emit SupplyRequested(
                requestedAmount,
                totalProducedKg
            );
        }
    }

    /// @notice Mark supply as delivered
    function markSupplyDelivered(uint256 deliveredKg) public {
        require(waitingForSupply, "No supply request active");
        require(deliveredKg > 0, "Delivered must be > 0");

        totalProducedKg = 0;
        waitingForSupply = false;

        emit SupplyDelivered(
            msg.sender,
            deliveredKg
        );
    }

    /// @notice Returns remaining kilograms required to reach threshold
    function remainingToTrigger()
        public
        view
        returns (uint256)
    {
        if (totalProducedKg >= triggerKg) {
            return 0;
        } else {
            return triggerKg - totalProducedKg;
        }
    }
}
