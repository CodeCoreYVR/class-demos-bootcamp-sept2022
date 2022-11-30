import "./a.js"
import llama from './images/llama.jpg';
import "./styles/main.css";
import React from "react";
import ReactDOM from "react-dom";

console.log("Hello World");

function add(a,b){
    return a + b;
}

add(1,2);

const arr = [1,2,3,4]

add(arr[0], arr[2])

console.log("This is the index.js entry point")

console.log("Goodbye World!")

console.log("This does not run automatically if I don't have the --watch running")

console.log("Added mode config to use development environment!")

//Create a functional react component
// const App = () => {
//     return(
//         <div>
//             <h1>Here is a react element</h1>
//             <img src={llama} alt="llama"></img>
//         </div>
//     )
// }

//Alternative React element:
import thumbsUp from "./images/thumbsUp.gif"
const App = () => {
    return(
        <div>
            <h1>Here is an alternative react element:</h1>
            <img src={thumbsUp} alt="thumbsUp"></img>
        </div>
    )
}

document.addEventListener("DOMContentLoaded", () => {
    const img = document.createElement("img");
    img.src = llama;
    document.querySelector("body").append(img);

    const rootDiv = document.createElement("div");
    document.querySelector("body").append(rootDiv);
    ReactDOM.render(<App/>, rootDiv)
})

