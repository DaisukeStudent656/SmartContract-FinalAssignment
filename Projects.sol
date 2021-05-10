pragma solidity ^0.8.4;
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

import "./Charity.sol";

contract Project{
  constructor() ReentrancyGuard() public {}
    
    address owner;
    address donatorContractAddress;
    Charity charity;
    string name;
    uint256 timestamp;
    uint256 Contribs;
    uint256 indx = 0;
    bool canVote =true;
    
    struct Donator {
        bool vote;
        bool voted;
        uint256 amount;
    }
    
    mapping(uint256=> address) indexedAddr;
    mapping(address => Donator) donorList;
    
    uint256 counterVotes = 0; // (negative votes?) thus the ones that has voted against the project. 
    
    constructor(string memory _name, Charity charityContractAddress, address _donatorContractAddress){
        owner = msg.sender;
        name = _name;
        charity = charityContractAddress;
        donatorContractAddress = _donatorContractAddress;
        timestamp = block.timestamp;
        
    }
    
    function addDonor(address addr, uint256 amount) external{
        
        require(msg.sender == donatorContractAddress,"Can only be called by the donor contract.");
        indexedAddr[indx] = addr;
        donorList[addr] = Donator(true,false,amount);
        indx++;
        
    }
    
    
    function voteYes() public{
        require(canVote, "You can't vote yet.");
        require(donorList[msg.sender].voted==false, "You have voted alreay.");
        donorList[msg.sender].vote=true;
        donorList[msg.sender].voted=true;
    }
    
    function voteNo() public{
        require(canVote, "You can't vote yet.");
        require(donorList[msg.sender].voted==false, "You have voted alreay.");
        donorList[msg.sender].vote=false;
        donorList[msg.sender].voted=true;
    }
    
    
    function countRefundVote() internal{
        uint falseVotes = 0;
        counterVotes = 0;
        
        for(uint i = 0; i<indx; i++){
            if(donorList[indexedAddr[i]].vote == false) {
                falseVotes++;
                counterVotes++;
            }
        }
        if(counterVotes >= indx){
            refund();
        }else{
            deleteDonors();
        }
        
    }
    
    function refund() nonReentrant() internal{
        canVote=false;
        for(uint i = 0; i<indx; i++){
            uint amount = donorList[indexedAddr[i]].amount/2;
            payable(indexedAddr[i]).transfer(amount);
            charity.transferTokens(address(this),payable(indexedAddr[i]), amount);
        }
    }
    
    function deleteDonors() internal{
        for (uint i = 0; i < indx; i++) {
            // deleting everyone
            delete donorList[indexedAddr[i]];
            delete indexedAddr[i];
        }        
        indx = 0;
    }
    
    //when the project holders are allowed to retrieve the ethers from the project.
    function extract(address x) public payable {
        require(msg.sender == owner, "The owner is the only one allowed to extract ethers.");
    
        //change the "1 minutes" to 4 weeks. It is set to 1 minute for testing purposes but this part of the code revises if it's too early to check for withdrawal of the ethers.
        require(block.timestamp > timestamp + 4 weeks, "Sorry, you may not extract at this current time.");
        countRefundVote();
        payable(x).transfer((address(this).balance));
        timestamp = block.timestamp;
        canVote= true;
    }
    
    function getDonorAmount() public view returns (uint){
        //shows amount of donors.
        return indx;    
    }
    
    function getEtherBal() public view returns (uint){
        // returns the ether balance of the contract
        return address(this).balance;
    }
    
    function getTokensBalance() public view returns(uint){
        //returns the token balance.
        return charity.myBalance(address(this));
    }
    
    function getCounterVotes() public view returns (uint){
    //returns the amount of voters that voted against the project( tegen het project. ).
        return counterVotes;
    }
    
    function getName() public view returns(string memory){
        return name;
    }
    
    //this returns the address of the project contract that was deployed.
    function getAddress() public view returns (address){
        return address(this);
    }
    
    receive() external payable{
        /*
        * this has to be here or else it will crash when trying to send ethers. 
        */
    }
    
}
