const log = console.log

const larryTheLion = document.querySelector("#larry-the-lion")
// log(larryTheLion)

const moneyBagsMichael = document.querySelector("#moneybags-michael")
// log(moneyBagsMicheal)

const teamSalmon = document.querySelector(".team.salmon")
// log(teamSalmon)

// Use querySelectorAll to return a NodeList of all the elements that match the css selector
const teams = document.querySelectorAll(".team")

// querySelectorAll will return all the nodes that match the selector in an Array-like structure
// It is NOT an array but has some built in methods that mimic an array
// for example, iterating with "for...of" and ".forEach()"
// It does not have a map or reduce method for example

// for (const node of teams) {
//   log(node)
// }

// ----------------Picking Doggos-------------------------------------

const moneyBagsMichaelAndLarryTheLion = document.querySelectorAll("#larry-the-lion, #moneybags-michael")
// log(moneyBagsMichaelAndLarryTheLion)

const allTeamTealButFirst = document.querySelectorAll(".team.teal .doggo:not(:first-child)")
// log(allTeamTealButFirst)

const secondDoggo = document.querySelectorAll('.team .doggo:nth-child(2)')
// log(secondDoggo)

// ------------------Selecting by element-------------------------------
const toxicTim = document.getElementById("toxic-tim")
// log(toxicTim)


// ----------------Select surrounding nodes
const bumbleBertha = toxicTim.nextElementSibling
// log(bumbleBertha)

const ninaTheNinja = toxicTim.nextElementSibling.nextElementSibling
// log(ninaTheNinja)

const teams2 = toxicTim.parentElement.parentElement
// log(teams2)

// --------------------Selecting children nodes------------------------------
const inBreadDog = document.querySelector("#inbread-dog")
// log(inBreadDog)

const roster = inBreadDog.parentElement
// log(roster)

// log(roster.children[0]) // returns inBreadDog
// log(roster.children[1]) // returns larryTheLion
// log(roster.children[2]) // returns moneybagsMichael
// log(roster.children) // returns a HTML Collection that is array-like and can be iterated through

const rosterCollection = roster.children
// log(rosterCOllection)

// for (const node of rosterCollection) {
//   log(node)
// }

// log(roster.firstElementChild)
// log(roster.lastElementChild)

// -----------------matches---------------------------------
// <node>.matches check if a node matches a css selector and return a boolean

// log(inBreadDog.matches('.fighter')) // true
// log(inBreadDog.matches('.team.salmon')) // false
// log(inBreadDog.matches('.team.teal')) // false because  a doggo just has a class of .doggo or .fighter

// --------------------closest------------------------------
// <node>.closest('<css query>')
// Searches all ancestors of element (beginning with itself)
// for the first node that matches the query.
// If no matching ancestors, it will return null
// It can be thought of as a reverse querySelector

// log(inBreadDog.closest('.team')) // returns the team teal div node, which is the parent of the parent of inBreadDog
// log(toxicTim.closest('div')) // returns itself because it is a node that is a div
// log(inBreadDog.closest('.team.salmon'))

// -------------------------------Manipulation----------------------------------

// When using the . notation, we use camelCase to refer to CSS property names
// for example, border-radius will be style.borderRadius

// inBreadDog.style.border = 'solid medium red';
// teamSalmon.style.backgroundColor = 'orange';

// // Nodes are just special JS objects, so we can also use the [] notation
// toxicTim.style["background-image"] = "url(images/paws.jpg)"

// ----------------Computed styles of nodes ----------------------
// To read the actual computed styles of a node, use the global function getComputedStyle(<node>)
// this global function is only available in the browser, so using it in our index.js will not work

// getComputedStyle(toxicTim) // returns the computed/real styles of the node given
// getComputedStyle(toxicTim).backgroundColor // returns the specific background color of toxicTim

// ----------------------Changing the contents of a node-----------------------

// <node>.innerHTML property will allow us to get/set the HTML within the selected node
// it will return all the HTML content as a string

// <node>.outerHTML property will allow us to get or set the whole node

// log(toxicTim.innerHTML) // returns just the inner content of the node in a string
// toxicTim.innerHTML = "<h1>Non Toxic</h1><h1>Non Toxic</h1><h1>Non Toxic</h1>"//this will change the inner content

// log(toxicTim.outerHTML) // returns the whole node including it's contents
// toxicTim.outerHTML = '<h1>My turn in the light</h1>'

// <node>.innerText is a getter/setter for the text within a node - returns all the content with the HTML stripped
// i.e. it effectively just returns the text
// We can change this text by setting it to something else

// toxicTim.innerText = "something new"

// ----------------------- Changing ids and classes-----------

// get or set ids
//<node>.id -> gets the id property of the node
// <node>.id = "new id" -> sets it to a new id
// toxicTim.id // returns "toxic-tim"

// same with class
// note: because class is a reserved word, we use camelCase "className" instead to refer to node classes
//<node>.className -> gets the class property of the node
// <node>.id = "new class" -> set it to a new class
// toxicTim.className // return "doggo fighter"

// classList is an abstraction of className, and even though it's a bit slower to use than className,
// it makes it easier to manipulate multiple nodes. It returns a special array-like object instead of a string,
// and has extra properties like .add and .remove that can be used on it.

// toxicTim.className = "doggo fighter hello" // adds .hello class to toxicTim
// toxicTim.classList.add("hello")  // this will append the node with an additional hello class and keep original classes too
// toxicTim.className = "hello" // replaces all original classes with hello class
// toxicTim.classList.remove("doggo") // removes given class argument from the node

toxicTim.getAttribute('class') // returns values of the class attribute
toxicTim.getAttribute('id') // returns values of the id attribute
toxicTim.setAttribute('data-id', '7xz80') // adds an attribute called data-id with the value of 7xz80
toxicTim.hasAttribute('id') // true
toxicTim.hasAttribute('bark') // false
toxicTim.removeAttribute('data-id')

// ----------------------Remove nodes-----------------------------------

//<node>.remove() - remove the node permanently 
// toxicTim.remove() // will remove toxicTim

//---------------------Vandalize the arena-------------------

//1.
// let twoTeams = document.getElementsByClassName('team')

// for (const node of twoTeams) {
//   node.style.backgroundColor = 'fuchsia'
// }

//2.
// let allDoggos = document.querySelectorAll(".doggo")

// allDoggos.forEach(node => {
//   node.innerText = "Rob the Slob"
// })

//3.
// allDoggos.forEach(node => {
//   node.style.backgroundImage = "url(https://images.unsplash.com/photo-1561948955-570b270e7c36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=602&q=80)"
// })

//--------------------Creating nodes------------------------

const drillBitDarrel = document.createElement('div')

// add an id
drillBitDarrel.id = 'drill-bit-darrel'

// add a class
// drillBitDarrel.className = "doggo fighter"
drillBitDarrel.classList.add('doggo')
drillBitDarrel.classList.add('fighter')

// add a h1 with the dog's name
drillBitDarrel.innerHTML = '<h1> Drill Bit Darrel </h1>'

// give him his background pic
drillBitDarrel.style.backgroundImage = "url(./images/drill_bit_darel.jpg)"

// drillBitDarrel node has been created but it needs to be attached to a node on the DOM
// we are going to attach him to the teal team node

const teamTeal = document.querySelector('.team.teal')
const tealRoster = teamTeal.querySelector('.roster')

// appendChild -> appends a new node as the last child of an existing node
// tealRoster.appendChild(drillBitDarrel)

// insertBefore -> used to append the new node to a specific position in the node, relative to a sibling node
tealRoster.insertBefore(drillBitDarrel, larryTheLion)

// clone nodes
// tealRoster.insertBefore(drillBitDarrel.cloneNode(), moneyBagsMichael)
// tealRoster.appendChild(drillBitDarrel.cloneNode())


















