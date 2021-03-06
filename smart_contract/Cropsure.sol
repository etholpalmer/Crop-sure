pragma solidity ^0.4.24;

contract Cropsure{
    address private owner;
    
    struct Candidate{
        string name;
        address acc_address;
        string propertyaddress;
        uint256 propertyvalue;
        uint256 annualproduction;
        uint256 equipmentreplacementvalue;
        uint256 yearsinbusiness;
        uint256 coverageamount;
        uint256 startDatemmddyear;
        uint256 expiryDatemmddyear;
        uint256 premium;
        
    }
    struct Acc_addreses{
        address[] candidate_adds;
    }
    Acc_addreses private all_acc;
    mapping(address => Candidate) candidates;
    constructor () public {
        owner = msg.sender;
    }
    modifier isOwner() {
        require (owner == msg.sender);
        _;
    }
    
    function Application(string memory _name, address _acc_address, string _propertyaddress, uint256 _propertyvalue, uint256 _annualproduction, uint256 _equipmentreplacementvalue, uint256 _yearsinbusiness, uint256 _coverageamount, uint256 _startDatemmddyear, uint256 _expiryDatemmddyear, uint256 _premium) public isOwner {
        Candidate memory candidate;
        candidate.name = _name;
        candidate.acc_address = _acc_address;
        candidate.propertyaddress = _propertyaddress;
        candidate.propertyvalue = _propertyvalue;
        candidate.annualproduction = _annualproduction;
        candidate.equipmentreplacementvalue = _equipmentreplacementvalue;
        candidate.yearsinbusiness = _yearsinbusiness;
        candidate.coverageamount = _coverageamount;
        candidate.startDatemmddyear = _startDatemmddyear;
        candidate.expiryDatemmddyear = _expiryDatemmddyear;
        candidate.premium = _premium;
        candidates[_acc_address] = candidate;
        all_acc.candidate_adds.push(_acc_address);
        
    }
    
    function getRegistry() public constant returns (address[] memory){
        return all_acc.candidate_adds;
    }
    // Input wallet address to retrieve policy 
    function getPolicy(address _address) public constant returns (string memory name, string propertyaddress ,uint256 propertyvalue, uint256 _coverageamount, uint256 _startDatemmddyear, uint256 _expiryDatemmddyear, uint256 _premium){
        return (candidates[_address].name, candidates[_address].propertyaddress, candidates[_address].propertyvalue, candidates[_address].coverageamount, candidates[_address].startDatemmddyear, candidates[_address].expiryDatemmddyear, candidates[_address].premium);
    }
    
}