const knex = require("./client");

knex("posts")
  .where("title", "Object-based national complexity")
  .del()
  .then((data) => {
    console.log(data);
    knex.destroy();
  });
