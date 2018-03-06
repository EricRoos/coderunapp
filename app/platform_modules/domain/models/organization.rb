# frozen_string_literal: true
module Domain
  module Models
    class Organization < ApplicationRecord
      has_many :groups, -> { order('created_at desc') }

      def can_add_more_groups?
        groups.count < max_number_groups
      end

      private

      def max_number_groups
        100
      end
    end
  end
end
