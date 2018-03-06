module Domain
  module Controllers
    class OrganizationsController < BaseController 
      prepend_view_path 'app/platform_modules/domain/views'
      def show
        organization = Models::Organization.find(params[:id])
        @organization = Domain::Cells::OrganizationCell.(organization).()
        respond_to do |format|
          format.html { render 'organizations/show' }
        end
      end
    end
  end
end
