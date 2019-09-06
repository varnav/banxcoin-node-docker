#!/bin/bash

if [ ! -f "$HOME/.banxcoin" ]; then

echo '
rpcuser=rpc_banxcoin
rpcpassword=69c863e3356d3daee95df454a1
rpcallowip=0.0.0.0
listen=1
server=1
txindex=1
daemon=0
' > $HOME/.banxcoin
fi
