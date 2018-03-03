module Subscribers
  class Sessions < ::Subscribers::Base
    def logged_in(event)
      user = event.payload[:user]
      Rails.logger.info "User #{user} logged in"
    end
  end
end
