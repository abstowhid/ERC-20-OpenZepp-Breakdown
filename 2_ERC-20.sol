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



4️⃣ Token Transfers
function transfer(address to, uint256 value) public virtual returns (bool) {
    address owner = _msgSender();
    _transfer(owner, to, value);
    return true;
}
  //  Uses _msgSender() (from Context.sol) to get the sender.
   // Calls _transfer() to move tokens.

Allowing Others to Spend======================================

function approve(address spender, uint256 value) public virtual returns (bool) {
    address owner = _msgSender();
    _approve(owner, spender, value);
    return true;
}

Spender Transfers Tokens=============================
function transferFrom(address from, address to, uint256 value) public virtual returns (bool) {
    address spender = _msgSender();
    _spendAllowance(from, spender, value);
    _transfer(from, to, value);
    return true;
}

//check allowence=============================================
function allowance(address owner, address spender) public view virtual returns (uint256) {
    return _allowances[owner][spender];
}

5️⃣ Internal Transfer Function

function _transfer(address from, address to, uint256 value) internal {
    if (from == address(0)) {
        revert ERC20InvalidSender(address(0));
    }
    if (to == address(0)) {
        revert ERC20InvalidReceiver(address(0));
    }
    _update(from, to, value);
}


6️⃣ Minting & Burning Tokens

function _mint(address account, uint256 value) internal {
    if (account == address(0)) {
        revert ERC20InvalidReceiver(address(0));
    }
    _update(address(0), account, value);
}

function _burn(address account, uint256 value) internal {
    if (account == address(0)) {
        revert ERC20InvalidSender(address(0));
    }
    _update(account, address(0), value);
}

7️⃣ Updating Token Balances

function _update(address from, address to, uint256 value) internal virtual {
    if (from == address(0)) {
        _totalSupply += value;
    } else {
        uint256 fromBalance = _balances[from];
        if (fromBalance < value) {
            revert ERC20InsufficientBalance(from, fromBalance, value);
        }
        unchecked {
            _balances[from] = fromBalance - value;
        }
    }

    if (to == address(0)) {
        unchecked {
            _totalSupply -= value;
        }
    } else {
        unchecked {
            _balances[to] += value;
        }
    }

    emit Transfer(from, to, value);
}


8️⃣ Allowance Management

function _approve(address owner, address spender, uint256 value, bool emitEvent) internal virtual {
    if (owner == address(0)) {
        revert ERC20InvalidApprover(address(0));
    }
    if (spender == address(0)) {
        revert ERC20InvalidSpender(address(0));
    }
    _allowances[owner][spender] = value;
    if (emitEvent) {
        emit Approval(owner, spender, value);
    }
}


function _spendAllowance(address owner, address spender, uint256 value) internal virtual {
    uint256 currentAllowance = allowance(owner, spender);
    if (currentAllowance < type(uint256).max) {
        if (currentAllowance < value) {
            revert ERC20InsufficientAllowance(spender, currentAllowance, value);
        }
        unchecked {
            _approve(owner, spender, currentAllowance - value, false);
        }
    }
}









          

