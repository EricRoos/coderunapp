module Subscribers
  class Sessions < ::Subscribers::Base
    def logged_in(event)
      user = event.payload[:user]
      Rails.logger.info "Payload: #{event.payload}"
      messageable = Accounts::Models::User.find(user['id'])
      text = 'Thanks for logging in.'
      messageable.messages << Notifications::Models::Message.new(content: text)
    end
  end
end
