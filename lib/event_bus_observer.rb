# frozen_string_literal: true
class EventBusObserver
  attr_reader :proxy, :stream_name
  def initialize(observer_proxy, stream_name)
    @proxy = observer_proxy
    @stream_name = stream_name
  end

  def call(message, *args)
    method = message.gsub("#{stream_name}.", '')
    proxy.send(method, ActiveSupport::Notifications::Event.new(message, *args))
  end
end
