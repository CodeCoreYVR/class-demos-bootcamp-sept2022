/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.createTable('posts', table => {
    table.increments('id'); // creates an auto-incrementing column 'id' that is the same as SERIAL in SQL
    table.string('title'); // "title" column with VARCHAR(255)
    table.text('content'); // "content" column with TEXT(larger than VARCHAR)
    table.integer('view_count'); // "view_count" column as integer
    table.timestamp('created_at').defaultTo(knex.fn.now()); // created_at timestamp is defaulted to the time of now, now being when the function is triggered
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.dropTable('posts')
};
