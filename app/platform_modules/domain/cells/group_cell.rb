# frozen_string_literal: true
module Domain
  module Cells
    class GroupCell < Cell::ViewModel
      include Cell::Slim
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::CaptureHelper

      self.view_paths = ['app/platform_modules']

      property :organization
      property :name
      property :id

      def show
        render
      end

      def form
        render
      end

      def index
        render
      end

      private

      def new_group_form
        form_url = ::Rails.application.routes.url_helpers.organization_groups_path(organization.id)
        capture do
          form_for(model, url: form_url, authenticity_token: false, remote: true) do |f|
            concat f.hidden_field(:organization_id, value: organization.id)

            concat(content_tag(:div) do
              f.text_field :name, placeholder: 'Name', label: 'name'
            end)

            concat(content_tag(:div) do
              f.submit(value: 'Create')
            end)
          end
        end
      end

      def errors
        model.errors.full_messages.join('<br/>')
      end
    end
  end
end
