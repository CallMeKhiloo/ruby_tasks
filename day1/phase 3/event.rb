# event.rb
# A plain data object that carries everything every output needs.
# Fields: type, description, duration (minutes), timestamp
# Deliberately has NO knowledge of how it is displayed or stored (S + D).
Event = Struct.new(:type, :description, :duration, :timestamp)
