pragma solidity ^0.4.25;

contract Coursetro {
    
    string fName = "NoName";
    uint age = 0;
    address owner;
    
    constructor() public {
        owner  = msg.sender;
    }
    
    event Instructor(
        string name,
        uint age
    );
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function setInstructor(string _fName, uint _age) onlyOwner public {
        fName = _fName;
        age = _age;
        
        emit Instructor(_fName, _age);
    }
    
    function getInstructor() public constant returns (string, uint) {
        return (fName, age);
    }
}