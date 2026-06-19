# console_handler.rb
# Strategy: prints an event to the terminal.
# Single responsibility: terminal output ONLY — no file I/O, no stats (S).
require_relative 'handler'

class ConsoleHandler < Handler
  def handle(event)
    timestamp = event.timestamp.strftime('%Y-%m-%d %H:%M')
    puts "[#{timestamp}] #{event.type.upcase} — #{event.description} (#{event.duration} min)"
    puts '✓ Event logged.'
  end
end
