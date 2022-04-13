// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 <0.9.0;

import "hardhat/console.sol";

contract Token{
    string public name="HardHat Token";
    string public symbol = "HHT";
    uint public totalSupply = 100000;

    address public owner;
    mapping(address=>uint) balances;

    constructor(){
        balances[msg.sender]=totalSupply;
        owner=msg.sender;
    }

    function transfer ( address to, uint amount) external {
        console.log("***** Sender balance is %s token ****", balances[msg.sender]);
        console.log(" **** Sender  is sending  %s token to %s address ***", amount , to);

        require(balances[msg.sender]>= amount ,"Not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount ;
    }

    function balanceOf(address account) external view returns(uint256){
        return balances[account];
    }

}