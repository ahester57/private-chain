# geth-private  
#### Austin Hester  

Contains scripts and whatnot for running a private ethereum blockchain

### Prerequisites

	> go-ethereum-1.7.3-stable (geth)
	> go-1.8+
	> nodejs-1.8+
	> [optional] Mist browser
	
### Installation

go-ethereum:  

Follow instructions at https://github.com/ethereum/go-ethereum   
The latest release [1.8.0-unstable], is, well, unstable.  
Get [1.7.3-stable].

go.1.8+:

	> sudo add-apt-repository ppa:gophers/archive
	> sudo apt update
	> sudo apt install golang-1.[8|9]
	> echo "PATH=/usr/lib/go/bin:$PATH" >> ~/.bashrc

nodejs-1.8+

	> curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	> sudo apt update
	> sudo apt install nodejs npm
	
[optional] Mist browser

	> git clone https://github.com/ethereum/mist.git
	> cd mist
	> curl -o- -L https://yarnpkg.com/install.sh | bash
	> curl https://install.meteor.com/ | sh
	> yarn global add electron
	> yarn global add gulp
	> yarn

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

Now, attach to the bootstrap to ensure they are connected:

	> ./attach_nodes.sh (choose b)

In this console, type:  
	
	> admin.peers

If nothing appears, make sure you ip and ports are correct and run
```./get_endodes.sh && ./copy_static_nodes.sh``` again

### Mist browser

To run mist browser, run the following commands:

	> cd mist/interface
	> meteor --no-release-check

This opens a server on localhost:3000. To now open the GUI:  
Open a new terminal window,

	> cd mist
	> yarn dev:electron --mode mist --rpc http://localhost:<rpc_port> \
	> --swarmurl "null" --node-networkid <network_id>

