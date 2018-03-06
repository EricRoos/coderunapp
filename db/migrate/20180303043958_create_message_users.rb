# frozen_string_literal: true
class CreateMessageUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :message_users, id: false do |t|
      t.references :accounts_user, foreign_key: true
      t.references :notifications_message, foreign_key: true
      t.timestamps
    end
  end
end
