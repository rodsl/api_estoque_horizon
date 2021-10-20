"use strict";
const bcrypt = require("bcryptjs");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert(
      "usuarios",
      [
        {
          nome: "Fabricio Souza",
          cpf: 12345678901,
          email: "fabricio@email.com",
          senha: bcrypt.hashSync("123456"),
        },
        {
          nome: "John Doe",
          cpf: 12345678901,
          email: "john@email.com",
          senha: bcrypt.hashSync("123456"),
        },
        {
          nome: "Jane Doe",
          cpf: 12345678901,
          email: "jane@email.com",
          senha: bcrypt.hashSync("123456"),
        },
      ],
      {}
    );
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("usuarios", null, {});
  },
};
