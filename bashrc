export CARDANO_NODE=~/cardano-node-1.35.4
export PATH=$CARDANO_NODE:$PATH
export TESTNETPATH=~/testnet

#magic id for preview network is 2, preprod 1
export TESTNET="--testnet-magic 2"
export PREPROD="--testnet-magic 1"
export PREVIEW="--testnet-magic 2"
#legacy magic id
#export TESTNET="--testnet-magic 1097911063"

export CARDANO_NODE_SOCKET_PATH=~/testnet/node.socket

#Added some bash-completion scripts here for ease of execution of commands
source <(cardano-cli --bash-completion-script `which cardano-cli`)
source <(cardano-node --bash-completion-script `which cardano-node`)
#source <(cardano-address --bash-completion-script `which cardano-address`)

alias previewnode='$CARDANO_NODE/cardano-node run --topology $TESTNETPATH/config/preview/topology.json --database-path $TESTNETPATH/db/preview/ --socket-path $CARDANO_NODE_SOCKET_PATH --port 3001 --config $TESTNETPATH/config/preview/config.json'
alias preprodnode='$CARDANO_NODE/cardano-node run --topology $TESTNETPATH/config/preprod/topology.json --database-path $TESTNETPATH/db/preprod/ --socket-path $CARDANO_NODE_SOCKET_PATH --port 3001 --config $TESTNETPATH/config/preprod/config.json'
alias legacynode='$LEGACYNODE/cardano-node run --topology $TESTNETPATH/config/legacy/testnet-topology.json --database-path $TESTNETPATH/db/legacy/ --socket-path $CARDANO_NODE_SOCKET_PATH --port 3001 --config $TESTNETPATH/config/legacy/testnet-config.json'
alias ctip='cardano-cli query tip $TESTNET'

function utxo() { cardano-cli query utxo $TESTNET --address $1 ; }
function utxof() { cardano-cli query utxo $TESTNET --address $(cat $1) ; }
function submit() { cardano-cli transaction submit --tx-file $1 $TESTNET ;}

alias plutix='nix-shell ~/plutus-apps/shell.nix'
