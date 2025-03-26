// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Standard ERC-20 functionality
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Extensions
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";  // Allows burning
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";  // Allows pausing
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";  // Supports historical snapshots
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";  // Supports gasless approvals

// Access Control
import "@openzeppelin/contracts/access/AccessControl.sol";  // Role-based access control

// Security
import "@openzeppelin/contracts/security/Pausable.sol";  // Adds pause/unpause functionality

// Upgradability
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";  // For upgradeable contract
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";  // Upgradeable ERC-20
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";  // Upgradeable ownership
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";  // Upgradeable burnable
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PausableUpgradeable.sol";  // Upgradeable pausable
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";  // Upgradeable gasless approval
