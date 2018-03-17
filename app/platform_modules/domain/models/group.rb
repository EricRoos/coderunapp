# frozen_string_literal: true
module Domain
  module Models
    class Group < ApplicationRecord
      belongs_to :organization

      validates_presence_of :name, :organization

      validates_uniqueness_of :name,
        scope: :organization,
        message: 'name must be unique to the orginization'

      has_many :group_members
      has_many :organization_members, through: :group_members
      has_many :users, through: :organization_members, class_name: 'Accounts::Models::User'
      has_many :projects

      def can_add_more_projects?
        true
      end
    end
  end
end
