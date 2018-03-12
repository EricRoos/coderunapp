# frozen_string_literal: true
module Domain
  module Cells
    class OrganizationCell < Cell::ViewModel
      include Cell::Slim
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::CaptureHelper

      self.view_paths = ['app/platform_modules']
      property :id
      property :name
      property :groups

      def show
        render
      end

      private

      def groups_list
        content_tag :ul do
          groups.first(10).collect do |g|
            content_tag(:li, group_item(g), class: 'group')
          end.join('').html_safe
        end
      end

      def group_item(group)
        content_tag :div do
          url = ::Rails.application.routes.url_helpers.organization_group_path(model, group)
          link_to(group.name, url)
        end
      end

      def group_header
        "Groups (#{groups.count})"
      end

      def group_actions
        if model.can_add_more_groups?
          new_group_link
        else
          increase_max_group_count_link
        end
      end

      def increase_max_group_count_link
        capture do
          concat(content_tag(:div) do
            (content_tag(:h3) do
              'Max Number of Groups Reached'
            end)
          end)
          concat(content_tag(:div) do
            (content_tag(:span) do
              'You need to purchase more groups for your oganization.'
            end)
          end)
        end
      end

      def new_group_link
        url = ::Rails.application.routes.url_helpers.new_organization_group_path(id)
        link_to 'New Group', url, remote: true
      end
    end
  end
end
