module Subscribers
  class Base
    class_attribute :subscriptions_enabled
    attr_reader :namespace

    def initialize(namespace)
      @namespace = namespace
    end

    # attach public methods of subscriber with events in the namespace
    def self.attach_to(namespace)
      observer = new(namespace)
      observer.public_methods(false).each do |event|
        EventBus.subscribe(namespace, event, observer)
      end
    end

    # trigger methods when an even is captured
    #def call(message, *args)
    #  method  = message.gsub("#{namespace}.", '')
    #  self.send(method, ActiveSupport::Notifications::Event.new(message, *args))
    #end
  end
end
