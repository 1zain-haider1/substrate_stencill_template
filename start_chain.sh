#!/usr/bin/env bash

set -e

start_boot_node() {
  echo "Starting boot node..."
  install -d ./ind_validators/validator1
  ./target/release/substrate-stencil --validator --base-path ./ind_validators/validator1 --port 30333 --ws-port=9943 --rpc-port=9944 --chain local --alice --node-key 0000000000000000000000000000000000000000000000000000000000000001 >./ind_validators/validator1/out_validator1 2>&1 &
}

start_validator_2() {
  echo "Starting validator 2..."
  install -d ./ind_validators/validator2
  ./target/release/substrate-stencil --validator --port 30334 --base-path ./ind_validators/validator2 \
    -ltime=trace --ws-port=9945 --rpc-port=9946 --chain local --bob \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator2/out_validator2 2>&1 &
}

start_validator_3() {
  echo "Starting validator 3..."
  install -d ./ind_validators/validator3
  ./target/release/substrate-stencil --validator --port 30335 --base-path ./ind_validators/validator3 -lthea=trace  \
    --ws-port=9947 --rpc-port=9948 --chain local --charlie \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator3/out_validator3 2>&1 &
}

start_validator_4() {
  echo "Starting validator 4..."
  install -d ./ind_validators/validator4
  ./target/release/substrate-stencil --validator --port 30336 --base-path ./ind_validators/validator4 -lthea=trace  \
    --ws-port=9949 --rpc-port=9950 --chain local --eve \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator4/out_validator4 2>&1 &
}

start_validator_5() {
  echo "Starting validator 5..."
  install -d ./ind_validators/validator5
  ./target/release/substrate-stencil --validator --port 30337 --base-path ./ind_validators/validator5 -lthea=trace  \
    --ws-port=9959 --rpc-port=9960 --chain local --dave \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator5/out_validator5 2>&1 &
}

start_validator_6() {
  echo "Starting validator 6..."
  install -d ./ind_validators/validator6
  ./target/release/substrate-stencil --validator --port 30338 --base-path ./ind_validators/validator6 -lthea=trace  \
    --ws-port=9969 --rpc-port=9970 --chain local --ferdie \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator6/out_validator6 2>&1 &
}

start_validator_7() {
  echo "Starting validator 7..."
  install -d ./ind_validators/validator7
  ./target/release/substrate-stencil --validator --port 30339 --base-path ./ind_validators/validator7 -lthea=trace  \
    --ws-port=9979 --rpc-port=9980 --chain local --ferdiel \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator7/out_validator7 2>&1 &
}

start_validator_8() {
  echo "Starting validator 8..."
  install -d ./ind_validators/validator8
  ./target/release/substrate-stencil --validator --port 30319 --base-path ./ind_validators/validator8 -lthea=trace  \
    --ws-port=9919 --rpc-port=9920 --chain local --ferdiell \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    >./ind_validators/validator8/out_validator8 2>&1 &
}

kill_nodes() {
  echo "Killing all nodes."
  killall -2 substrate-stencil
}

SLEEP=10

start_chain() {
  ./purge-chain.sh

  start_boot_node
  sleep $SLEEP
  start_validator_2
  sleep $SLEEP
  start_validator_3
  sleep $SLEEP
  start_validator_4
  sleep $SLEEP
  start_validator_5
   sleep $SLEEP
  start_validator_6
   sleep $SLEEP
  start_validator_7
  sleep $SLEEP
  start_validator_8
 
  #./set-keys.sh
  
  tail -f ./ind_validators/validator1/out_validator1
}

start_chain