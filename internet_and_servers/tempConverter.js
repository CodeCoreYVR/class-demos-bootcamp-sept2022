const http = require('http');
// const url = require('url');

const server = http.createServer((req, res) => {
  // request is the object that represents a client's request
  // req.url property is the url of the request. This is stuff that was typed into the address bar
  // console.log(req.url);
  // const parsedUrl = url.parse(req.url, true);
  // console.log(parsedUrl);
  const urlString = req.url;
  console.log(urlString);
  const queryString = urlString.split('?')[1];
  console.log(queryString);
  const query = {};
  if (queryString) {
    queryString.split('&').forEach(keyValuePair => {
      const splitKeyValuePair = keyValuePair.split('=');
      query[splitKeyValuePair[0]] = splitKeyValuePair[1];
    })
  }
  console.log(query);
  const fahrenheitTemp = query.temp;
  const celcius = (fahrenheitTemp - 32) * (5/9);

  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.write(`<p>${fahrenheitTemp} fahrenheit in celcius is ${celcius}`);
  res.end();
})

const PORT = 8080;
// const HOST = '127.0.0.1';
const HOST = 'localhost';
server.listen(PORT, HOST, () => {
  console.log(`Server started at ${HOST}:${PORT}`);
});

