# geth-private  
#### Austin Hester  

Contains scripts and whatnot for running a private ethereum blockchain


### Prerequisites

	> go-ethereum (geth)
	> go.1.8+
	
### Installation

go-ethereum:  
follow instructions at https://github.com/ethereum/go-ethereum  

go.1.8+:

	> sudo add-apt-repository ppa:gophers/archive
	> sudo apt update
	> sudo apt install golang-1.[8|9]
	> //add /usr/lib/go/bin to $PATH in .bashrc
	> echo PATH=/usr/lib/go/bin:$PATH >> .bashrc

!!!! DON'T FORGET !!!!  >> 


### Running

Make sure your genesis is how you want it. 


Put password for first account (coinbase) in each node's datadir in a file
called passwd.sec with correct perms.

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

