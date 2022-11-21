// ====================IMPORTANT MESSAGE===================================

// 1) Run your Rails API server (awesome answers) on a different terminal with rail s
// 2) To run the SPA server, do not use VSCode's Live server as it doesn't have
//    all the functionality needed for cross-origin requests
// 3) Install the http server globally, and use that to run the SPA instead:
//    For example, when you type in the following command:
//    http-server -p 9999 .
//    Your app will be available on http://localhost:9999/
// 4) Make sure the above domain is listed on your Rails API's "whitelist" in cors.rb

//=================================================================

// "http://localhost:3000/api/v1/questions" GET index
// "http://localhost:3000/api/v1/questions/:id" GET show
// "http://localhost:3000/api/v1/questions" POST create
// "http://localhost:3000/api/v1/questions/:id" DELETE destroy
// "http://localhost:3000/api/v1/questions/:id" PATCH update

// Base URL that we going to send the requests to (the API server)
const baseURL = "http://localhost:3000/api/v1"

// ===============Question=========================
const Question = {
  // fetch all the questions from server
  index(){
    return fetch(`${baseURL}/questions`)
    // by default fetch is a GET request
    // so we don't need to specify the method
    // we know the path to the backend because we created the API,
    // but for external API's you will need to look at the documentation
    // If you create an API for other's to access you are responsible
    // to specify the paths for the requests in your documentation

    // fetch will always return a promise, and a promise
    // will always return a response object, and the
    // response object represents the response and it's data. 
    // We want the data of the actual response
    .then(response => {
      // console.log(response);
      return response.json();
      // normally we want it to be in some sort of text formate, but now we want it in json
      // response object has a method .json() that will parse the body of response into json format
    })
  }

}

Question.index().then(questions => console.log(questions))

