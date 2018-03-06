# frozen_string_literal: true
module Accounts
  module Controllers
    class SessionsController < Devise::SessionsController
      def create
        super do |resource|
          EventBus.broadcast(:users, :logged_in, user: resource.as_json)
        end
      end
    end
  end
end
