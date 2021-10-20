"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert(
      "movimento_itens",
      [
        {
          tipo_movimento: "entrada",
          qtd: 10,
          item_id: 1,
          created_by_user_id: 1,
          updated_by_user_id: 1,
        },
        {
          tipo_movimento: "entrada",
          qtd: 20,
          item_id: 2,
          created_by_user_id: 1,
          updated_by_user_id: 1,
        },
        {
          tipo_movimento: "entrada",
          qtd: 20,
          item_id: 3,
          created_by_user_id: 3,
          updated_by_user_id: 3,
        },
        {
          tipo_movimento: "entrada",
          qtd: 20,
          item_id: 4,
          created_by_user_id: 1,
          updated_by_user_id: 1,
        },
        {
          tipo_movimento: "saida",
          qtd: 10,
          item_id: 2,
          created_by_user_id: 2,
          updated_by_user_id: 2,
        },
        {
          tipo_movimento: "saida",
          qtd: 5,
          item_id: 1,
          created_by_user_id: 2,
          updated_by_user_id: 2,
        },
      ],
      {}
    );
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("movimento_itens", null, {});
  },
};
