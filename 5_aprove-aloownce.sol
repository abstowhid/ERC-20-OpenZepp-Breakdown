//alowence to view
//aprove to set
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
