const knex = require('knex');
const knexfile = require('../knexfile');
const client = knex(knexfile.development);

module.exports = client;