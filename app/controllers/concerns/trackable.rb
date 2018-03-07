# frozen_string_literal: true
module Trackable
  extend ActiveSupport::Concern
  included do
    before_action :log_action
  end

  private

  def log_action
    Rails.logger.info "LOGGING PAGE VIEW FOR #{::Current.user}"
  end
end
