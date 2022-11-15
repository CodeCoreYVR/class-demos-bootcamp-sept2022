"use strict";
const { Message } = require("../models");

module.exports = {
  up(queryInterface, Sequelize) {
    const messages = [
      { username: `tyrion`, body: `What is it that you want, exactly?` },
      {
        username: `the_spider`,
        body: `Peace. Prosperity. A land where the powerful do not prey on the powerless.`
      },
      {
        username: `tyrion`,
        body: `Where the castles are made of gingerbread and the moats are filled with blackberry wine. The powerful have always preyed on the powerless; that’s how they became powerful in the first place.`
      },
      {
        username: `the_spider`,
        body: `Perhaps. And perhaps we’ve grown so used to horror we assume there’s no other way.`
      }
    ].map(params => Message.create(params));

    return Promise.all(messages);
  },

  down(queryInterface, Sequelize) {
    return queryInterface.bulkDelete("Messages", null, {});
  }
};
