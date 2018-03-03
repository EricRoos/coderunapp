module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private
    def authenticate
      if authenticated_user = current_user
        Current.user = authenticated_user
      end
    end
end
