# frozen_string_literal: true
class MessageUser < ApplicationRecord
  belongs_to :user
  belongs_to :model
end
