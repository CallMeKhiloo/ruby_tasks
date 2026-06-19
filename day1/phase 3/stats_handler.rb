# stats_handler.rb
# Strategy (third output): accumulates events in memory and prints a summary on exit.
# The summary fires via `at_exit` — the menu loop never calls it directly (S + O).
# Single responsibility: statistics aggregation and display ONLY.
require_relative 'handler'

class StatsHandler < Handler
  def initialize
    @events = []
    # Fires automatically when the process exits — no menu logic involved.
    at_exit { print_summary }
  end

  def handle(event)
    @events << event
  end

  private

  def print_summary
    return if @events.empty?

    puts "\n╔══════════════════════════════╗"
    puts "║      Session Summary         ║"
    puts "╚══════════════════════════════╝"

    by_type = @events.group_by(&:type)
    by_type.each do |type, events|
      total_minutes = events.sum(&:duration)
      puts "  #{type.upcase.ljust(10)} #{events.count} session(s)  |  #{total_minutes} min total"
    end

    puts "  ─────────────────────────────"
    puts "  Total events logged: #{@events.count}"
  end
end
