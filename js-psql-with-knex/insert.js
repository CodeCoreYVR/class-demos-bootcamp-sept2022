const knex = require('./client');

knex('posts').insert({
  title: 'our first post',
  content: 'Inserting records using Knex.js',
  imageUrl: 'http://google.ca'
}).then((p) => {
  console.log('inserted into posts: ', p);
  knex.destroy()
}).catch((err) => {
  console.log(err);
})