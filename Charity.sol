pragma solidity ^0.8.4;

import "./Dontoken.sol";

contract Charity {
    address charOwn;
    Dontoken public myToken = new Dontoken(msg.sender,0);
    
    constructor()  {
        charOwn = msg.sender;
    }
    
    
  function donate() public payable {
        require(msg.value > 10, "minimum value is 10 wei");
        uint value = msg.value;
        uint newAmount = (value /100*20);
        myToken.mint(msg.sender, newAmount);
    } 
    
    function Withdrawal(address payable account)  payable external {
        require(msg.sender == charOwn,"Only the charity owner address can withdraw from the charity.");
        account.transfer(address(this).balance);
    }
    
    // returns the balance of the contract
    function contractBalance () public view returns (uint){
        return address(this).balance;
    }

    //returns the requested balance.    
    function myBalance(address addr) public view returns (uint) {
        return myToken.balanceOf(addr);
    }
    
    
    /*
    * Send ether to the projects.
    */
    function sendEtherToProject(address projectAddress, uint amount) external {
        payable(projectAddress).transfer(amount);
    }

    function transferTokens(address sender, address recipient, uint amount) external {
        myToken.pay(sender,recipient, amount);
    }

    
}
