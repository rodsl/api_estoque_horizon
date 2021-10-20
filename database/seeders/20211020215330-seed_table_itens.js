"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert(
      "itens",
      [
        {
          nome: "Monitor",
          descricao: "Monitor para PC",
          fabricante: "Dell",
          modelo: "P2214H",
          codigo_barra: "000000000000",
          nota_fiscal_id: 1,
          created_by_user_id: 1,
          updated_by_user_id: 1,
          estoque_id: 1,
        },
        {
          nome: "Celular",
          descricao: "Smartphone Apple",
          fabricante: "Apple",
          modelo: "iPhone 8",
          codigo_barra: "000000000000",
          nota_fiscal_id: 2,
          created_by_user_id: 2,
          updated_by_user_id: 2,
          estoque_id: 2,
        },
        {
          nome: "Celular",
          descricao: "Smartphone Apple",
          fabricante: "Apple",
          modelo: "iPhone 13 Pro",
          codigo_barra: "000000000000",
          nota_fiscal_id: 3,
          created_by_user_id: 3,
          updated_by_user_id: 3,
          estoque_id: 3,
        },
        {
          nome: "Notebook",
          descricao: "Notebook Gamer",
          fabricante: "Samsung",
          modelo: "Odyssey i5",
          codigo_barra: "000000000000",
          nota_fiscal_id: 2,
          created_by_user_id: 1,
          updated_by_user_id: 1,
          estoque_id: 1,
        },
      
      ],
      {}
    );
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("itens", null, {});
  },
};
