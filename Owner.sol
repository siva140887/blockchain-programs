// SPDX-License-Identifier: GPL-3.0

// This program is about set and get the contract owner

pragma solidity >=0.8.2 <0.9.0;

contract Owner
{
    address owner;	// owner is a state variable that holds the blockchain address of current owner
    event changeowner(address indexed owner, address indexed newowner);		// event and emit constructs are used to inform the external entities say DApps about the important change occurred in the contract
    
    constructor() 
    {
         owner = msg.sender;	// msg.sender gives the address of the caller, in this context the caller is the contract deployer
    }

    function get() public view returns (address)	// view returns will be used with a function to retrieve or read data from blockchain, in this case that data is the address of the current owner
    {
        return owner;
    }

    function set(address newowner) public	// to set or change the contract owner
    {
        // only the current owner should be allowed to call this function
        require(msg.sender==owner,"The caller is not the owner");	// require() takes two parameters 1. condition, 2. message to be displayed when the condition is evaluated to false
        emit changeowner(owner, newowner);
        owner = newowner;
    }
}


/*
Sample I/O:

********
[vm]from: 0x5B3...eddC4to: Owner.(constructor)value: 0 weidata: 0x608...f0033logs: 0hash: 0xf5c...4a819

status	1 Transaction mined and execution succeed
transaction hash	0xf5c6afb88f3f62ad14317cc5b589431cb88532a4f0e5f385046b09ea5364a819
block hash	0x97cd1bdfca162b5615e835ea866a1e0ada78c58ed1f6bfe0baa91cb46f9faed2
block number	3
contract address	0xf8e81D47203A594245E36C48e151709F0C19fBe8
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	Owner.(constructor)
transaction cost	256398 gas 
execution cost	189176 gas 
output	0x608060405234801561000f575f5ffd5b5060043610610034575f3560e01c80632801617e146100385780636d4ce63c14610054575b5f5ffd5b610052600480360381019061004d9190610241565b610072565b005b61005c6101bc565b604051610069919061027b565b60405180910390f35b5f5f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614610100576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016100f7906102ee565b60405180910390fd5b8073ffffffffffffffffffffffffffffffffffffffff165f5f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff167fc0f68157a1ee4f5fd0afbe6a5903e04fca9cf384354cfa6c978239765fb177ab60405160405180910390a3805f5f6101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050565b5f5f5f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16905090565b5f5ffd5b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f610210826101e7565b9050919050565b61022081610206565b811461022a575f5ffd5b50565b5f8135905061023b81610217565b92915050565b5f60208284031215610256576102556101e3565b5b5f6102638482850161022d565b91505092915050565b61027581610206565b82525050565b5f60208201905061028e5f83018461026c565b92915050565b5f82825260208201905092915050565b7f5468652063616c6c6572206973206e6f7420746865206f776e657200000000005f82015250565b5f6102d8601b83610294565b91506102e3826102a4565b602082019050919050565b5f6020820190508181035f830152610305816102cc565b905091905056fea2646970667358221220a4b10820ef6bdcbbcecd36c056eabfef3a152d0261d2190786792011e27dc66664736f6c634300081f0033
decoded input	{}
decoded output	 - 
logs	[]
raw logs	[]

********
[call]from: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4to: Owner.get()data: 0x6d4...ce63c

from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	Owner.get() 0xf8e81D47203A594245E36C48e151709F0C19fBe8
execution cost	2514 gas (Cost only applies when called by a contract)
input	0x6d4...ce63c
output	0x0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
decoded input	{}
decoded output	{
	"0": "address: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
}
logs	[]
raw logs	[]

*********
[vm]from: 0x4B2...C02dbto: Owner.set(address) 0xf8e...9fBe8value: 0 weidata: 0x280...35cb2logs: 0hash: 0xaed...2e956
status	0 Transaction mined but execution failed
transaction hash	0xaed1245da658755bec718e257ed48eb7576a068467565dbb93265bd7eec2e956
block hash	0x6d281b047f3f9bd6eaa94b3b465fd33a779ea1e5068d7c4fc80b81447c785ce8
block number	4
from	0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
to	Owner.set(address) 0xf8e81D47203A594245E36C48e151709F0C19fBe8
transaction cost	24309 gas 
execution cost	2877 gas 
output	0x08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001b5468652063616c6c6572206973206e6f7420746865206f776e65720000000000
decoded input	{
	"address newowner": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
}
decoded output	{}
logs	[]
raw logs	[]

transact to Owner.set errored: Error occurred: revert.

revert
	The transaction has been reverted to the initial state.
Reason provided by the contract: "The caller is not the owner".
If the transaction failed for not having enough gas, try increasing the gas limit gently.

*******
[vm]from: 0x5B3...eddC4to: Owner.set(address) 0xf8e...9fBe8value: 0 weidata: 0x280...35cb2logs: 1hash: 0xbcd...1d151

status	1 Transaction mined and execution succeed
transaction hash	0xbcde252173289aaeb19780668e6f33e2fd9d970133a0c7be52fffd8e1ea1d151
block hash	0xe618fc594efc47dac8777a5be93fdf02d8b489bd3d0b81c76f82c39b46dd2a55
block number	5
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	Owner.set(address) 0xf8e81D47203A594245E36C48e151709F0C19fBe8
transaction cost	28771 gas 
execution cost	7339 gas 
output	0x
decoded input	{
	"address newowner": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
}
decoded output	{}
logs	[
	{
		"from": "0xf8e81D47203A594245E36C48e151709F0C19fBe8",
		"topic": "0xc0f68157a1ee4f5fd0afbe6a5903e04fca9cf384354cfa6c978239765fb177ab",
		"event": "changeowner",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
		}
	}
]
raw logs	[
  {
    "_type": "log",
    "address": "0xf8e81D47203A594245E36C48e151709F0C19fBe8",
    "blockHash": "0xe618fc594efc47dac8777a5be93fdf02d8b489bd3d0b81c76f82c39b46dd2a55",
    "blockNumber": 5,
    "data": "0x",
    "index": 1,
    "topics": [
      "0xc0f68157a1ee4f5fd0afbe6a5903e04fca9cf384354cfa6c978239765fb177ab",
      "0x0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4",
      "0x000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2"
    ],
    "transactionHash": "0xbcde252173289aaeb19780668e6f33e2fd9d970133a0c7be52fffd8e1ea1d151",
    "transactionIndex": 0
  }
]

*********

[call]from: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4to: Owner.get()data: 0x6d4...ce63c

from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	Owner.get() 0xf8e81D47203A594245E36C48e151709F0C19fBe8
execution cost	2514 gas (Cost only applies when called by a contract)
input	0x6d4...ce63c
output	0x000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2
decoded input	{}
decoded output	{
	"0": "address: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
}
logs	[]
raw logs	[]

*/