#!/bin/bash

echo "🧹 Cleaning old environment..."
pkill -9 nodeos
sleep 2
rm -rf ~/.local/share/eosio/nodeos
rm -rf ~/eosio-wallet
rm -f nodeos.log

echo "🚀 Starting fresh nodeos..."
nodeos -e -p eosio \
  --plugin eosio::producer_plugin \
  --plugin eosio::producer_api_plugin \
  --plugin eosio::chain_api_plugin \
  --plugin eosio::http_plugin \
  --access-control-allow-origin='*' \
  --contracts-console \
  --http-validate-host=false \
  --verbose-http-errors >> nodeos.log 2>&1 &

echo "⏳ Waiting for nodeos to initialize..."
for i in {1..20}; do
  if cleos get info > /dev/null 2>&1; then
    echo "✅ Nodeos started successfully!"
    break
  fi
  sleep 1
  echo -n "."
done

if ! cleos get info > /dev/null 2>&1; then
  echo ""
  echo "❌ Nodeos failed to start. Check nodeos.log"
  exit 1
fi

echo "🔑 Creating wallet..."
cleos wallet create --to-console > wallet_password.txt
echo "✅ Wallet created! Password saved to wallet_password.txt"

echo "🔑 Importing default development key..."
cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
echo "✅ Default key imported!"

echo "🔑 Creating keys..."
cleos wallet create_key
cleos wallet create_key

echo "📋 Your keys:"
cleos wallet keys

# Get the first non-eosio key (second key in the list)
PUBKEY=$(cleos wallet keys | grep EOS | head -1 | tr -d ' "[],' )
echo "🔑 Using public key: $PUBKEY"

echo "👤 Step 4: Creating hello account..."
cleos create account eosio hello $PUBKEY -p eosio@active
echo "📋 Account 'hello' created with public key: $PUBKEY"

echo "Step 5: Compiling and deploying hello contract in contracts/hello..."
cd ./contracts/hello
cdt-cpp -abigen -o hello.wasm hello.cpp
cleos set contract hello . hello.wasm hello.abi -p hello@active
echo "✅ Contract deployed to account 'hello'!"

echo "🎉 Setup complete! You can now interact with the 'hello' contract using cleos."

echo "👤 Step 6: Creating minimal account..."
cleos create account eosio minimal $PUBKEY -p eosio@active
echo "📋 Account 'minimal' created with public key: $PUBKEY"

echo "Step 7: Compiling and deploying minimal contract in contracts/minimal..."
cd ./../minimal
cdt-cpp -abigen -o minimal.wasm minimal.cpp
cleos set contract minimal . minimal.wasm minimal.abi -p minimal@active
echo "✅ Contract deployed to account 'minimal'!"

echo "🎉 All contracts deployed! You can now interact with them using cleos."

# Test the contract (this still has the access violation issue)
cleos push action hello hi '["alice"]' -p hello@active
cleos push action minimal test '["alice"]' -p minimal@active
