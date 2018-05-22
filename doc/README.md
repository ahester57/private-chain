## Geth Statistic Scripts

### Edge Server

There are a total of 4 nodes running on the Edge Server:  
{bootstrap, miner1, miner2, testnode}   

**```collect_storage_data.sh```**

A script that is to be run in ~/private-chain/scripts.  
It checks the storage space taken up by each node.  
It gives output like this

"<block>": {  
"node": [ 
    "834kB", "149kB", "1kB", "10kB", "1kB", "0kB", "1kB", "16777kB", "16908kB"  
]}

Where the numbers correlate respectively to:  
".log", ".ldb", "CURRENT", "LOCK", "LOG", "MANIFEST", "cache-R-0000", "cache-R-hex"

Each block seems to add an average of 1.8 kB to each node's storage, not dependent 
on the node's sync-mode. 

Through data analysis of ../stats/storage.json, it is shown that the .log file fills up to 
a certain point and data is added to the .ldb file. This usually happens when the log file exceeds 1 MB. The log file then goes down to about 100 kB, the ldb file increases about 450 kB, the number of log, ldb, and MANIFEST increment, and CURRENT points to the new MANIFEST file.


**```decode_block_mine_time.sh```**

This is a script that takes in the log of a mining node, saved as a text file.  
It processes the text and matches committed mining networks to their respective mined time 
and averages all the block mine times. Resulted in an average of 1.28s per block. 

**```decode_import_times.sh```**

This script takes in the log of a non-mining node, while another node *is* mining, saved as a text file.  
It takes how much has been cached vs. the elapsed time to give a final average of data cached per second. Resulted in an average of 38.8 MB/s for caching blocks.

### Raspberry Pi 3

Raspberry Pi is running a geth node in the "fast" sync-mode.


**```decode_import_times.sh```**

It takes how much has been cached vs. the elapsed time to give a final average of data cached per second. Resulted in an average of 3.79 MB/s for caching blocks.

Each block seems to add an average of 1.8 kB to each node's storage, not dependent 
on the node's sync-mode. 

