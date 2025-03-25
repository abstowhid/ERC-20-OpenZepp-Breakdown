//there are too maany functions and import in that repo,

import .....interface
contract ERC20 is Interfaces{
//here all code
}
/////========================================================

Key Components
1️⃣ State Variables (Storage)

mapping(address account => uint256) private _balances;
mapping(address account => mapping(address spender => uint256)) private _allowances;
uint256 private _totalSupply;
string private _name;
string private _symbol;

          //_balances: Stores the token balance of each address.
          //_allowances: Tracks how much one address is allowed to spend from another.
          //_totalSupply: The total number of tokens in circulation.










          

