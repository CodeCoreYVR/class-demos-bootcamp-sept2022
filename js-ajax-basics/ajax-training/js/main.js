// AJAX - Asynchronous Javascript and XML

// AJAX is a set of techniques to fetch data from a server asynchronously
// without interfering with the display and behavior of the existing page in the browser
// What this means is that our page loads while in the background AJAX fetches data
// from the server and makes it available for our use

//----------------Native XMLHttpRequest----------------

//to use it, we need to set an instance of it
const students = new XMLHttpRequest()

// specify what we want to do with it
students.open("GET", "http://localhost:3000/students")

students.onload = () => {
  console.log("XML Students: ", JSON.parse(students.responseText));
}

students.send()

//--------------------------jQuery AJAX request-------------------
$.ajax({
  method: "GET",
  url: "https://pokeapi.co/api/v2/pokemon/bulbasaur",
  // this is a function that will be invoked after the request is successful:
  // success(data){
  //   console.log(data);
  // }
  success: function (data) {
    console.log("jQuery pokemon: ", data);
  }
})

// --------------------XML AJAX Pokemon Example---------------------
const getReq = new XMLHttpRequest()

getReq.addEventListener(
  'load',
  function() {
    console.log("Squirtle: ", this.responseText);
  }
)

getReq.open(
  "GET",
  "https://pokeapi.co/api/v2/pokemon/squirtle"
)

getReq.send()

//--------------------Axios req to data.json departments----------------
const fetchDataButton = document.querySelector("#fetch-button")

fetchDataButton.addEventListener("click", async() => {
  const response = await axios.get("http://localhost:3000/departments")
  console.log("axios data: ", response.data);
})

//-------------------SuperAgent req to data.json students-------------
superagent.get("http://localhost:3000/students").then(res => {
  console.log("superagent data: ", JSON.parse(res.text));
})

// ---------------------Fetching data using Fetch AJAX-----------------
fetchDataButton.addEventListener("click", () => {
  fetch("http://localhost:3000/students").then(res => {
    return res.json()
  }).then(data => {
    console.log("using fetch: ", data);
  })
})