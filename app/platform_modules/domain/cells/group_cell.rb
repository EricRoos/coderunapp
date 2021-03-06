# frozen_string_literal: true
module Domain
  module Cells
    class GroupCell < Cell::ViewModel
      include Cell::Slim
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::CaptureHelper

      self.view_paths = ['app/platform_modules']

      property :projects
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

      def projects_list
        content_tag :ul do
          projects.first(10).collect do |p|
            content_tag(:li, project_item(p), class: 'project')
          end.join('').html_safe
        end
      end

      def project_item(project)
        project.title
      end

      def group_name
        model.name
      end

      def new_group_form
        form_url = ::Rails.application.routes.url_helpers.organization_groups_path(organization.id)
        capture do
          form_for(model, url: form_url, authenticity_token: false, remote: true) do |f|
            concat org_id_hidden_field(f)
            concat name_field(f)
            concat submit_button(f)
          end
        end
      end

      def org_id_hidden_field(form)
        form.hidden_field(:organization_id, value: organization.id)
      end

      def name_field(form)
        content_tag(:div) do
          form.text_field :name, placeholder: 'Name', label: 'name'
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
