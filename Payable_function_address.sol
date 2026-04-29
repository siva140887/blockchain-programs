// SPDX-License-Identifier: GPL-3.0

/* payable function and address. */ 

pragma solidity >=0.8.2 <0.9.0;

contract pay2
{
    function send() public payable { 		/* payable function to send money to contract account. I use payable with a function when I want it to receive ETH */

    }

    function payment(address payable to) public payable { 	/* payable function and address to send money to EOA. I use payable with an address when I want it to receive ETH */
        bool status;
        (status,) = to.call{value: msg.value}("");  	/* send and transfer have become deprecated in jan 2026. Hence using the low level call method */
        require(status,"Transfer is unsuccessful"); 	// this is required
    }

    function getbalance() public view returns (uint) 	// this function is used to retrieve contract balance
    {
        return address(this).balance;  		// returns contract account balance
    }
}





/*
Sample I/O:

**********************************
Contract deployment:

[vm] from: 0x5B3...eddC4 to: pay2.(constructor) value: 0 wei data: 0x608...20033 logs: 0 hash: 0x144...9a4cc
status	1 Transaction mined and execution completed
transaction hash	0x144ee894681e5fe6217476b633c303a02258ccfa1c8e9fe4897e3c2813d9a4cc
block hash	0xfaa5a2878cd73e5b93a0bbc030c3a290b41f5d609ce9a938b9202148f71ef4da
block number	24
contract address	0xe2899bddFD890e320e643044c6b95B9B0b84157A
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	pay2.(constructor)
transaction cost	213508 gas 
execution cost	148794 gas 
output	0x608060405260043610610033575f3560e01c80633b92f3df146100375780634d9b3d5d14610053578063b46300ec1461007d575b5f5ffd5b610051600480360381019061004c919061019c565b610087565b005b34801561005e575f5ffd5b50610067610135565b60405161007491906101df565b60405180910390f35b61008561013c565b005b5f8173ffffffffffffffffffffffffffffffffffffffff16346040516100ac90610225565b5f6040518083038185875af1925050503d805f81146100e6576040519150601f19603f3d011682016040523d82523d5f602084013e6100eb565b606091505b50508091505080610131576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161012890610293565b60405180910390fd5b5050565b5f47905090565b565b5f5ffd5b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f61016b82610142565b9050919050565b61017b81610161565b8114610185575f5ffd5b50565b5f8135905061019681610172565b92915050565b5f602082840312156101b1576101b061013e565b5b5f6101be84828501610188565b91505092915050565b5f819050919050565b6101d9816101c7565b82525050565b5f6020820190506101f25f8301846101d0565b92915050565b5f81905092915050565b50565b5f6102105f836101f8565b915061021b82610202565b5f82019050919050565b5f61022f82610205565b9150819050919050565b5f82825260208201905092915050565b7f5472616e7366657220697320756e7375636365737366756c00000000000000005f82015250565b5f61027d601883610239565b915061028882610249565b602082019050919050565b5f6020820190508181035f8301526102aa81610271565b905091905056fea26469706673582212200a64dfd769c607210614041beef4e311a2623092987ec69ee0191fb6d0beea1e64736f6c63430008220033
decoded input	{}
decoded output	 - 
logs	[]
raw logs	[]
*****************************************

send:
[vm] from: 0x5B3...eddC4 to: pay2.send() 0xe28...4157A value: 2000000000000000000 wei data: 0xb46...300ec logs: 0 hash: 0xcbe...3ead2
status	1 Transaction mined and execution completed
transaction hash	0xcbe845fa4e3484c674ad70961914ec72488de65cdc8a7fb16d9bac7b0b23ead2
block hash	0x2099567dea87f1093dc85a16ef45a989091b4de71e2a69b80ecda38d8bed360a
block number	25
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	pay2.send() 0xe2899bddFD890e320e643044c6b95B9B0b84157A
transaction cost	21193 gas 
execution cost	141 gas 
output	0x
decoded input	{}
decoded output	{}
logs	[]
raw logs	[]
value	2000000000000000000 wei
********************************************

getbalance:
[call] from: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 to: pay2.getbalance() data: 0x4d9...b3d5d
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	pay2.getbalance() 0xe2899bddFD890e320e643044c6b95B9B0b84157A
execution cost	334 gas (Cost only applies when called by a contract)
input	0x4d9...b3d5d
output	0x0000000000000000000000000000000000000000000000001bc16d674ec80000
decoded input	{}
decoded output	{
	"0": "uint256: 2000000000000000000"
}
logs	[]
raw logs	[]
*********************************************

payment:
[vm] from: 0x5B3...eddC4 to: pay2.payment(address) 0xe28...4157A value: 3000000000000000000 wei data: 0x3b9...35cb2 logs: 0 hash: 0x59d...984e3
status	1 Transaction mined and execution completed
transaction hash	0x59d59e15e4f48cc184341030e0e8bb176f5ba3718f7e03ccab842a8df29984e3
block hash	0x2ec2024268597cab2ff059dd09ba8d6f9f95826ed952723b533b39687ff15508
block number	26
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	pay2.payment(address) 0xe2899bddFD890e320e643044c6b95B9B0b84157A
transaction cost	31443 gas 
execution cost	10011 gas 
output	0x
decoded input	{
	"address to": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"
}
decoded output	{}
logs	[]
raw logs	[]
value	3000000000000000000 wei

*/