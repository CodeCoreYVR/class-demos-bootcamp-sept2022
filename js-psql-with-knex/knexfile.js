// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */
module.exports = {

  development: {
    client: 'pg',
    connection: {
      database: 'knex_demo',
      // If you're on Linux(Ubuntu) you need to provide the username and password
      username: "matt", // check in terminal with <whoami>
      password: "123", // check your postgres user password
      // To reset the password:
      // 1) In terminal connect to postgres using <psql>
      // 2) inside of psql use the command \password
      // 3) enter your new password
    },
    migrations: {
      tableName: 'migrations',
      directory: 'db'
    },
    seeds: {
      directory: 'seeds'
    }
  }
};
