//Classesa are created with a special keyword 'class'
class Doggo{
  //constructor is a special method for classes
  //this is foired off when we create a new instance of the class of Doggo
  //this is similar to the constructor function
  constructor(name, age){
    this.name = name;
    this.age = age;
  }  
  //class methods are methods created in the constructor
  //but these methods are prototype methods by default
  bark(){
    console.log(`${this.name}: woof!`)
  }
}

const lucky = new Doggo('lucky', 2)

lucky.bark()

class DoggoFighter extends Doggo{
    constructor(name,age,specialAbility){
        super(name,age)
        this.specialAbility = specialAbility;
    }
    useSpecial(){
        console.log(`${this.name} uses the special ability: ${this.specialAbility}`)
    }
}

const buster = new DoggoFighter('Buster', 5, 'hide mode')
buster.useSpecial()
buster.bark()


// lucky.useSpecial() //this will throw an error because lucky is not a DoggoFighter instance


