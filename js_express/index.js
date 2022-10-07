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
// const { response } = require('express');
const express = require('express');
const app = express();

//--------------------BODY PARSER and URLENCODED MIDDLEWARE-------------------->
//To be able to use data from a POST HTTP request, like filling out a form and submitting:
//Previously we had to add body parser as an extra package but we don't need to install body parser anymore, 
//because express has a new method called urlencoded that we'll use instead to parse in x-www-urlencoded format
//Forms using POST actions send their data as x-www-urlencoded format
//It looks like key=value separated by & and + where special characters are replaced 
//This middleware will decode (parse out) the data that was submitted from the form
//using  the "POST" HTTP Verb and change it into a format the our application can understand
//such as JavaScript objects that will represent request.body

//When "extended" option is "true", it allows the data to take the shape of arrays and objects
//And puts all the info on req.body.  Without it, you will only get strings back 
//the method has other options available as well that we don't need today
app.use(express.urlencoded({extended: true}))
//It will modify the request object given to routes by adding a property to it named body
//So request.body will be an object containing the data from our form

//------Cookie Parser------------->
//req.body.cookie
//install: npm i cookie-parser
//require cookie-parser:
const cookieParser = require('cookie-parser');

app.use(cookieParser())
//will parse cookies and put them on request.cookies available as express properties (see express docs)
//you can still require cookies without this, but in the backend it's hard for us to read
//every time we make a request to the browser, in the header somewhere there's a cookie header that holds all the info for that cookie
//cookie parser reads the headers for us and it will parse out the cookies
//it will read it in whatever format it is, and turns it into a nice JS object for us

//------Custom Middleware--------->
//Remember, order matters! So make sure this is under the urlencoded and cookie-parser
//because it will depend on it to work properly

app.use((req, res, next) =>  {
    const username = req.cookies.username

    //res.locals are properties set and are available in any views
    //almost like a global variable
    res.locals.username = '';

    if(username){
        res.locals.username = username;
        console.log(`Signed in as ${username}`)
    }
    next();
    // All middleware functions have an optional parameter **next()** 
    //beside (request, response) parameters which is needed to pass along 
    //the request to the next function in the chain just simply by calling it
    //Packaged middleware might already have the next() implemented, so you might not need to specify it
    //But always include it in your own middleware
    //After the we are done with the middleware then we pass the request to next 
    //middleware function but, if the middleware didn't run successfully then the 
    //response will be given from the middleware
})



//------Static assets------------->
//Static assets require a path that's already accessible through express
//in turn, we will use express.static through the path
const path = require("path")

//Use path.join to combine string arguments into a path
//path.join('/','users','bob')   -> '/users/bob'

//The below line connects out public directory to express so that it can serve the browser those assets
//(images, css files, browser-side JS files, etc) 
//Set up the public directory for these files to reside in
app.use(express.static(path.join(__dirname, 'public')));
//__dirname is a global variable available to node thay has the value of the path to your root directory

//static asset middleware will take all the files and directories within /public
//and serve them publically with their own url
//For example: http://localhost:3000/images/thumbsUp.gif
//or http://localhost:3000/css/main.css

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

//==============================ROUTES/ ROUTERS===================================>
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
    // res.send("<h1>Hello World</h1>")
    res.render('hello_world')
})

//------Survey Page
app.get('/survey', (req, res) => {
    res.render('survey')
})

//----Handle the submit of the Surb=vey form---->
app.get('/submit', (req, res) => {
    // res.render('thank_you')
    // res.send('thank_you')
    // `response.send(...)` is helpful when debugging if you
	// see the contents of object in your browser. Use it
	// like you would use `console.log(...)`
	// response.send(request.query);
    // `request.query` is a property that holds an object
	// representation of the URL query.
    const fullName = req.query.fullName;
    const favouriteColour = req.query.favouriteColour;
    const favouriteDay = req.query.favouriteDay;
    const message = req.query.message
    res.render('thank_you', {
        fullName: fullName,
        favouriteColour: favouriteColour,
        favouriteDay: favouriteDay,
        message: message
    })
})

//------Sign in POST request---------------->
app.post('/sign_in', (req, res) => {
    // res.send(req.body) //-> this is available through urlencoded

    const COOKIE_MAX_AGE = 1000 * 60 * 60 * 24 //a day in milliseconds
    const username = req.body.username
    res.cookie('username', username, {maxAge: COOKIE_MAX_AGE})
    res.redirect('/')
})

//-------Sign out POST request------------->
app.post('/sign_out', (req, res) => {
    res.clearCookie('username');
    res.redirect('/');
})

//---Set View Engine----------->
app.set('view engine', 'ejs')
app.set('views', 'views')

//==============================SERVER===================================>
//----Start the server to start listening for a connection----->
const PORT = 3000;
const DOMAIN = 'localhost' //loopback address: 127.0.0.1

app.listen(PORT, DOMAIN, () => {
    console.log(`Server is listening on http://${DOMAIN}:${PORT}`)
})



