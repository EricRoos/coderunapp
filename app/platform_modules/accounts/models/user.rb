# frozen_string_literal: true
module Accounts
  module Models
    class User < ApplicationRecord
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
      include Messageable
      has_many :organization_members, foreign_key: 'accounts_user_id'
      has_many :organizations, through: :organization_members
    end
  end
end
