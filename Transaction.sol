// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
    
contract Transaction{
    uint transactionCount;
    event transferEvent (address from, address reciever, uint amount, string message, uint timestamp);

    struct transferStruct{
        address sender;
        address reciever;
        uint amount;
        string message;
        uint timestamp; 
        
        
    }
    
    transferStruct[] transferArray;

    function transferFunc( address payable reciever, uint amount, string memory message) public{
        transactionCount += 1;
        transferArray.push(transferStruct(msg.sender, reciever, amount, message, block.timestamp));
        emit transferEvent(msg.sender, reciever, amount, message, block.timestamp);
    }
    function getAllTransactions() public view returns (transferStruct[] memory ){
        return transferArray;
    }
    function getAllTransactionCount() public view returns(uint){
        return transactionCount;
    }

   

}
