# Final Assignment Smart Contract


Deploy the charity smart contract first.

![1](https://user-images.githubusercontent.com/78915037/117611604-c74a9600-b131-11eb-99d3-3a6e90014df0.png)


after you deploy the charity smart contract, donate a few "wei" to the contract. After that is done

![2](https://user-images.githubusercontent.com/78915037/117611620-ce71a400-b131-11eb-87b0-2a31d03877e6.png)


deploy the donator smart contract and take the charity smart contract address and put it in the address value that it asks for.

![3](https://user-images.githubusercontent.com/78915037/117611631-d3365800-b131-11eb-968c-64e41b3db6da.png)


After you finish deploying the donator smart contract proceed to deploy a project with a "name", charity address and donator address. 

![4](https://user-images.githubusercontent.com/78915037/117611636-d6c9df00-b131-11eb-81f6-2eab4fe1fd89.png)


When the project finishes deploying copy the project address and add it to the donator smart contract by using the function of "addProject" it will
ask for the project address as a parameter.

![5](https://user-images.githubusercontent.com/78915037/117611644-daf5fc80-b131-11eb-8677-fcd0d2723dca.png)


Via the Donator contract you can make the donation then to the projects you have added to the contract by index and amount. "index,amount" are the parameters
of the donateToProject() function.

![6](https://user-images.githubusercontent.com/78915037/117611653-df221a00-b131-11eb-972a-afa49bb9a9a5.png)




You don't require to deploy the smart contract token since when you make a donation it will deploy the contract automatically and will send you then the "Dontoken" or "DTK" that will be used for the charities. 



### voting:

You can vote for yes or no, if all the voters voted for no, the donators will receive a refund from the contract and the rest will return to the charity. When the project owners deployed the contract they will have to wait for an entire month before they can  extract the ether from the contract. In the charity contract there's a function that you can send ether directly to the project.

