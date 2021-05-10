# Final Assignment Smart Contract

```
Deploy the charity smart contract first.
```
![alt text](/images/1.jpg)

```
after you deploy the charity smart contract, donate a few "wei" to the contract. After that is done
```
![alt text](/images/2.jpg)

```
deploy the donator smart contract and take the charity smart contract address and put it in the address value that it asks for.
```
![alt text](/images/3.jpg)
```
After you finish deploying the donator smart contract proceed to deploy a project with a "name", charity address and donator address. 
```
![alt text](/images/4.jpg)
```
When the project finishes deploying copy the project address and add it to the donator smart contract by using the function of "addProject" it will
ask for the project address as a parameter.
```
![alt text](/images/5.jpg)
```
Via the Donator contract you can make the donation then to the projects you have added to the contract by index and amount. "index,amount" are the parameters
of the donateToProject() function.
```
![alt text](/images/6.jpg)


```

You don't require to deploy the smart contract token since when you make a donation it will deploy the contract automatically and will send you then the "Dontoken" or "DTK" that will be used for the charities. 

```

### voting:
```
You can vote for yes or no, if all the voters voted for no, the donators will receive a refund from the contract and the rest will return to the charity. When the project owners deployed the contract they will have to wait for an entire month before they can  extract the ether from the contract. In the charity contract there's a function that you can send ether directly to the project.
```
