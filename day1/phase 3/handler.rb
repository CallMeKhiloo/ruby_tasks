# handler.rb
# The shared interface (abstract base class).
# Every output MUST implement #handle(event).
# If it forgets, Ruby will raise NotImplementedError loudly at runtime — never silently.
# This satisfies:
#   I — exactly one method, no output is forced to implement anything extra
#   D — EventRouter depends only on THIS abstraction, never on concrete classes
class Handler
  def handle(event)
    raise NotImplementedError, "#{self.class}#handle is not implemented. " \
                               "Every Handler subclass must define #handle(event)."
  end
end
