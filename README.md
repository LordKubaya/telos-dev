# Enviromnent Setup for Telos Zero Development

This repository contains scripts and configurations for setting up a development environment for Telos Zero. The environment includes necessary tools, dependencies, and configurations to facilitate smart contract development and testing.

## Getting Started
To set up your development environment, follow these steps:
1. Clone the repository:
```bash
git clone https://github.com/AndreAugusto11/telos-dev.git
```
```bash
cd telos-dev
```

1. For a fresh environment, execute:
```bash
./fresh_env.sh
```

## Project Structure

- **contracts/** - Smart contract source files
- **.devcontainer/** - Development container configuration
- **fresh_env.sh** - Fresh environment initialization script
- **nodeos.log** - Node output logs
- **wallet_password.txt** - Wallet credentials (keep secure)

## Software Versions Installed

* antelope-spring_1.2.2_amd64.deb
* cdt_4.0.1_amd64.deb

## Current Problem

Run `./fresh_env.sh` to set up the environment.

```bash
🎉 All contracts deployed! You can now interact with them using cleos.
failed transaction: 9257d30c64783fa00ea7d5c3edbbb4e2af5f8d416b4dbd408e172776af63aa75  <unknown> bytes  <unknown> us
error 2026-02-15T20:59:33.832 cleos     main.cpp:712                  print_result         ] soft_except->to_detail_string(): 3080004 tx_cpu_usage_exceeded: Transaction exceeded the current CPU usage limit imposed on the transaction
transaction 9257d30c64783fa00ea7d5c3edbbb4e2af5f8d416b4dbd408e172776af63aa75 was executing for too long 151059us reached on chain max_transaction_cpu_usage 150000us
    {"id":"9257d30c64783fa00ea7d5c3edbbb4e2af5f8d416b4dbd408e172776af63aa75","billing_timer":151059,"subjective":0,"limit":150000}
    nodeos  transaction_context.cpp:531 checktime
hello <= hello::hi pending console output: 
    {"console":"","account":"hello","action":"hi","receiver":"hello"}
    nodeos  apply_context.cpp:134 exec_one
 
failed transaction: b6e63b2a5120ef6173f7cfd74aa6c1dc5d76d12964a5322536e3a49d1f4d0827  <unknown> bytes  <unknown> us
error 2026-02-15T20:59:34.127 cleos     main.cpp:712                  print_result         ] soft_except->to_detail_string(): 3080004 tx_cpu_usage_exceeded: Transaction exceeded the current CPU usage limit imposed on the transaction
transaction b6e63b2a5120ef6173f7cfd74aa6c1dc5d76d12964a5322536e3a49d1f4d0827 was executing for too long 150438us reached on chain max_transaction_cpu_usage 150000us
    {"id":"b6e63b2a5120ef6173f7cfd74aa6c1dc5d76d12964a5322536e3a49d1f4d0827","billing_timer":150438,"subjective":0,"limit":150000}
    nodeos  transaction_context.cpp:531 checktime
minimal <= minimal::test pending console output: 
    {"console":"","account":"minimal","action":"test","receiver":"minimal"}
    nodeos  apply_context.cpp:134 exec_one
```
