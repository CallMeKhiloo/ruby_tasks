# life_track.rb — entry point / wiring only
# This is the ONLY file that knows about concrete handler classes.
# The router itself never references any handler by name (D).
require_relative 'event'
require_relative 'event_router'
require_relative 'console_handler'
require_relative 'file_handler'
require_relative 'stats_handler'

# ── Wiring ────────────────────────────────────────────────────────────────────
router = EventRouter.new
router.register(ConsoleHandler.new)
router.register(FileHandler.new('events.log'))
router.register(StatsHandler.new)   # prints summary automatically on exit

# ── Event type map ─────────────────────────────────────────────────────────────
EVENT_TYPES = {
  '1' => 'work',
  '2' => 'study',
  '3' => 'exercise',
  '4' => 'meal'
}.freeze

# ── CLI menu loop ──────────────────────────────────────────────────────────────
puts '=== LifeTrack ==='

loop do
  puts ''
  puts '1. Log a work session'
  puts '2. Log a study session'
  puts '3. Log an exercise session'
  puts '4. Log a meal'
  puts '5. Exit'
  print "\nChoose an option: "

  choice = gets.chomp

  break if choice == '5'

  unless EVENT_TYPES.key?(choice)
    puts 'Invalid option. Please choose 1–5.'
    next
  end

  print 'Description: '
  description = gets.chomp

  print 'Duration (minutes): '
  duration = gets.chomp.to_i

  event = Event.new(EVENT_TYPES[choice], description, duration, Time.now)
  puts ''
  router.dispatch(event)
end
