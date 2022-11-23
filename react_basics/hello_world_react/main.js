//React.createElement - method for returning a React element
//A React element is an object that represents a DOM node

const ourFirstElement = React.createElement(
   'div',
   null, //this is the props used for 2 reasons: 1. setting attributes to an html element, 2. its the properties to a react component
   'Hello World'
)

//Another example
// const newElementWithProps = React.createElement(
//     'a', //html tag
//     { href: 'https://google.ca '}, //props setting the attributes
//     'Google'
// )

//Because the main.js script will be loaded before the html body, we need to make
//sure that the document's content is loaded before we refer to it
//(i.e. if you need to grab a div, in this case) To do this, we wrap it into an event listener:
// document.addEventListener('DOMContentLoaded', () => {
//     //ReactDOM library is used to interpret React elements and render them to the DOM
//     //with the .render method
//     ReactDOM.render(
//         //first argument is a React element - this is returned from the React.createElement
//         ourFirstElement,
//         // newElementWithProps,
//         //second argument is a DOM node we want to attach the element to
//         //in this case we are going to grab the div we created with the id of "app"
//         document.getElementById("app")
//     )
// })

document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById("app");
    const root = ReactDOM.createRoot(container);
    root.render(
        ourFirstElement
    )
})


