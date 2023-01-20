# Ethernut_challenge_1
solution [how to think]

1. First find where the owner variable is set 
2 . to set the owner = msg.sender ; we have to call the contribute function 
3 . after calling and sending some value greater than 0 we will have to call receive function 
4. and , for that we have to do low level transaction , after successful execution of the transaction 
5 .we will be the owner and then we will call the withdraw function and will withdraw all the ether 
