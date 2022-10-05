const http = require('http'); //library used to create http servers
const url = require('url')

const server = http.createServer(function(request, response){
    //request object represents a request being made by a client
    const params = url.parse(request.url, true)
    console.log(params)
    // console.log(request)
    //response object represents the response to the client that the server will build
    response.writeHead(200, { 'Content-Type': 'text/html' }) //when the server receives a response, it should send a response bacl to let the clinet know that we are going to be sending some html/text back.  Writhead is a function to add some data to the response
    //Content-type is a header thay is used to determine what the content is coded as
    response.write(`<!DOCTYPE html>
    <html>
        <head>
        <title>My first web server</title>
        </head>
        <body>
            <h1>Hello World</h1>
        </body>
    </html>`);
  response.end(); //make sure to end the response cycle and let the client know the response is done.
});

const PORT = 4000;
// const HOST = '127.0.0.1'
const HOST = 'localhost';

server.listen(PORT, HOST);
console.log(`Server is listening on ${HOST}:${PORT}`)





