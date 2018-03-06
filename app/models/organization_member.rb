# frozen_string_literal: true
class OrganizationMember < ApplicationRecord
  belongs_to :user, class_name: '::Accounts::Models::User', foreign_key: 'accounts_user_id'
  belongs_to :organization, class_name: '::Domain::Models::Organization'
end
