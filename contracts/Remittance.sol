// SPDX-License-Identifier:MIT 
pragma solidity 0.5.16;
    
contract Remittance {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    struct RemittanceStruct {
        bytes32 hash;
        uint256 value;
    }

    mapping (bytes32 => RemittanceStruct) public remittances;

    function sendRemittance(address payable recipient, bytes32 hash) public payable {
        require(msg.value > 0, "Value must be greater than zero.");
        uint256 amount = msg.value;
        recipient.transfer(amount);
    }

    function createRemittance(bytes32 hash) public payable {
        require(msg.value > 0, "Value must be greater than zero.");

        RemittanceStruct storage remittance = remittances[hash];
        require(remittance.value == 0, "Remittance already exists.");

        remittance.hash = hash;
        remittance.value = msg.value;
    }

    function withdraw(bytes32 passphrase1, bytes32 passphrase2) public {
        bytes32 hash = keccak256(abi.encodePacked(passphrase1, passphrase2, msg.sender));
        RemittanceStruct storage remittance = remittances[hash];
        require(remittance.value > 0, "Remittance does not exist.");

        uint256 value = remittance.value;
        remittance.value = 0;
        msg.sender.transfer(value);
    }
}
