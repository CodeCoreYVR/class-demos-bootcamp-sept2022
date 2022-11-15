"use strict";
module.exports = function(sequelize, DataTypes) {
  const Message = sequelize.define("Message", {
    body: DataTypes.TEXT,
    flagged: DataTypes.BOOLEAN,
    username: DataTypes.STRING
  });
  return Message;
};
