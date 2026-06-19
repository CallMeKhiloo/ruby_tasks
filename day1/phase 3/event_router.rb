# event_router.rb
# Observer pattern: notifies ALL registered handlers when an event is dispatched.
# SOLID compliance:
#   S — only responsibility is registering handlers and dispatching events
#   D — depends only on the Handler abstraction; zero concrete class names appear here
require_relative 'handler'

class EventRouter
  def initialize
    @handlers = []
  end

  # Register any object that inherits from Handler.
  # The router never needs to know which concrete class it is (D).
  def register(handler)
    @handlers << handler
  end

  # Fan out the event to every registered handler simultaneously.
  # Adding a new output requires ZERO changes here (O).
  def dispatch(event)
    @handlers.each { |handler| handler.handle(event) }
  end
end
