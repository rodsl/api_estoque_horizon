const path = require("path");
require("dotenv").config({
  path: path.resolve(__dirname, "..", "..", ".env.development"),
});

module.exports = {
  development: {
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    host: process.env.DB_HOSTNAME,
    dialect: process.env.DB_DIALECT,
    define: {
      underscored: true,
    },
  },
  test: {
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    host: process.env.DB_HOSTNAME,
    dialect: process.env.DB_DIALECT,
    define: {
      underscored: true,
    },
  },
  production: {
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    host: process.env.DB_HOSTNAME,
    dialect: process.env.DB_DIALECT,
    define: {
      underscored: true,
    },
  },
};
