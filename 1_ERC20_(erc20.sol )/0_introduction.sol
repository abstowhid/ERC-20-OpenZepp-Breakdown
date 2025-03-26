there are serveral nesting like one function call in another function.

1.for transfer
     i. transfer function is just for calling _transfer and providing the details.
    ii._transfer function checking input and calling _update function , where the real operations . 
    iii. _update function is updating the values by checking all conditions


Note: while calling an another function, i must provide the parameter. where i will use the parameter , there the values of the parameter will work for the function(from where calling{parameter's value function})
=>suppose
i have a function with 3 paramter of it's own

function _update(addres from, addres to,uint amount){
//code
}

now in another functoin i will call it

function _mint(para1,para2,para3)  {
_update(para1, para2, para3); 
//or,i need only para3, others will be auto(like msg.sender,0 add)
_update(address(0), msg.sender, para3);
}
