# geth-private  
#### Austin Hester  

Contains scripts and whatnot for running a private ethereum blockchain, as well as 
some example Smart Contracts and documentation about geth and truffle.

### Prerequisites

	> go-ethereum-1.8.2-stable (geth)
	> go-1.8+
	> nodejs@9.x
	> truffle@4.1.x+
	> [optional] Mist browser
	
### Installation

go-ethereum:  

Follow instructions at https://github.com/ethereum/go-ethereum   
Get the latest stable release from their releases page and build from source.

go.1.8+:

	> sudo add-apt-repository ppa:gophers/archive
	> sudo apt update
	> sudo apt install golang-1.[8|9|10]-go
	> echo "PATH=/usr/lib/go-1.x/bin:$PATH" >> ~/.bashrc
	> source ~/.bashrc

nodejs@9.x

	> curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
	> sudo apt update
	> sudo apt install nodejs npm
	
truffle@4.1.x+

	> npm install -g truffle
	> mkdir newContract && cd newContract
	> truffle init

[optional] Mist browser

	> git clone https://github.com/ethereum/mist.git
	> cd mist
	> curl -o- -L https://yarnpkg.com/install.sh | bash
	> curl https://install.meteor.com/ | sh
	> yarn global add electron
	> yarn global add gulp
	> yarn

BONUS: How to avoid git permission denied errors when using npm:  
Follow Option 2 (change npm's default directory)

https://docs.npmjs.com/getting-started/fixing-npm-permissions


### Running

Make sure your genesis is how you want it. 

Take note of or change the ports each node uses.

To begin:  

	> cd private-chain
	> ./generate_genesis.sh
	> Configure your genesis to your liking
	> ./initialize_chain.sh
	> ./create_account.sh
	> ./unlock_on_start.sh
	> ./get_enodes.sh
	> ./copy_static_nodes.sh
	
Now you can run each node in separate terminals.

	> ./runbootstrap
	> CTRL+SHIFT+T
	> ./startminer1.sh
	> . . . 

Now, attach to the bootstrap to ensure they are connected:

	> ./attach_nodes.sh (choose b)

In this console, type:  
	
	> admin.peers

If nothing appears, make sure you ip and ports are correct and run
```./get_endodes.sh && ./copy_static_nodes.sh``` again

Depending on your setup, get_enodes.sh may not work correctly or at all.
In this case, either make a json file containing all enodes called ```static-nodes.json```.

The enodes should be in a [] list in quotes. Example:

	> [ "enode://abunchofhex@<my-private-ip>:<my-udp-port>", "another-enode", . . . ]

Or . . . if the enodes were created but with the wrong IP:

	> Open ./enode/new-static-nodes.json in vim
	> ESC, SHIFT+: to open command mode in vim
	> type '%s/<wrong-ip>/<my-private-ip>/g' and press ENTER
	> ESC, SHIFT+:, wq, ENTER
	> Now you can run ./copy_static_nodes.sh

### Mist browser

To run mist browser, run the following commands:

	> cd mist/interface
	> meteor --no-release-check

This opens a server on localhost:3000. To now open the GUI:  
Open a new terminal window,

	> cd mist
	> yarn dev:electron --mode mist --rpc http://localhost:<rpc_port> \
	> --swarmurl "null" --node-networkid <network_id>

### Truffle

Truffle is a development environment for writing smart contracts 
for the Ethereum Virtual Machine.

I have a PDF about testing and scripting with truffle in ./docs of this repository.

Check it out at

http://truffleframework.com/docs/getting_started/installation

