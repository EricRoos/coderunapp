# frozen_string_literal: true
module Domain
  module Controllers
    class GroupsController < BaseController
      prepend_view_path 'app/platform_modules/domain/views'
      def new
        group = Models::Group.new(organization: Models::Organization.find(params[:organization_id]))
        @group_form = Domain::Cells::GroupCell.call(group).call(:form)
        respond_to do |format|
          format.js { render 'groups/new', layout: false }
        end
      end

      def create
        respond_to do |format|
          @group = Models::Group.create(group_params)
          if @group.errors.any?
            @group_form = Domain::Cells::GroupCell.call(@group).call(:form)
            format.js { render 'groups/new', layout: false }
          else
            organization = @group.organization
            @organization = Domain::Cells::OrganizationCell.call(organization).call
            format.js { render 'groups/create', layout: false }
          end
        end
      end

      #def delete
      #  respond_to do |format|
      #    @group = Models::Group.find(params[:id])
      #    @group.delete
      #    format.js { render 'groups/delete', layout: false }
      #  end
      #end

      def show

      end

      protected

      def group_params
        params.require(:domain_models_group).permit(:name, :organization_id)
      end
    end
  end
end
