// function printThis(){
//     console.log(this) //this will refer to the global object or undefined in strict mode
// }

// printThis()

const obj = {
    printThis: function(){
        console.log(this)
    }
}

function can(fn){
    console.log(fn())
}

// obj.printThis() //refers to instance of obj
// can(obj.printThis) //refers to global object


//=====Bind=====>
//used to counter the behaviour of  'this' and to set ther reference to 'this'
const bindPrintThis = obj.printThis.bind(obj)

can(bindPrintThis)
