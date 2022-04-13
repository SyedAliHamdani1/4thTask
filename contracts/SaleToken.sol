    // SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SaleToken is ERC20Capped,Ownable{
    constructor(uint _capAmount) ERC20Capped(_capAmount*10**decimals()) ERC20("Sale_Token","ST"){
        
    }

    function tokenPrice(uint _amount) public pure returns(uint){
        uint Price=_amount*1000000000;  // price of one token is one Gwei
        return Price; 
    }

    function mint(address _to,uint _amount) external payable {
        require(msg.value>=tokenPrice(_amount),"SaleToken: The price is less then the amount of token");
        _mint(_to,_amount);
    }

    
    function withdraw(address _owner,uint _amount) external onlyOwner() {
        payable(_owner).transfer(_amount);
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

