# frozen_string_literal: true
module Domain
  module Cells
    class ProjectCell < Cell::ViewModel
      include Cell::Slim
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::CaptureHelper

      self.view_paths = ['app/platform_modules']

      property :group
      property :title
      property :description

      def form
        render
      end


      private

      def new_project_form
        form_url = ::Rails.application.routes.url_helpers.organization_group_projects_path(group.organization, group)
        capture do
          form_for(model, url: form_url, authenticity_token: false, remote: true) do |f|
            concat group_id_hidden_field(f)
            concat title_field(f)
            concat description_markdown_field(f)
            concat submit_button(f)
          end
        end
      end

      def group_id_hidden_field(form)
        form.hidden_field(:group_id, value: group.id)
      end

      def description_markdown_field(form)
        content_tag(:div) do
          (capture do
            concat(form.label(:description_md, value: 'Description'))
            concat(form.text_area(:description_md))
          end).html_safe
        end
      end

      def title_field(form)
        content_tag(:div) do
          form.text_field :title, placeholder: 'Title', label: 'title'
        end
      end

      def submit_button(form)
        content_tag(:div) do
          form.submit(value: 'Create')
        end
      end

      def errors
        model.errors.full_messages.join('<br/>')
      end

      def new_project_link
        url = ::Rails.application.routes.url_helpers.new_organization_group_project_path(model.organization, model)
        link_to 'New Project', url, remote: true
      end

      def group_actions
        if model.can_add_more_projects?
          new_project_link
        else
          nil
        end
      end
    end
  end
end
