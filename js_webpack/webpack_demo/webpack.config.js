const path = require("path"); //you must specify this for the output
const HTMLWebpackPlugin = require("html-webpack-plugin"); //have to require it from the installed nmp package to use it

// Entry Points
// https://webpack.js.org/concepts/entry-points

// Output
// https://webpack.js.org/concepts/output

// Loaders 
// https://webpack.js.org/concepts/#loaders

// Plugins
// https://webpack.js.org/concepts/plugins

// Mode
// https://webpack.js.org/configuration/mode/



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
    },
    module: {
        //this is where we will have the configurations for the loaders
        rules: [
            {
                loader: "file-loader",
                test:/\.(png|jpg|gif|webp|svg)$/, //this is regex for the different types of image extensions that you will allow
                options: {
                    //if you don't specify options, the default is to compile everything into one JS file
                    //instead, specify output to a new directory called outputImages where all the images will reside
                    outputPath: "outputImages/",
                    name: "[name].[ext]"
                }
            },
            {
                //this is a bit different because we are using 2 loaders:
                test: /\.css$/, //here we specify that we are using css files. You would need another for sass or other extensions used
                use: [
                    { loader: "style-loader" },
                    { loader: "css-loader" }
                ]
            },
            {
                test: /\.(js|jsx)$/,
                exclude: /node_modules/, //no need to have babel transfor files in node_modules directory
                loader: "babel-loader"
            }
        ]
    },
    plugins: [
        new HTMLWebpackPlugin({
            title: "Webpack Demo", //<title> of the webpage
            chunks: ["main"]
            //chunks tells webpack which bundles to include in the html file
            //in this case it will use the main.js file in the build directory
        })
    ]
}

