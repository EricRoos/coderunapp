# frozen_string_literal: true
module Domain
  module Controllers
    class ProjectsController < BaseController
      prepend_view_path 'app/platform_modules/domain/views'
      before_action :set_dependent_models

      def new
        project = Models::Project.new(group: @group)
        @project_form = Domain::Cells::ProjectCell.call(project).call(:form)
        respond_to do |format|
          format.js { render 'projects/new', layout: false }
        end
      end
      def create
        respond_to do |format|
          @project = Models::Project.create(project_params)
          if @project.errors.any?
            @project_form = Domain::Cells::ProjectCell.call(@project).call(:form)
            format.js { render 'projects/new', layout: false }
          else
            group = @project.group
            @group = Domain::Cells::GroupCell.call(group).call
            format.js { render 'projects/create', layout: false }
          end
        end
      end

      protected
      def project_params 
        params.require(:domain_models_project).permit(:title, :group_id, :description_md)
      end

      def set_dependent_models
        @organization = Models::Organization.find(params[:organization_id])
        @group = Models::Group.find(params[:group_id])
      end
    end
  end
end
