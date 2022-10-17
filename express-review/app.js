const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const methodOverride = require("method-override");

const app = express();

app.use(logger("dev"));

app.use(express.urlencoded({ extended: true }));

app.use(
  methodOverride((req, res) => {
    if (req.body && req.body._method) {
      const method = req.body._method;
      return method;
    }
  })
);

app.use(express.static(path.join(__dirname, "public")));

app.use(cookieParser());

app.get("/", (req, res) => {
  res.render("home");
});

const todosRouter = require("./routes/todosRouter");
app.use("/todos", todosRouter);

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

const PORT = 3000;
const HOST = "localhost";
app.listen(PORT, HOST, () => {
  console.log(`The server is listening at http://${HOST}:${PORT}`);
});
