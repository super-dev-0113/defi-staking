pragma solidity >=0.5.5;

contract Migrations {
    // variables
    address public owner;
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    // modifiers can be used to modify functions :)
    modifier restricted() {
        if(msg.sender == owner) _; // _ just means if true continue onward
    }

    // restricted is the modifier making sure the owner of the contract can use these functions
    // instead of putting the if into both functions we can use a modifier
    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {   
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}