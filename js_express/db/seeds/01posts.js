/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const faker = require('faker');

exports.seed = function (knex) {
  // Deletes ALL existing entries
  return knex("posts")
    .del()
    .then(function() {
      // Insert seed entries
      // generate an array of 100 posts using faker
      const posts = Array.from({length: 100}).map(() => {
        return {
          title: faker.company.catchPhrase(),
          content: faker.lorem.paragraph(),
          image_url: faker.image.imageUrl(),
          view_count: Math.floor(Math.random() * 100),
          created_at: faker.date.past()
        }
      })
      // insert seed entries
      // Inside of callback passed to the function
      // Always return knex query that you create
      return knex('posts').insert(posts)
    })
};
