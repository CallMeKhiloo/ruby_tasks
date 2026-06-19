# file_handler.rb
# Strategy: appends a line to a log file on every event.
# Single responsibility: file I/O ONLY — no terminal output, no stats (S).
require_relative 'handler'

class FileHandler < Handler
  def initialize(filepath = 'events.log')
    @filepath = filepath
  end

  def handle(event)
    timestamp = event.timestamp.strftime('%Y-%m-%d %H:%M')
    File.open(@filepath, 'a') do |file|
      file.puts "[#{timestamp}] #{event.type.upcase} — #{event.description} (#{event.duration} min)"
    end
  end
end
