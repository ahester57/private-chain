# geth-private  
#### Austin Hester  

Contains scripts and whatnot for running a private ethereum blockchain


### Prerequisites

	> go-ethereum (geth)
	> go.1.8.x
	
### Installation

go-ethereum:  
follow instructions at https://github.com/ethereum/go-ethereum  

go.1.8.x:

	> wget  
	> https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz  
	> tar -xzf go1.8.3.linux-amd64.tar.gz -C /usr/local
	> add /usr/local/go/bin to $PATH in .bashrc

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
	> Make 2 accounts for each of the three nodes.
	> geth --datadir ./<nodename> account new (*2)
	> ./get_enodes.sh
	> ./copy_static_nodes.sh
	
Now you can run each node in separate terminals.

Now, attach to the bootstrap to ensure they are connected:

	> ./attach_nodes.sh (choose b)

In this console, type:  
	
	> admin.peers

If nothing appears, make sure you ip and ports are correct and run
```./get_endodes.sh && ./copy_static_nodes.sh``` again

