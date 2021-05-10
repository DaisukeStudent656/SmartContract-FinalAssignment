pragma solidity ^0.8.4;

import "./Dontoken.sol";
import "./Charity.sol";
import "./Projects.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Donator {
constructor() ReentrancyGuard() public {}

    Charity charity;
    address charAddr;
    uint indx = 0;
    mapping (uint => Project) public projects;
   
   constructor(Charity addr){
       charity = addr;
   }
   
    function donateToProject(uint indx, uint256 amount) nonReentrant() public payable {
        require(charity.myBalance(msg.sender) >= amount, "We're sorry, you don't have enough funds.");
        Project pjs = projects[indx];

        charity.transferTokens(msg.sender,payable(pjs.getAddress()),amount);
        
        charity.sendEtherToProject(payable(pjs.getAddress()), amount);
        
        pjs.addDonor(msg.sender, amount);
    }
    
    function myBalance() public view returns (uint) {
        return charity.myBalance(msg.sender);
    }
    
    function addProject(Project addr) public {
        projects[indx] = addr;
        indx++;
    }
    
}
