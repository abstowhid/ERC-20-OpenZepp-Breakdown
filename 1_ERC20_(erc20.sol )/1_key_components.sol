mapping(address account => uint256) private _balances;
mapping(address account => mapping(address spender => uint256)) private _allowances;
uint256 private _totalSupply;
string private _name;
string private _symbol;


these are key components(state variable) to set those state variable we will use constructo
//by constructor we will add those name symbol total suply for a basic token (that always need)
