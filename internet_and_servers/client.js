const net = require("net");

const client = new net.Socket();  //socket represents a connection

const PORT = 5000;
const ADDRESS = '127.0.0.1'; // 'localhost'   -> loopback address

client.on('data', function(data){ //.on is another event listener, client.on is waiting for a response from the server
    console.log(`Data received from server: ` + data);
    client.end(); //make sure you close the connection by calling the end() function
    //otherwise the tcp connection stays open and will be "hanging". so let the server know the request is done
})
//connect is used to connect the client to the server
//we provide the address and port of the server we want to connect to
client.connect(PORT, ADDRESS, function() {
    //when the client is connected to a server this callback function is called
    client.write('Stephanie');
});


