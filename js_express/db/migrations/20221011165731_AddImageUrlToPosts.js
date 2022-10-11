/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.table('posts', table => {
    table.string('image_url'); // add column "image_url" with type VARCHAR(255)
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.table('posts', table => {
    table.dropColumn('image_url')// Drop the image_url column
  })
};
