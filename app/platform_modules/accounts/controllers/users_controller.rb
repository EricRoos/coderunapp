# frozen_string_literal: true
module Accounts
  module Controllers
    class UsersController < ApplicationController
      def search
        render json: { hello: :world }
      end
    end
  end
end
