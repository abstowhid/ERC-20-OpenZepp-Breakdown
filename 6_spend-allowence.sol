//this function control the transaxtion limit(allowence) for the child(spender) under a parent.
//it updates the limit & check the limit. if limit is now not transfeerable then spender can't transaction.
function _spendAllowance(address owner, address spender, uint256 value) internal {
    uint256 currentAllowance = allowances[owner][spender];
    require(currentAllowance >= value, "Insufficient allowance");
    
    unchecked { allowances[owner][spender] -= value; } // Saves gas
}

//This function checks and reduces the allowance when a spender tries to use approved tokens.
