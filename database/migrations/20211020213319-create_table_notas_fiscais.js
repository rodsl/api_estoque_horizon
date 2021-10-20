"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable("notas_fiscais", {
      id: {
        primaryKey: true,
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false,
        autoIncrement: true,
      },
      numero: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      cnpj_emissor: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      valor_total: {
        type: Sequelize.DECIMAL,
        allowNull: false,
      },
      tipo_nf: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      excluido: {
        type: Sequelize.TINYINT(1),
        defaultValue: 0,
        allowNull: false,
      },
      created_by_user_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
          model: "usuarios",
          key: "id",
        },
        onUpdate: "cascade",
        onDelete: "cascade",
      },
      updated_by_user_id: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false,
        references: {
          model: "usuarios",
          key: "id",
        },
        onUpdate: "cascade",
        onDelete: "cascade",
      },
      created_at: {
        type: "TIMESTAMP",
        defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: false,
      },
      updated_at: {
        type: "TIMESTAMP",
        defaultValue: Sequelize.literal("CURRENT_TIMESTAMP"),
        allowNull: false,
      },
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable("notas_fiscais");
  },
};
