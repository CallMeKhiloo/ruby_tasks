# Bonus — The Architect's Test: Slack Notifications

> The product manager wants Slack notifications on every logged event.

---

### 1. What would you name the new class and where would it live?

**`SlackHandler`**, in a new file: `slack_handler.rb` inside the `phase 3/` directory.

---

### 2. What is the one method it must implement?

```ruby
def handle(event)
  # POST the event to the Slack webhook URL
end
```

The one method is `#handle(event)`, inherited from `Handler`.

---

### 3. List every existing file you would open to plug it in.

Only **one** existing file needs to change:

- `life_track.rb` — to `require_relative 'slack_handler'` and call
  `router.register(SlackHandler.new(webhook_url))`

That is the **only** existing file touched.

---

### 4. Does that list include the router or the shared interface?

**No.** `event_router.rb` and `handler.rb` are not opened.

If they were, that would violate the **Open/Closed Principle (O)** — the system would not be
open for extension without modification. The architecture prevents this by making the router
depend on the `Handler` abstraction, so any new concrete handler slots in without touching
the router.

---

### Implementation

```ruby
# slack_handler.rb
require 'net/http'
require 'json'
require_relative 'handler'

class SlackHandler < Handler
  def initialize(webhook_url)
    @webhook_url = URI(webhook_url)
  end

  def handle(event)
    timestamp = event.timestamp.strftime('%Y-%m-%d %H:%M')
    message   = "[#{timestamp}] #{event.type.upcase} — #{event.description} (#{event.duration} min)"
    payload   = { text: message }.to_json

    Net::HTTP.post(@webhook_url, payload, 'Content-Type' => 'application/json')
  end
end
```

Register in `life_track.rb`:
```ruby
require_relative 'slack_handler'
router.register(SlackHandler.new(ENV['SLACK_WEBHOOK_URL']))
```

**Verification:** The router was not opened. No existing file except the entry-point wiring changed.
The answer written before coding matched the actual result exactly.
