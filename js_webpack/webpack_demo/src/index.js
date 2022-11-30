import "./a.js"
import llama from './images/llama.jpg';
import "./styles/main.css"

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

document.addEventListener("DOMContentLoaded", () => {
    const img = document.createElement("img");
    img.src = llama;
    document.querySelector("body").append(img);
})
