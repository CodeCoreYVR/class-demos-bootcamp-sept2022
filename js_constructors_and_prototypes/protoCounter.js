function Counter(count, step=1){ //set a default value if step is not passed as an argument
    this.count = count || 0; //set a default value of 0 if count is not passed as an argument
    this.step = step
}

Counter.prototype.inc = function(){
    this.count += this.step // this.count = this.count + this.step
    return this;
}

Counter.prototype.dec = function(){
    this.count -= this.step // this.count = this.count - this.step
    return this;
}

Counter.prototype.now = function(){
    return this.count; //returns where the count is at
}
    
const c1 = new Counter(10,5) //this will start with a count of 10 and increase or decrease by step of 5
const c2 = new Counter(); //this will just start with the default values of count at 0 and inc/dec by step of 1

// console.log(c1)
// console.log(c2)

c1.inc()
// console.log(c1)
// console.log(c1.now())

c2.inc()
// console.log(c2)
// c2.inc()
// c2.inc()
// c2.inc()
// c2.inc()
// c2.inc()
// console.log(c2)

// console.log(c2.inc().inc().inc().inc().inc())
//the above is called chaining
//if we want chained behaviour, we have to make sure that the methods
//that we're calling are returning 'this'
//because 'this' represents the object instance that owns the method, so we need to return the object instance 
//to use the new method on it in the chain

const c3 = new Counter();
const c4 = new Counter();
const c5 = new Counter();
const c6 = new Counter();

console.log(c3)
console.log(c4)
console.log(c5)
console.log(c6)

console.log(c3.now())