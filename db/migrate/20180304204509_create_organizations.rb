# frozen_string_literal: true
class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
