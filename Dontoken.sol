pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Dontoken is ERC20 {
    constructor(address holder,uint256 initialSupply) ERC20("Dontoken", "DTK")  {
        _mint(holder, initialSupply);
    }

   
    function mint(address to, uint256 amount) public virtual {
        _mint(to, amount);
    }
    
    

    
    
    function pay(address sender, address recipient, uint256 amount) public virtual returns (bool) {
        _transfer(sender, recipient, amount);
        return true;
    }
}