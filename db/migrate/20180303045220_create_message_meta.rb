class CreateMessageMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :message_meta do |t|
      t.belongs_to :messageable, polymorphic: true
      t.references :notifications_message

      t.timestamps
    end
  end
end
