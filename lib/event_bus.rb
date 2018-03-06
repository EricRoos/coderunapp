# frozen_string_literal: true
module EventBus
  module_function
  def broadcast(stream_name, event, payload)
    event_name = "#{stream_name}.#{event}"
    ActiveSupport::Notifications.instrument(event_name, payload)
  end

  def subscribe(stream_name, event, domain_observer)
    observer = EventBusObserver.new(domain_observer, domain_observer.namespace)
    ActiveSupport::Notifications.subscribe("#{stream_name}.#{event}", observer)
  end
end
