"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert(
      "notas_fiscais",
      [
        {
          numero: "123456",
          cnpj_emissor: "00000000000000",
          valor_total: 10000.0,
          tipo_nf: "entrada",
          created_by_user_id: 1,
          updated_by_user_id: 1,
        },
        {
          numero: "654321",
          cnpj_emissor: "10000000000000",
          valor_total: 200000.0,
          tipo_nf: "entrada",
          created_by_user_id: 2,
          updated_by_user_id: 2,
        },
        {
          numero: "987654",
          cnpj_emissor: "20000000000000",
          valor_total: 10000.0,
          tipo_nf: "saida",
          created_by_user_id: 3,
          updated_by_user_id: 3,
        },
      ],
      {}
    );
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("notas_fiscais", null, {});
  },
};
