pragma solidity 0.7.4;

contract OrcaPodManager {
    address deployer;

    struct rule {
        address contractAddress;
        uint256 minBalance;
    }

    mapping(uint256 => rule) public ruleByPod;

    constructor() public {
        deployer = msg.sender;
    }

    // probably a better way to manage  this
    // dependent on how we are managing contract deployment
    modifier onlyProtocol {
        require(msg.sender == deployer, "Only OrcaProtocol can call this function.");
        _;
    }

    // add modifier for only OrcaProtocol
    function createPodRule(
        uint256 podId,
        address contractAddress,
        uint256 minBalance
    ) public {
        ruleByPod[podId] = rule(contractAddress, minBalance);
    }
}
