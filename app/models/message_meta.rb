# frozen_string_literal: true
class MessageMeta < ApplicationRecord
  belongs_to :messageable, polymorphic: true
  belongs_to :message,
    class_name:  'Notifications::Models::Message',
    foreign_key: 'notifications_message_id'
end
