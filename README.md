# 1 MAN 1 VOTE 

Tribute to Nelson Mandela famous quote : "One Man, One Vote".
The idea is to let every person holding 1man1vote tokens to have the right to vote using ERC777 token. 


### Inspiration 

[ERC777-VotingSystem](https://hackernoon.com/i-built-an-ethereum-based-fully-decentralized-voting-system-5x8t34gz)

### Problem 

 - Scalability : using a "list" of voters could be very expensive if we consider a country with millions of voters 
 - token holders don't have real "control" over their tokens.

### Solution 

![PoPV](./docs/Snapshot.png)

### Rules of 1man1vote 

10 tokens -> 3 points
100 tokens --> 5 points 
10000 tokens --> 50 points 

This "non-correlated" tokens/points rule is made to encourage more votes which means more liquidity to the token contract, and by this less frugality in votes. The more liquid the token contract will be, the less disparities it will have, and the more "fair" the vote should be. 
We incentivise more liquidity to have less points of failure in the voting. 

### Smart contract 

- send tokens to a contract and notify it in a single transaction with ERC777
- Use a granularity of 10 minimum tokens minted/burned for voting to respect our specified points which listed in the rules of 1man1vote 


