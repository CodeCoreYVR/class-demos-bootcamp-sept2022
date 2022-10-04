const knex = require("./client");

knex.insert([
  { title: "first", content: "first" },
  { title: "second", content: "second" },
  { title: "third", content: "third" },
]).into("posts").then(data => {
  console.log(data);
  knex.destroy();
})
