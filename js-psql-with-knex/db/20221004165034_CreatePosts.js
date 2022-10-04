/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.createTable('posts', table => {
    table.bigIncrements('id');// creates a colum called id with type of SERIAL
    table.string('title');// creates a column called title with type of VARCHAR
    table.text('content');// creates a colum called content with type of TEXT
    table.timestamp('createdAt').defaultTo(knex.fn.now()) // creates a column
    // called createdAt with type of TIMESTAMP which also defaults to the machine time (current time)
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.dropTable('posts')
};
