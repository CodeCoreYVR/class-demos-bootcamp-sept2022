//------------------To create a npm project---------------------->
//Create an empty project directory
//Run nmp init to initialize a project
//Follow the prompts, and press "enter" if all is good
//at the end, type "y" and enter
//This will create a npm project with a package.json file
//you could also just do the following in the beginning: npm init -y

//------------------Create .gitignore file------------------------->
//This file will hold any information you don't want to share,
//like sensitive info or large libraries like node_modules
//You can use gitignore.io to generate content for the .gitignore file
//You can also: curl https://www.toptal.com/developers/gitignore/api/node,macos,linux,windows > .gitignore
//This will read, copy, and paste into .gitignore

//------------------Install express package-------------------------->
// npm i express
//this will enable us to use the express library and will create node_modules
//and a package-lock.json file

//------Create main project file------->
//create index.js
//this file should match what your package.json says as the "main" file i.e. the entry point of your project
//this file will hold all of the informtion in order for your project to function

//------Require the express library from the express dependency------>
const express = require('express');
const app = express();

//------Logging Middleware-------->
//install morgan middleware to our npm project: npm i morgan
//now  we require it:
const logger = require('morgan');
app.use(logger('dev'));

//------Common methods for App (express app)------->
// https://expressjs.com/en/4x/api.html#app
//require ('express') returns a function that returns an instance of an express app
//The app variable referenced in index.js is an object with methods to configure your app

//app.use() -> initializes middleware
//app.engine() -> to set a view engine for express
//app.listen() -> to start the express server

//-----HTTP VERBS----->
//app.get() -> to listen for a GET request from the client
//app.post() -> to listen for a POST request from the client
//app.put() -> to listen for a PUT request from the client
//app.patch() -> to listen for a PATCH request from the client
//app.delete() -> to listen for a DELETE request from the client

//app.method -> method is jiust a generic variable for any HTTP request types
//supported by express and includes app.get, app.post. etc.

//app.set() -> used to set the application variables.  Mainly used to configure application wide variables
//like a path to a view directory or a path to static files

//Root page
app.get('/', (req, res) => {
    // res.send("<h1>This is my root page. Hi there!</h1>")
    res.render('welcome', {
        title: 'Welcome to Our Meme Page',
        memes: [
            "https://www.probytes.net/wp-content/uploads/2018/01/2.jpg",
            "https://www.probytes.net/wp-content/uploads/2018/01/20.png",
            "https://www.probytes.net/wp-content/uploads/2018/01/r_389776_tqMPa-1.jpg",
            "https://www.loginradius.com/blog/async/static/ce430bf1882a235044353d4b4d098275/e85cb/12.png",
            "https://res.cloudinary.com/practicaldev/image/fetch/s--MOKp0Jew--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://www.probytes.net/wp-content/uploads/2018/01/4-1.png"
        ]
    })
})

//Hello world demo
//first argument is the path
//second argument is the request handler
app.get('/hello_world', (req, res) => {
    res.send("<h1>Hello World</h1>")
})

//---Set View Engine----------->
app.set('view engine', 'ejs')
app.set('views', 'views')

//----Start the server to start listening for a connection----->
const PORT = 3000;
const DOMAIN = 'localhost' //loopback address: 127.0.0.1

app.listen(PORT, DOMAIN, () => {
    console.log(`Server is listening on http://${DOMAIN}:${PORT}`)
})



