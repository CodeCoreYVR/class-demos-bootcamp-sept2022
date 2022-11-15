// 🤖 M O D U L E S
const path = require("path");
const logger = require("morgan");
const multer = require("multer");
const express = require("express");
const favicon = require("serve-favicon");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");

const home = require("./routes/home");
const messages = require("./routes/messages");

const app = express();

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

// 🏭 M I D D L E W A R E
app.use(favicon(path.join(__dirname, "public", "favicon.png")));
app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// multer middleware is required to support `multipart/form-data`
// which is used by any fetch request made with a `FormData` body
app.use(multer().none());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// 🛣 R O U T E S
app.use("/", home);
app.use("/messages", messages);

// catch 404 and forward to error handler
app.use((req, res, next) => {
  const err = new Error("Not Found");
  err.status = 404;
  next(err);
});

// error handler
app.use((err, req, res, next) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
