# frozen_string_literal: true
module Domain
  module Models
    class Project < ApplicationRecord
      include MarkdownField

      markdown_field :description_md, name: 'description'
      belongs_to :group

      validates_presence_of :title

      validates_uniqueness_of :title,
        scope: :group,
        message: 'must be unique to the group'

    end
  end
end
