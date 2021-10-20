"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert(
      "estoques",
      [
        {
          nome: "Estoque 001",
          logradouro: "Rua 123",
          numero: "100",
          complemento: "Logo Ali",
          bairro: "Cajazeiras",
          cidade: "Salvador",
          uf: "BA",
          cep: "40000000",
          created_by_user_id: 1,
          updated_by_user_id: 1,
        },
        {
          nome: "Estoque 002",
          logradouro: "Rua 456",
          numero: "200",
          complemento: "Logo Ali",
          bairro: "Parque Bela Vista",
          cidade: "Salvador",
          uf: "BA",
          cep: "40000000",
          created_by_user_id: 2,
          updated_by_user_id: 2,
        },
        {
          nome: "Estoque 003",
          logradouro: "Rua 789",
          numero: "300",
          complemento: "Logo Ali",
          bairro: "Pituba",
          cidade: "Salvador",
          uf: "BA",
          cep: "40000000",
          created_by_user_id: 3,
          updated_by_user_id: 3,
        },
      ],
      {}
    );
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("estoques", null, {});
  },
};
