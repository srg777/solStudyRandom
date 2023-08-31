import sys
import time
from web3 import Web3

abi = [{"inputs": [],"name": "test","outputs": [{"internalType": "uint256","name": "","type": "uint256"}],"stateMutability": "view","type": "function"}]
address='0xEE530F568b4FBBbC18E631aE598eD261C61f14d5'
w3 = Web3(Web3.HTTPProvider('https://polygon-mumbai-bor.publicnode.com'))
rnd = w3.eth.contract(address=address, abi=abi)

arr=[0,0,0,0,0]
i = 0
while True:
    time.sleep(2)
    t = rnd.functions.test().call()
    arr[t] +=1
    s = sum(arr)
    print (f"\r>> {s}: {[round(x/s,3) for x in arr]}", end='')
    sys.stdout.flush()

