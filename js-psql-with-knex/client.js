const knex = require('knex')

const developmentConfig = require('./knexfile').development;

const client = knex(developmentConfig)

module.exports = client