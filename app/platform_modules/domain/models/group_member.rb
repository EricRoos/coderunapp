# frozen_string_literal: true
module Domain
  module Models
    class GroupMember < ApplicationRecord
      belongs_to :organization_member
      belongs_to :group
    end
  end
end
