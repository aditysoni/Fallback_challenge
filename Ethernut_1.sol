// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//solution [how to think]

//first find where the owner variable is set 
// to set the owner = msg.sender ; we have to call the contribute function 
//after calling and sending some value greater than 0 we will have to call receive function 
//and , for that we have to do low level transaction , after successful execution of the transaction 
//we will be the owner 
//and then we will call the withdraw function and will withdraw all the ether 


contract Fallback {

  mapping(address => uint) public contributions;
  address public owner;

  constructor() {
    owner = msg.sender;
    contributions[msg.sender] = 1000 * (1 ether);
  }

  modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

  function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }

  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }

  function withdraw() public onlyOwner {
    payable(owner).transfer(address(this).balance);
  }

  receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}
