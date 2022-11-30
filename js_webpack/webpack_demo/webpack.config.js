const path = require("path"); //you must specify this for the output

// Entry Points
// https://webpack.js.org/concepts/entry-points

// Output
// https://webpack.js.org/concepts/output

module.exports = {
    mode: "development", //here you specify which environment mode to use - development or production
    //You can specify a path to an entry file in multiple ways:
    //single entry -> entry: "./src/index.js"
    //array entry -> entry: ["./src/a.js", "./src/b.js" ]
    //As an object with specified outputs of bundles (creating multiple bundles from separate entry files):
    entry: {
        main: "./src/index.js",
        chunkA: "./src/a.js",
        chunkB: "./src/b.js"
    },
    output: {
        //output requires the use of "path" to specify the location where our bundles files are created
        path: path.join(__dirname, "build"),
        //the filename property is used to change the names of the bundles files
        filename: "[name].js"
    }
}

