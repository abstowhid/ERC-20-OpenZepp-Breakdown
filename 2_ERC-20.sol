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



2️⃣ Constructor
constructor(string memory name_, string memory symbol_) {
    _name = name_;
    _symbol = symbol_;
}

//Takes name and symbol as inputs and sets them.
//These values are immutable after deployment.

3️⃣ Basic ERC-20 Functions
Token Information (View Functions)


function name() public view virtual returns (string memory) {
    return _name;
}

function symbol() public view virtual returns (string memory) {
    return _symbol;
}

function decimals() public view virtual returns (uint8) {
    return 18;
}

function totalSupply() public view virtual returns (uint256) {
    return _totalSupply;
}

function balanceOf(address account) public view virtual returns (uint256) {
    return _balances[account];
}







          

