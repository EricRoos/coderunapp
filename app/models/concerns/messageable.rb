# frozen_string_literal: true
module Messageable
  extend ActiveSupport::Concern
  included do
    has_many :message_meta, as: :messageable, class_name: 'MessageMeta'
    has_many :messages, through: :message_meta
  end
end
