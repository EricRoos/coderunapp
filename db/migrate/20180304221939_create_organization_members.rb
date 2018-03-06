# frozen_string_literal: true
class CreateOrganizationMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_members do |t|
      t.references :accounts_user, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
