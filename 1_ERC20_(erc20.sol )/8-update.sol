//whatever happening update is must
//minting,burning,transfer,allowence everywhere we need to update the from,to ,amount, sometimes totalsupply

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
