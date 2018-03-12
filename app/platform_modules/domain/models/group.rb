# frozen_string_literal: true
module Domain
  module Models
    class Group < ApplicationRecord
      belongs_to :organization

      validates_presence_of :name, :organization

      validates_uniqueness_of :name,
        scope: :organization,
        message: 'name must be unique to the orginization'

    end
  end
end
